(local iso-tile (require :isohue.iso-tile))
(local iso-drawing (require :isohue.iso-drawing))
(local json (require :json.json))
(defn iso-tile-terrain [top surface transition deep]
  (local new-tile (iso-tile))
  (set new-tile.name :terrain)
  (set new-tile.top-texture top)
  (set new-tile.side-surface-texture surface)
  (set new-tile.side-transition-texture transition)
  (set new-tile.side-deep-texture deep)
  (lambda new-tile.draw [x y z context]
    (var top? nil)
    (var sidea? nil)
    (var sideb? nil)
    (defn check-sides [context texture]
      (when (= (. context (table.concat [1 0 0] "\0")) :empty)
        (set sidea? texture))
      (when (= (. context (table.concat [0 1 0] "\0")) :empty)
        (set sideb? texture)))
    (when (= (. context (table.concat [0 0 1] "\0")) :empty)
      (set top? new-tile.top-texture)
      (check-sides context new-tile.side-surface-texture))
    (when (and (= (. context (table.concat [0 0 2] "\0")) :empty) (= (. context (table.concat [0 0 1] "\0")) :terrain))
      (check-sides context new-tile.side-transition-texture))
    (when (and (= (. context (table.concat [0 0 1] "\0")) :terrain) (= (. context (table.concat [0 0 2] "\0")) :terrain))
      (check-sides context new-tile.side-deep-texture))
    (iso-drawing.draw-iso x y z
      top?
      sidea?
      sideb?))
  new-tile)

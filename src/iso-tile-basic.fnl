(local iso-tile (require :iso-tile))
(local iso-drawing (require :iso-drawing))
(local iso-utils (require :iso-utils))
(defn iso-tile-basic [top surface transition deep]
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
      (when (= (. context (iso-utils.index [1 0 0])) :empty)
        (set sidea? texture))
      (when (= (. context (iso-utils.index [0 1 0])) :empty)
        (set sideb? texture)))
    (when (= (. context (iso-utils.index [0 0 1])) :empty)
      (set top? new-tile.top-texture)
      (check-sides context new-tile.side-surface-texture))
    (iso-drawing.draw-iso x y z
      top?
      sidea?
      sideb?))
  new-tile)

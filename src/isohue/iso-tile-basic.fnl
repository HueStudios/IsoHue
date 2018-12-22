(local iso-tile (require :isohue.iso-tile))
(local iso-drawing (require :isohue.iso-drawing))
(local iso-utils (require :isohue.iso-utils))
(defn iso-tile-basic [name top side]
  (local new-tile (iso-tile))
  (set new-tile.name name)
  (set new-tile.top-texture top)
  (set new-tile.side-texture side)
  (lambda new-tile.draw [x y z context]
    (var top? nil)
    (var sidea? nil)
    (var sideb? nil)
    (defn check-sides [context texture]
      (when (= (. context (iso-utils.index [0 1 0])) nil)
        (set sidea? texture))
      (when (= (. context (iso-utils.index [1 0 0])) nil)
        (set sideb? texture)))
    (when (= (. context (iso-utils.index [0 0 1])) nil)
      (set top? new-tile.top-texture)
      (check-sides context new-tile.side-texture))
    ;(print top? sidea? sideb? x y z)
    (iso-drawing.draw-iso x y z
      top?
      sidea?
      sideb?))
  new-tile)

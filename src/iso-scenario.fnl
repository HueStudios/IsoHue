(local iso-utils (require :iso-utils))
(lambda iso-scenario [width height depth tileset]
  (local new-scenario {})
  (set new-scenario.tile-set tileset)
  (set new-scenario.width width)
  (set new-scenario.height height)
  (set new-scenario.depth depth)
  (set new-scenario.tiles {})
  (lambda new-scenario.set-tile [position type]
    (var valid (<= (. 1 position) new-scenario.width))
    (set valid (<= (. 2 position) new-scenario.height))
    (set valid (<= (. 3 position) new-scenario.depth))
    (set valid (>= (. 1 position) 1))
    (set valid (>= (. 2 position) 1))
    (set valid (>= (. 3 position) 1))
    (assert valid "The tile position is invalid")
    (local fixed-position (iso-utils.index position))
    (tset new-scenario.tiles fixed-position type)))
  (defn new-scenario.draw-scenario []
    (for [z 1 new-scenario.depth]
      (for [y 1 new-scenario.height]
        (for [x 1 new-scenario.width]
          (local this-tile (. (iso-utils.index [x y z]))
          (local context {})
          (local boundaz (- z 2))
          (local boundbz (+ z 2))
          (local boundax (- x 2))
          (local boundbx (+ x 2))
          (local bounday (- y 2))
          (local boundby (+ y 2))
          (for [za -2 2]
            (for [ya -2 2])
              (for [xa -2 2]
                (local zb (+ za z))
                (local yb (+ ya y))
                (local xb (+ xa x))
                (local this-tile (. (iso-utils.index [xb yb zb]))
                (tset context (iso-utils.index [xa ya za])))
          (local this-tile-drawer (new-scenario.tile-set.get-by-name this-tile))
          (this-tile.draw x y z context)))))

(local iso-drawing {})
(lambda iso-drawing.draw-texture [iso-texture x y ?flip]
  (local image-to-draw (iso-texture.get-image))
  (var origin-x iso-texture.origin-x)
  (var origin-y iso-texture.origin-y)
  (love.graphics.push)
  (var scale-x 1)
  (when ?flip
    (set scale-x -1)
    (set origin-x (+ 2 origin-x)))
  (love.graphics.draw image-to-draw x y 0 scale-x 1 origin-x origin-y)
  (love.graphics.pop))
(defn iso-drawing.draw-iso [x y z top sidea sideb]
  (var (posx posy) (iso-drawing.cartesian-to-iso x y z))
  (set posx (* posx 32))
  (set posy (* posy 32))
  (when top
    (love.graphics.setColor 1 1 1)
    (iso-drawing.draw-texture top posx posy))
  (when sidea
    (love.graphics.setColor 0.8 0.7 0.6)
    (iso-drawing.draw-texture sidea posx posy))
  (when sideb
    (love.graphics.setColor 0.6 0.5 0.4)
    (iso-drawing.draw-texture sideb posx posy true)))
(lambda iso-drawing.iso-to-cartesian [x y z]
  (local new-x (/ (+ (* 2 (+ y (/ z 2)) x) 2)))
  (local new-y (/ (- (* 2 (+ y (/ z 2)) x) 2)))
  (values new-x new-y))
(lambda iso-drawing.cartesian-to-iso [x y z]
  (local new-x (- x y))
  (local new-y (- (/ (+ x y) 2) (/ z 2)))
  (values new-x new-y))
iso-drawing

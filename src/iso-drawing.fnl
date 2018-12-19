(local iso-drawing {})
(lambda iso-drawing.draw-texture [iso-texture x y ?flip]
  (local image-to-draw (iso-texture.get-image))
  (var origin-x iso-texture.origin-x)
  (var origin-y iso-texture.origin-y)
  (love.graphics.push)
  (var scale-x 1)
  (when ?flip
    (set scale-x -1))
  (love.graphics.draw image-to-draw x y 0 scale-x 1 origin-x origin-y)
  (love.graphics.pop))
(lambda iso-drawing.iso-to-cartesian [x y z]
  (local new-x (/ (+ (* 2 (- y (/ z 2)) x) 2)))
  (local new-y (/ (- (* 2 (- y (/ z 2)) x) 2)))
  (values new-x new-y))
(lambda iso-drawing.cartesian-to-iso [x y z]
  (local new-x (- x y))
  (local new-y (+ (/ (+ x y) 2) (/ z 2)))
  (values new-x new-y))
iso-drawing

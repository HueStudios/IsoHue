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
iso-drawing

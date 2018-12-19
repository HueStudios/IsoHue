(lambda iso-texture [filename origin-x origin-y]
  (local iso-texture {})
  (set iso-texture.cached-image nil)
  (set iso-texture.filename filename)
  (set iso-texture.origin-x origin-x)
  (set iso-texture.origin-y origin-y)
  (defn iso-texture.get-image []
    (when (not iso-texture.cached-image)
      (local image (love.graphics.newImage iso-texture.filename))
      (: image :setFilter :nearest :nearest)
      (set iso-texture.cached-image image))
    iso-texture.cached-image)
  (lambda iso-texture.draw [x y ?flip]
    (local image-to-draw (iso-texture.get-image))
    (var origin-x iso-texture.origin-x)
    (local height (: image-to-draw :getHeight))
    (var origin-y iso-texture.origin-y)
    (love.graphics.push)
    (var scale-x 1)
    (when ?flip
      (set scale-x -1))
    (love.graphics.draw image-to-draw x y 0 scale-x 1 origin-x origin-y)
    (love.graphics.pop))
  iso-texture)

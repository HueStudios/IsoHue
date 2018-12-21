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
  iso-texture)

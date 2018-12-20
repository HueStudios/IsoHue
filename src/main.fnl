(local iso-texture (require :iso-texture))
(local iso-drawing (require :iso-drawing))
(local iso-tile-terrain (require :iso-tile-terrain))

(var top nil)
(var side nil)
(var trans nil)
(var deep nil)
(var terrain nil)

(defn love.load []
  (set top (iso-texture :depends/iso-tile-top.png 47 47))
  (set side (iso-texture :depends/iso-tile-side.png 47 30))
  (set trans (iso-texture :depends/iso-tile-side-layer-transition.png 47 30))
  (set deep (iso-texture :depends/iso-tile-side-layer-lower.png 47 30))
  (set terrain (iso-tile-terrain top side trans deep)))

(defn love.update [dt])

(defn love.draw []
  (love.graphics.translate 200 200)
  (love.graphics.scale 3)
  (iso-drawing.draw-iso 0 0 0 top side side))

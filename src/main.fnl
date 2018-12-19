(local iso-texture (require :iso-texture))
(local iso-drawing (require :iso-drawing))

(var top nil)
(var effect nil)
(var side nil)

(defn love.load []
  (set top (iso-texture :depends/iso-tile-top.png 47 47))
  (set side (iso-texture :depends/iso-tile-side.png 47 30)))

(defn love.update [dt])

(defn love.draw []
  ;(love.graphics.clear 0.5 0.5 0.5)
  (love.graphics.setColor 1 1 1)
  (love.graphics.scale 3 3)
  (iso-drawing.draw-texture top 100 100)
  (love.graphics.setColor 0.5 0.6 0.8)
  (iso-drawing.draw-texture side 100 100)
  (love.graphics.setColor 0.4 0.4 0.6)
  (iso-drawing.draw-texture side 102 100 true))

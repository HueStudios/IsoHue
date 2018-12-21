(local iso-texture (require :isohue.iso-texture))
(local iso-drawing (require :isohue.iso-drawing))
(local iso-tile-terrain (require :isohue.iso-tile-terrain))

(var top nil)
(var side nil)
(var trans nil)
(var deep nil)
(var terrain nil)

(defn love.load []
  (set top (iso-texture :assets/chess/white-tile.png 47 47))
  (set side (iso-texture :assets/chess/board-side.png 47 30))
  (set terrain (iso-tile-terrain top side trans deep)))

(defn love.update [dt])

(defn love.draw []
  (love.graphics.translate 200 200)
  (love.graphics.scale 3)
  (iso-drawing.draw-iso 0 0 0 top side side))

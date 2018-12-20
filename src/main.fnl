(local iso-texture (require :isohue.iso-texture))
(local iso-drawing (require :isohue.iso-drawing))
(local iso-tile-terrain (require :isohue.iso-tile-terrain))

(var top nil)
(var side nil)
(var trans nil)
(var deep nil)
(var terrain nil)

(defn love.load []
  (set top (iso-texture :assets/iso-tile-top.png 47 47))
  (set side (iso-texture :assets/iso-tile-side.png 47 30))
  (set trans (iso-texture :assets/iso-tile-side-layer-transition.png 47 30))
  (set deep (iso-texture :assets/iso-tile-side-layer-lower.png 47 30))
  (set terrain (iso-tile-terrain top side trans deep)))

(defn love.update [dt])

(defn love.draw [])

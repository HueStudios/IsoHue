(local iso-texture (require :isohue.iso-texture))
(local iso-drawing (require :isohue.iso-drawing))
(local iso-tile-basic (require :isohue.iso-tile-basic))
(local iso-tile-set (require :isohue.iso-tile-set))
(local iso-scenario (require :isohue.iso-scenario))

(var top-black-texture nil)
(var side-texture nil)
(var top-white-texture nil)
(var black-tile nil)
(var white-tile nil)
(var board-tile-set nil)
(var board-scenario nil)

(defn love.load []
  (set top-white-texture (iso-texture :assets/chess/white-tile.png 47 47))
  (set top-black-texture (iso-texture :assets/chess/black-tile.png 47 47))
  (set side-texture (iso-texture :assets/chess/board-side.png 47 30))
  (set black-tile (iso-tile-basic :white top-white-texture side-texture))
  (set white-tile (iso-tile-basic :black top-black-texture side-texture))
  (set board-tile-set (iso-tile-set))
  (board-tile-set.add-tile black-tile)
  (board-tile-set.add-tile white-tile)
  (set board-scenario (iso-scenario 8 8 1 board-tile-set))
  (var this-tile :white)
  (for [x 1 8]
    (if (= 0 (% x 2))
      (set this-tile :white)
      (set this-tile :black))
    (for [y 1 8]
      (if (= this-tile :white)
        (set this-tile :black)
        (set this-tile :white))
      (board-scenario.set-tile [x y 1] this-tile)
      (print x y this-tile))))

(defn love.update [dt])

(defn love.draw []
  (love.graphics.clear (/ 36 255) (/ 36 255) (/ 36 255))
  (love.graphics.translate 520 50)
  (love.graphics.scale 2)
  (board-scenario.draw-scenario))

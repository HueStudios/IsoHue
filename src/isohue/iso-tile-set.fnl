(lambda iso-tile-set []
  (local new-tile-set {})
  (set new-tile-set.tiles {})
  (lambda new-tile-set.add-tile [tile]
    (local index (+ 1 (# new-tile-set.tiles)))
    (tset new-tile-set.tiles index tile))
  (lambda new-tile-set.get-by-name [name]
    (var tile nil)
    (each [k v (pairs new-tile-set.tiles)]
      (when (= v.name name)
        (set tile v)))
    tile))

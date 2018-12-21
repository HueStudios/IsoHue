(local iso-utils {})
(defn iso-utils.index [table]
  (table.concat table "\0"))
iso-utils

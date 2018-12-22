(local iso-utils {})
(defn iso-utils.index [index-table]
  (table.concat index-table "\0"))
iso-utils

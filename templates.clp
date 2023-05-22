(deftemplate cliente
  (slot id)
  (slot nombre)
  (slot correo)
  (slot cel)
)

(deftemplate producto
  (slot marca)
  (slot modelo)
  (slot memoria)
  (slot precio)
  (slot existencia)
)

(deftemplate tarjeta
  (slot nombre)
)

(deftemplate orden-compra
  (slot cliente-id)
  (multislot productos)
)

(deftemplate oferta
  (slot descripcion)
)

(deftemplate descuento
  (slot porcentaje)
)

(deftemplate sugerencia
  (slot descripcion)
)

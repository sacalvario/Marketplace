
(defrule oferta-iphone
  (orden-compra (cliente-id ?id) (productos $?productos&:(member$ "iPhone 14" ?productos)))
  (cliente (id ?id))
  (tarjeta (nombre "Banamex"))
  =>
  (assert (oferta (descripcion "Oferta: Compra un iPhone 14 a 24 meses sin intereses con tarjeta Banamex")))
)

(defrule oferta-tablet-samsung
  (orden-compra (cliente-id ?id) (productos $?productos&:(member$ "Tablet SamsungX" ?productos)))
  (cliente (id ?id))
  (tarjeta (nombre "Liverpool VISA"))
  =>
  (assert (oferta (descripcion "Oferta: Compra una Tablet SamsungX a 12 meses sin intereses con tarjeta Liverpool VISA")))
)

(defrule descuento-applewatch-iphone
  (orden-compra (cliente-id ?id) (productos $?productos&:(member$ "AppleWatch" ?productos)))
  =>
  (assert (descuento (porcentaje 10)))
)

(defrule descuento-smartphone
  (orden-compra (cliente-id ?id) (productos $?productos&:(member$ "SmartphoneXYZ" ?productos)))
  =>
  (assert (descuento (porcentaje 15)))
)

(defrule sugerencia-compra
  (orden-compra (cliente-id ?id) (productos $?productos))
  (cliente (id ?id))
  (not (descuento))
  =>
  (assert (sugerencia (descripcion "Sugerencia: Aprovecha nuestras ofertas especiales en productos seleccionados")))
)


;; Reglas para mostrar resultados

(defrule mostrar-oferta
  ?f <- (oferta (descripcion ?descripcion))
  =>
  (printout t ?descripcion crlf)
  (retract ?f)
)

(defrule mostrar-descuento
  ?f <- (descuento (porcentaje ?porcentaje))
  =>
  (printout t "Descuento: " ?porcentaje "%" crlf)
  (retract ?f)
)

(defrule mostrar-sugerencia
  ?f <- (sugerencia (descripcion ?descripcion))
  =>
  (printout t ?descripcion crlf)
  (retract ?f)
)

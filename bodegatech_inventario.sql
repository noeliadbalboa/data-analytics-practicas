DROP TABLE IF EXISTS inventario;

CREATE TABLE inventario (
  id_producto int PRIMARY KEY, --el id (también clave primaria) debe ser dígito entero y que se considera como identificador único
  nombre_producto varchar(100), --el nombre del producto sólo permite hasta 100 caracteres, si fuera un texto más largo, su tipo de dato sería text
  categoria varchar(50), --misma situación que con nombre_producto, sólo que la categoría es más acotada y se debe aclarar de debe ser de hasta 50 caracteres
  precio_unitario decimal(10,2), --para precio debe ser un valor en decimal y con la restricción de que debe ser de hasta 10 dígitos y 2 decimales
  stock_actual int, --debe ser un número entero ya que representa una cantidad
  stock_minimo int, --debe ser un número entero ya que representa una cantidad
  fecha_ingreso date, --este campo representa una fecha fija, por eso se eligió date
  activo tinyint(1) --únicamente deben ser 2 números permitidos hasta el 1, ya que cada uno representa un estado (1=disponible, 0=discontinuado)
)

CREATE TABLE clientes (
  id_cliente int PRIMARY KEY, --int representa número entero (sin decimales) ya que un ID es un nro identificatorio
  nombre varchar(100), --espacio para texto de hasta 100 caracteres
  perfil_bio text, --según la consigna, se necesita un bloque de texto muy largo
  fecha_registro date --usé date para fechas exatas
);

CREATE TABLE productos (
  id_producto int PRIMARY KEY, --idem id_cliente, el ID debe ser nro entero
  descripcion varchar(255), --espacio para texto de hasta 255 caracteres
  precio decimal(10,2), --número decimal de hasta 10 dígitos y 2 decimales
  esta_activo bit --el tipo de dato debe ser true o false
);

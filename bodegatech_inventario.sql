-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Noelia Balboa
-- Fecha: 19-10-2026
-- ══════════════════════════════════════════

--Sección DDL - Definiendo la estructura
--Paso 1 - Elimina la tabla si ya existe para poder re-ejecutar el script sin errores
DROP TABLE IF EXISTS inventario;

--Paso 2 - Creación de la tabla inventario con todas sus columnas indicadas, sus tipos de datos y clave primaria en id_producto
CREATE TABLE inventario (
  id_producto int PRIMARY KEY, --el id (también clave primaria) debe ser dígito entero y que se considera como identificador único
  nombre_producto varchar(100), --el nombre del producto sólo permite hasta 100 caracteres, si fuera un texto más largo, su tipo de dato sería text
  categoria varchar(50), --misma situación que con nombre_producto, sólo que la categoría es más acotada y se debe aclarar de debe ser de hasta 50 caracteres
  precio_unitario decimal(10,2), --para precio debe ser un valor en decimal y con la restricción de que debe ser de hasta 10 dígitos y 2 decimales
  stock_actual int, --debe ser un número entero ya que representa una cantidad
  stock_minimo int, --debe ser un número entero ya que representa una cantidad
  fecha_ingreso date, --este campo representa una fecha fija, por eso se eligió date
  activo tinyint(1) --únicamente deben ser 2 números permitidos hasta el 1, ya que cada uno representa un estado (1=disponible, 0=discontinuado)
);

--Sección DML - Trabajando con los datos
--Paso 3 - Inserción del contenido de la tabla.
INSERT INTO inventario
 (id_producto, nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES
    (1,  'Laptop Pro 15',       'Computación',    1200.00, 15, 3,  '2024-01-10', 1),
    (2,  'Mouse Inalámbrico',   'Accesorios',       28.00, 80, 10, '2024-01-10', 1),
    (3,  'Monitor 4K 27"',      'Computación',     450.00, 12, 2,  '2024-01-15', 1),
    (4,  'Teclado Mecánico',    'Accesorios',       95.00, 40, 5,  '2024-01-15', 1),
    (5,  'Laptop Basic 14',     'Computación',     650.00, 20, 3,  '2024-02-01', 1),
    (6,  'Auriculares BT Pro',  'Audio',           120.00, 35, 5,  '2024-02-01', 1),
    (7,  'Hub USB-C 7 puertos', 'Accesorios',       45.00, 60, 10, '2024-02-10', 1),
    (8,  'Webcam HD 1080p',     'Accesorios',       85.00, 25, 5,  '2024-02-10', 1),
    (9,  'SSD Externo 1TB',     'Almacenamiento',  130.00, 18, 3,  '2024-03-01', 1),
    (10, 'Parlante Bluetooth',  'Audio',            60.00, 45, 8,  '2024-03-01', 1);

--Paso 4 - Actualizar el stock_actual
UPDATE inventario SET stock_actual = stock_actual - 3  WHERE id_producto = 1;
UPDATE inventario SET stock_actual = stock_actual - 12 WHERE id_producto = 2;
UPDATE inventario SET stock_actual = stock_actual - 5 WHERE id_producto = 6;

--Paso 5 - Actualización adicional
UPDATE inventario SET activo = 0 WHERE id_producto = 8;

--Paso 6 - Confirmar la carga
SELECT * FROM inventario;

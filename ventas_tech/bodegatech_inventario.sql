-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Noelia Balboa
-- Fecha: 2026-10-19
-- Motor: SQL Server (SSMS)
-- ══════════════════════════════════════════


-- ── SECCIÓN DDL ──────────────────────────

-- DROP TABLE: permite re-ejecutar el script sin errores
DROP TABLE IF EXISTS inventario;

-- CREATE TABLE: define la estructura de la tabla
CREATE TABLE inventario (
    -- INT: identificador numérico entero; PRIMARY KEY garantiza que sea único y no nulo
    id_producto     INT           NOT NULL PRIMARY KEY,
    nombre_producto VARCHAR(100)  NOT NULL,
    categoria       VARCHAR(50)   NOT NULL,
    -- DECIMAL(10,2): valor monetario exacto, con 2 decimales; FLOAT generaría imprecisiones
    precio_unitario DECIMAL(10,2) NOT NULL,
    -- INT: las unidades de stock son siempre números enteros
    stock_actual    INT           NOT NULL,
    stock_minimo    INT           NOT NULL,
    -- DATE: solo interesa la fecha de ingreso, no la hora
    fecha_ingreso   DATE          NOT NULL,
    -- TINYINT: en SQL Server no existe TINYINT(1); alcanza para guardar 1 (disponible) o 0 (descontinuado)
    activo          TINYINT       NOT NULL DEFAULT 1
);


-- ── SECCIÓN DML ──────────────────────────

-- INSERT INTO: carga inicial de los 10 productos (columnas indicadas explícitamente)
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

-- UPDATE ventas del día (cada uno con su WHERE)
-- Laptop Pro 15: 15 - 3 = 12
UPDATE inventario SET stock_actual = stock_actual - 3  WHERE id_producto = 1;
-- Mouse Inalámbrico: 80 - 12 = 68
UPDATE inventario SET stock_actual = stock_actual - 12 WHERE id_producto = 2;
-- Auriculares BT Pro: 35 - 5 = 30
UPDATE inventario SET stock_actual = stock_actual - 5  WHERE id_producto = 6;

-- UPDATE producto descontinuado: Webcam HD 1080p
UPDATE inventario SET activo = 0 WHERE id_producto = 8;

-- SELECT validación: ver la tabla completa para confirmar la carga
SELECT * FROM inventario;

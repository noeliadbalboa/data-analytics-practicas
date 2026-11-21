-- ══════════════════════════════════════════
-- TechStore - Consultas con JOINs 
-- Autor: Noelia Balboa
-- Fecha: 21-11-2026
-- ══════════════════════════════════════════

-- ══════════════════════════════════════════
-- Consulta 1 - Vista base del proyecto (INNER JOIN)
-- Propósito: Mostrar los datos de cada venta de manera completa usando INNER JOIN
SELECT
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre              AS nombre_cliente,
    c.ciudad,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes   AS c   ON v.id_cliente   = c.id_cliente
INNER JOIN productos  AS p   ON v.id_producto  = p.id_producto
INNER JOIN categorias AS cat ON p.id_categoria = cat.id_categoria
ORDER BY total_venta DESC;

-- Hallazgo: Se identifican 26 registros en orden descendente a la totalidad de venta por cliente
-- Las 8 ventas más altas han sido de la Laptop Pro 15

-- ══════════════════════════════════════════
-- Consulta 2 - Clientes sin ventas (LEFT JOIN)
-- Propósito: Identificar clientes registrados que no han realizado ninguna venta
SELECT 
    c.id_cliente,
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.fecha_registro;

-- Hallazgo: De los 9 clientes registrados,  1 sólo no realizó ninguna compra, el mismo es el último cliente registrado

-- ══════════════════════════════════════════
-- Consulta 3 - Productos sin ventas (LEFT JOIN)
-- Propósito: Identificar productos que no han tenido ninguna venta
SELECT
    p.id_producto,
    p.nombre_producto,
    p.id_categoria,
    p.precio
FROM productos AS p
LEFT JOIN ventas AS v ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL
ORDER BY p.precio;

-- Hallazgo: El Disco SSD 1TB es el único producto de los 8 registrados que no ha tenido ninguna venta 

-- ══════════════════════════════════════════
-- Consulta 4 - Consolidado por canal (UNION ALL)
-- Propósito: Obtener ventas que se originan en grupos distintos y obtener el total de cada uno. 
-- Se eligió separar en 2 períodos de tiempo en fecha_venta
SELECT 
    canal, 
    SUM(total) AS total_canal
FROM (
    SELECT 
        fecha_venta, 
        cantidad * precio_unitario AS total, 
        'Primera etapa' AS canal
    FROM ventas WHERE fecha_venta <= '2026-03-10'
    UNION ALL
    SELECT 
        fecha_venta, 
        cantidad * precio_unitario AS total, 
        'Segunda etapa' AS canal
    FROM ventas WHERE fecha_venta > '2026-03-10'
) AS consolidado
GROUP BY canal;

-- Hallazgo: Se registró mayor venta en la segunda etapa, obteniendo $9430.00 en la misma, a diferencia de la primera, que se obtuvo un total de $7140.00

-- ══════════════════════════════════════════
-- TechStore - Consultas SQL del negocio
-- Autor: Noelia Balboa
-- Fecha: 29-10-2026
-- ══════════════════════════════════════════

--Consulta 1 — Resumen ejecutivo mensual 
SELECT 
  MONTH(fecha_venta) AS mes,
  SUM(cantidad * precio_unitario) AS total_facturado, 
  COUNT(*) AS cantidad_pedidos,
  AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

--Consulta 2 — Ranking de productos
SELECT TOP 5
  id_producto,
  SUM(cantidad) AS unidades_vendidas,
  SUM(cantidad * precio_unitario) AS total_facturado 
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

--Consulta 3 — Clientes recurrentes
SELECT 
  id_cliente,
  COUNT(cantidad) as cantidad_pedidos,
  SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP  BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC;

--Consulta 4 — Meses por encima/por debajo del promedio
WITH VentasMensuales AS (
    SELECT 
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_mes
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT 
    mes,
    total_mes,
    (SELECT AVG(total_mes) FROM VentasMensuales) AS promedio_general,
    CASE 
        WHEN total_mes >= (SELECT AVG(total_mes) FROM VentasMensuales) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS evaluacion_promedio
FROM VentasMensuales
ORDER BY mes;

--Bloque de cierre
-- 1. Sólo se registra el 100% de las operaciones en el mes 3 (marzo).
-- 2. El prodcto con id 1 lidera el ranking de productos con mayor facturación (3600) en 3 unidades vendidas.
-- 3. En aspectos generales, marzo registra una facturación por encima del promedio mensual general.

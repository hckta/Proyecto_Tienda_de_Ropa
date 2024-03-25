USE Tienda_de_ropa_rivero;

-- VISTAS
-- Agregaremos una vista para ver la direccion de cada cliente para el envio de los productos
CREATE OR REPLACE VIEW vista_direcciones_ventas_clientes AS
SELECT c.id_cliente, c.nombre_cliente, c.direccion, v.id_venta
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente;

SELECT * FROM vista_direcciones_ventas_clientes;

-- Agregaremos una vista para ver todas las ventas del año 2023
CREATE OR REPLACE VIEW vista_ventas_2023 AS
SELECT *
FROM ventas
WHERE YEAR(fecha_venta) = 2023;
SELECT * FROM vista_ventas_2023;

-- Agregaremos una vista para ver todas las ventas del año 2022
CREATE OR REPLACE VIEW vista_ventas_2022 AS
SELECT *
FROM ventas
WHERE YEAR(fecha_venta) = 2022;
SELECT * FROM vista_ventas_2022;

-- Agregatemos una vista para ver todas las ventas mayores a 30.000,00 
-- ya que iran con un cupon de descuento en una proxima compra
CREATE OR REPLACE VIEW vista_ventas_mayores_30000_con_clientes AS
SELECT v.id_venta, v.id_cliente, c.nombre_cliente AS nombre_cliente, c.email, c.dni, c.direccion, v.fecha_venta, v.total_venta
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE v.total_venta > 30000.00;
SELECT * FROM vista_ventas_mayores_30000_con_clientes;

-- Agregaremos una vista para observar todos los pedidos a proveedores en el año 2023
CREATE OR REPLACE VIEW vista_pedidos_proveedores_2023 AS
SELECT *
FROM pedidos_proveedores
WHERE YEAR(fecha) = 2023;
SELECT * FROM vista_pedidos_proveedores_2023;

-- Agregaremos una vista para observar todos los pedidos a proveedores en el año 2022
CREATE OR REPLACE VIEW vista_pedidos_proveedores_2022 AS
SELECT *
FROM pedidos_proveedores
WHERE YEAR(fecha) = 2022;
SELECT * FROM vista_pedidos_proveedores_2022;



-- Vistas para importar y analizar en Microsoft Excel

-- Vista para los productos que mas se vendieron
CREATE OR REPLACE VIEW vista_productos_mas_vendidos AS    
SELECT p.id_producto, p.tipo_producto, SUM(dv.cantidad) AS total_vendido
FROM detalles_ventas dv
JOIN productos p ON dv.id_producto = p.id_producto
GROUP BY p.id_producto, p.tipo_producto
ORDER BY total_vendido DESC;

-- Vista para visualizar la ganancia neta y pocentaje de ganancia por cada producto
CREATE OR REPLACE VIEW vista_ganancia_porcentaje AS
SELECT 
    pp.id_producto,
    p.tipo_producto,
    (dv.precio_unitario - pp.precio_unidad) AS ganancia_neta,
    ((dv.precio_unitario - pp.precio_unidad) / dv.precio_unitario) * 100 AS ganancia_porcentaje
FROM detalles_ventas dv
JOIN productos p ON dv.id_producto = p.id_producto
JOIN (
    SELECT id_producto, MAX(precio_unidad) AS precio_unidad
    FROM pedidos_proveedores
    GROUP BY id_producto
) pp ON dv.id_producto = pp.id_producto;

-- Vista para la cantidad de compras realizadas por los clientes
CREATE OR REPLACE VIEW vista_cantidad_compras AS
SELECT 
    dv.id_cliente,
    c.nombre_cliente,
    COUNT(*) AS total_compras
FROM detalles_ventas dv
JOIN clientes c ON dv.id_cliente = c.id_cliente
GROUP BY dv.id_cliente
ORDER BY total_compras DESC;

-- Vista para la cantidad de compras y cantidad de productos comprados por clientes 
CREATE OR REPLACE VIEW vista_cantidad_compras_productos AS
SELECT 
    dv.id_cliente,
    c.nombre_cliente,
    COUNT(*) AS total_compras,
    SUM(dv.cantidad) AS total_productos_comprados
FROM detalles_ventas dv
JOIN clientes c ON dv.id_cliente = c.id_cliente
GROUP BY dv.id_cliente
ORDER BY total_compras DESC;
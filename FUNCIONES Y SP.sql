USE Tienda_de_ropa_rivero;

-- FUNCIONES
-- Agregaremos una funcion que permita calcular el total de ingresos de las ventas de 2023
DELIMITER $$

CREATE FUNCTION calcularTotalVentas2023() RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(total_venta) INTO total FROM ventas WHERE YEAR(fecha_venta) = 2023;
    RETURN COALESCE(total, 0);
END $$

DELIMITER ;
SELECT calcularTotalVentas2023() AS total_ventas_2023;

-- Agregaremos una funcion que nos permita calcular el promedio de ventas del año 2023
-- Calculando el monto total anual dividido la cantiad de ventas
DELIMITER $$

CREATE FUNCTION calcularPromedioVentas2023() RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    DECLARE cantidad INT;
    DECLARE promedio DECIMAL(10, 2);

    SELECT SUM(total_venta), COUNT(*) INTO total, cantidad
    FROM ventas
    WHERE YEAR(fecha_venta) = 2023;

    IF cantidad > 0 THEN
        SET promedio = total / cantidad;
    ELSE
        SET promedio = 0;
    END IF;

    RETURN promedio;
END $$

DELIMITER ;
SELECT calcularPromedioVentas2023() AS promedio_ventas_2023;

-- STORED PROCEDURES

-- Agregaremos un stored procedures que advierta cuando algun tipo de producto
-- tenga un stock inferior a 30 unidades
DELIMITER $$

CREATE PROCEDURE notificarStockBajo(producto_id INT)
BEGIN
    DECLARE stock_actual INT;
    
    -- Obtendremos el stock actual del producto
    SELECT stock INTO stock_actual
    FROM productos
    WHERE id_producto = producto_id;

    -- Verificaremos si el stock es menor a 30
    IF stock_actual < 30 THEN
        -- Si el stock es menor a 30
        SELECT CONCAT('¡Advertencia! Stock bajo para el producto ', producto_id, '. Stock actual: ', stock_actual) AS mensaje;
    ELSE
        -- Si el stock es mayor a 30
        SELECT CONCAT('Stock suficiente para el producto ', producto_id, '. Stock actual: ', stock_actual) AS mensaje;
    END IF;
END $$

DELIMITER ;
-- Aqui colocaremos el id_producto del producto 
-- para el cual deseamos obtener la informacion de stock
CALL notificarStockBajo(1);

-- Agregaremos un SP que realizara una actualizacion del stock cada vez por cada venta
DELIMITER $$

CREATE PROCEDURE actualizarStock(
    IN cliente_id INT,
    IN producto_id INT,
    IN cantidad INT,
    OUT total_venta DECIMAL(10, 2)
)
BEGIN
    DECLARE precio_producto DECIMAL(10, 2);
    
    -- Obtendremos el precio del producto
    SELECT precio INTO precio_producto
    FROM productos
    WHERE id_producto = producto_id;

    -- Calcularemos el total de la venta
    SET total_venta = precio_producto * cantidad;

    -- Actualizaremos el stock y registraremos la venta
    UPDATE productos
    SET stock = stock - cantidad
    WHERE id_producto = producto_id;

    INSERT INTO ventas (id_cliente, fecha_venta, total_venta)
    VALUES (cliente_id, CURDATE(), total_venta);
END $$

DELIMITER ;
-- Para llamar al SP deberemos indicar 
-- El id_cliente que realiza la compra
-- El id_producto que identifica que producto compra
-- La cantidad de productos que el cliente esta comprando
-- Y la variable que calculara el valor total de la venta
CALL actualizarStock(1, 1, 2, @total_venta);
SELECT @total_venta AS total_venta;
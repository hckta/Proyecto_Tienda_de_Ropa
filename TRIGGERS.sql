USE Tienda_de_ropa_rivero;

-- TRIGGERS

-- Agregaremos un trigger que nos permita registrar la fecha de la ultima venta de cada producto
-- esto nos permitira saber que productos no se venden hace mucho tiempo y no son deseados por los clientes

-- Creamos la tabla para insertar los registros del trigger
CREATE TABLE ultima_venta_producto (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    ultima_fecha_venta DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    UNIQUE (id_producto, ultima_fecha_venta)
);
DELIMITER $$

CREATE TRIGGER actualizarFechaUltimaVenta
AFTER INSERT ON detalles_ventas
FOR EACH ROW
BEGIN
    INSERT INTO ultima_venta_producto (id_producto, ultima_fecha_venta)
    VALUES (NEW.id_producto, CURRENT_DATE)
    ON DUPLICATE KEY UPDATE ultima_fecha_venta = CURRENT_DATE;
END $$

DELIMITER ;


-- Agregaremos un trigger que NO permita la venta de un producto del que no hay stock
-- y que ademas advierta que no hay unidades disponibles
-- Crearemos la esta tabla para insertar los registros de aquellos productos que no tengan stock

CREATE TABLE sin_stock (
    id_stock INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    stock_actual INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

DELIMITER $$
CREATE TRIGGER verificarStockAntesDeVenta
BEFORE INSERT ON detalles_ventas
FOR EACH ROW
BEGIN
    -- Verificaremos si el stock es 0
    IF (SELECT stock FROM productos WHERE id_producto = NEW.id_producto) = 0 THEN
        -- Insertaremos en la tabla sin_stock
        INSERT INTO sin_stock (id_producto, stock_actual)
        VALUES (NEW.id_producto, 0); 

        -- Generar un error para evitar la venta si el stock es 0
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede realizar la venta, no hay unidades disponibles en stock';
    END IF;
END $$
DELIMITER ;
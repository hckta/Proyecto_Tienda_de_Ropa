USE Tienda_de_ropa_rivero;

-- Agregar datos de clientes
INSERT INTO clientes (nombre_cliente, email, dni, direccion) 
VALUES
    ('Rodrigo Gamarra', 'rod.gamarra@hotmail.com', 42367831, 'Av Presidente Peron 5636, Santa fe'),
    ('Matias Duarte', 'mati.duarte@email.com', 38902311, 'Peschel 4562, Mendoza'),
    ('Claudia Lopez', 'clau.lopez@yahoo.com', 25678901, 'Calle N37 162, La Plata'),
    ('Miguel Gutierrez', 'migue@gmail.com', '45600200', 'Av Bradley 1240, El Palomar'),
    ('Ana García', 'ana.garcia@example.com', 12345678, 'Calle 1230, Bahia Blanca'),
    ('Pedro Martínez', 'pedro.martinez@example.com', 23456789, 'Av Rosas 4560, Mar del plata '),
    ('Laura Fernández', 'laura.fernandez@example.com', 34567890, 'Los pensamientos 7890, Ciudad Jardin'),
    ('Javier Rodríguez', 'javier.rodriguez@example.com', 45678901, 'Av Marconi 4550, Tucuman'),
    ('Cecilia López', 'cecilia.lopez@example.com', 56789012, 'Manuel Belgrano 345, Moron'),
    ('Carlos González', 'carlos.gonzalez@example.com', 67890123, 'Calle N15 290, La Plata'),
    ('Sofía Pérez', 'sofia.perez@example.com', 78901234, 'Av Santa Fe 901, Capital Federal'),
    ('Alejandro Sánchez', 'alejandro.sanchez@example.com', 89012345, 'La paz 3856, Resistencia'),
    ('Lucía Martín', 'lucia.martin@example.com', 90123456, 'Figueroa Alcorta 567, Santiago del Estero'),
    ('David Hernández', 'david.hernandez@example.com', 11223344, 'Buen viaje 4570, Tandil'),
    ('Elena Gómez', 'elena.gomez@example.com', 44556677, 'Juan B Justo 4567, Mendoza');
    
    -- Agregar datos de productos
INSERT INTO productos (tipo_producto, precio, stock) 
VALUES
    ('Pantalones de jean', 19999.99, 50),
    ('Remera de Algodón', 9999.99, 100),
    ('Zapatillas Deportivas', 59999.99, 30),
    ('Camisa Formal', 24999.99, 40),
    ('Vestido de Noche', 35999.99, 20),
    ('Sweater de Lana', 17999.99, 60),
    ('Sombrero de Verano', 8999.99, 80),
    ('Chaqueta de Cuero', 54999.99, 25),
    ('Bufanda de Algodon', 4999.99, 120),
    ('Bolso Elegante', 29999.99, 35),
    ('Gafas de Sol', 12999.99, 70),
    ('Traje de Baño', 21999.99, 15),
    ('Pantalones Deportivos', 15999.99, 55),
    ('Gorra de Béisbol', 6999.99, 90),
    ('Sandalia Casual', 37999.99, 28);
    
    -- Agregar datos de proveedores    
INSERT INTO proveedores (nombre_proveedor, tipo_producto, email, telefono) VALUES
    ('FashionStyle', 'Pantalones de jean', 'fashionstyle@example.com', 1134567896),
    ('EleganceShoes', 'Remera de Algodón', 'eleganceshoes@example.com', 1187654321),
    ('AccessoriesHub', 'Zapatillas Deportivas', 'accessorieshub@example.com', 1167890124),
    ('FormalFashionCo', 'Camisa Formal', 'formalfashionco@example.com', 1145678903),
    ('SportsFootwear', 'Vestido de Noche', 'sportsfootwear@example.com', 1189012345),
    ('TinyTrend', 'Sweater de Lana', 'tinytrend@example.com', 1134567891),
    ('ChicBags', 'Sombrero de Verano', 'chicbags@example.com', 110123567),
    ('BeachwearParadise', 'Chaqueta de Cuero', 'beachwearparadise@example.com', 115678902),
    ('HatHeaven', 'Bufanda de Algodon', 'hatheaven@example.com', 1154321098),
    ('CasualWardrobe', 'Bolso Elegante', 'casualwardrobe@example.com', 1110987654),
    ('ElegantFootsteps', 'Gafas de Sol', 'elegantfootsteps@example.com', 1109876543),
    ('JewelJunction', 'Traje de Baño', 'jeweljunction@example.com', 1176543210),
    ('IntimateStyles', 'Pantalones Deportivos', 'intimatestyles@example.com', 1143210987),
    ('WinterWardrobe', 'Gorra de Béisbol', 'winterwardrobe@example.com', 1121098765),
    ('SummerStyles', 'Sandalia Casual', 'summerstyles@example.com', 1134567890);
    
    -- Agregamos datos a la tabla pedidos a proveedores
INSERT INTO pedidos_proveedores (id_orden, id_producto, cantidad_producto, precio_total, precio_unidad, fecha, nombre_proveedor) VALUES
    (1, 1, 6, 80000.00, 13333.33, '2022-07-25', 'FashionStyle'),
    (2, 2, 8, 45000.00, 5625.00, '2022-04-08', 'EleganceShoes'),
    (3, 3, 15, 500000.00, 33333.33, '2023-02-04', 'AccessoriesHub'),
    (4, 4, 10, 180000.00, 18000.00, '2023-03-16', 'FormalFashionCo'),
    (5, 5, 4, 100000.00, 25000.00, '2021-08-21', 'SportsFootwear'),
    (6, 6, 10, 135000.00, 13500.00, '2020-11-23', 'TinyTrend'),
    (7, 7, 15, 110000.00, 7333.33, '2022-09-11', 'ChicBags'),
    (8, 8, 5, 190000.00, 38000.00,'2021-06-08', 'BeachwearParadise'),
    (9, 9, 20, 60000.00, 3000.00, '2021-01-16', 'HatHeaven'),
    (10, 10, 8, 200000.00, 25000.00, '2022-02-11', 'CasualWardrobe'),
    (11, 11, 10, 90000.00, 9000.00,'2023-11-29', 'ElegantFootsteps'),
    (12, 12, 8, 100000.00, 12500.00, '2022-05-22', 'JewelJunction'),
    (13, 13, 5, 45000.00, 9000.00, '2023-07-19', 'IntimateStyles'),
    (14, 14, 5, 25000.00, 5000.00, '2023-09-13', 'WinterWardrobe'),
    (15, 15, 5, 155000.00, 31000.00, '2022-07-10', 'SummerStyles');
    
-- Agregar datos a la tabla ventas
INSERT INTO ventas (id_cliente, fecha_venta, total_venta) 
VALUES
	(6, '2024-01-05', 39999.98),
    (10, '2024-01-07', 29999.97),
    (14, '2024-01-15', 49999.99),
    (8, '2021-02-02', 99999.96),
    (7, '2021-02-10', 71999.98),
    (2, '2022-02-18', 53999.97),
    (7, '2022-03-01', 8999.99),
    (11, '2023-03-09', 109999.98),
    (4, '2023-03-17', 4999.99),
    (9, '2021-03-25', 89999.97),
    (6, '2020-04-03', 25999.98),
    (5, '2021-04-11', 21999.99),
    (12, '2022-04-19', 63999.96),
    (3, '2022-04-27', 13999.99),
    (9, '2023-05-05', 113999.97);
    
-- Agregar datos a la tabla detalles_pedido
INSERT INTO detalles_ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, total_producto) 
VALUES
    (1, 6, 1, 2, 19999.99, 39999.98),
    (2, 10, 2, 3, 9999.99, 29999.97),
    (3, 14, 3, 1, 49999.99, 49999.99),
    (4, 8, 4, 4, 24999.99, 99999.96),
    (5, 7, 5, 2, 35999.99, 71999.98),
    (6, 2, 6, 3, 17999.99, 53999.97),
    (7, 7, 7, 1, 8999.99, 8999.99),
    (8, 11, 8, 2, 54999.99, 109999.98),
    (9, 4, 9, 1, 4999.99, 4999.99),
    (10, 9, 10, 3, 29999.99, 89999.97),
    (11, 6, 11, 2, 12999.99, 25999.98),
    (12, 5, 12, 1, 21999.99, 21999.99),
    (13, 11, 13, 4, 15999.99, 63999.96),
    (14, 3, 14, 2, 6999.99, 13999.99),
    (15, 9, 15, 3, 37999.99, 113999.97);
    
-- Agregar datos a la tabla detalles_productos
INSERT INTO detalles_productos (id_producto, tipo_producto, color, marca, talle) 
VALUES
    (1,'Pantalones de jean','Azul', 'Levis', '40'),
    (2,'Remera de Algodón','Negro', 'GAP', 'L'),
    (3,'Zapatillas Deportivas','Gris', 'Nike', '42'),
    (4,'Camisa Formal', 'Blanco', 'Adidas', '38'),
    (5,'Vestido de Noche', 'Rojo', 'Puma', 'M'),
    (6,'Sweater de Lana', 'Verde', 'Under Armour', '44'),
    (7,'Sombrero de Verano', 'Amarillo', 'Converse', '39'),
    (8,'Chaqueta de Cuero', 'Marrón', 'Reebok', 'XL'),
    (9,'Bufanda de Algodon', 'Celeste', 'New Balance', '41'),
    (10,'Bolso Elegante', 'Morado', 'Vans', 'S'),
    (11,'Gafas de Sol', 'Rosa', 'Fila', '36'),
    (12,'Traje de Baño', 'Naranja', 'Tommy Hilfiger', '37'),
    (13,'Pantalones Deportivos', 'Beige', 'Calvin Klein', '43'),
    (14,'Gorra de Béisbol', 'Turquesa', 'NFL', '38'),
    (15,'Sandalia Casual', 'Azul Marino', 'H&M', '39');
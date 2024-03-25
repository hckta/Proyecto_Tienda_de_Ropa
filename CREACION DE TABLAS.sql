CREATE SCHEMA Tienda_de_ropa_rivero;
USE Tienda_de_ropa_rivero;

-- TABLA DE CLIENTES
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    dni INT NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

-- TABLA DE PRODUCTOS
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_producto VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);
-- TABLA DE PROVEEDORES
CREATE TABLE proveedores(
	nombre_proveedor VARCHAR (30) PRIMARY KEY NOT NULL,
    id_producto INT,
    tipo_producto VARCHAR (30) NOT NULL,
    email VARCHAR (30) NOT NULL,
    telefono INT(30) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
    );
    
-- TABLA DE PEDIDOS A PROVEEDORES
CREATE TABLE pedidos_proveedores(
	id_orden INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT NOT NULL,
    cantidad_producto INT NOT NULL,
    precio_total DECIMAL (10,2) NOT NULL,
    precio_unidad DECIMAL (10,2) NOT NULL,
    fecha DATE NOT NULL,
    nombre_proveedor VARCHAR(30) NOT NULL,
	FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (nombre_proveedor) REFERENCES proveedores(nombre_proveedor)
    );
    

-- TABLA DE VENTAS
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    nombre_cliente VARCHAR (50),
    fecha_venta DATE NOT NULL,
    total_venta DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- TABLA INTERMEDIA PARA ALMACENAR LOS PRODUCTOS DE CADA VENTA
CREATE TABLE detalles_ventas (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    total_producto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- TABLA DE DETALLES ESPECIFICOS PARA LOS PRODUCTOS
CREATE TABLE detalles_productos (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    tipo_producto VARCHAR(30) NOT NULL,
    color VARCHAR(15) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    talle VARCHAR(5) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
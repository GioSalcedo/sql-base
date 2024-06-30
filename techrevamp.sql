-- Creación de base de datos
CREATE DATABASE techrevamp;
-- Selección de la base de datos
USE techrevamp
-- Tabla Producto
CREATE TABLE Producto (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(255) NOT NULL
);

-- Tabla Usuario
CREATE TABLE Usuario (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);

-- Tabla Pedido
CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    codigo_pedido VARCHAR(255) UNIQUE NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

-- Tabla Pedido_Producto (relación muchos a muchos entre Pedido y Producto)
CREATE TABLE Pedido_Producto (
    pedido_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (pedido_id, producto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Producto(producto_id)
);

-- Tabla Carrito de compras
CREATE TABLE Carrito (
    carrito_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

-- Tabla Carrito_Producto (relación muchos a muchos entre Carrito y Producto)
CREATE TABLE Carrito_Producto (
    carrito_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (carrito_id, producto_id),
    FOREIGN KEY (carrito_id) REFERENCES Carrito(carrito_id),
    FOREIGN KEY (producto_id) REFERENCES Producto(producto_id)
);

-- Tabla Pago
CREATE TABLE Pago (
    pago_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    monto DECIMAL(10, 2) NOT NULL,
    metodo_pago VARCHAR(255) NOT NULL,
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

-- Tabla Dirección de envío
CREATE TABLE Direccion (
    direccion_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    calle VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255) NOT NULL,
    estado VARCHAR(255) NOT NULL,
    codigo_postal VARCHAR(20) NOT NULL,
    pais VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

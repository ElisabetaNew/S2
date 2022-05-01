# Create schemas
CREATE SCHEMA pizzeria;

USE pizzeria;

# Create tables
CREATE TABLE IF NOT EXISTS client
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    CP VARCHAR(5) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    localidad_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS localidad
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    provincia_id VARCHAR(9) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS provincia
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS pedidos
(
    id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    Fecha_Hora DATETIME NOT NULL,
    Cantidad_productos INT NOT NULL,
    Importe_total DOUBLE DEFAULT 0.00 NOT NULL,
    Tipo_de_pedido_id INT NOT NULL,
    Fech_Hora_entrega DATETIME,
    tienda_id INT NOT NULL,
    PRIMARY KEY(id)
);

# <p>El campo categoria puede ser nulo porque solo corresponde a los productos de la clase Pizza</p>
#
CREATE TABLE IF NOT EXISTS Productos
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    imagen BINARY(255),
    precio DOUBLE NOT NULL,
    Categoria_id INT,
    Clase_producto_id INT,
    PRIMARY KEY(id)
);

# <p>Solo los productos Pizza tiene categoria</p>
#
CREATE TABLE IF NOT EXISTS Categoria
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

# <p>Los productos pueden ser de tres clases</p>
##
##<p>Bebidas, Hamburguesas o&nbsp;Pizzas</p>
##

CREATE TABLE IF NOT EXISTS Clase_producto
(
    id INT NOT NULL AUTO_INCREMENT,
    Tipo_producto VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tienda
(
    id INT NOT NULL AUTO_INCREMENT,
    direccion VARCHAR(45) NOT NULL,
    CP VARCHAR(5) NOT NULL,
    localidad_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Empleado
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    NIF VARCHAR(9) NOT NULL,
    tienda_id INT,
    Posiciones_id INT NOT NULL,
    PRIMARY KEY(id)
);

# <p>Los empleados podran tener la posicion de&nbsp;cocineros o repartidores.</p>
#
#<p>&nbsp;</p>
#
CREATE TABLE IF NOT EXISTS Posiciones
(
    id INT NOT NULL AUTO_INCREMENT,
    Posicion VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Tipo_de_pedido
(
    id INT NOT NULL AUTO_INCREMENT,
    Tipo_pedido VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Lineas_pedido
(
    id INT NOT NULL AUTO_INCREMENT,
    Cantidad_linea INT NOT NULL,
    Importe_linea DOUBLE NOT NULL,
    pedidos_id INT NOT NULL,
    Articulos_id INT NOT NULL,
    PRIMARY KEY(id)
);

# Create FKs
ALTER TABLE localidad
    ADD    FOREIGN KEY (provincia_id)
    REFERENCES provincia(id)
;
    
ALTER TABLE client
    ADD    FOREIGN KEY (localidad_id)
    REFERENCES localidad(id)
;
    
ALTER TABLE pedidos
    ADD    FOREIGN KEY (client_id)
    REFERENCES client(id)
;
    
ALTER TABLE Productos
    ADD    FOREIGN KEY (Categoria_id)
    REFERENCES Categoria(id)
;
    
ALTER TABLE tienda
    ADD    FOREIGN KEY (localidad_id)
    REFERENCES localidad(id)
;
    
ALTER TABLE Empleado
    ADD    FOREIGN KEY (Posiciones_id)
    REFERENCES Posiciones(id)
;
    
ALTER TABLE pedidos
    ADD    FOREIGN KEY (Tipo_de_pedido_id)
    REFERENCES Tipo_de_pedido(id)
;
    
ALTER TABLE Lineas_pedido
    ADD    FOREIGN KEY (pedidos_id)
    REFERENCES pedidos(id)
;
    
ALTER TABLE Lineas_pedido
    ADD    FOREIGN KEY (Articulos_id)
    REFERENCES Productos(id)
;
    
ALTER TABLE pedidos
    ADD    FOREIGN KEY (tienda_id)
    REFERENCES tienda(id)
;
    
ALTER TABLE Empleado
    ADD    FOREIGN KEY (tienda_id)
    REFERENCES tienda(id)
;
    
ALTER TABLE Productos
    ADD    FOREIGN KEY (Clase_producto_id)
    REFERENCES Clase_producto(id)
;
    

# Create Indexes


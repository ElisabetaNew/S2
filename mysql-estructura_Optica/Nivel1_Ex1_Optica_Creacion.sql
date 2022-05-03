# Create schemas
CREATE SCHEMA optica_cul_ampolla;
USE optica_cul_ampolla;

# Create tables
CREATE TABLE IF NOT EXISTS Cliente
(
    id INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45),
    telefono VARCHAR(45),
    email VARCHAR(45),
    fecha_alta DATE,
    Recomendado_por INT,
    Direccion_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Direccion
(
    id INT NOT NULL AUTO_INCREMENT,
    calle VARCHAR(45),
    numero INT,
    piso INT,
    puerta INT,
    ciudad VARCHAR(45),
    CP VARCHAR(5),
    pais VARCHAR(45),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Proveedor
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45),
    telefono VARCHAR(9),
    fax VARCHAR(9),
    NIF VARCHAR(9),
    Direccion_id INT,
    Marca_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Venta
(
    id INT NOT NULL AUTO_INCREMENT,
    empleado INT,
    gafas INT,
    fecha DATE,
    Cliente_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Gafas
(
    id INT NOT NULL AUTO_INCREMENT,
    proveedor INT,
	tipo_montura INT,
    graduacion_IZ FLOAT(3),
    graduacio_DCH FLOAT(3),
    color_montura VARCHAR(45),
    color_vidrio_IZ VARCHAR(45),
    color_vidrio_DCH VARCHAR(45),
    precio DOUBLE,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Empleado
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Marca
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45),
    proveedor INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Tipo_Montura
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45),
    PRIMARY KEY(id)
);


# Create FKs
ALTER TABLE Venta
    ADD    FOREIGN KEY (empleado)
    REFERENCES Empleado(id)
;
    
ALTER TABLE Venta
    ADD    FOREIGN KEY (gafas)
    REFERENCES Gafas(id)
;
    
ALTER TABLE Gafas
    ADD    FOREIGN KEY (proveedor)
    REFERENCES Proveedor(id)
;
    
ALTER TABLE Gafas
    ADD    FOREIGN KEY (tipo_montura)
    REFERENCES Tipo_Montura(id)
;
    
ALTER TABLE Venta
    ADD    FOREIGN KEY (Cliente_id)
    REFERENCES Cliente(id)
;
    
ALTER TABLE Cliente
    ADD    FOREIGN KEY (Direccion_id)
    REFERENCES Direccion(id)
;
    
ALTER TABLE Proveedor
    ADD    FOREIGN KEY (Direccion_id)
    REFERENCES Direccion(id)
;
    
ALTER TABLE Proveedor
    ADD    FOREIGN KEY (Marca_id)
    REFERENCES Marca(id)
;
    
ALTER TABLE Cliente
    ADD    FOREIGN KEY (Recomendado_por)
    REFERENCES Cliente(id)
;
    

# Create Indexes


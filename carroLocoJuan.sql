DROP TABLE IF EXISTS ciudades;
DROP TABLE IF EXISTS tipoDocumento;
DROP TABLE IF EXISTS ocupaciones;
DROP TABLE IF EXISTS profesiones;
DROP TABLE IF EXISTS colores;
DROP TABLE IF EXISTS estadosCiviles;
DROP TABLE IF EXISTS menus;
DROP TABLE IF EXISTS paises;
DROP TABLE IF EXISTS marcas;
DROP TABLE IF EXISTS bancos;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS vehiculos;
DROP TABLE IF EXISTS vendedores;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS vehiculosColor;
DROP TABLE IF EXISTS vehiculosVendedor;
DROP TABLE IF EXISTS bancosProveedor;
DROP TABLE IF EXISTS clientesVehiculos;
DROP TABLE IF EXISTS vehiculosProveedor;
DROP TABLE IF EXISTS ciudades;
-- FALTA UNIFICAR EL TIPO DE DATO DE LAS LLAVES PRIMARIAS 
CREATE TABLE IF NOT EXISTS ciudades
(
    id_ciudad INTEGER NOT NULL,
    nom_ciudad VARCHAR NOT NULL,
    val_latitud VARCHAR NOT NULL, 
    VAL_longitud SMALLINT NOT NULL,
    PRIMARY KEY(id_ciudad)
);
CREATE TABLE IF NOT EXISTS tipoDocumento
(
    id_tipoDocumento SMALLINT NOT NULL,
    documentName VARCHAR NOT NULL,
    PRIMARY KEY(id_tipoDocumento)
);
CREATE TABLE IF NOT EXISTS ocupaciones 
(
    id_ocupacion SMALLINT NOT NULL,
    nom_ocupacion VARCHAR NOT NULL,
    PRIMARY KEY(id_ocupacion)
);
CREATE TABLE IF NOT EXISTS profesiones 
(
    id_profesion SMALLINT NOT NULL,
    nom_profesion VARCHAR NOT NULL,
    PRIMARY KEY(id_profesion)
);
CREATE TABLE IF NOT EXISTS colores
(
    id_color SMALLINT NOT NULL,
    nombreColor VARCHAR NOT NULL,
    PRIMARY KEY(id_color)
);
CREATE TABLE IF NOT EXISTS estadosCiviles
(
    id_estadoCivil SMALLINT NOT NULL,
    nom_estadoCivil VARCHAR NOT NULL,
    PRIMARY KEY(id_estadoCivil)
);
CREATE TABLE IF NOT EXISTS menus 
(
    id_menu SMALLINT NOT NULL,
    nom_menu VARCHAR NOT NULL,
    id_nivel VARCHAR NOT NULL,
    nom_prog VARCHAR NOT NULL,
    PRIMARY KEY(id_menu)
);
CREATE TABLE IF NOT EXISTS paises
(
    id_pais SMALLINT NOT NULL,
    nom_pais VARCHAR NOT NULL,
    PRIMARY KEY(id_pais)
);
CREATE TABLE IF NOT EXISTS marcas 
(
    id_marca SMALLINT NOT NULL,
    nom_marca VARCHAR NOT NULL,
    id_pais SMALLINT NOT NULL,
    PRIMARY KEY(id_marca),
    FOREIGN KEY(id_pais) REFERENCES paises(id_pais)
);
CREATE TABLE IF NOT EXISTS bancos 
(
    id_banco SMALLINT NOT NULL,
    nom_banco VARCHAR NOT NULL,
    dir_banco VARCHAR NOT NULL,
    PRIMARY KEY(id_banco)
);
CREATE TABLE IF NOT EXISTS usuarios 
(
    id_usuario SMALLINT NOT NULL,
    pass_usuario VARCHAR NOT NULL,
    mail_user VARCHAR NOT NULL,
    tel_user INTEGER NOT NULL,
    PRIMARY KEY(id_usuario)
);
CREATE TABLE IF NOT EXISTS clientes
(
    id_cliente INTEGER NOT NULL,
    ape_cliente VARCHAR NOT NULL,
    mail_cliente VARCHAR NOT NULL,
    sexo VARCHAR NOT NULL,
    tel INTEGER NOT NULL,
    num_hijos SMALLINT NOT NULL,
    direccion_cliente VARCHAR NOT NULL,
    id_usuario SMALLINT NOT NULL,
    id_ciudad INTEGER NOT NULL,
    id_tipoDocumento SMALLINT NOT NULL,
    id_ocupacion SMALLINT NOT NULL,
    id_profesion SMALLINT NOT NULL,
    PRIMARY KEY(id_cliente),
    FOREIGN KEY(id_ciudad)  REFERENCES ciudades(id_ciudad),
    FOREIGN KEY(id_tipoDocumento) REFERENCES tipoDocumento(id_tipoDocumento),
    FOREIGN KEY(id_ocupacion) REFERENCES ocupaciones(id_ocupacion),
    FOREIGN KEY(id_profesion) REFERENCES profesiones(id_profesion),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE IF NOT EXISTS vehiculos
(
    id_placa VARCHAR NOT NULL,
    num_motor VARCHAR NOT NULL,
    var_modelo SMALLINT NOT NULL,
    var_capacidad SMALLINT NOT NULL,
    var_cilindraje SMALLINT NOT NULL,
    num_pasajeros SMALLINT NOT NULL,
    tipo_Combustible VARCHAR NOT NULL,
    ind_blindaje SMALLINT NOT NULL,
    val_vehiculo INTEGER NOT NULL,
    num_puertas SMALLINT NOT NULL,
    fec_importacion DATE NOT NULL,
    fec_matricula DATE NOT NULL,
    id_vendedor INTEGER NOT NULL,
    id_marca SMALLINT NOT NULL,
    PRIMARY KEY(id_placa),
    FOREIGN KEY(id_marca) REFERENCES marcas(id_marca)
);
CREATE TABLE IF NOT EXISTS vendedores
(
    id_vendedor INTEGER NOT NULL,
    id_nomVendedor VARCHAR NOT NULL,
    id_apellidoVendedor VARCHAR NOT NULL,
    id_mailVendedor VARCHAR NOT NULL,
    id_fechaNacimiento DATE NOT NULL,
    sexo VARCHAR NOT NULL,
    salarioBase INTEGER NOT NULL,
    cuentaNomina INTEGER NOT NULL,
    acumuladoVentas INTEGER NOT NULL,
    marcasVendidas VARCHAR NOT NULL,
    telefono INTEGER NOT NULL,
    direccion VARCHAR NOT NULL,
    numHijos SMALLINT NOT NULL,
    contactoEmergencia INTEGER NOT NULL,
    fechaVinculacion DATE NOT NULL,
    horaIngreso TIME NOT NULL, 
    horaSalida TIME NOT NULL,
    diaDescanso SMALLINT NOT NULL,
    valorComisiones INTEGER NOT NULL,
    porcentajeComision  SMALLINT NOT NULL,
    metaVentas INTEGER NOT NULL,
    id_estadoCivil SMALLINT NOT NULL,
    id_usuario SMALLINT NOT NULL,
    PRIMARY KEY(id_vendedor),
    FOREIGN KEY(id_estadoCivil) REFERENCES estadosCiviles(id_estadoCivil),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE IF NOT EXISTS proveedores
(
    id_proveedor SMALLINT NOT NULL,
    nombre VARCHAR NOT NULL,
    apellido  VARCHAR NOT NULL,
    correo VARCHAR NOT NULL,
    id_pais VARCHAR NOT NULL,
    telefono INTEGER NOT NULL,
    direccion VARCHAR NOT NULL,
    id_tipoDocumento VARCHAR NOT NULL,
    id_usuario SMALLINT NOT NULL,
    PRIMARY KEY(id_proveedor),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)

);
CREATE TABLE IF NOT EXISTS vehiculosColor
(
    id_placa VARCHAR NOT NULL,
    id_color SMALLINT NOT NULL,
    PRIMARY KEY (id_placa,id_color),
    FOREIGN KEY(id_placa)  REFERENCES vehiculos(id_placa),
    FOREIGN KEY(id_color) REFERENCES colores(id_color)
);
CREATE TABLE IF NOT EXISTS vehiculosVendedor
(
    id_placa VARCHAR NOT NULL,
    id_vendedor INTEGER NOT NULL,
    PRIMARY KEY(id_placa, id_vendedor),
    FOREIGN KEY(id_placa) REFERENCES vehiculos(id_placa),
    FOREIGN KEY(id_vendedor) REFERENCES vendedores(id_vendedor)
);
CREATE TABLE IF NOT EXISTS bancosProveedor
(
    id_proveedor SMALLINT NOT NULL,
    id_banco SMALLINT NOT NULL,
    num_cuenta INTEGER NOT NULL,
    PRIMARY KEY(id_proveedor, id_banco),
    FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY(id_banco) REFERENCES bancos(id_banco)
);
CREATE TABLE IF NOT EXISTS clientesVehiculos 
(
    id_cliente INTEGER NOT NULL,
    id_placa VARCHAR NOT NULL,
    PRIMARY KEY(id_cliente, id_placa),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY(id_placa) REFERENCES vehiculos(id_placa)
);
CREATE TABLE IF NOT EXISTS vehiculosProveedor 
(
    id_placa VARCHAR NOT NULL,
    id_proveedor SMALLINT NOT NULL,
    PRIMARY KEY(id_placa, id_proveedor),
    FOREIGN KEY(id_placa) REFERENCES vehiculos(id_placa),
    FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor)
);




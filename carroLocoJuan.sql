CREATE TABLE IF NOT EXISTS ciudades
(
    id_ciudad INTEGER NOT NULL,
    nom_ciudad VARCHAR NOT NULL,
    val_latitud VARCHAR NOT NULL, 
    VAL_longitud SMALLINT NOT NULL,
    PRIMARY KEY(id_ciudad),
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
CREATE TABLE IF NOT EXISTS bancos 
(
    id_banco SMALLINT NOT NULL,
    nom_banco VARCHAR NOT NULL,
    dir_banco VARCHAR NOT NULL,
    PRIMARY KEY(id_banco)
);
CREATE TABLE IF NOT EXISTS paises
(
    id_pais SMALLINT NOT NULL,
    nom_pais VARCHAR NOT NULL,
    PRIMARY KEY(id_pais)
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
    PRIMARY KEY(id_cliente),
    FOREIGN KEY(id_ciudad)  REFERENCES ciudades(id_ciudad),
    FOREIGN KEY(id_tipoDocumento) REFERENCES tipoDocumento(id_tipoDocumento),
    FOREIGN KEY(id_ocupacion) REFERENCES ocupaciones(id_ocupacion),
    FOREIGN KEY(id_profesion) REFERENCES profesiones (id_profesion)
);
CREATE TABLE IF NOT EXISTS vehiculos
(
    id_placa VARCHAR NOT NULL,
    num_motor VARCHAR NOT NULL,
    var_modelo SMALLINT CHECK(val_modelo <= 2025),
    var_capacidad SMALLINT NOT NULL,
    var_cilindraje SMALLINT NOT NULL,
    num_pasajeros SMALLINT NOT NULL,
    tipo_Combustible VARCHAR NOT NULL,
    ind_blindaje SMALLINT NOT NULL,
    val_vehiculo INTEGER NOT NULL,
    num_puertas SMALLINT NOT NULL,
    fec_importacion DATE NOT NULL,
    fec_matricula DATE NOT NULL,
);

CREATE TABLE IF NOT EXISTS vehiculosColor
(
    
);

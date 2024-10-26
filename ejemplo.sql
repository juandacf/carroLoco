    DROP TABLE IF EXISTS tab_vehiculos;
DROP TABLE IF EXISTS tab_marcas;
DROP TABLE IF EXISTS tab_paises;
DROP TABLE IF EXISTS tab_colores;
DROP TABLE IF EXISTS tab_menu_user;
DROP TABLE IF EXISTS tab_menus;
DROP TABLE IF EXISTS tab_users;




--Tabla de usuarios del sistema.
CREATE TABLE IF NOT EXISTS tab_users
(
    id_user            VARCHAR        NOT NULL,
    pass_user          VARCHAR        NOT NULL, -- Investigar funciones para mejorar la encripcion.
    mail_user          VARCHAR        NOT NULL, -- investigar funcion para validar.
    tel_user           DECIMAL(10,0)  NOT NULL,
    ult_fec_ingreso    TIMESTAMP WITHOUT TIME ZONE  NOT NULL    DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id_user)
);

-- Tabla de menu para usuarios
CREATE TABLE IF NOT EXISTS tab_menu
(
    id_menu            VARCHAR         NOT NULL,
    nom_menu           VARC
    
    
    
    
    
    
    
    HAR         NOT NULL,
    nom_prog           VARCHAR         NOT NULL,
    PRIMARY KEY(id_menu)
);

CREATE TABLE IF NOT EXISTS tab_menu_user
(
    id_user         VARCHAR             NOT NULL,
    id_menu         VARCHAR             NOT NULL,
    PRIMARY KEY(id_user,id_menu),
    FOREIGN KEY(id_user)                REFERENCES tab_users(id_user),
    FOREIGN KEY(id_menu)                REFERENCES tab_menu(id_menu)
);

CREATE TABLE IF NOT EXISTS tab_colores
(
    id_color        VARCHAR     NOT NULL,
    nom_color       VARCHAR     NOT NULL,
    PRIMARY KEY(id_color)
);
CREATE TABLE IF NOT EXISTS tab_paises
(
        id_pais         DECIMAL(3,0)        NOT NULL,
        nom_pais        VARCHAR             NOT NULL,
        zip_pais        VARCHAR             NOT NULL,
        PRIMARY KEY(id_pais)

);
CREATE TABLE IF NOT EXISTS tab_marcas
(
    id_marcas        VARCHAR         NOT NULL,
    nom_marca        VARCHAR         NOT NULL,
    id_pais          DECIMAL(3,0)    NOT NULL,
    PRIMARY KEY(id_marcas),
    FOREIGN KEY(id_pais)            REFERENCES tab_paises(id_pais)
);

CREATE TABLE IF NOT EXISTS tab_vehiculos
(
    id_placa          VARCHAR      NOT NULL,
    id_color          VARCHAR      NOT NULL,
    num_motor         VARCHAR      NOT NULL,
    num_chasis        VARCHAR      NOT NULL,
    val_modelo        DECIMAL(4,0)   CHECK(val_modelo <= 2025),
    id_marca          VARCHAR       NOT NULL,
    PRIMARY KEY(id_placa),
    FOREIGN KEY(id_color)        REFERENCES tab_colores(id_color),
    FOREIGN KEY(id_marca)        REFERENCES tab_marcas(id_marcas)
);
CREATE UNIQUE INDEX idx_num_motor ON tab_vehiculos(num_motor);
CREATE INDEX idx_val_modelo       ON tab_vehiculos(val_modelo);
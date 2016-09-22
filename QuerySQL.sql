-- Gerado por Oracle SQL Developer Data Modeler 4.1.3.901
--   em:        2016-09-22 16:41:52 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE CARTA
  (
    ID_CARTA                 INTEGER NOT NULL ,
    NOME_CARTA               VARCHAR (30) ,
    DESC_CARTA               VARCHAR (141) ,
    IMG_CARTA                OID ,
    FABRICANTE_ID_FABRICANTE INTEGER NOT NULL
  ) ;
ALTER TABLE CARTA ADD CONSTRAINT CARTA_PK PRIMARY KEY ( ID_CARTA ) ;


CREATE TABLE CATALOGO
  (
    USUARIO_CATALOGO VARCHAR (25) NOT NULL ,
    CARTA_CATALOGO   INTEGER NOT NULL ,
    QUANT_CATALOGO   INTEGER ,
    VALOR_CATALOGO FLOAT (2)
  ) ;
ALTER TABLE CATALOGO ADD CONSTRAINT CATALOGO_PK PRIMARY KEY ( USUARIO_CATALOGO ) ;


CREATE TABLE CIDADE
  (
    NOME_CIDADE           VARCHAR (30) NOT NULL ,
    ESTADO_NOME_ESTADO    VARCHAR (30) NOT NULL ,
    ESTADO_PAIS_NOME_PAIS VARCHAR (40) NOT NULL
  ) ;
ALTER TABLE CIDADE ADD CONSTRAINT CIDADE_PK PRIMARY KEY ( NOME_CIDADE, ESTADO_NOME_ESTADO, ESTADO_PAIS_NOME_PAIS ) ;


CREATE TABLE ESTADO
  (
    NOME_ESTADO    VARCHAR (30) NOT NULL ,
    PAIS_NOME_PAIS VARCHAR (40) NOT NULL
  ) ;
ALTER TABLE ESTADO ADD CONSTRAINT ESTADO_PK PRIMARY KEY ( NOME_ESTADO, PAIS_NOME_PAIS ) ;


CREATE TABLE FABRICANTE
  (
    NOME_FABRICANTE VARCHAR (50) ,
    ID_FABRICANTE   INTEGER NOT NULL
  ) ;
ALTER TABLE FABRICANTE ADD CONSTRAINT FABRICANTE_PK PRIMARY KEY ( ID_FABRICANTE ) ;


CREATE TABLE PAIS
  (
    NOME_PAIS VARCHAR (40) CONSTRAINT NNC_PAIS_NOME_ESTADO NOT NULL
  ) ;
ALTER TABLE PAIS ADD CONSTRAINT PAIS_PK PRIMARY KEY ( NOME_PAIS ) ;


CREATE TABLE TRANSACAO
  (
    USUARIO_NICK_VENDEDOR  VARCHAR (25) NOT NULL ,
    USUARIO_NICK_COMPRADOR VARCHAR (25) NOT NULL ,
    STATUS_TRANSACAO       VARCHAR (15) ,
    CARTA_ID_CARTA         INTEGER NOT NULL ,
    VALORCARTA_TRANSACAO FLOAT (2) ,
    VALORFRETE_TRANSACAO FLOAT (2)
  ) ;


CREATE TABLE USUARIO
  (
    NICK_USUARIO                 VARCHAR (25) NOT NULL ,
    NOME_USUARIO                 VARCHAR (50) NOT NULL ,
    ENDERECO_USUARIO             VARCHAR (50) ,
    NUM_USUARIO                  VARCHAR (20) ,
    EMAIL_USUARIO                VARCHAR (60) NOT NULL ,
    CIDADE_ESTADO_PAIS_NOME_PAIS VARCHAR (40) NOT NULL ,
    CIDADE_ESTADO_NOME_ESTADO    VARCHAR (30) NOT NULL ,
    CIDADE_NOME_CIDADE           VARCHAR (30) NOT NULL
  ) ;
ALTER TABLE USUARIO ADD CONSTRAINT USUARIO_PK PRIMARY KEY ( NICK_USUARIO ) ;


ALTER TABLE TRANSACAO ADD CONSTRAINT CARTA_VENDIDA FOREIGN KEY ( CARTA_ID_CARTA ) REFERENCES CARTA ( ID_CARTA ) ;

ALTER TABLE TRANSACAO ADD CONSTRAINT COMPRADOR FOREIGN KEY ( USUARIO_NICK_VENDEDOR ) REFERENCES USUARIO ( NICK_USUARIO ) ;

ALTER TABLE CATALOGO ADD CONSTRAINT CONTEM FOREIGN KEY ( CARTA_CATALOGO ) REFERENCES CARTA ( ID_CARTA ) ;

ALTER TABLE CARTA ADD CONSTRAINT FABRICA FOREIGN KEY ( FABRICANTE_ID_FABRICANTE ) REFERENCES FABRICANTE ( ID_FABRICANTE ) ;

ALTER TABLE CATALOGO ADD CONSTRAINT PERTENCE FOREIGN KEY ( USUARIO_CATALOGO ) REFERENCES USUARIO ( NICK_USUARIO ) ;

ALTER TABLE CIDADE ADD CONSTRAINT PERTENCEv2 FOREIGN KEY ( ESTADO_NOME_ESTADO, ESTADO_PAIS_NOME_PAIS ) REFERENCES ESTADO ( NOME_ESTADO, PAIS_NOME_PAIS ) ;

ALTER TABLE ESTADO ADD CONSTRAINT PERTENCEv3 FOREIGN KEY ( PAIS_NOME_PAIS ) REFERENCES PAIS ( NOME_PAIS ) ;

ALTER TABLE USUARIO ADD CONSTRAINT USUARIO_CIDADE_FK FOREIGN KEY ( CIDADE_NOME_CIDADE, CIDADE_ESTADO_NOME_ESTADO, CIDADE_ESTADO_PAIS_NOME_PAIS ) REFERENCES CIDADE ( NOME_CIDADE, ESTADO_NOME_ESTADO, ESTADO_PAIS_NOME_PAIS ) ;

ALTER TABLE TRANSACAO ADD CONSTRAINT VENDEDOR FOREIGN KEY ( USUARIO_NICK_COMPRADOR ) REFERENCES USUARIO ( NICK_USUARIO ) ;


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

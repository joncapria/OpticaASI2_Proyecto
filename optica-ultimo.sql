SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
DROP SCHEMA IF EXISTS `optica` ;
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `TIPOFACTURA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TIPOFACTURA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `TIPOFACTURA` (
  `IdTipoFactura` INT(11) NOT NULL AUTO_INCREMENT ,
  `TipoFactura` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`IdTipoFactura`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PLAZA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PLAZA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `PLAZA` (
  `IdPlaza` INT(11) NOT NULL AUTO_INCREMENT ,
  `Plaza` VARCHAR(50) NOT NULL ,
  `Descripcion` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`IdPlaza`) )
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PROFESION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROFESION` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `PROFESION` (
  `IdProf` INT(11) NOT NULL AUTO_INCREMENT ,
  `Profesion` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`IdProf`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DEPARTAMENTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DEPARTAMENTO` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `DEPARTAMENTO` (
  `IdDepartamento` INT(11) NOT NULL AUTO_INCREMENT ,
  `Departamento` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`IdDepartamento`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `MUNICIPIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MUNICIPIO` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `MUNICIPIO` (
  `IdMun` INT(11) NOT NULL AUTO_INCREMENT ,
  `Municipio` VARCHAR(50) NOT NULL ,
  `DEPARTAMENTO_IdDepartamento` INT(11) NOT NULL ,
  PRIMARY KEY (`IdMun`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EMPLEADO` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `EMPLEADO` (
  `IdEmpleado` INT(11) NOT NULL AUTO_INCREMENT ,
  `NombreEmp` VARCHAR(50) NOT NULL ,
  `PrimerApellidoEmp` VARCHAR(50) NOT NULL ,
  `SegundoApellidoEmp` VARCHAR(50) NULL DEFAULT NULL ,
  `ApellidoCasadaEmp` VARCHAR(50) NULL DEFAULT NULL ,
  `GeneroEmp` VARCHAR(2) NOT NULL ,
  `DuiEmp` VARCHAR(30) NOT NULL ,
  `NitEmp` VARCHAR(30) NOT NULL ,
  `NupEmp` VARCHAR(30) NULL ,
  `TelefonoEmp` VARCHAR(30) NOT NULL ,
  `DEPARTAMENTO_IdDepartamento` INT(11) NOT NULL ,
  `MUNICIPIO_IdMun` INT(11) NOT NULL ,
  `DireccionEmp` VARCHAR(100) NOT NULL ,
  `EmailEmp` VARCHAR(45) NULL ,
  `PROFESION_IdProf` INT(11) NOT NULL ,
  `PLAZA_IdPlaza` INT(11) NOT NULL ,
  `SueldoEmp` INT(11) NULL ,
  PRIMARY KEY (`IdEmpleado`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `USUARIO` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `USUARIO` (
  `IdUsuario` INT(11) NOT NULL AUTO_INCREMENT ,
  `UsuarioUsu` VARCHAR(50) NOT NULL ,
  `ClaveUsu` VARCHAR(50) NOT NULL ,
  `FechaCreacionUsu` DATE NULL DEFAULT NULL ,
  `EMPLEADO_IdEmpleado` INT(11) NOT NULL ,
  PRIMARY KEY (`IdUsuario`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `FACTURA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FACTURA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `FACTURA` (
  `IdFac` INT(11) NOT NULL AUTO_INCREMENT ,
  `FechaFac` DATE NOT NULL ,
  `TIPOFACTURA_IdTipoFactura` INT(11) NOT NULL ,
  `USUARIO_IdUsuario` INT(11) NOT NULL ,
  PRIMARY KEY (`IdFac`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TIPOIDENTIFICACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TIPOIDENTIFICACION` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `TIPOIDENTIFICACION` (
  `IdTipoIdentificacion` INT(11) NOT NULL AUTO_INCREMENT ,
  `Documento` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`IdTipoIdentificacion`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CLIENTE` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `CLIENTE` (
  `IdCliente` INT(11) NOT NULL AUTO_INCREMENT ,
  `NombreCli` VARCHAR(45) NOT NULL ,
  `PrimerApellidoCli` VARCHAR(45) NOT NULL ,
  `SegundoApellidoCli` VARCHAR(45) NULL DEFAULT NULL ,
  `ApellidoCasadaCli` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `TIPOIDENTIFICACION_IdTipoIdentificacion` INT(11) NOT NULL ,
  `NumeroDocCli` VARCHAR(45) NOT NULL ,
  `NrcCli` VARCHAR(45) NULL DEFAULT NULL ,
  `NitCli` VARCHAR(45) NULL DEFAULT NULL ,
  `TelefonoCli` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Esperamos que el ' ,
  `MUNICIPIO_IdMun` INT(11) NOT NULL ,
  `DEPARTAMENTO_IdDepartamento` INT(11) NOT NULL ,
  `DireccionCli` VARCHAR(45) NOT NULL ,
  `EmailCli` VARCHAR(45) NULL DEFAULT NULL ,
  `Usuariocli` VARCHAR(50) NULL ,
  `Clave` VARCHAR(10) NULL ,
  PRIMARY KEY (`IdCliente`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `VENTA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VENTA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `VENTA` (
  `IdVenta` INT(11) NOT NULL AUTO_INCREMENT ,
  `Fecha` VARCHAR(45) NOT NULL ,
  `CLIENTE_IdCliente` INT(11) NOT NULL ,
  `MontoTotal` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`IdVenta`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DETALLEFACTURA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLEFACTURA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `DETALLEFACTURA` (
  `IdDetalleFactura` INT(11) NOT NULL AUTO_INCREMENT ,
  `FACTURA_IdFac` INT(11) NOT NULL ,
  `VENTA_IdVenta` INT(11) NOT NULL ,
  PRIMARY KEY (`IdDetalleFactura`) )
ENGINE = InnoDB;

SHOW WARNINGS;
USE `optica` ;

-- -----------------------------------------------------
-- Table `ABONO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ABONO` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `ABONO` (
  `IdAbono` INT(11) NOT NULL AUTO_INCREMENT ,
  `Fecha` VARCHAR(45) NOT NULL ,
  `MontoInicial` VARCHAR(45) NULL DEFAULT NULL ,
  `MontoRestante` VARCHAR(45) NULL DEFAULT NULL ,
  `MontoAbonado` VARCHAR(45) NULL DEFAULT NULL ,
  `VENTA_IdVenta` INT(11) NOT NULL ,
  PRIMARY KEY (`IdAbono`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TIPOCOMPRA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TIPOCOMPRA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `TIPOCOMPRA` (
  `IdTipoCompra` INT(11) NOT NULL AUTO_INCREMENT ,
  `TipoCompra` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`IdTipoCompra`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PROVEEDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROVEEDOR` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `PROVEEDOR` (
  `IdPro` INT(11) NOT NULL AUTO_INCREMENT ,
  `NrcPro` VARCHAR(30) NOT NULL ,
  `NombrePro` VARCHAR(50) NOT NULL ,
  `NitPro` VARCHAR(30) NOT NULL ,
  `DEPARTAMENTO_IdDepartamento` INT(11) NOT NULL ,
  `MUNICIPIO_IdMun` INT(11) NOT NULL ,
  `DireccionPro` VARCHAR(45) NOT NULL ,
  `TelefonoPro` VARCHAR(30) NOT NULL ,
  `Email` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`IdPro`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `COMPRA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `COMPRA` (
  `IdCompra` INT(11) NOT NULL AUTO_INCREMENT ,
  `USUARIO_IdUsuario` INT(11) NOT NULL ,
  `TIPOCOMPRA_IdTipoCompra` INT(11) NOT NULL ,
  `Fecha` DATE NOT NULL ,
  `Monto` VARCHAR(50) NOT NULL ,
  `PROVEEDOR_IdPro` INT(11) NOT NULL ,
  PRIMARY KEY (`IdCompra`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TIPOPRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TIPOPRODUCTO` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `TIPOPRODUCTO` (
  `IdTipoProducto` INT(11) NOT NULL AUTO_INCREMENT ,
  `NombreTipoPro` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`IdTipoProducto`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCTO` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `PRODUCTO` (
  `IdProducto` INT(11) NOT NULL AUTO_INCREMENT ,
  `FechaProd` DATE NOT NULL ,
  `CantProd` INT(11) NOT NULL ,
  `CodigoProd` VARCHAR(50) NOT NULL ,
  `DescripcionProd` VARCHAR(50) NOT NULL ,
  `TIPOPRODUCTO_IdTipoProducto` INT(11) NOT NULL ,
  `Marca` VARCHAR(50) NULL DEFAULT NULL ,
  `Precio` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`IdProducto`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DETALLECOMPRA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLECOMPRA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `DETALLECOMPRA` (
  `IdDetalleCompra` INT(11) NOT NULL AUTO_INCREMENT ,
  `Cantidad` VARCHAR(45) NOT NULL ,
  `COMPRA_IdCompra` INT(11) NOT NULL ,
  `PRODUCTO_IdProducto` INT(11) NOT NULL ,
  PRIMARY KEY (`IdDetalleCompra`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DETALLEVENTA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLEVENTA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `DETALLEVENTA` (
  `IdDetalleVenta` INT(11) NOT NULL AUTO_INCREMENT ,
  `Cantidad` VARCHAR(45) NULL DEFAULT NULL ,
  `VENTA_IdVenta` INT(11) NOT NULL ,
  `PRODUCTO_IdProducto` INT(11) NOT NULL ,
  PRIMARY KEY (`IdDetalleVenta`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DIAGNOSTICO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DIAGNOSTICO` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `DIAGNOSTICO` (
  `IdDiagnostico` INT(11) NOT NULL AUTO_INCREMENT ,
  `Diagnostico` VARCHAR(50) NOT NULL ,
  `Descripcion` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`IdDiagnostico`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PAGINA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PAGINA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `PAGINA` (
  `IdPag` INT(11) NOT NULL AUTO_INCREMENT ,
  `Url` VARCHAR(50) NULL DEFAULT NULL ,
  `Descripcion` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`IdPag`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ROL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ROL` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `ROL` (
  `IdRol` INT(11) NOT NULL AUTO_INCREMENT ,
  `Rol` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`IdRol`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '			';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PAGINAROL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PAGINAROL` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `PAGINAROL` (
  `IdPagRol` INT(11) NOT NULL AUTO_INCREMENT ,
  `ROL_IdRol` INT(11) NOT NULL ,
  `PAGINA_IdPag` INT(11) NOT NULL ,
  PRIMARY KEY (`IdPagRol`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RECETA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RECETA` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `RECETA` (
  `IdRec` INT(11) NOT NULL AUTO_INCREMENT ,
  `USUARIO_IdUsuario` INT(11) NOT NULL ,
  `CLIENTE_IdCliente` INT(11) NOT NULL ,
  `DIAGNOSTICO_IdDiagnostico` INT(11) NOT NULL ,
  `Fecha` DATE NOT NULL ,
  `EsfDer` VARCHAR(45) NULL DEFAULT NULL ,
  `EsfIzq` VARCHAR(45) NULL DEFAULT NULL ,
  `CilDer` VARCHAR(45) NULL DEFAULT NULL ,
  `CilIzq` VARCHAR(45) NULL DEFAULT NULL ,
  `EjeDer` VARCHAR(45) NULL DEFAULT NULL ,
  `EjeIzq` VARCHAR(45) NULL DEFAULT NULL ,
  `AroDer` VARCHAR(45) NULL DEFAULT NULL ,
  `AroIzq` VARCHAR(45) NULL DEFAULT NULL ,
  `BaseDer` VARCHAR(45) NULL DEFAULT NULL ,
  `Observaciones` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`IdRec`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `USUARIOROL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `USUARIOROL` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `USUARIOROL` (
  `IdUsuRol` INT(11) NOT NULL AUTO_INCREMENT ,
  `USUARIO_IdUsuario` INT(11) NOT NULL ,
  `ROL_IdRol` INT(11) NOT NULL ,
  PRIMARY KEY (`IdUsuRol`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

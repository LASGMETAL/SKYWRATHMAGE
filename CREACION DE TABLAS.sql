/*CREAR BASE DE DATOS PARA EL ITSM*/
CREATE DATABASE IF NOT EXISTS SKYWRATHMAGE;
    USE SKYWRATHMAGE;
		/*TABLA DE USUARIOS*/
		CREATE TABLE IF NOT EXISTS CatUsers (
			IdUser INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			HexCode VARCHAR(8) UNIQUE NOT NULL,
			Usuario VARCHAR(20) UNIQUE NOT NULL,
			Nombre VARCHAR(20) NOT NULL,
			Apellido VARCHAR(20) NOT NULL,
			ImageURL VARCHAR(255),
			Perfil INTEGER UNSIGNED,
			JobTitle INTEGER UNSIGNED,
			Warehouse INTEGER UNSIGNED,
			Cliente INTEGER UNSIGNED,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			/*TABLA DE AUDITORIA DE CatUsers*/
			CREATE TABLE IF NOT EXISTS CatUsers_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdUser INTEGER UNSIGNED,
				HexCode VARCHAR(8),
				Usuario VARCHAR(20),
				Nombre VARCHAR(20),
				Apellido VARCHAR(20),
				ImageURL VARCHAR(255),
				Perfil INTEGER UNSIGNED,
				JobTitle INTEGER UNSIGNED,
				Warehouse INTEGER UNSIGNED,
				Cliente INTEGER UNSIGNED,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				/*CREACION DE TRIGGERS DE AUDITORIA CatUsers*/
				CREATE TRIGGER after_catusers_insert
					AFTER INSERT ON CatUsers
					FOR EACH ROW
					INSERT INTO CatUsers_Audit (IdUser, HexCode, Usuario, Nombre, Apellido, ImageURL, Perfil, JobTitle, Warehouse, Cliente, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdUser, NEW.HexCode, NEW.Usuario, NEW.Nombre, NEW.Apellido, NEW.ImageURL, NEW.Perfil, NEW.JobTitle, NEW.Warehouse, NEW.Cliente, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catusers_update
					AFTER UPDATE ON CatUsers
					FOR EACH ROW
					INSERT INTO CatUsers_Audit (IdUser, HexCode, Usuario, Nombre, Apellido, ImageURL, Perfil, JobTitle, Warehouse, Cliente, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdUser, NEW.HexCode, NEW.Usuario, NEW.Nombre, NEW.Apellido, NEW.ImageURL, NEW.Perfil, NEW.JobTitle, NEW.Warehouse, NEW.Cliente, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catusers_delete
					AFTER DELETE ON CatUsers
					FOR EACH ROW
					INSERT INTO CatUsers_Audit (IdUser, HexCode, Usuario, Nombre, Apellido, ImageURL, Perfil, JobTitle, Warehouse, Cliente, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdUser, OLD.HexCode, OLD.Usuario, OLD.Nombre, OLD.Apellido, OLD.ImageURL, OLD.Perfil, OLD.JobTitle, OLD.Warehouse, OLD.Cliente, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		
        
        CREATE TABLE IF NOT EXISTS CatProfiles (
			IdProfile INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Perfil VARCHAR(20) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatProfiles_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdProfile INTEGER UNSIGNED,
				Perfil VARCHAR(20),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catprofiles_insert
					AFTER INSERT ON CatProfiles
					FOR EACH ROW
					INSERT INTO CatProfiles_Audit (IdProfile, Perfil, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdProfile, NEW.Perfil, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catprofiles_update
					AFTER UPDATE ON CatProfiles
					FOR EACH ROW
					INSERT INTO CatProfiles_Audit (IdProfile, Perfil, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdProfile, NEW.Perfil, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catprofiles_delete
					AFTER DELETE ON CatProfiles
					FOR EACH ROW
					INSERT INTO CatProfiles_Audit (IdProfile, Perfil, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdProfile, OLD.Perfil, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		

        CREATE TABLE IF NOT EXISTS CatJobTitles (
			IdJobTitle INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			JobTitle VARCHAR(20) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatJobTitles_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdJobTitle INTEGER UNSIGNED,
				JobTitle VARCHAR(20),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catjobtitles_insert
					AFTER INSERT ON CatJobTitles
					FOR EACH ROW
					INSERT INTO CatJobTitles_Audit (IdJobTitle, JobTitle, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdJobTitle, NEW.JobTitle, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catjobtitles_update
					AFTER UPDATE ON CatJobTitles
					FOR EACH ROW
					INSERT INTO CatJobTitles_Audit (IdJobTitle, JobTitle, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdJobTitle, NEW.JobTitle, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catjobtitles_delete
					AFTER DELETE ON CatJobTitles
					FOR EACH ROW
					INSERT INTO CatJobTitles_Audit (IdJobTitle, JobTitle, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdJobTitle, OLD.JobTitle, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
            
            
		CREATE TABLE IF NOT EXISTS CatWarehouses (
			IdWarehouse INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Warehouse VARCHAR(20) NOT NULL,
			City VARCHAR(20) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatWarehouses_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdWarehouse INTEGER UNSIGNED,
				Warehouse VARCHAR(20) NOT NULL,
				City VARCHAR(20) NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catwarehouses_insert
					AFTER INSERT ON CatWarehouses
					FOR EACH ROW
					INSERT INTO CatWarehouses_Audit (IdWarehouse, Warehouse, City, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdWarehouse, NEW.Warehouse, NEW.City, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catwarehouses_update
					AFTER UPDATE ON CatWarehouses
					FOR EACH ROW
					INSERT INTO CatWarehouses_Audit (IdWarehouse, Warehouse, City, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdWarehouse, NEW.Warehouse, NEW.City, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catwarehouses_delete
					AFTER DELETE ON CatWarehouses
					FOR EACH ROW
					INSERT INTO CatWarehouses_Audit (IdWarehouse, Warehouse, City, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdWarehouse, OLD.Warehouse, OLD.City, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		
        
        CREATE TABLE IF NOT EXISTS CatClients (
			IdClient INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Cliente VARCHAR(20) NOT NULL,
			Division VARCHAR(20) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatClients_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdClient INTEGER UNSIGNED,
				Cliente VARCHAR(20) NOT NULL,
				Division VARCHAR(20),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catclients_insert
					AFTER INSERT ON CatClients
					FOR EACH ROW
					INSERT INTO CatClients_Audit (IdClient, Cliente, Division, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdClient, NEW.Cliente, NEW.Division, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catclients_update
					AFTER UPDATE ON CatClients
					FOR EACH ROW
					INSERT INTO CatClients_Audit (IdClient, Cliente, Division, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdClient, NEW.Cliente, NEW.Division, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catclients_delete
					AFTER DELETE ON CatClients
					FOR EACH ROW
					INSERT INTO CatClients_Audit (IdClient, Cliente, Division, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdClient, OLD.Cliente, OLD.Division, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		/*MODIFICACION DE DATOS PARA QUE SEAN LLAVES FORANEAS*/
		ALTER TABLE CatUsers
			ADD FOREIGN KEY (Perfil) REFERENCES CatProfiles(IdProfile),
			ADD FOREIGN KEY (JobTitle) REFERENCES CatJobTitles(IdJobTitle),
			ADD FOREIGN KEY (Warehouse) REFERENCES CatWarehouses(IdWarehouse),
			ADD FOREIGN KEY (Cliente) REFERENCES CatClients(IdClient);
			
            
		/*TABLAS DE ASIGNACION DE HARDWARE*/ 
		CREATE TABLE IF NOT EXISTS CatHardwareAssignments (
			IdHardwareAssignment INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Usuario VARCHAR(20),
			AssignmentComputer TINYINT(1),
				SerialNumberComputer VARCHAR(50),
			AssignmentHandHeld TINYINT(1),
				SerialNumberHandHeld VARCHAR(50),
			AssignmentCelPhone TINYINT(1),
				SerialNumberCelPhone VARCHAR(50),
			AssignmentExtension TINYINT(1),
				MacExtension VARCHAR(50),
			AssignmentPrinter TINYINT(1),
				PrinterName VARCHAR(50),
			AssignmentDisplay TINYINT(1),
				SerialNumberDisplay VARCHAR(50),
			AssignmentTool TINYINT(1),
				NameTool VARCHAR(50),
			AssigmentPeriferico TINYINT(1),
				NamePeriferico VARCHAR(50) UNIQUE NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatHardwareAssignments_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				Usuario VARCHAR(20),
				AssignmentComputer TINYINT(1),
					SerialNumberComputer VARCHAR(50),
				AssignmentHandHeld TINYINT(1),
					SerialNumberHandHeld VARCHAR(50),
				AssignmentCelPhone TINYINT(1),
					SerialNumberCelPhone VARCHAR(50),
				AssignmentExtension TINYINT(1),
					MacExtension VARCHAR(50),
				AssignmentPrinter TINYINT(1),
					PrinterName VARCHAR(50),
				AssignmentDisplay TINYINT(1),
					SerialNumberDisplay VARCHAR(50),
				AssignmentTool TINYINT(1),
					NameTool VARCHAR(50),
				AssigmentPeriferico TINYINT(1),
					NamePeriferico VARCHAR(50),
				CreatedAt TIMESTAMP,
				CreatedBy INTEGER UNSIGNED,
				UpdatedAt TIMESTAMP,
				UpdatedBy INTEGER UNSIGNED,
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_cathardwareassignments_insert
					AFTER INSERT ON CatHardwareAssignments
					FOR EACH ROW
					INSERT INTO CatHardwareAssignments_Audit (Usuario, AssignmentComputer, SerialNumberComputer, AssignmentHandHeld, SerialNumberHandHeld, AssignmentCelPhone, SerialNumberCelPhone, AssignmentExtension, MacExtension, AssignmentPrinter, PrinterName, AssignmentDisplay, SerialNumberDisplay, AssignmentTool, NameTool, AssigmentPeriferico, NamePeriferico, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.Usuario, NEW.AssignmentComputer, NEW.SerialNumberComputer, NEW.AssignmentHandHeld, NEW.SerialNumberHandHeld, NEW.AssignmentCelPhone, NEW.SerialNumberCelPhone, NEW.AssignmentExtension, NEW.MacExtension, NEW.AssignmentPrinter, NEW.PrinterName, NEW.AssignmentDisplay, NEW.SerialNumberDisplay, NEW.AssignmentTool, NEW.NameTool, NEW.AssigmentPeriferico, NEW.NamePeriferico, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_cathardwareassignments_update
					AFTER UPDATE ON CatHardwareAssignments
					FOR EACH ROW
					INSERT INTO CatHardwareAssignments_Audit (IdUser, AssignmentComputer, SerialNumberComputer, AssignmentHandHeld, SerialNumberHandHeld, AssignmentCelPhone, SerialNumberCelPhone, AssignmentExtension, MacExtension, AssignmentPrinter, PrinterName, AssignmentDisplay, SerialNumberDisplay, AssignmentTool, NameTool, AssigmentPeriferico, NamePeriferico, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.Usuario, NEW.AssignmentComputer, NEW.SerialNumberComputer, NEW.AssignmentHandHeld, NEW.SerialNumberHandHeld, NEW.AssignmentCelPhone, NEW.SerialNumberCelPhone, NEW.AssignmentExtension, NEW.MacExtension, NEW.AssignmentPrinter, NEW.PrinterName, NEW.AssignmentDisplay, NEW.SerialNumberDisplay, NEW.AssignmentTool, NEW.NameTool, NEW.AssigmentPeriferico, NEW.NamePeriferico, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_cathardwareassignments_delete
					AFTER DELETE ON CatHardwareAssignments
					FOR EACH ROW
					INSERT INTO CatHardwareAssignments_Audit (IdUser, AssignmentComputer, SerialNumberComputer, AssignmentHandHeld, SerialNumberHandHeld, AssignmentCelPhone, SerialNumberCelPhone, AssignmentExtension, MacExtension, AssignmentPrinter, PrinterName, AssignmentDisplay, SerialNumberDisplay, AssignmentTool, NameTool, AssigmentPeriferico, NamePeriferico, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdUser, OLD.AssignmentComputer, OLD.SerialNumberComputer, OLD.AssignmentHandHeld, OLD.SerialNumberHandHeld, OLD.AssignmentCelPhone, OLD.SerialNumberCelPhone, OLD.AssignmentExtension, OLD.MacExtension, OLD.AssignmentPrinter, OLD.PrinterName, OLD.AssignmentDisplay, OLD.SerialNumberDisplay, OLD.AssignmentTool, OLD.NameTool, OLD.AssigmentPeriferico, OLD.NamePeriferico, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
	
       /*CATALOGOS GENERALES DE HARDWARE*/
		CREATE TABLE IF NOT EXISTS CatComputers (
			IdComputer INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			SerialNumber VARCHAR(50) UNIQUE NOT NULL,
			Brand VARCHAR(15) NOT NULL,
			Model VARCHAR(25) NOT NULL,
			Rom INTEGER(3) NOT NULL,
			Ram INTEGER(3) NOT NULL,
			Processor VARCHAR(25) NOT NULL,
			Price DOUBLE (7,2) NOT NULL,					/*VALIDAR FORMATO DE IP DESDE PHYTON*/
			DataSheetURL VARCHAR(255),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatComputers_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdComputer INTEGER UNSIGNED,
				SerialNumber VARCHAR(50),
				Brand VARCHAR(15),
				Model VARCHAR(25),
				Rom INTEGER(3),
				Ram INTEGER(3),
				Processor VARCHAR(25) NOT NULL,
				Price DOUBLE(7,2),
				DataSheetURL VARCHAR(255),
				CreatedAt TIMESTAMP,
				CreatedBy INTEGER UNSIGNED,
				UpdatedAt TIMESTAMP,
				UpdatedBy INTEGER UNSIGNED,
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catcomputers_insert
					AFTER INSERT ON CatComputers
					FOR EACH ROW
					INSERT INTO CatComputers_Audit (IdComputer, SerialNumber, Brand, Model, Rom, Ram, Processor, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdComputer, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.Rom, NEW.Ram, NEW.Processor, NEW.Price, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catcomputers_update
					AFTER UPDATE ON CatComputers
					FOR EACH ROW
					INSERT INTO CatComputers_Audit (IdComputer, SerialNumber, Brand, Model, Rom, Ram, Processor, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdComputer, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.Rom, NEW.Ram, NEW.Processor, NEW.Price, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catcomputers_delete
					AFTER DELETE ON CatComputers
					FOR EACH ROW
					INSERT INTO CatComputers_Audit (IdComputer, SerialNumber, Brand, Model, Rom, Ram, Processor, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdComputer, OLD.SerialNumber, OLD.Brand, OLD.Model, OLD.Rom, OLD.Ram, OLD.Processor, OLD.Price, OLD.DataSheetURL, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
 
 
		CREATE TABLE IF NOT EXISTS CatHandHelds (
			IdHandHelds INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			SerialNumber VARCHAR(30) UNIQUE NOT NULL,
			Brand VARCHAR(15) NOT NULL,
			Model VARCHAR(15) NOT NULL,
			MacWireless VARCHAR(17) UNIQUE,				/*VALIDAR FORMATO DE MAC DESDE PHYTON*/
			IpWireless VARCHAR(15),
			Price DOUBLE (7,2) NOT NULL,				/*VALIDAR FORMATO DE MAC DESDE PHYTON*/
			DataSheetURL VARCHAR(255),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatHandHelds_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdCellPhone INTEGER UNSIGNED,
				SerialNumber VARCHAR(30),
				Brand VARCHAR(15),
				Model VARCHAR(15),
				MacWireless VARCHAR(17),
				IpWireless VARCHAR(15),
				Price DOUBLE(7,2),
				DataSheetURL VARCHAR(255),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_cathandhelds_insert
					AFTER INSERT ON CatHandHelds
					FOR EACH ROW
					INSERT INTO HandHelds_Audit (IdHandHelds, SerialNumber, Brand, Model, MacWireless, IpWireless, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdHandHelds, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.MacWireless, NEW.IpWireless, NEW.Price, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_handhelds_update
					AFTER UPDATE ON CatHandHelds
					FOR EACH ROW
					INSERT INTO CatHandHelds_Audit (IdHandHelds, SerialNumber, Brand, Model, MacWireless, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdHandHelds, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.MacWireless, NEW.IpWireless, NEW.Price, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_handhelds_delete
					AFTER DELETE ON CatHandHelds
					FOR EACH ROW
					INSERT INTO CatHandHelds_Audit (IdHandHelds, SerialNumber, Brand, Model, MacWireless, IpWireless, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdHandHelds, OLD.SerialNumber, OLD.Brand, OLD.Model, OLD.MacWireless, OLD.IpWireless, OLD.Price, OLD.DataSheetURL, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');


		CREATE TABLE IF NOT EXISTS CatCellPhones (
			IdCellPhone INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			SerialNumber VARCHAR(30) UNIQUE NOT NULL,
			Brand VARCHAR(15) NOT NULL,
			Model VARCHAR(15) NOT NULL,
			MacWireless VARCHAR(17) UNIQUE,				/*VALIDAR FORMATO DE MAC DESDE PHYTON*/
			IMEI VARCHAR(20) NOT NULL,
			Price DOUBLE (7,2) NOT NULL,				/*VALIDAR FORMATO DE PRECIO DESDE PHYTON*/
			DataSheetURL VARCHAR(255),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatCellPhones_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdCellPhone INTEGER UNSIGNED,
				SerialNumber VARCHAR(30),
				Brand VARCHAR(15),
				Model VARCHAR(15),
				MacWireless VARCHAR(17),
				IMEI VARCHAR(20),
				Price DOUBLE(7,2),
				DataSheetURL VARCHAR(255),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catcellphones_insert
					AFTER INSERT ON CatCellPhones
					FOR EACH ROW
					INSERT INTO CatCellPhones_Audit (IdCellPhone, SerialNumber, Brand, Model, MacWireless, IMEI, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdCellPhone, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.MacWireless, NEW.IMEI, NEW.Price, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catcellphones_update
					AFTER UPDATE ON CatCellPhones
					FOR EACH ROW
					INSERT INTO CatCellPhones_Audit (IdCellPhone, SerialNumber, Brand, Model, MacWireless, IMEI, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdCellPhone, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.MacWireless, NEW.IMEI, NEW.Price, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catcellphones_delete
					AFTER DELETE ON CatCellPhones
					FOR EACH ROW
					INSERT INTO CatCellPhones_Audit (IdCellPhone, SerialNumber, Brand, Model, MacWireless, IMEI, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdCellPhone, OLD.SerialNumber, OLD.Brand, OLD.Model, OLD.MacWireless, OLD.IMEI, OLD.Price, OLD.DataSheetURL, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');



		CREATE TABLE IF NOT EXISTS CatExtensions(
			Idextension INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Extension VARCHAR(3) UNIQUE NOT NULL,
			MacEthernet VARCHAR(17) UNIQUE,				/*VALIDAR FORMATO DE MAC DESDE PHYTON*/
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatExtensions_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				Idextension INTEGER UNSIGNED,
				Extension VARCHAR(3),
				MacEthernet VARCHAR(17),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catextensions_insert
					AFTER INSERT ON CatExtensions
					FOR EACH ROW
					INSERT INTO CatExtensions_Audit (Idextension, Extension, MacEthernet, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.Idextension, NEW.Extension, NEW.MacEthernet, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catextensions_update
					AFTER UPDATE ON CatExtensions
					FOR EACH ROW
					INSERT INTO CatExtensions_Audit (Idextension, Extension, MacEthernet, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.Idextension, NEW.Extension, NEW.MacEthernet, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catextensions_delete
					AFTER DELETE ON CatExtensions
					FOR EACH ROW
					INSERT INTO CatExtensions_Audit (Idextension, Extension, MacEthernet, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.Idextension, OLD.Extension, OLD.MacEthernet, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
                    
                    
		CREATE TABLE IF NOT EXISTS CatPrinters(
			IdPrinter INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			PrinterName VARCHAR(15) UNIQUE,
			SerialNumber VARCHAR(30) UNIQUE NOT NULL,
			Brand VARCHAR(15) NOT NULL,
			Model VARCHAR(15) NOT NULL,
			MacEthernet VARCHAR(17) UNIQUE,				/*VALIDAR FORMATO DE MAC DESDE PHYTON*/
			IpEthernet  VARCHAR(15) UNIQUE,             /*VALIDAR FORMATO DE IP DESDE PHYTON*/
			Supplier VARCHAR(20) NOT NULL,
			DataSheetURL VARCHAR(255),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatCatPrinters_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdPrinter INTEGER UNSIGNED,
				PrinterName VARCHAR(15) UNIQUE,
				SerialNumber VARCHAR(30),
				Brand VARCHAR(15),
				Model VARCHAR(15),
				MacEthernet VARCHAR(17),
				IpEthernet  VARCHAR(15) UNIQUE,
				Supplier VARCHAR(20),
				DataSheetURL VARCHAR(255),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catprinters_insert
					AFTER INSERT ON CatPrinters
					FOR EACH ROW
					INSERT INTO CatPrinters_Audit (IdPrinter, PrinterName, SerialNumber, Brand, Model, MacEthernet, IpEthernet, Supplier, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdPrinter, NEW.PrinterName, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.MacEthernet, NEW.IpEthernet, NEW.Supplier, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catcatprinters_update
					AFTER UPDATE ON CatPrinters
					FOR EACH ROW
					INSERT INTO CatPrinters_Audit (IdPrinter, PrinterName, SerialNumber, Brand, Model, MacEthernet, IpEthernet, Supplier, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdPrinter, NEW.PrinterName, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.MacEthernet, NEW.IpEthernet, NEW.Supplier, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catprinters_delete
					AFTER DELETE ON CatPrinters
					FOR EACH ROW
					INSERT INTO CatPrinters_Audit (IdPrinter, PrinterName, SerialNumber, Brand, Model, MacEthernet, IpEthernet, Supplier, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdPrinter, OLD.PrinterName, OLD.SerialNumber, OLD.Brand, OLD.Model, OLD.MacEthernet, OLD.IpEthernet, OLD.Supplier, OLD.DataSheetURL, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		
        
        CREATE TABLE IF NOT EXISTS CatDisplays(
			IdDisplay INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			SerialNumber VARCHAR(30) UNIQUE NOT NULL,
			Brand VARCHAR(15) NOT NULL,
			Model VARCHAR(15) NOT NULL,
			Price DOUBLE (7,2) NOT NULL,				/*VALIDAR FORMATO DE PRECIO DESDE PHYTON*/
			DataSheetURL VARCHAR(255),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatDisplays_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdDisplay INTEGER UNSIGNED,
				SerialNumber VARCHAR(30),
				Brand VARCHAR(15),
				Model VARCHAR(15),
				Price DOUBLE(7,2),
				DataSheetURL VARCHAR(255),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catdisplays_insert
					AFTER INSERT ON CatDisplays
					FOR EACH ROW
					INSERT INTO CatDisplays_Audit (IdDisplay, SerialNumber, Brand, Model, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdDisplay, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.Price, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catdisplays_update
					AFTER UPDATE ON CatDisplays
					FOR EACH ROW
					INSERT INTO CatDisplays_Audit (IdDisplay, SerialNumber, Brand, Model, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdDisplay, NEW.SerialNumber, NEW.Brand, NEW.Model, NEW.Price, NEW.DataSheetURL, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catdisplays_delete
					AFTER DELETE ON CatDisplays
					FOR EACH ROW
					INSERT INTO CatDisplays_Audit (IdDisplay, SerialNumber, Brand, Model, Price, DataSheetURL, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdDisplay, OLD.SerialNumber, OLD.Brand, OLD.Model, OLD.Price, OLD.DataSheetURL, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
        
        
        CREATE TABLE IF NOT EXISTS CatTools(
				IdCatTool INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				Tool VARCHAR(15) UNIQUE NOT NULL,
				CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1) DEFAULT 1
			);
				CREATE TABLE IF NOT EXISTS CatTools_Audit (
					AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
					IdCatTool INTEGER UNSIGNED,
					Tool VARCHAR(15),
					CreatedAt TIMESTAMP,
					CreatedBy VARCHAR(20),
					UpdatedAt TIMESTAMP,
					UpdatedBy VARCHAR(20),
					Estatus TINYINT(1),
					ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
					ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
				);
					CREATE TRIGGER after_cattools_insert
						AFTER INSERT ON CatTools
						FOR EACH ROW
						INSERT INTO CatTools_Audit (IdCatTool, Tool, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (NEW.IdCatTool, NEW.Tool, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
					CREATE TRIGGER after_cattools_update
						AFTER UPDATE ON CatTools
						FOR EACH ROW
						INSERT INTO CatTools_Audit (IdCatTool, Tool, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (NEW.IdCatTool, NEW.Tool, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
					CREATE TRIGGER after_cattools_delete
						AFTER DELETE ON CatTools
						FOR EACH ROW
						INSERT INTO CatTools_Audit (IdCatTool, Tool, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (OLD.IdCatTool, OLD.Tool, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
			
            
		CREATE TABLE IF NOT EXISTS CatPerifericos( 
			IdPeriferico INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Periferico VARCHAR(20) UNIQUE NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatPerifericos_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdPeriferico INTEGER UNSIGNED,
				Periferico VARCHAR(20),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_catperiferico_insert
					AFTER INSERT ON CatPerifericos
					FOR EACH ROW
					INSERT INTO CatPerifericos_Audit (IdPeriferico, Periferico, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdPeriferico, NEW.Periferico, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catperiferico_update
					AFTER UPDATE ON CatPerifericos
					FOR EACH ROW
					INSERT INTO CatPerifericos_Audit (IdPeriferico, Periferico, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdPeriferico, NEW.Periferico, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_cattools_delete
					AFTER DELETE ON CatPerifericos
					FOR EACH ROW
					INSERT INTO CatPerifericos_Audit (IdPeriferico, Periferico, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdPeriferico, OLD.Periferico, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		ALTER TABLE CatHardwareAssignments
			ADD FOREIGN KEY (Usuario) REFERENCES CatUsers(Usuario),
            ADD FOREIGN KEY (SerialNumberComputer) REFERENCES CatComputers(SerialNumber),
			ADD FOREIGN KEY (SerialNumberHandHeld) REFERENCES CatHandHelds(SerialNumber),
			ADD FOREIGN KEY (SerialNumberCelPhone) REFERENCES CatCellPhones(SerialNumber),
			ADD FOREIGN KEY (MacExtension) REFERENCES CatExtensions(MacEthernet),
			ADD FOREIGN KEY (PrinterName) REFERENCES CatPrinters(PrinterName),
			ADD FOREIGN KEY (SerialNumberDisplay) REFERENCES CatDisplays(SerialNumber),
			ADD FOREIGN KEY (NameTool) REFERENCES CatTools(Tool),
			ADD FOREIGN KEY (NamePeriferico) REFERENCES CatPerifericos(Periferico);


		/*Asignacion de Software para el usuario*/
		CREATE TABLE IF NOT EXISTS CatSoftwareAssignments (
			IdSoftwareAssignment INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            Usuario VARCHAR(20),
			AssignmentWalsCom TINYINT(1),
				WalsCom VARCHAR(15),
            AssignmentWalsTer TINYINT(1),
				WalsTer VARCHAR(15),
			AssignmentEmail TINYINT(1),
				Email VARCHAR (50),
			AssignmentOffice TINYINT(1),
				Office VARCHAR (50),
			AssignmentPowerBi TINYINT(1),
				PowerBi VARCHAR (50),
			AssignmentCarpCom TINYINT(1),
				CarpCom VARCHAR (50),
			AssignmentLan TINYINT(1),
			AssignmentLanVisitas TINYINT(1),
			AssignmentDataBaseWals TINYINT(1),
				DataBaseWals VARCHAR (50),
			AssignmentIVMS TINYINT(1),
			AssignmentSAP TINYINT(1),
			AssignmentMICROSIP TINYINT(1),
			AssignmentDataBasesTI TINYINT(1),
				DataBaseTI VARCHAR (50),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatSoftwareAssignments_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdSoftwareAssignment INTEGER UNSIGNED,
				Usuario VARCHAR(20),
				AssignmentWalsCom TINYINT(1),
					WalsCom VARCHAR(15),
				AssignmentWalsTer TINYINT(1),
					WalsTer VARCHAR(15),
				AssignmentEmail TINYINT(1),
					Email VARCHAR (50),
				AssignmentOffice TINYINT(1),
					Office VARCHAR (50),
				AssignmentPowerBi TINYINT(1),
					PowerBi VARCHAR (50),
				AssignmentCarpCom TINYINT(1),
					CarpCom VARCHAR (50),
				AssignmentLan TINYINT(1),
				AssignmentLanVisitas TINYINT(1),
				AssignmentDataBaseWals TINYINT(1),
					DataBaseWals VARCHAR (50),
				AssignmentIVMS TINYINT(1),
				AssignmentSAP TINYINT(1),
				AssignmentMICROSIP TINYINT(1),
				AssignmentDataBasesTI TINYINT(1),
                CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            );
				CREATE TRIGGER after_catsoftwareassignments_insert
					AFTER INSERT ON CatSoftwareAssignments
					FOR EACH ROW
					INSERT INTO CatSoftwareAssignments_Audit (IdSoftwareAssignment, Usuario, AssignmentWalsCom, WalsCom, AssignmentWalsTer, WalsTer, AssignmentEmail, Email, AssignmentOffice, Office, AssignmentPowerBi, AssignmentCarpCom, AssignmentLan, AssignmentLanVisitas, AssignmentDataBaseWals, DataBaseWals, AssignmentIVMS, AssignmentSAP, AssignmentMICROSIP, AssignmentDataBasesTI, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdSoftwareAssignment, NEW.Usuario, NEW.AssignmentWalsCom, NEW.WalsCom, NEW.AssignmentWalsTer, NEW.WalsTer, NEW.AssignmentEmail, NEW.Email, NEW.AssignmentOffice, NEW.Office, NEW.AssignmentPowerBi, NEW.PowerBi, NEW.AssignmentCarpCom, NEW.CarpCom, NEW.AssignmentLan, NEW.AssignmentLanVisitas, NEW.AssignmentDataBaseWals, NEW.DataBaseWals, NEW.AssignmentIVMS, NEW.AssignmentSAP, NEW.AssignmentMICROSIP, NEW.AssignmentDataBasesTI, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_catsoftwareassignments_update
					AFTER UPDATE ON CatSoftwareAssignments
					FOR EACH ROW
					INSERT INTO CatSoftwareAssignments_Audit (IdSoftwareAssignment, Usuario, AssignmentWalsCom, WalsCom, AssignmentWalsTer, WalsTer, AssignmentEmail, Email, AssignmentOffice, Office, AssignmentPowerBi, AssignmentCarpCom, AssignmentLan, AssignmentLanVisitas, AssignmentDataBaseWals, DataBaseWals, AssignmentIVMS, AssignmentSAP, AssignmentMICROSIP, AssignmentDataBasesTI, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdSoftwareAssignment, NEW.Usuario, NEW.AssignmentWalsCom, NEW.WalsCom, NEW.AssignmentWalsTer, NEW.WalsTer, NEW.AssignmentEmail, NEW.Email, NEW.AssignmentOffice, NEW.Office, NEW.AssignmentPowerBi, NEW.PowerBi, NEW.AssignmentCarpCom, NEW.CarpCom, NEW.AssignmentLan, NEW.AssignmentLanVisitas, NEW.AssignmentDataBaseWals, NEW.DataBaseWals, NEW.AssignmentIVMS, NEW.AssignmentSAP, NEW.AssignmentMICROSIP, NEW.AssignmentDataBasesTI, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_catsoftwareassignments_delete
					AFTER DELETE ON CatSoftwareAssignments
					FOR EACH ROW
					INSERT INTO CatSoftwareAssignments_Audit (IdSoftwareAssignment, Usuario, AssignmentWalsCom, WalsCom, AssignmentWalsTer, WalsTer, AssignmentEmail, Email, AssignmentOffice, Office, AssignmentPowerBi, AssignmentCarpCom, AssignmentLan, AssignmentLanVisitas, AssignmentDataBaseWals, DataBaseWals, AssignmentIVMS, AssignmentSAP, AssignmentMICROSIP, AssignmentDataBasesTI, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdSoftwareAssignment, OLD.Usuario, OLD.AssignmentWalsCom, OLD.WalsCom, OLD.AssignmentWalsTer, OLD.WalsTer, OLD.AssignmentEmail, OLD.Email, OLD.AssignmentOffice, OLD.Office, OLD.AssignmentPowerBi, OLD.PowerBi, OLD.AssignmentCarpCom, OLD.CarpCom, OLD.AssignmentLan, OLD.AssignmentLanVisitas, OLD.AssignmentDataBaseWals, OLD.DataBaseWals, OLD.AssignmentIVMS, OLD.AssignmentSAP, OLD.AssignmentMICROSIP, OLD.AssignmentDataBasesTI, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
            
					
		 CREATE TABLE IF NOT EXISTS CatWalsComs (
			IdProfile INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			WalsCom VARCHAR(20),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatWalsComs_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdProfile INTEGER UNSIGNED,
				WalsCom VARCHAR(20),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatWalsComs_insert
					AFTER INSERT ON CatWalsComs
					FOR EACH ROW
					INSERT INTO CatWalsComs_Audit (IdProfile, WalsCom, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdProfile, NEW.WalsCom, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatWalsComs_update
					AFTER UPDATE ON CatWalsComs
					FOR EACH ROW
					INSERT INTO CatWalsComs_Audit (IdProfile, WalsCom, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdProfile, NEW.WalsCom, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatWalsComs_delete
					AFTER DELETE ON CatWalsComs
					FOR EACH ROW
					INSERT INTO CatWalsComs_Audit (IdProfile, WalsCom, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdProfile, OLD.WalsCom, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		ALTER TABLE CatSoftwareAssignments
			ADD FOREIGN KEY (WalsCom) REFERENCES CatWalsComs(WalsCom);


        CREATE TABLE IF NOT EXISTS CatWalsTerms (
			IdProfile INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			WalsTer VARCHAR(20),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatWalsTerms_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdProfile INTEGER UNSIGNED,
				WalsTer VARCHAR(20),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatWalsTerms_insert
					AFTER INSERT ON CatWalsTerms
					FOR EACH ROW
					INSERT INTO CatWalsTerms_Audit (IdProfile, Perfil, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdProfile, NEW.Perfil, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatWalsTerms_update
					AFTER UPDATE ON CatWalsTerms
					FOR EACH ROW
					INSERT INTO CatCatWalsTerms_Audit (IdProfile, Perfil, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdProfile, NEW.Perfil, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatWalsTerms_delete
					AFTER DELETE ON CatWalsTerms
					FOR EACH ROW
					INSERT INTO CatWalsTerms_Audit (IdProfile, Perfil, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdProfile, OLD.Perfil, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		ALTER TABLE CatSoftwareAssignments
			ADD FOREIGN KEY (WalsTer) REFERENCES CatWalsTerms(WalsTer);


        CREATE TABLE IF NOT EXISTS CatEmails (
			IdEmail INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Email VARCHAR(30),
            Usuario VARCHAR(30),
            Pass VARCHAR(20) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatEmails_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdEmail INTEGER UNSIGNED,
				Email VARCHAR(30),
				Usuario VARCHAR(30),
				Pass VARCHAR(20) NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatEmails_insert
					AFTER INSERT ON CatEmails
					FOR EACH ROW
					INSERT INTO CatEmails_Audit (IdEmail, Email, Usuario, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdEmail, NEW.Email, NEW.Usuario, NEW.Pass, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatEmails_update
					AFTER UPDATE ON CatEmails
					FOR EACH ROW
					INSERT INTO CatEmails_Audit (IdEmail, Email, Usuario, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdEmail, NEW.Email, NEW.Usuario, NEW.Pass, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatEmails_delete
					AFTER DELETE ON CatEmails
					FOR EACH ROW
					INSERT INTO CatEmails_Audit (IdEmail, Email, Usuario, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdEmail, OLD.Email, OLD.Usuario, OLD.Pass, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		ALTER TABLE CatEmails
				ADD FOREIGN KEY (Usuario) REFERENCES CatUsers(Usuario);


        CREATE TABLE IF NOT EXISTS CatLicOffice (
			IdOffice INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Office VARCHAR(30)NOT NULL,
            Pass VARCHAR(30) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatLicOffice_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdOffice INTEGER UNSIGNED,
				Office VARCHAR(30),
				Pass VARCHAR(30) NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatLicOffice_insert
					AFTER INSERT ON CatLicOffice
					FOR EACH ROW
					INSERT INTO CatLicOffice_Audit (IdOffice, Office, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdOffice, NEW.Office, NEW.Pass, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatLicOffice_update
					AFTER UPDATE ON CatLicOffice
					FOR EACH ROW
					INSERT INTO CatLicOffice_Audit (IdOffice, Office, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdOffice, NEW.Office, NEW.Pass, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatLicOffice_delete
					AFTER DELETE ON CatLicOffice
					FOR EACH ROW
					INSERT INTO CatLicOffice_Audit (IdOffice, Office, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdOffice, OLD.Office, OLD.Pass, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');


        CREATE TABLE IF NOT EXISTS CatPowerBi (
			IdPowerBi INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			PowerBi VARCHAR(30)NOT NULL,
            Pass VARCHAR(30) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatPowerBi_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdPowerBi INTEGER UNSIGNED,
				PowerBi VARCHAR(30),
				Pass VARCHAR(30) NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatPowerBi_insert
					AFTER INSERT ON CatPowerBi
					FOR EACH ROW
					INSERT INTO CatPowerBi_Audit (IdPowerBi, PowerBi, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdPowerBi, NEW.PowerBi, NEW.Pass, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatPowerBi_update
					AFTER UPDATE ON CatPowerBi
					FOR EACH ROW
					INSERT INTO CatPowerBi_Audit (IdPowerBi, PowerBi, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdPowerBi, NEW.PowerBi, NEW.Pass, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatPowerBi_delete
					AFTER DELETE ON CatPowerBi
					FOR EACH ROW
					INSERT INTO CatPowerBi_Audit (IdPowerBi, PowerBi, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdPowerBi, OLD.PowerBi, OLD.Pass, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
						
                        
		CREATE TABLE IF NOT EXISTS CatCarpCom (
			IdCarpCom INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			CarpCom VARCHAR(30) NOT NULL,
			ADUser VARCHAR(30) NOT NULL UNIQUE,
			Pass VARCHAR(30) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatCarpCom_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdCarpCom INTEGER UNSIGNED,
				CarpCom VARCHAR(30) NOT NULL,
				ADUser VARCHAR(30) NOT NULL UNIQUE,
				Pass VARCHAR(30) NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatCarpCom_insert
					AFTER INSERT ON CatCarpCom
					FOR EACH ROW
					INSERT INTO CatCarpCom_Audit (IdCarpCom, CarpCom, ADUser, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdCarpCom, NEW.CarpCom, NEW.ADUser, NEW.Pass, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatCarpCom_update
					AFTER UPDATE ON CatCarpCom
					FOR EACH ROW
					INSERT INTO CatCarpCom_Audit (IdCarpCom, CarpCom, ADUser, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdCarpCom, NEW.CarpCom, NEW.ADUser, NEW.Pass, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatCarpCom_delete
					AFTER DELETE ON CatCarpCom
					FOR EACH ROW
					INSERT INTO CatCarpCom_Audit (IdCarpCom, CarpCom, ADUser, Pass, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdCarpCom, OLD.CarpCom, OLD.ADUser, OLD.Pass, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
                    
                    
		CREATE TABLE IF NOT EXISTS CatLans (
			IdCatLan INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Warehouse VARCHAR(20) NOT NULL,
			ISP VARCHAR(15) NOT NULL,
            Tel INTEGER(10) UNSIGNED NOT NULL,
            Holder VARCHAR(50) NOT NULL,
			Cuenta VARCHAR(50) NOT NULL UNIQUE,
            Download INTEGER(3) NOT NULL UNIQUE,
			Upload INTEGER(3) NOT NULL UNIQUE,
            Visits TINYINT(1) DEFAULT 0,
			SSID VARCHAR(30) NOT NULL,
			Pass VARCHAR(30) NOT NULL,
			NetworkIP VARCHAR(15) NOT NULL,
			MaskIP VARCHAR(15) NOT NULL,
            GatewayIP VARCHAR(15) NOT NULL,
            DHCPRange INTEGER UNSIGNED NOT NULL,
            Usuario VARCHAR(20) NOT NULL,
            GatewayPass VARCHAR(20) NOT NULL,
            SerialNumber VARCHAR(30) NOT NULL,
            Ubicacion VARCHAR(15),
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatLans_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdCatLan INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				Warehouse VARCHAR(20) NOT NULL,
				ISP VARCHAR(15) NOT NULL,
				Tel INTEGER(10) UNSIGNED NOT NULL,
				Holder VARCHAR(50) NOT NULL,
				Cuenta VARCHAR(50) NOT NULL UNIQUE,
				Download INTEGER(3) NOT NULL UNIQUE,
				Upload INTEGER(3) NOT NULL UNIQUE,
				Visits TINYINT(1) DEFAULT 0,
				SSID VARCHAR(30) NOT NULL,
				Pass VARCHAR(30) NOT NULL,
				NetworkIP VARCHAR(15) NOT NULL,
				MaskIP VARCHAR(15) NOT NULL,
				GatewayIP VARCHAR(15) NOT NULL,
				DHCPRange INTEGER UNSIGNED NOT NULL,
				Usuario VARCHAR(20) NOT NULL,
				GatewayPass VARCHAR(20) NOT NULL,
				SerialNumber VARCHAR(30) NOT NULL,
				Ubicacion VARCHAR(15),
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatLans_insert
					AFTER INSERT ON CatLans
					FOR EACH ROW
					INSERT INTO CatLans_Audit (IdCatLan, Warehouse, ISP, Tel, Holder, Cuenta, Download, Upload, Visits, SSID, Pass, NetworkIP, MaskIP, GatewayIP, DHCPRange, Usuario, GatewayPass, SerialNumber, Ubicacion, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdCatLan, NEW.IdCatLan, NEW.Warehouse, NEW.ISP, NEW.Tel, NEW.Holder, NEW.Cuenta, NEW.Download, NEW.Upload, NEW.Visits, NEW.SSID, NEW.Pass, NEW.NetworkIP, NEW.MaskIP, NEW.GatewayIP, NEW.DHCPRange, NEW.Usuario, NEW.GatewayPass, NEW.SerialNumber, NEW.Ubicacion, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus,  'INSERT');
				CREATE TRIGGER after_CatLans_update
					AFTER UPDATE ON CatLans
					FOR EACH ROW
					INSERT INTO CatLans_Audit (IdCatLan, Warehouse, ISP, Tel, Holder, Cuenta, Download, Upload, Visits, SSID, Pass, NetworkIP, MaskIP, GatewayIP, DHCPRange, Usuario, GatewayPass, SerialNumber, Ubicacion, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdCatLan, NEW.IdCatLan, NEW.Warehouse, NEW.ISP, NEW.Tel, NEW.Holder, NEW.Cuenta, NEW.Download, NEW.Upload, NEW.Visits, NEW.SSID, NEW.Pass, NEW.NetworkIP, NEW.MaskIP, NEW.GatewayIP, NEW.DHCPRange, NEW.Usuario, NEW.GatewayPass, NEW.SerialNumber, NEW.Ubicacion, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus,  'UPDATE');
				CREATE TRIGGER after_CatLans_delete
					AFTER DELETE ON CatLans
					FOR EACH ROW
					INSERT INTO CatLans_Audit (IdCatLan, Warehouse, ISP, Tel, Holder, Cuenta, Download, Upload, Visits, SSID, Pass, NetworkIP, MaskIP, GatewayIP, DHCPRange, Usuario, GatewayPass, SerialNumber, Ubicacion, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdCatLan, OLD.IdCatLan, OLD.Warehouse, OLD.ISP, OLD.Tel, OLD.Holder, OLD.Cuenta, OLD.Download, OLD.Upload, OLD.Visits, OLD.SSID, OLD.Pass, OLD.NetworkIP, OLD.MaskIP, OLD.GatewayIP, OLD.DHCPRange, OLD.Usuario, OLD.GatewayPass, OLD.SerialNumber, OLD.Ubicacion, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus,  'DELETE');
		ALTER TABLE CatLans
			ADD FOREIGN KEY (Warehouse) REFERENCES CatWarehouses(IdWarehouse);
            
            
		CREATE TABLE IF NOT EXISTS CatDataBasesWals (
			IdDataBaseWals INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			DataBaseWals VARCHAR(30) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatDataBasesWals_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdDataBaseWals INTEGER UNSIGNED,
				DataBaseWals VARCHAR(30) NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatDataBasesWals_insert
					AFTER INSERT ON CatDataBasesWals
					FOR EACH ROW
					INSERT INTO CatDataBasesWals_Audit (IdDataBaseWals, DataBaseWals, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdDataBaseWals, NEW.DataBaseWals, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatDataBasesWals_update
					AFTER UPDATE ON CatDataBasesWals
					FOR EACH ROW
					INSERT INTO CatDataBasesWals_Audit (IdDataBaseWals, DataBaseWals, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdDataBaseWals, NEW.DataBaseWals, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatDataBasesWals_delete
					AFTER DELETE ON CatDataBasesWals
					FOR EACH ROW
					INSERT INTO CatDataBasesWals_Audit (IdDataBaseWals, DataBaseWals, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdDataBaseWals, OLD.DataBaseWals, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
            
		CREATE TABLE IF NOT EXISTS CatDataBasesTI (
			IdDataBaseTI INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			DataBaseTI VARCHAR(30) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatDataBasesTI_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdDataBaseTI INTEGER UNSIGNED,
				DataBaseTI VARCHAR(30) NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatDataBasesTI_insert
					AFTER INSERT ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdDataBaseTI, DataBaseTI, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdDataBaseTI, NEW.DataBaseTI, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatDataBasesTI_update
					AFTER UPDATE ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdDataBaseTI, DataBaseTI, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdDataBaseTI, NEW.DataBaseTI, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatDataBasesTI_delete
					AFTER DELETE ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdDataBaseTI, DataBaseWals, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdDataBaseTI, OLD.DataBaseTI, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
        ALTER TABLE CatSoftwareAssignments
			ADD FOREIGN KEY (Usuario) REFERENCES CatUsers(Usuario),
			ADD FOREIGN KEY (WalsCom) REFERENCES CatWalsComs(WalsCom),
			ADD FOREIGN KEY (WalsTer) REFERENCES CatWalsTerms(WalsTer),
			ADD FOREIGN KEY (Email) REFERENCES CatEmails(Email),
			ADD FOREIGN KEY (Office) REFERENCES CatLicOffice(Office),
			ADD FOREIGN KEY (PowerBi) REFERENCES CatPowerBi(PowerBi),
			ADD FOREIGN KEY (CarpCom) REFERENCES CatCarpCom(CarpCom),
			ADD FOREIGN KEY (DataBaseWals) REFERENCES CatDataBasesWals(DataBaseWals),
			ADD FOREIGN KEY (DataBaseTI) REFERENCES CatDataBasesTI(DataBaseTI);
            
            
  		CREATE TABLE IF NOT EXISTS CatLogos (
			IdLogo INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Logo VARCHAR(255) NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatDataBasesTI_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdLogo INTEGER UNSIGNED,
				Logo VARCHAR(30) NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatDataBasesTI_insert
					AFTER INSERT ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdLogo, Logo, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdLogo, NEW.Logo, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatDataBasesTI_update
					AFTER UPDATE ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdLogo, Logo, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdLogo, NEW.Logo, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatDataBasesTI_delete
					AFTER DELETE ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdLogo, Logo, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdLogo, OLD.Logo, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');


		/*CATALOGO DE CONSEPTOS PARA PROYECTOS*/
  		CREATE TABLE IF NOT EXISTS CatConsepts (
			IdConsept INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            ItemCode VARCHAR (100) NOT NULL UNIQUE,
			ItemDescription VARCHAR(50) NOT NULL,
            UnitOfMeasurement VARCHAR(30) NOT NULL,
			Price DOUBLE (7,2) NOT NULL,									/*VALIDAR FORMATO DE IP DESDE PHYTON*/
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatConsepts_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdConsept INTEGER UNSIGNED,
				ItemCode VARCHAR (100) NOT NULL UNIQUE,
				ItemDescription VARCHAR(50) NOT NULL,
				UnitOfMeasurement VARCHAR(30) NOT NULL,
				Price DOUBLE (7,2) NOT NULL,	
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20),
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20),
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatDataBasesTI_insert
					AFTER INSERT ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdConsept, ItemCode, ItemDescription, UnitOfMeasurement, Price, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdConsept, NEW.LogItemCodeo, NEW.ItemDescription, NEW.UnitOfMeasurement, NEW.Price, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatDataBasesTI_update
					AFTER UPDATE ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdConsept, ItemCode, ItemDescription, UnitOfMeasurement, Price, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdConsept, NEW.LogItemCodeo, NEW.ItemDescription, NEW.UnitOfMeasurement, NEW.Price, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatDataBasesTI_delete
					AFTER DELETE ON CatDataBasesTI
					FOR EACH ROW
					INSERT INTO CatDataBasesTI_Audit (IdConsept, ItemCode, ItemDescription, UnitOfMeasurement, Price, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdConsept, OLD.LogItemCodeo, OLD.ItemDescription, OLD.UnitOfMeasurement, OLD.Price, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');


			/*CATALOGO DE FOLIOS DE GASTOS PARA FINANZAS*/
			CREATE TABLE IF NOT EXISTS CatFoliosFinanzas (
				IdFolio INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                Prefix ENUM ('LS') NOT NULL,
                Mes ENUM('ENE', 'FEB', 'MAR', 'ABR', 'MAY', 'JUN', 'JUL', 'AGO', 'SEP', 'OCT', 'NOV', 'DIC') NOT NULL,
                Years INT(4) UNSIGNED NOT NULL,
                Sequence INT(3) UNSIGNED NOT NULL,
                Cliente VARCHAR(20) NOT NULL,
				ItemCode VARCHAR (100) NOT NULL UNIQUE,
				ItemDescription VARCHAR(50) NOT NULL,
				UnitOfMeasurement VARCHAR(30) NOT NULL,
				UnitPrice DOUBLE (7,2) NOT NULL,									/*VALIDAR DESDE PHYTON*/
                Amount INT(3) UNSIGNED NOT NULL,
                SubTotal DOUBLE (7,2) NOT NULL,										/*VALIDAR DESDE PHYTON*/
                Tax DOUBLE (7,2) NOT NULL,											/*VALIDAR DESDE PHYTON*/
                Importe DOUBLE (7,2) NOT NULL,										/*VALIDAR DESDE PHYTON*/
                Instructions VARCHAR(255) NOT NULL,
				CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1) DEFAULT 1
			);
				CREATE TABLE IF NOT EXISTS CatFoliosFinanzas_Audit (
					AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
					IdFolio INTEGER UNSIGNED,
					Prefix ENUM ('LS') NOT NULL,
					Mes ENUM('ENE', 'FEB', 'MAR', 'ABR', 'MAY', 'JUN', 'JUL', 'AGO', 'SEP', 'OCT', 'NOV', 'DIC') NOT NULL,
					Years INT(4) UNSIGNED NOT NULL,
					Sequence INT(3) UNSIGNED NOT NULL,
					Cliente VARCHAR(20) NOT NULL,
					ItemCode VARCHAR (100) NOT NULL UNIQUE,
					ItemDescription VARCHAR(50) NOT NULL,
					UnitOfMeasurement VARCHAR(30) NOT NULL,
					UnitPrice DOUBLE (7,2) NOT NULL,									/*VALIDAR DESDE PHYTON*/
					Amount INT(3) UNSIGNED NOT NULL,
					SubTotal DOUBLE (7,2) NOT NULL,										/*VALIDAR DESDE PHYTON*/
					Tax DOUBLE (7,2) NOT NULL,											/*VALIDAR DESDE PHYTON*/
					Importe DOUBLE (7,2) NOT NULL,										/*VALIDAR DESDE PHYTON*/
					Instructions VARCHAR(255) NOT NULL,
					CreatedAt TIMESTAMP,
					CreatedBy VARCHAR(20),
					UpdatedAt TIMESTAMP,
					UpdatedBy VARCHAR(20),
					Estatus TINYINT(1),
					ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
					ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
				);
					CREATE TRIGGER after_CatFoliosFinanzas_insert
						AFTER INSERT ON CatFoliosFinanzas
						FOR EACH ROW
						INSERT INTO CatFoliosFinanzas_Audit (IdFolio, Prefix, Mes, Years, Sequence, Cliente, ItemCode, ItemDescription, UnitOfMeasurement, UnitPrice, Amount, SubTotal, Tax, Importe, Instructions, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (NEW.IdFolio, NEW.Prefix, NEW.Mes, NEW.Years, NEW.Sequence, NEW.Cliente, NEW.ItemCode, NEW.ItemDescription, NEW.UnitOfMeasurement, NEW.UnitPrice, NEW.Amount, NEW.SubTotal, NEW.Tax, NEW.Importe, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
					CREATE TRIGGER after_CatFoliosFinanzas_update
						AFTER UPDATE ON CatFoliosFinanzas
						FOR EACH ROW
						INSERT INTO CatFoliosFinanzas_Audit (IdFolio, Prefix, Mes, Years, Sequence, Cliente, ItemCode, ItemDescription, UnitOfMeasurement, UnitPrice, Amount, SubTotal, Tax, Importe, Instructions, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (NEW.IdFolio, NEW.Prefix, NEW.Mes, NEW.Years, NEW.Sequence, NEW.Cliente, NEW.ItemCode, NEW.ItemDescription, NEW.UnitOfMeasurement, NEW.UnitPrice, NEW.Amount, NEW.SubTotal, NEW.Tax, NEW.Importe, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
					CREATE TRIGGER after_CatFoliosFinanzas_delete
						AFTER DELETE ON CatFoliosFinanzas
						FOR EACH ROW
						INSERT INTO CatFoliosFinanzas_Audit (IdFolio, Prefix, Mes, Years, Sequence, Cliente, ItemCode, ItemDescription, UnitOfMeasurement, UnitPrice, Amount, SubTotal, Tax, Importe, Instructions, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (OLD.IdFolio, OLD.Prefix, OLD.Mes, OLD.Years, OLD.Sequence, OLD.Cliente, OLD.ItemCode, OLD.ItemDescription, OLD.UnitOfMeasurement, OLD.UnitPrice, OLD.Amount, OLD.SubTotal, OLD.Tax, OLD.Importe, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
			ALTER TABLE CatFoliosFinanzas
				ADD FOREIGN KEY (Cliente) REFERENCES CatClients(Cliente),
				ADD FOREIGN KEY (ItemCode) REFERENCES CatConsepts(ItemCode),
				ADD FOREIGN KEY (ItemDescription) REFERENCES CatConsepts(ItemDescription),
				ADD FOREIGN KEY (UnitOfMeasurement) REFERENCES CatConsepts(UnitOfMeasurement),
				ADD FOREIGN KEY (Price) REFERENCES CatConsepts(Price);
				
        
			/*TABLAS DEMO PARA YOAB MANTENIMIENTO DE UNIDADES */
			CREATE TABLE IF NOT EXISTS CatUnits (
				IdFolioMant INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				Operation ENUM ('INDUSTRIAL', 'FARMACEUTICA'),
				Warehouse VARCHAR(50) NOT NULL,
				Economic VARCHAR(50) NOT NULL,
				Brand VARCHAR(50) NOT NULL,
				SubBrand VARCHAR(50) NOT NULL,
				Model VARCHAR(50) NOT NULL,
				Plate VARCHAR(50) NOT NULL,
				Capacity VARCHAR(50) NOT NULL,
				Fuel ENUM ('DIESEL', 'GASOLINA') NOT NULL,
				NIV VARCHAR(50) NOT NULL,
				Motor VARCHAR(50) NOT NULL,
				CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1) DEFAULT 1
			);
				CREATE TABLE IF NOT EXISTS CatUnits_Audit (
					AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
					IdFolioMant INTEGER UNSIGNED,
					Operation ENUM ('INDUSTRIAL', 'FARMACEUTICA'),
					Warehouse VARCHAR(50) NOT NULL,
					Economic VARCHAR(50) NOT NULL,
					Brand VARCHAR(50) NOT NULL,
					SubBrand VARCHAR(50) NOT NULL,
					Model VARCHAR(50) NOT NULL,
					Plate VARCHAR(50) NOT NULL,
					Capacity VARCHAR(50) NOT NULL,
					Fuel ENUM ('DIESEL', 'GASOLINA') NOT NULL,
					NIV VARCHAR(50) NOT NULL,
					Motor VARCHAR(50) NOT NULL,
					CreatedAt TIMESTAMP,
					CreatedBy VARCHAR(20),
					UpdatedAt TIMESTAMP,
					UpdatedBy VARCHAR(20),
					Estatus TINYINT(1),
					ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
					ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
				);
					CREATE TRIGGER after_CatUnits_insert
						AFTER INSERT ON CatUnits
						FOR EACH ROW
						INSERT INTO CatUnits_Audit (IdFolioMant, Operation, Warehouse, Economic, Brand, SubBrand, Model, Plate, Capacity, Fuel, NIV, Motor, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (NEW.NIdFolioMant, NEW.Operation, NEW.Warehouse, NEW.Economic, NEW.Brand, NEW.SubBrand, NEW.odel, NEW.Plate, NEW.Capacity, NEW.Fuel, NEW.NIV, NEW.Motor, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
					CREATE TRIGGER after_CatUnits_update
						AFTER UPDATE ON CatUnits
						FOR EACH ROW
						INSERT INTO CatUnits_Audit (IdFolioMant, Operation, Warehouse, Economic, Brand, SubBrand, Model, Plate, Capacity, Fuel, NIV, Motor, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (NEW.NIdFolioMant, NEW.Operation, NEW.Warehouse, NEW.Economic, NEW.Brand, NEW.SubBrand, NEW.odel, NEW.Plate, NEW.Capacity, NEW.Fuel, NEW.NIV, NEW.Motor, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
					CREATE TRIGGER after_CatUnits_delete
						AFTER DELETE ON CatUnits
						FOR EACH ROW
						INSERT INTO CatUnits_Audit (IdFolioMant, Operation, Warehouse, Economic, Brand, SubBrand, Model, Plate, Capacity, Fuel, NIV, Motor, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (OLD.NIdFolioMant, OLD.Operation, OLD.Warehouse, OLD.Economic, OLD.Brand, OLD.SubBrand, OLD.odel, OLD.Plate, OLD.Capacity, OLD.Fuel, OLD.NIV, OLD.Motor, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
		
			
			CREATE TABLE IF NOT EXISTS CatUnitMaintence (
				IdFolioMant INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				Operation ENUM ('INDUSTRIAL', 'FARMACEUTICA'),
				Warehouse VARCHAR(50) NOT NULL,
				Economic VARCHAR(50) NOT NULL,
				Brand VARCHAR(50) NOT NULL,
				SubBrand VARCHAR(50) NOT NULL,
				Model VARCHAR(50) NOT NULL,
				Plate VARCHAR(50) NOT NULL,
				Capacity VARCHAR(50) NOT NULL,
				Fuel VARCHAR(50) NOT NULL,
				NIV VARCHAR(50) NOT NULL,
				Motor VARCHAR(50) NOT NULL,
				OperatorReport VARCHAR(500) NOT NULL,
				Operator VARCHAR(20) UNIQUE NOT NULL,
				MechanicReport VARCHAR(500) NOT NULL,
				Mechanic VARCHAR(20) UNIQUE NOT NULL,
				DeliveryObservation VARCHAR(500) NOT NULL,
				CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1) DEFAULT 1
			);
				CREATE TABLE IF NOT EXISTS CatUnitMaintence_Audit (
					AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
					IdFolioMant INTEGER UNSIGNED,
					Operation ENUM ('INDUSTRIAL', 'FARMACEUTICA'),
					Warehouse VARCHAR(50) NOT NULL,
					Economic VARCHAR(50) NOT NULL,
					Brand VARCHAR(50) NOT NULL,
					SubBrand VARCHAR(50) NOT NULL,
					Model VARCHAR(50) NOT NULL,
					Plate VARCHAR(50) NOT NULL,
					Capacity VARCHAR(50) NOT NULL,
					Fuel VARCHAR(50) NOT NULL,
					NIV VARCHAR(50) NOT NULL,
					Motor VARCHAR(50) NOT NULL,
					OperatorReport VARCHAR(500) NOT NULL,
					Operator VARCHAR(20) UNIQUE NOT NULL,
					MechanicReport VARCHAR(500) NOT NULL,
					Mechanic VARCHAR(20) UNIQUE NOT NULL,
					DeliveryObservation VARCHAR(500) NOT NULL,
					CreatedAt TIMESTAMP,
					CreatedBy VARCHAR(20),
					UpdatedAt TIMESTAMP,
					UpdatedBy VARCHAR(20),
					Estatus TINYINT(1),
					ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
					ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
				);
					CREATE TRIGGER after_CatUnitMaintence_insert
						AFTER INSERT ON CatUnitMaintence
						FOR EACH ROW
						INSERT INTO CatUnitMaintence_Audit (IdFolioMant, Operation, Warehouse, Economic, Brand, SubBrand, Model, Plate, Capacity, Fuel, NIV, Motor, OperatorReport, Operator, MechanicReport, Mechanic, DeliveryObservation, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (NEW.NIdFolioMant, NEW.Operation, NEW.Warehouse, NEW.Economic, NEW.Brand, NEW.SubBrand, NEW.odel, NEW.Plate, NEW.Capacity, NEW.Fuel, NEW.NIV, NEW.Motor, NEW.OperatorReport, NEW.Operator, NEW.MechanicReport, NEW.Mechanic, NEW.DeliveryObservation, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
					CREATE TRIGGER after_CatUnitMaintence_update
						AFTER UPDATE ON CatUnitMaintence
						FOR EACH ROW
						INSERT INTO CatUnitMaintence_Audit (IdFolioMant, Operation, Warehouse, Economic, Brand, SubBrand, Model, Plate, Capacity, Fuel, NIV, Motor, OperatorReport, Operator, MechanicReport, Mechanic, DeliveryObservation, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (NEW.NIdFolioMant, NEW.Operation, NEW.Warehouse, NEW.Economic, NEW.Brand, NEW.SubBrand, NEW.odel, NEW.Plate, NEW.Capacity, NEW.Fuel, NEW.NIV, NEW.Motor, NEW.OperatorReport, NEW.Operator, NEW.MechanicReport, NEW.Mechanic, NEW.DeliveryObservation, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
					CREATE TRIGGER after_CatUnitMaintence_delete
						AFTER DELETE ON CatUnitMaintence
						FOR EACH ROW
						INSERT INTO CatUnitMaintence_Audit (IdFolioMant, Operation, Warehouse, Economic, Brand, SubBrand, Model, Plate, Capacity, Fuel, NIV, Motor, OperatorReport, Operator, MechanicReport, Mechanic, DeliveryObservation, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
						VALUES (OLD.NIdFolioMant, OLD.Operation, OLD.Warehouse, OLD.Economic, OLD.Brand, OLD.SubBrand, OLD.odel, OLD.Plate, OLD.Capacity, OLD.Fuel, OLD.NIV, OLD.Motor, OLD.OperatorReport, OLD.Operator, OLD.MechanicReport, OLD.Mechanic, OLD.DeliveryObservation, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');
			ALTER TABLE CatUnitMaintence
					ADD FOREIGN KEY (Operation) REFERENCES CatUnits(Operation),
					ADD FOREIGN KEY (Warehouse) REFERENCES CatWarehouses(Warehouse),
					ADD FOREIGN KEY (Economic) REFERENCES CatUnits(Economic),
					ADD FOREIGN KEY (Brand) REFERENCES CatUnits(Brand),
					ADD FOREIGN KEY (SubBrand) REFERENCES CatUnits(SubBrand),
					ADD FOREIGN KEY (Model) REFERENCES CatUnits(Model),
					ADD FOREIGN KEY (Plate) REFERENCES CatUnits(Plate),
					ADD FOREIGN KEY (Capacity) REFERENCES CatUnits(Capacity),
					ADD FOREIGN KEY (Fuel) REFERENCES CatUnits(Fuel),
					ADD FOREIGN KEY (NIV) REFERENCES CatUnits(NIV),
					ADD FOREIGN KEY (Motor) REFERENCES CatUnits(Motor);

     
        CREATE TABLE IF NOT EXISTS CatIPs (
			IdIP INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			IP VARCHAR(20) NOT NULL,
            Rango ENUM('RED','GATEWAY','SWITCH','AP','BIOMETRICO','IMPRESORA','ALARMA','GRABADOR','DIRECCION GENERAL','TI','ADMINISTRACION','EJECUTIVOS','AUXILIARES','TERMINAL','SERVIDOR') NOT NULL,
            MAC VARCHAR(17) UNIQUE NOT NULL, /*VALIDAR FORMATO CON PHYTON*/
            NIC ENUM('ETHERNET','WIRELESS') NOT NULL,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatIPs_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdIP INTEGER UNSIGNED,
				IP VARCHAR(20) NOT NULL,
				Rango ENUM('RED','GATEWAY','SWITCH','AP','BIOMETRICO','IMPRESORA','ALARMA','GRABADOR','DIRECCION GENERAL','TI','ADMINISTRACION','EJECUTIVOS','AUXILIARES','TERMINAL','SERVIDOR') NOT NULL,
				MAC VARCHAR(17) UNIQUE NOT NULL, /*VALIDAR FORMATO CON PHYTON*/
				NIC ENUM('ETHERNET','WIRELESS') NOT NULL,
				CreatedAt TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1),
				ActionTaken ENUM('INSERT', 'UPDATE', 'DELETE'),
				ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			);
				CREATE TRIGGER after_CatIPs_insert
					AFTER INSERT ON CatIPs
					FOR EACH ROW
					INSERT INTO CatIPs_Audit (IdIP, IP, Rango, MAC, NIC, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdIP, NEW.IP, NEW.Rango, NEW.MAC, NEW.NIC, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatIPs_update
					AFTER UPDATE ON CatIPs
					FOR EACH ROW
					INSERT INTO CatIPs_Audit (IdIP, IP, Rango, MAC, NIC, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdIP, NEW.IP, NEW.Rango, NEW.MAC, NEW.NIC, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatIPs_delete
					AFTER DELETE ON CatIPs
					FOR EACH ROW
					INSERT INTO CatIPs_Audit (IdIP, IP, Rango, MAC, NIC, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdIP, OLD.IP, OLD.Rango, OLD.MAC, OLD.NIC, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');


		CREATE TABLE IF NOT EXISTS ComputerIPAssignments (
			IdAssignment INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			IdComputer INTEGER UNSIGNED,
			IdIP INTEGER UNSIGNED,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS ComputerIPAssignments_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdAssignment INTEGER UNSIGNED,
				IdComputer INTEGER UNSIGNED,
				IdIP INTEGER UNSIGNED,
				CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1) DEFAULT 1
			);
				CREATE TRIGGER after_ComputerIPAssignments_insert
					AFTER INSERT ON ComputerIPAssignments
					FOR EACH ROW
					INSERT INTO ComputerIPAssignments_Audit (IdAssignment, IdComputer, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdAssignment, NEW.IdComputer, NEW.IdIP, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_ComputerIPAssignments_update
					AFTER UPDATE ON ComputerIPAssignments
					FOR EACH ROW
					INSERT INTO ComputerIPAssignments_Audit (IdAssignment, IdComputer, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdAssignment, NEW.IdComputer, NEW.IdIP, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_ComputerIPAssignments_delete
					AFTER DELETE ON ComputerIPAssignments
					FOR EACH ROW
					INSERT INTO ComputerIPAssignments_Audit (IdAssignment, IdComputer, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdAssignment, OLD.IdComputer, OLD.IdIP, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');		
		ALTER TABLE ComputerIPAssignments
				ADD FOREIGN KEY (IdComputer) REFERENCES CatComputers(IdComputer),
				ADD FOREIGN KEY (IdIP) REFERENCES CatIPs(IdIP);
    

		CREATE TABLE IF NOT EXISTS HandHeldsIPAssignments (
			IdAssignment INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			IdHandHelds INTEGER UNSIGNED,
			IdIP INTEGER UNSIGNED,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS HandHeldsIPAssignments_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdAssignment INTEGER UNSIGNED,
				IdHandHelds INTEGER UNSIGNED,
				IdIP INTEGER UNSIGNED,
				CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1) DEFAULT 1
			);
				CREATE TRIGGER after_HandHeldsIPAssignments_insert
					AFTER INSERT ON HandHeldsIPAssignments
					FOR EACH ROW
					INSERT INTO HandHeldsIPAssignments_Audit (IdAssignment, IdHandHelds, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdAssignment, NEW.IdHandHelds, NEW.IdIP, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_HandHeldsIPAssignments_update
					AFTER UPDATE ON HandHeldsIPAssignments
					FOR EACH ROW
					INSERT INTO HandHeldsIPAssignments_Audit (IdAssignment, IdHandHelds, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdAssignment, NEW.IdHandHelds, NEW.IdIP, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_HandHeldsIPAssignments_delete
					AFTER DELETE ON HandHeldsIPAssignments
					FOR EACH ROW
					INSERT INTO HandHeldsIPAssignments_Audit (IdAssignment, IdHandHelds, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdAssignment, OLD.IdHandHelds, OLD.IdIP, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');		
		ALTER TABLE HandHeldsIPAssignments
				ADD FOREIGN KEY (IdHandHelds) REFERENCES CatHandHelds(IdHandHelds),
				ADD FOREIGN KEY (IdIP) REFERENCES CatIPs(IdIP);
                
                
		CREATE TABLE IF NOT EXISTS CatPrintersIPAssignments (
			IdAssignment INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			IdPrinter INTEGER UNSIGNED,
			IdIP INTEGER UNSIGNED,
			CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			CreatedBy VARCHAR(20) NOT NULL,
			UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			UpdatedBy VARCHAR(20) NOT NULL,
			Estatus TINYINT(1) DEFAULT 1
		);
			CREATE TABLE IF NOT EXISTS CatPrintersIPAssignments_Audit (
				AuditId INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
				IdPrinter INTEGER UNSIGNED,
				CatPrinters INTEGER UNSIGNED,
				IdIP INTEGER UNSIGNED,
				CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
				CreatedBy VARCHAR(20) NOT NULL,
				UpdatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				UpdatedBy VARCHAR(20) NOT NULL,
				Estatus TINYINT(1) DEFAULT 1
			);
				CREATE TRIGGER after_CatPrintersIPAssignments_insert
					AFTER INSERT ON CatPrintersIPAssignments
					FOR EACH ROW
					INSERT INTO CatPrintersIPAssignments_Audit (IdAssignment, IdPrinter, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdAssignment, NEW.IdPrinter, NEW.IdIP, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'INSERT');
				CREATE TRIGGER after_CatPrintersIPAssignments_update
					AFTER UPDATE ON HandHeldsIPAssignments
					FOR EACH ROW
					INSERT INTO CatPrintersIPAssignments_Audit (IdAssignment, IdPrinter, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (NEW.IdAssignment, NEW.IdPrinter, NEW.IdIP, NEW.CreatedAt, NEW.CreatedBy, NEW.UpdatedAt, NEW.UpdatedBy, NEW.Estatus, 'UPDATE');
				CREATE TRIGGER after_CatPrintersIPAssignments_delete
					AFTER DELETE ON CatPrintersIPAssignments
					FOR EACH ROW
					INSERT INTO CatPrintersIPAssignments_Audit (IdAssignment, IdPrinter, IdIP, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Estatus, ActionTaken)
					VALUES (OLD.IdAssignment, OLD.IdPrinter, OLD.IdIP, OLD.CreatedAt, OLD.CreatedBy, OLD.UpdatedAt, OLD.UpdatedBy, OLD.Estatus, 'DELETE');		
		ALTER TABLE CatPrintersIPAssignments
				ADD FOREIGN KEY (IdPrinter) REFERENCES CatPrinters(IdPrinter),
				ADD FOREIGN KEY (IdIP) REFERENCES CatIPs(IdIP);
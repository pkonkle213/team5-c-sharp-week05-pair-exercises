
-- Switch to the system (aka master) database
USE master;
GO

-- Delete the AnimalHospital Database (IF EXISTS)
IF EXISTS(select * from sys.databases where name='AnimalHospital')
DROP DATABASE AnimalHospital;
GO

-- Create a new AnimalHospital Database
CREATE DATABASE AnimalHospital;
GO

-- Switch to the AnimalHospital Database
USE AnimalHospital
GO

-- Begin a TRANSACTION that must complete with no errors
BEGIN TRANSACTION;

CREATE TABLE address (
    id integer NOT NULL,
	streetaddress varchar(64) NOT NULL,
    city varchar(64) NOT NULL,
	district varchar(64) NOT NULL,
	postalcode integer NOT NULL,
    CONSTRAINT pk_address_id PRIMARY KEY (id)
);

CREATE TABLE invoice (
    id integer NOT NULL,
    paymentmethod varchar(64) NOT NULL,
    total decimal NOT NULL,
    taxpercent decimal NOT NULL,
    CONSTRAINT pk_invoice_id PRIMARY KEY (id)
);

CREATE TABLE proceedure (
    id integer NOT NULL,
    description varchar(64) NOT NULL,
    cost decimal NOT NULL,
    CONSTRAINT pk_proceedure_id PRIMARY KEY (id)
);

CREATE TABLE owner (
    id integer NOT NULL,
    firstname varchar(64) NOT NULL,
    lastname varchar(64) NOT NULL,
    addressid integer NOT NULL,
    CONSTRAINT pk_owner_id PRIMARY KEY (id),
    CONSTRAINT fk_address_id FOREIGN KEY (addressid) REFERENCES address(id)
);

CREATE TABLE pet (
    id integer NOT NULL,
    name varchar(64) NOT NULL,
    type varchar(10) NOT NULL,
    ownerid integer NOT NULL,
    age integer NOT NULL,
    CONSTRAINT pk_pet_id PRIMARY KEY (id),
    CONSTRAINT fk_ownerid FOREIGN KEY (ownerid) REFERENCES owner(id)
);

CREATE TABLE visit (
    id integer NOT NULL,
	date DATE NOT NULL,
    petid integer NOT NULL,
	proceedureid integer NOT NULL,
	invoiceid integer NOT NULL,
    CONSTRAINT pk_visit_id PRIMARY KEY (id),
	CONSTRAINT fk_petid FOREIGN KEY (petid) REFERENCES pet(id),
	CONSTRAINT fk_procedureid FOREIGN KEY (proceedureid) REFERENCES proceedure(id),
	CONSTRAINT fk_invoiceid FOREIGN KEY (invoiceid) REFERENCES invoice(id)
);

COMMIT TRANSACTION
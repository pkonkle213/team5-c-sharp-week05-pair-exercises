
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


CREATE TABLE visit (
    id integer NOT NULL,
	date string(10) NOT NULL,
    petid integer NOT NULL,
	procedureid integer NOT NULL,
	invoiceid integer NOT NULL,
    CONSTRAINT pk_visit_id PRIMARY KEY (id),
	CONSTRAINT fk_petid (petid) references pet(id),
	CONSTRAINT fk_procedureid (procedureid) references procedure(id),
	CONSTRAINT fk_invoiceid (invoiceid) references invoice(id)
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

CREATE TABLE owner (
    id integer NOT NULL,
    firstname varchar(64) NOT NULL,
    lastname varchar(64) NOT NULL,
    addressid integer NOT NULL,
    CONSTRAINT pk_owner_id PRIMARY KEY (id),
    CONSTRAINT fk_address_id FOREIGN KEY (addressid) REFERENCES address(id)
);
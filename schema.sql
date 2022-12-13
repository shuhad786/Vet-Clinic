/* Database schema to keep the structure of entire database. */
CREATE database vet_clinic

CREATE TABLE animals
(
	Id integer primary key,
	Name varchar(50),
	Date_of_birth date,
	Escape_attempts integer,
	Neutered boolean,
	Weight_kg real
);

ALTER TABLE animals  
ADD COLUMN species varchar(100);

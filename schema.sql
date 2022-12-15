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

CREATE TABLE owners
(
	id serial primary key,
	full_name varchar(50),
	age integer
);

CREATE TABLE species
(
	id serial primary key,
	name varchar(100)
);

ALTER TABLE animals 
ADD COLUMN owner_id integer;

ALTER TABLE animals 
ADD COLUMN species_id integer;

ALTER TABLE animals 
ADD CONSTRAINT animalspecies FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals 
ADD CONSTRAINT animalsowner FOREIGN KEY (owner_id) REFERENCES owners(id);



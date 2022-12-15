/* Database schema to keep the structure of entire database. */
CREATE database vet_clinic

CREATE TABLE animals
(
  id integer primary key,
  name varchar(50),
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg real
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

CREATE TABLE vets
(
	id serial primary key,
	name varchar(50),
	age integer,
	date_of_graduation date
);

CREATE TABLE specializations
(
	species_id integer,
	vets_id integer
);

ALTER TABLE specializations 
ADD CONSTRAINT specials1 FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE specializations 
ADD CONSTRAINT specials2 FOREIGN KEY (vets_id) REFERENCES vets(id);

CREATE TABLE visits
(
	animals_id integer,
	vets_id integer,
	date_of_visit date
);

ALTER TABLE visits 
ADD CONSTRAINT visits1 FOREIGN KEY (animals_id) REFERENCES animals(id);

ALTER TABLE visits 
ADD CONSTRAINT visits2 FOREIGN KEY (vets_id) REFERENCES vets(id);


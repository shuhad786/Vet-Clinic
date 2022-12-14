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

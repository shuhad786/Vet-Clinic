/* Populate database with sample data. */

INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '03-02-2020', 0, true, 10.23);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', '07-01-2021', 1, false, 15.04);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', '12-05-2017', 5, true, 11);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5, 'Charmander', '08-02-2020', 0, false, -11);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (7, 'Squirtle', '02-04-1993', 3, false, -12.13);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (8, 'Angemon', '12-06-2005', 1, true, -45);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (9, 'Boarmon', '07-06-2005', 7, true, 20.4);
	
INSERT INTO public.animals
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

INSERT INTO Public.owners(
	name, age)
	VALUES ('Sam Smith', 34);
	
INSERT INTO Public.owners(
	name, age)
	VALUES ('Jennifer Orwell', 19);
	
INSERT INTO Public.owners(
	name, age)
	VALUES ('Bob', 45);
	
INSERT INTO Public.owners(
	name, age)
	VALUES ('Melody Pond', 77);
	
INSERT INTO Public.owners(
	name, age)
	VALUES ('Dean Winchester', 14);
	
INSERT INTO Public.owners(
	name, age)
	VALUES ('Jodie Whittaker', 38);

INSERT INTO Public.species(
	name)
	VALUES ('Pokemon');

INSERT INTO Public.species(
	name)
	VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Pikachu';

UPDATE animals SET owner_id = 3 WHERE name = 'Devimon';
UPDATE animals SET owner_id = 3 WHERE name = 'Plantmon';

UPDATE animals SET owner_id = 4 WHERE name = 'Charmander'; 
UPDATE animals SET owner_id = 4 WHERE name = 'Squirtle';
UPDATE animals SET owner_id = 4 WHERE name = 'Blossom';

UPDATE animals SET owner_id = 5 WHERE name = 'Angemon';
UPDATE animals SET owner_id = 5 WHERE name = 'Boarmon';

INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('William Tatcher', 45, '2000-04-23');
	
INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('Maisy Smith', 26, '2019-01-17');
	
INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('Stephanie Mendez', 64, '1981-05-04');
	
INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO public.specializations(
	species_id, vets_id)
	VALUES (1, 1);

INSERT INTO public.specializations(
	species_id, vets_id)
	VALUES (2, 3);
	
INSERT INTO public.specializations(
	species_id, vets_id)
	VALUES (1, 3);
	
INSERT INTO public.specializations(
	species_id, vets_id)
	VALUES (2, 4);

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (1, 1, '2020-05-24');
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (1, 3, '2020-06-22'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (2, 4, '2021-02-02'); 

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (3, 2, '2020-01-05'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (3, 2, '2020-03-24'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (3, 2, '2020-03-14'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (4, 3, '2021-05-04'); 

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (5, 4, '2021-02-24'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (6, 2, '2019-12-21'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (6, 1, '2020-08-10'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (6, 2, '2021-04-07'); 

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (7, 3, '2019-09-29'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (8, 4, '2020-10-03');
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (8, 4, '2020-11-04'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (9, 2, '2019-01-24'); 

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (9, 2, '2019-05-15'); 

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (9, 2, '2020-02-27'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (9, 2, '2020-08-03'); 
	
INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (10, 3, '2020-05-24'); 

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (10, 1, '2021-01-11');

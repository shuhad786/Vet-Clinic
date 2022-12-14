/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN '01-01-2016' AND '01-01-2019';

SELECT name from animals WHERE neutered = true AND escape_attempts <= 3;

SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts from animals WHERE weight_kg >= 10.5;

SELECT * from animals WHERE neutered = true;

SELECT * from animals WHERE name != 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3

BEGIN;
UPDATE animals 
SET species = 'unspecified';
SELECT * FROM animals

BEGIN;
UPDATE animals 
SET species = 'unspecified';
ROLLBACK;
SELECT * FROM animals

BEGIN;
UPDATE animals 
SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals

BEGIN;
UPDATE animals 
SET species = 'pokemon' WHERE species IS null;
COMMIT;
SELECT * FROM animals

BEGIN;
DELETE FROM animals
WHERE date_of_birth >= '01-01-2022';
SAVEPOINT my_save;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT my_save;
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered FROM animals 
WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals)
GROUP BY neutered;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

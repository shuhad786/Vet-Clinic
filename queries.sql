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

SELECT name FROM animals 
WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

SELECT species, 
MIN(weight_kg) AS min_weight, 
MAX(weight_kg) AS max_weight 
FROM animals
GROUP BY species;

SELECT species, 
AVG(escape_attempts)
FROM animals
GROUP BY species;

SELECT a.name FROM animals as a
INNER JOIN owners as o 
ON o.id = a.owner_id 
WHERE o.name = 'Melody Pond';

SELECT a.name FROM animals AS a
JOIN species AS s
ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT a.name, o.name FROM animals AS a
RIGHT JOIN owners AS o
ON a.owner_id = o.id;

SELECT COUNT(*) as pokemons FROM animals AS a
JOIN species AS s
ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT COUNT(*) as digimons FROM animals AS a
JOIN species AS s
ON a.species_id = s.id
WHERE s.name = 'Digimon';

SELECT a.name FROM animals AS a
JOIN owners AS o
ON a.owner_id = o.id
JOIN species AS s
ON a.species_id = s.id
WHERE o.name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name FROM animals AS a
JOIN owners AS o
ON a.owner_id = o.id
WHERE o.name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.name
FROM owners AS o
JOIN animals AS a on o.id = a.owner_id
GROUP BY o.name
ORDER BY COUNT(*) DESC
LIMIT 1;
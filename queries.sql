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

SELECT a.name AS last_visited FROM vets AS v
JOIN visits AS vi
ON v.id = vi.vets_id
JOIN animals AS a
ON a.id = vi.animals_id
WHERE v.name = 'William Tatcher'
ORDER BY vi.date_of_visit DESC 
LIMIT 1;

SELECT COUNT(visited) AS visited FROM 
(
SELECT COUNT(a.name) 
FROM vets v 
JOIN visits vi ON v.id = vi.vets_id 
JOIN animals a ON vi.animals_id = a.id 
WHERE v.name = 'Stephanie Mendez' 
GROUP BY a.name
) visited;

SELECT v.name, s.name 
FROM vets v 
LEFT JOIN specializations sp ON v.id = sp.vets_id 
LEFT JOIN species s ON sp.species_id = s.id;

SELECT a.name, vi.date_of_visit, v.name 
FROM animals a 
JOIN visits vi ON a.id = vi.animals_id 
JOIN vets v ON v.id = vi.vets_id 
WHERE v.name='Stephanie Mendez' AND vi.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name, COUNT(vi.date_of_visit) AS number_of_visits 
FROM animals a 
JOIN visits vi ON a.id = vi.animals_id 
GROUP BY a.name 
ORDER BY number_of_visits DESC 
LIMIT 1;

SELECT a.name, vi.date_of_visit 
FROM animals AS a 
JOIN visits AS vi 
ON a.id = vi.animals_id 
JOIN vets AS v 
ON vi.vets_id = v.id 
WHERE v.name = 'Maisy Smith' 
ORDER BY vi.date_of_visit ASC 
LIMIT 1;

SELECT a.name, a.date_of_birth, a.escape_attempts, a.neutered, a.weight_kg, v.name, v.age, v.date_of_graduation, vi.date_of_visit 
FROM animals AS a 
JOIN visits AS vi 
ON a.id = vi.animals_id 
JOIN vets AS v 
ON vi.vets_id = v.id 
ORDER BY vi.date_of_visit DESC 
LIMIT 1;

SELECT COUNT(*) AS visits 
FROM (
SELECT sp.species_id AS vetsp, v.name, vi.date_of_visit, a.species_id AS animal_special FROM vets AS v 
LEFT JOIN specializations AS sp 
ON v.id = sp.vets_id
JOIN visits AS vi 
ON vi.vets_id = v.id
JOIN animals AS a 
ON vi.animals_id = a.id
WHERE (sp.species_id<>a.species_id OR sp.species_id IS NULL) AND v.name!='Stephanie Mendez'
) visits;

SELECT s.name, COUNT(s.name) AS specialty
FROM vets v
JOIN visits vi ON v.id = vi.vets_id
JOIN animals a ON vi.animals_id = a.id
JOIN species s ON a.species_id = s.id
WHERE v.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY specialty DESC 
LIMIT 1;
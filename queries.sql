/*Queries that provide answers to the questions from all projects.*/

-- Queries to list data for different cases
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg >10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name !='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;

-- Queries releted to safely modifying animals table

-- to begin a transaction
BEGIN TRANSACTION;

-- alter table in safe mode
ALTER TABLE animals RENAME COLUMN species TO unspecified;

-- display the table content
SELECT * FROM animals;

-- rollback the changes made
ROLLBACK TRANSACTION;
SELECT * FROM animals;

-- 
BEGIN TRANSACTION;
UPDATE animals SET species='Digimon' WHERE name Like'%mon%';
UPDATE animals SET species='Pokemon' WHERE species IS NULL;
COMMIT TRANSACTION;
SELECT * FROM animals;  

-- 
BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;

-- 
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg=weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;
COMMIT TRANSACTION;
SELECT * FROM animals;

-- 
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM  animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT name,date_of_birth, AVG(escape_attempts) FROM animals GROUP BY name, date_of_birth HAVING date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

-- Update the table as per the reviewer's request:
UPDATE animals SET weight_kg = -11, date_of_birth = '2020-08-02' WHERE name = 'Charmander';
UPDATE animals SET weight_kg = -5.7, date_of_birth = '2021-11-15' WHERE name = 'Plantmon';
UPDATE animals SET weight_kg = -12.13, date_of_birth = '1993-04-02' WHERE name = 'Squirtle';
UPDATE animals SET weight_kg = -45, date_of_birth = '2005-06-12' WHERE name = 'Angemon';

UPDATE animals SET date_of_birth = '2005-06-12' WHERE name = 'Angemon';

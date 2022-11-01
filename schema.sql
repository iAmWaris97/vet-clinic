/* Database schema to keep the structure of entire database. */

-- To creat a database named as "vet_clinic"
CREATE DATABASE vet_clinic;

-- To create a table named as "animals"
CREATE TABLE animals ( id INT, name CHAR(255), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL(5,2));

-- Add species column into animals table
ALTER TABLE animals ADD species CHAR(50);
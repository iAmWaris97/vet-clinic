/* Database schema to keep the structure of entire database. */

-- To creat a database named as "vet_clinic"
CREATE DATABASE vet_clinic;

-- To create a table named as "animals"
CREATE TABLE animals ( id INT, name CHAR(255), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL(5,2));

-- Add species column into animals table
ALTER TABLE animals ADD species CHAR(50);

-- Make the id column PRIMARY KEY
ALTER TABLE animals ADD PRIMARY KEY(id);


---------------------Day-3-----------

-- Create owners table
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY,full_name VARCHAR(255),age INT,PRIMARY KEY(id));

-- Create species table
CREATE TABLE species(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(255), PRIMARY KEY(id));

-- Update the animals table
-- id column is already autoincremented PRIMARY KEY
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);

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

-- Day-4 ---------------

-- Creating vets table
CREATE TABLE vets( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(50), age INT, date_of_graduation DATE, PRIMARY KEY (id));

-- Creating specialization table
CREATE TABLE specializations(species_id INT,vets_id INT,PRIMARY KEY(species_id,vets_id),FOREIGN KEY (species_id) REFERENCES species(id),FOREIGN KEY(vets_id) REFERENCES vets(id));

-- Creating visits table
CREATE TABLE visits(animal_id INT,vets_id INT,date_of_visit DATE,PRIMARY KEY(animal_id,vets_id,date_of_visit),FOREIGN KEY (animal_id) REFERENCES animals(id),FOREIGN KEY (vets_id) REFERENCES vets(id));

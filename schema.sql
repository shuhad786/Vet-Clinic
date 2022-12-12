/* Database schema to keep the structure of entire database. */
create database vet_clinic

create table animals
(
	Id integer primary key,
	Name varchar(50),
	Date_of_birth date,
	Escape_attempts integer,
	Neutered boolean,
	Weight_kg real
);

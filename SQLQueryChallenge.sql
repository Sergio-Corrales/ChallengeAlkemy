-- **************************  DATABASE  **************************
-- Create Database

CREATE DATABASE [Challenge]
USE [Challenge]
GO

--  >>>>>>>> TABLES <<<<<<<<

-- Table Person

IF OBJECT_ID('Person') IS NOT NULL
	BEGIN
		DROP TABLE [Person]
	END

CREATE TABLE [Person]( [Id_Person] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
						[Id] INT NOT NULL,
						[FirstName] VARCHAR(40) NOT NULL,
						[LastName] VARCHAR(40) NOT NULL,
						[Mail] VARCHAR(40) NOT NULL,
						[Phone] INT NOT NULL)
GO

-- Table Admin

IF OBJECT_ID('Admin') IS NOT NULL
	BEGIN
		DROP TABLE [Admin]
	END

CREATE TABLE [Admin]( [Id_Admin] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
					  [Id_Person] INT NOT NULL, 
					  [Id_User] INT NOT NULL)
GO

--Table Student

IF OBJECT_ID('Student') IS NOT NULL
	BEGIN
		DROP TABLE [Student]
	END

CREATE TABLE [Student]( [Id_Student] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
						[Id_User] INT NOT NULL,
						[Id_Person] INT NOT NULL,
						[File_Number] INT NOT NULL)
GO

-- Table Profesor

IF OBJECT_ID('Profesor') IS NOT NULL
	BEGIN
		DROP TABLE [Profesor]
	END

CREATE TABLE [Profesor]( [Id_Profesor] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
						 [Id_Person] INT NOT NULL,
						 [State] BIT NOT NULL)
GO

-- Table User

IF OBJECT_ID('User') IS NOT NULL
	BEGIN
		DROP TABLE [User]
	END

CREATE TABLE [User]( [Id_User] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
					 [User_Name] VARCHAR(50) NOT NULL,
					 [Pass] VARCHAR(50) NOT NULL)
GO

-- Table Subject

IF OBJECT_ID('Subject') IS NOT NULL
	BEGIN
		DROP TABLE [Subject]
	END

CREATE TABLE [Subject]( [Id_Subject] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
						[Name] VARCHAR(40) NOT NULL,
						[Description] VARCHAR (250) NOT NULL,
						[Capacity] INT NOT NULL,
						[Availability] INT NOT NULL,
						[TimeTable] VARCHAR(100) NOT NULL)
GO

-- Table Subject_Profesor

IF OBJECT_ID('Subject_Profesor') IS NOT NULL
	BEGIN
		DROP TABLE [Subject_Profesor]
	END

CREATE TABLE [Subject_Profesor]([Id_SubjProf] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
								[Id_Profesor] INT NOT NULL,
								[Id_Subject] INT NOT NULL)
GO

-- >>>>>>>> RELATIONS <<<<<<<<


--Relation Person, Admin, User

IF OBJECT_ID('Admin') IS NOT NULL
	BEGIN
		ALTER TABLE [Admin]
		ADD CONSTRAINT [Id_Person] FOREIGN KEY([Id_Person]) REFERENCES [Person],
		CONSTRAINT [Id_User] FOREIGN KEY([Id_User]) REFERENCES [User]
	END	
GO

-- Relation Person, Student, User

IF OBJECT_ID('Student') IS NOT NULL
	BEGIN
		ALTER TABLE [Student]
		ADD CONSTRAINT [Id_UserS] FOREIGN KEY(Id_User) REFERENCES [User],
		CONSTRAINT [Id_PersonS] FOREIGN KEY(Id_Person) REFERENCES [Person]		
	END
GO

--Relation Person Profesor

IF OBJECT_ID('Profesor') IS NOT NULL
	BEGIN
		ALTER TABLE[Profesor]
		ADD CONSTRAINT [Id_PersonP] FOREIGN KEY([Id_Person]) REFERENCES [Person]
	END
GO

--Relation Subject_Profesor, Subject, Profesor

IF OBJECT_ID('Subject_Profesor') IS NOT NULL
	BEGIN
		ALTER TABLE [Subject_Profesor]
		ADD CONSTRAINT [Id_Subject] FOREIGN KEY ([Id_Subject]) REFERENCES [Subject],
		CONSTRAINT [Id_Profesor] FOREIGN KEY ([Id_Profesor]) REFERENCES [Profesor]
	END
GO
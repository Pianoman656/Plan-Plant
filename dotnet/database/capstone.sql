USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE plants (
	plant_id int IDENTITY (1,1) NOT NULL,
	common_name varchar(50) NOT NULL,
	sqare_area int NOT NULL,
	cost decimal NOT NULL,
	sun_reqirements varchar(50) NOT NULL

	CONSTRAINT PK_plants PRIMARY KEY (plant_id)
);

CREATE TABLE zones (
	zone_id int IDENTITY (1,1) NOT NULL,
	zone_name varchar(10) NOT NULL
	
	CONSTRAINT PK_zones PRIMARY KEY (zone_id)
);

CREATE TABLE plant_zone (
	plant_zone_id int IDENTITY (1,1) NOT NULL,
	plant_id int,
	zone_id int,

	CONSTRAINT PK_plant_zone PRIMARY KEY (plant_zone_id),
	CONSTRAINT FK_plant_zone_plants FOREIGN KEY (plant_id) REFERENCES plants(plant_id),
	CONSTRAINT FK_plant_zone_zones FOREIGN KEY (zone_id) REFERENCES zones(zone_id)
);

CREATE TABLE farms (
	farm_id int IDENTITY (1,1)

	CONSTRAINT PK_farms PRIMARY KEY (farm_id)
)

CREATE TABLE plots (
	plot_id int IDENTITY (1,1) NOT NULL,
	farm_id int NOT NULL,
	plot_name varchar(50) NOT NULL,
	sun_status varchar(15) NOT NULL, 
	zone_id int NOT NULL,

	CONSTRAINT PK_plots PRIMARY KEY (plot_id),
	CONSTRAINT FK_plots_farms FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);

--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

GO
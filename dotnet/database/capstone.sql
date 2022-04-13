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
	description varchar(1000) NOT NULL,
	region varchar(100) NOT NULL,
	square_area int NOT NULL,
	cost decimal NOT NULL,
	sun_reqirements varchar(50) NOT NULL

	CONSTRAINT PK_plants PRIMARY KEY (plant_id)
);

CREATE TABLE supplies (
        supply_id int NOT NULL,
        supply_name varchar(100) NOT NULL,
        supply_cost decimal NOT NULL,
        CONSTRAINT PK_supplies PRIMARY KEY (supply_id)
);

INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('1', '2 cu ft. Bagged Brown Mulch', '4.50');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('2', '2 cu ft. Bagged Red Mulch', '4.50');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('3', '2 cu ft. Bagged Black Mulch', '4.50');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('4', '2 cu ft. Bagged Cypress Mulch Blend', '4.50');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('5', '2 cu ft. Bagged Pine Bark Nuggets', '4.50');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('6', '16-Tine Rake', '20.00');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('9', 'Hand Trowel', '9.00');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('10', 'Bypass Pruner', '10.75');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('11', '48 in. Round Point Shovel', '26.00');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('12', 'Firm Grip Grain Pigskin Gloves', '12.25');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('13', 'Rose Embroidered mid-length Gloves', '14.75');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('14', 'Plastic Wheelbarrow', '80.00');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('15', '4-tined basic green cultivator', '18.75');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('16', '4- tined green hand rake', '9.50');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('17', 'Watering can', '45.00');
INSERT INTO supplies (supply_id, supply_name, supply_cost) VALUES ('18', 'Tomato Cage', '20.00');


CREATE TABLE user_data(
        user_id int NOT NULL, 
		first_name varchar(100) NOT NULL,
		last_name varchar(100) NOT NULL,
        email varchar(100) NOT NULL,
        region varchar(100),
        city varchar(100),
        state varchar(100),
		zip varchar(20),
CONSTRAINT PK_user_data PRIMARY KEY (user_id)        

);

CREATE TABLE hardiness (
	zone_name varchar(10),
	avg_last_frost_month varchar(10),
	avg_last_frost_day int,
	avg_first_frost_month varchar(10),
	avg_first_frost_day int,
	avg_growing_days int,
        CONSTRAINT PK_zone_name PRIMARY KEY (zone_name)
);

INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('3', 'May', '15', 'September', '15', '123');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('4', 'May', '15', 'October', '1', '139');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('5', 'May', '1', 'October', '15', '168');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('6', 'Apr', '15', 'October', '15', '183');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('7', 'Apr', '1', 'October', '31', '213');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('8', 'March', '15', 'November', '15', '245');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('9', 'February', '15', 'November', '30', '290');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('10', 'January', '1', 'December', '31', '290');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('11', 'January', '1', 'December', '31', '290');


CREATE TABLE plant_hardiness (
    zone_name varchar(10),
	plant_id int,
        
        CONSTRAINT PK_plant_hardiness PRIMARY KEY (zone_name, plant_id)
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
	plant_id int,
	zone_id int NOT NULL,

	CONSTRAINT PK_plots PRIMARY KEY (plot_id),
	CONSTRAINT FK_plots_farms FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);

--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

GO
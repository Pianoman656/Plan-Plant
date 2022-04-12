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


INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Marigold-Flamenco French', '2', '3.00', 'Sun');  1,2,3,4,5,6,7,8,9,10  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc07f264c/images/products/Flamenco-Marigold.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Marjoram-Sweet', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw462c247f/images/products/Marjoram_Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Melon-Charentais Cantaloupe', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9a1d78a0/images/products/Charentais_Melon_Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Melon-Honeydew', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw281ff64a/images/products/Organic-Honey-Dew-Stutz-Supreme-01.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Mint-Peppermint', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwcba439e9/images/products/Peppermint-Seed-1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Mint-Spearmint', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw17478414/images/products/Spearmint-Seed-1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Okra-Jambalaya', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb607042e/images/products/Jambalaya-Okra-Seeds1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Onion-Sweet Oversize', '4', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc5396c62/images/products/IMG_6250_R1009-1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Onion-Red Creole', '4', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc356ba9f/images/products/Red-Creole-Onion-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Onion-Texas Early Grano White', '4', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe9cf8ec5/images/products/Texas-Early-Grano-502-Onion-Seeds.gif?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Oregano-Greek', '1', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw329285b9/images/products/Greek-Oregano.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Parsley-Italian Plain Leaf', '1', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwd34c52e1/images/products/Italian-Flat-Leaf-Parsley-1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Parsley-Triple Curled', '1', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc397ece5/images/products/Triple_Curled_Parsley_Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Pea-Super Sugar', '1', '3.00', 'Part-shade');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb9777517/images/products/Super-Sugar-Pea-Seeds1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Pea-Early Frosty', '1', '3.00', 'Part-shade');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw4227ba80/images/products/Early-Frosty-Pea-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Pepper-Early Jalepeno', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw2d7898f4/images/products/Early-Jalapeno-Pepper-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Pepper-Sunbright Bell', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw82ecc291/images/products/Sunbright-Pepper-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Pepper-Tabasco', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw66aea735/images/products/Tobasco-Pepper-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Potato-Georgia Jets Sweet Potato', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw1f964ff9/images/products/Georgia-Jets-Sweet-Potato-Slips.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Potato-Red Pontiac', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwdaff5c36/images/products/Red-Pontiac-Seed-Potato-Cut1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Potato-Russet Burbank', '1', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw8523ba68/images/products/Russett-Seed-Potato-Cut1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Potato-Yukon Gold', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwac8b84ee/images/products/Yukon-Gold-Seed-Potato-Cut1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Pumpkin-Halloween', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc228b76d/images/products/Halloween1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Pumpkin-Fairytale', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw0922825b/images/products/Fairy-Tale-Pumpkin.png?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Pumpkin-Small Sugar', '1.5', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb9c0bb96/images/products/Small_Sugar.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Radish-Crunchy King', '1', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw3cc0e706/images/products/Country-King-Radish.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Raspberry-Latham Red', '5', '3.00', 'Sun');  4,5,6,7,8  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw2fa6cd14/images/products/Latham-Raspberry-Plant.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Rhubarb-Victoria', '3', '3.00', 'Sun');  4,5,6,7,8  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw3c1f6ff4/images/products/Victoria-Rhubarb-Seed.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Rosemary-Common', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw98638701/images/products/Rosemary-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Sage-Broadleaf', '2', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw6b749d29/images/products/Sage-Seed.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Sage-White', '2', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw86dc96ab/images/products/White-Sage-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Spinach-Bloomsdale', '2', '3.00', 'Part-shade');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb137cedb/images/products/Bloomsdale.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Spinach-Seaside Baby', '2', '3.00', 'Part-Shade');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc09ee736/images/products/Seaside%20Spinach%20Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Sprouts-True Watercress', '1', '3.00', 'Shade');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe54735cc/images/products/True_Cress_Seed.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Sprouts-Rainbow Quinoa', '1', '3.00', 'Shade');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwf6dd2777/images/products/Quinoa-Rainbow-Green-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Squash-Dark Green Zucchini', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw24616637/images/products/Dark-Green-Zucchini.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Squash-Golden', '4', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwed809d32/images/products/Golden-Zucchini-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Squash-Vegetable Spaghetti', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe1d27859/images/products/Vegetable-Spaghetti-Squash.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Strawberry-Giant', '2', '3.00', 'Sun');  4,5,6,7,8  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw04f207d1/images/products/Giant-Strawberry-Seeds-3.jpg?sw=450&sh=450 
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Swiss Chard-Rainbow Blend', '1.5', '3.00', 'Part-shade');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwf3718fe4/images/products/Organic-rainbow-blend-chard.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Tarragon-French', '2', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw67dda26a/images/products/Tarragon.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Tarragon-Mexican', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9f508952/images/products/Mexican-Tarragon.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Thyme-English', '1', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwed0590e1/images/products/English-Thyme-Seed.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Thyme-French', '1', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw34bcda9a/images/products/French-Thyme-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Thyme-Creeping', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwfea8f4b9/images/products/Creeping-Thyme-Seed.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Tomato-Cherokee Purple', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw8bb7d914/images/products/Tomato_Cherokee-Purple.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Tomato-Kelloggs Breakfast', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw4ed05ba0/images/products/Kelloggs_Beefsteak_Tomatoes1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Tomato-Baby Roma', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe920805e/images/products/Organic-Baby-Roma-Tomato-Seeds.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Tomato-Big Beef', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwfd7f2eb6/images/products/Big-Beef-Tomato-1.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Turnip-Purple Top', '4', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9f5f32f2/images/products/Purple-Top-White-Globe-Turnips.jpg?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Watermelon-Harvest Moon Seedless', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw3662acd4/images/products/Harvest-Moon-Watermelon.png?sw=450&sh=450
INSERT INTO plants (plant_id, common_name, square_area, cost, sun_requirements) VALUES ('Watermelon-All Sweet', '3', '3.00', 'Sun');  3,4,5,6,7,8,9  https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw31116792/images/products/All_Sweet_Watermelon_Seeds.jpg?sw=450&sh=450

GO
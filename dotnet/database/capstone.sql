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
	--email address, region
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE plants (
	plant_id int IDENTITY (1,1) NOT NULL,
	common_name varchar(50) NOT NULL,
<<<<<<< HEAD
	description varchar(1000) NOT NULL,
	region varchar(100) NOT NULL,
=======
	description varchar(1000),
>>>>>>> 37ed926d1343e5ae1617645113cadb25da95705d
	square_area int NOT NULL,
	cost decimal NOT NULL,
	sun_requirements varchar(50) NOT NULL,
	image_url varchar(500),
	temporary_usda_zones varchar(50) -- using as placeholder until we decide how to define "region/zone/etc"

	CONSTRAINT PK_plants PRIMARY KEY (plant_id)
);

<<<<<<< HEAD
CREATE TABLE supplies (
        supply_id int NOT NULL,
        supply_name varchar(100) NOT NULL,
        supply_cost decimal NOT NULL,
        CONSTRAINT PK_supplies PRIMARY KEY (supply_id)
=======
CREATE TABLE zones ( --still unsure about this
	zone_id int IDENTITY (1,1) NOT NULL,
	zone_name varchar(10) NOT NULL
	
	CONSTRAINT PK_zones PRIMARY KEY (zone_id)
>>>>>>> 37ed926d1343e5ae1617645113cadb25da95705d
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
	farm_id int IDENTITY (1,1),
	user_id int,

	CONSTRAINT PK_farms PRIMARY KEY (farm_id),
	CONSTRAINT FK_farms_users FOREIGN KEY (user_id) REFERENCES users(user_id)
)

CREATE TABLE plots (
	plot_id int IDENTITY (1,1) NOT NULL,
	farm_id int NOT NULL,
	plot_name varchar(50) NOT NULL,
<<<<<<< HEAD
	sun_status varchar(15) NOT NULL,
	plant_id int,
=======
	plot_square_footage decimal NOT NULL,
	sun_status varchar(15) NOT NULL, 
>>>>>>> 37ed926d1343e5ae1617645113cadb25da95705d
	zone_id int NOT NULL,

	CONSTRAINT PK_plots PRIMARY KEY (plot_id),
	CONSTRAINT FK_plots_farms FOREIGN KEY (farm_id) REFERENCES farms(farm_id),
	CONSTRAINT FK_plots_zones FOREIGN KEY (zone_id) REFERENCES zones(zone_id)
);

CREATE TABLE shopping_list (
	list_id int IDENTITY (1,1) NOT NULL,
	farm_id int NOT NULL,
	--numbers of various amendments?
)

--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

INSERT INTO plants (common_name, square_area, cost, sun_requirements, image_url, temporary_usda_zones) VALUES
('Anise', 1, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe4f23339/images/products/Pimpinella-anisum_flower.jpg?sw=450&sh=450','3,4,5,6,7,8,9'), 
('Artichoke-Green Globe', 4, 3.00,'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb8c5d6cf/images/products/Artichoke_Seed1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Artichoke-Violet', 4, 3.00, 'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb05414b4/images/products/Violet-Artichoke-Seed.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),  
('Artichoke-Jerusalem', 1, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw6f108f88/images/products/Jerusalem-Artichokes.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Asparagus-Purple Passion', 1.5, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw12f89fa1/images/products/Purple-Passion-Asparagus.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Asparagus-Jersey Knight', 1.5, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw5a261816/images/products/Jersey_Knight_Asparagus.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Basil-Dark Opal', 1, 3.00, 'part-shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw3e9f4569/images/products/Purple_Basil_Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Basil-Holy', 1, 3.00, 'part-shade', 'https://cdn.shopify.com/s/files/1/0614/3796/8618/products/1639414251_basil-holy-green-leaf-com-wm_1512x.jpg?v=1639680009', '3,4,5,6,7,8,9'),
('Basil-Thai', 1, 3.00, 'part-shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw7f4fad2d/images/products/Thai-Basil.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Bee Balm', 1.5, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc3288551/images/products/Wild-Bergamot.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Borage', 1, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwf867b1c0/images/products/Borage-Seed.jpg?sw=450&sh=450','3,4,5,6,7,8,9'),
('Caraway', .5, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw94c7107a/images/products/Caraway.jpg?sw=450&sh=450','3,4,5,6,7,8,9'),
('Catnip', 1.5, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwec269b71/images/products/Catnip.jpg?sw=450&sh=450','3,4,5,6,7,8,9'),
('Chamomile', .5, 3.00, 'part-shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw6a64af2e/images/products/Chamomile.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Chervil', .5, 3.00, 'part-shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwcc92e7ec/images/products/Chervil_Plain_Leaf.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Chive', .5, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwf76c40e9/images/products/Organic-Standard-Chives.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Cilantro', .5, 3.00,'part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw1d47d756/images/products/Organic-Common-Cilantro.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Comfrey', 9, 3.00, 'part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwea4cf4c3/images/products/Comfrey%20Seeds.png?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Cumin', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw6e34aa26/images/products/Cumin-Seed.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Dill', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb76be47f/images/products/Dill-Mammoth.jpg?sw=275&sh=275','3,4,5,6,7,8,9'),
('Hyssop', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9179f6d7/images/products/Hyssop.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Lavender', 4, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw0ab9b37a/images/products/Lavandula_angustifolia.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Lemon Balm', 1.5, 3.00,'part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb087dcd5/images/products/Lemon-Balm-Seeds.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Lemon Grass', 9, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw1c950563/images/products/Lemon_Grass.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Lovage', 1, 3.00,'part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwbb806bce/images/products/Lovage.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Bean-Bush', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb4ef3204/images/products/Blue-Lake-Bush-Beans.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Bean-Fava', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw6e52a8cc/images/products/Fava-Windsor-Bean-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Bean-Pole', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw06b2ea19/images/products/White-Yard-Long-Beans.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Bean-Soy', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw4ac230f4/images/products/Kentucky_Wonder_Beans.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Beet', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw3aaffe36/images/products/Lutz-Green-Leaf-White-Stem-Beet.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Broccoli', 1.5, 3.00,'part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwa55d033a/images/products/Waltham_Broccoli1.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Broccoli-purple', 1.5, 3.00,'part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw54ec6d2b/images/products/Early-Purple-Sprouting-Broccoli-Seeds1.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Brussel Sprouts', 4, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwaadf80b1/images/products/Brussel_Sprouts.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Burdock', 2, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw87ee5741/images/products/Burdock-Seed1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Cabbage', 1.5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw7e53b00d/images/products/Stonehead-Cabbage-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Carrot', .5, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw07369b9a/images/products/Imperator-58-Carrot-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Cauliflower', 1.5, 3.00,'part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw6f188640/images/products/Amazing-Cauliflower1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Celeriac', 1.5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9d99f320/images/products/Brilliant-Celeriac-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Celery', 1.5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwf976c0ac/images/products/Tall-Utah.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Chard', 1, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9784b995/images/products/Gold-Stem-Swiss-Chard-Seeds.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Chicory', 1, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb8cd5f63/images/products/Chicory.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Chinese Cabbage', 1.5, 3.00,'part shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw6e6ea8a0/images/products/China-Coast-Cabbage.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Collards', 1.5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw2cbda6c7/images/products/Georgia_Southern_Collards.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Corn', 1, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9012b2b7/images/products/Cadence-Corn-Seed.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Cucumber', 5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw33249ca7/images/products/Marketmore-76-Cucumber-Seed1.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Eggplant', 1.5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe1cc3e3f/images/products/Black-Beauty-Eggplant-Seeds.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Fennel', 1, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw0fb7f8da/images/products/Antares%20Fennel%20Seed.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Garlic', .5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc8cc82a0/images/products/Spanish-Roja-Garlic-Cloves.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Gourd', 10, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwbe190b3b/images/products/Ten-Commandments-gourd-.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Green', .5, 3.00,'part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw2ddc15d5/images/products/Old_Fashioned_Mustard.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Horseradish', 1, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw35079133/images/products/Czechoslovokian-Horseradish.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Husk Cherry', 1.5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw42c914b8/images/products/Ground-Cherry-Tomato-Seeds.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Kale', 1, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwdfe6d2ca/images/products/Scarlet-Kale.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Kohlrabi', 1.5, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw33a8b6f3/images/products/Kohlrabi_White_Vienna.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Leeks', 1, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw0852c26e/images/products/King-Richard-Leek.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Lettuce', 1, 3.00,'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw238fcaae/images/products/Garden-Lettuce-Mix-Seeds.jpg?sw=275&sh=275', '3,4,5,6,7,8,9'),
('Marigold-Flamenco French', 2, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc07f264c/images/products/Flamenco-Marigold.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),  
('Marjoram-Sweet', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw462c247f/images/products/Marjoram_Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Melon-Charentais Cantaloupe', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9a1d78a0/images/products/Charentais_Melon_Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Melon-Honeydew', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw281ff64a/images/products/Organic-Honey-Dew-Stutz-Supreme-01.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Mint-Peppermint', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwcba439e9/images/products/Peppermint-Seed-1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Mint-Spearmint', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw17478414/images/products/Spearmint-Seed-1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Okra-Jambalaya', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb607042e/images/products/Jambalaya-Okra-Seeds1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'), 
('Onion-Sweet Oversize', 4, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc5396c62/images/products/IMG_6250_R1009-1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Onion-Red Creole', 4, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc356ba9f/images/products/Red-Creole-Onion-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Onion-Texas Early Grano White', 4, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe9cf8ec5/images/products/Texas-Early-Grano-502-Onion-Seeds.gif?sw=450&sh=450', '3,4,5,6,7,8,9'), 
('Oregano-Greek', 1, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw329285b9/images/products/Greek-Oregano.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Parsley-Italian Plain Leaf', 1, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwd34c52e1/images/products/Italian-Flat-Leaf-Parsley-1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Parsley-Triple Curled', 1, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc397ece5/images/products/Triple_Curled_Parsley_Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Pea-Super Sugar', 1, 3.00, 'Part-shade','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb9777517/images/products/Super-Sugar-Pea-Seeds1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Pea-Early Frosty', 1, 3.00, 'Part-shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw4227ba80/images/products/Early-Frosty-Pea-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Pepper-Early Jalepeno', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw2d7898f4/images/products/Early-Jalapeno-Pepper-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Pepper-Sunbright Bell', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw82ecc291/images/products/Sunbright-Pepper-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Pepper-Tabasco', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw66aea735/images/products/Tobasco-Pepper-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Potato-Georgia Jets Sweet Potato', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw1f964ff9/images/products/Georgia-Jets-Sweet-Potato-Slips.jpg?sw=450&sh=450', '3,4,5,6,7,8,9') ,
('Potato-Red Pontiac', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwdaff5c36/images/products/Red-Pontiac-Seed-Potato-Cut1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Potato-Russet Burbank', 1, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw8523ba68/images/products/Russett-Seed-Potato-Cut1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Potato-Yukon Gold', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwac8b84ee/images/products/Yukon-Gold-Seed-Potato-Cut1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Pumpkin-Halloween', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc228b76d/images/products/Halloween1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Pumpkin-Fairytale', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw0922825b/images/products/Fairy-Tale-Pumpkin.png?sw=450&sh=450', '3,4,5,6,7,8,9'), 
('Pumpkin-Small Sugar', 1.5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb9c0bb96/images/products/Small_Sugar.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Radish-Crunchy King', 1, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw3cc0e706/images/products/Country-King-Radish.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Raspberry-Latham Red', 5, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw2fa6cd14/images/products/Latham-Raspberry-Plant.jpg?sw=450&sh=450', '4,5,6,7,8'),
('Rhubarb-Victoria', 3, 3.00, 'Sun', ' https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw3c1f6ff4/images/products/Victoria-Rhubarb-Seed.jpg?sw=450&sh=450', '4,5,6,7,8'),  
('Rosemary-Common', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw98638701/images/products/Rosemary-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Sage-Broadleaf', 2, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw6b749d29/images/products/Sage-Seed.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Sage-White', 2, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw86dc96ab/images/products/White-Sage-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Spinach-Bloomsdale', 2, 3.00, 'Part-shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb137cedb/images/products/Bloomsdale.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Spinach-Seaside Baby', 2, 3.00, 'Part-Shade', ' https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwc09ee736/images/products/Seaside%20Spinach%20Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'), 
('Sprouts-True Watercress', 1, 3.00, 'Shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe54735cc/images/products/True_Cress_Seed.jpg?sw=450&sh=450','3,4,5,6,7,8,9'),  
('Sprouts-Rainbow Quinoa', 1, 3.00, 'Shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwf6dd2777/images/products/Quinoa-Rainbow-Green-Seeds.jpg?sw=450&sh=450','3,4,5,6,7,8,9'),    
('Squash-Dark Green Zucchini', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw24616637/images/products/Dark-Green-Zucchini.jpg?sw=450&sh=450','3,4,5,6,7,8,9'),
('Squash-Golden', 4, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwed809d32/images/products/Golden-Zucchini-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Squash-Vegetable Spaghetti', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe1d27859/images/products/Vegetable-Spaghetti-Squash.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Strawberry-Giant', 2, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw04f207d1/images/products/Giant-Strawberry-Seeds-3.jpg?sw=450&sh=450', '4,5,6,7,8'),
('Swiss Chard-Rainbow Blend', 1.5, 3.00, 'Part-shade', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwf3718fe4/images/products/Organic-rainbow-blend-chard.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Tarragon-French', 2, 3.00, 'Sun', ' https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw67dda26a/images/products/Tarragon.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'), 
('Tarragon-Mexican', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9f508952/images/products/Mexican-Tarragon.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Thyme-English', 1, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwed0590e1/images/products/English-Thyme-Seed.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Thyme-French', 1, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw34bcda9a/images/products/French-Thyme-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Thyme-Creeping', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwfea8f4b9/images/products/Creeping-Thyme-Seed.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Tomato-Cherokee Purple', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw8bb7d914/images/products/Tomato_Cherokee-Purple.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'), 
('Tomato-Kelloggs Breakfast', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw4ed05ba0/images/products/Kelloggs_Beefsteak_Tomatoes1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'), 
('Tomato-Baby Roma', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe920805e/images/products/Organic-Baby-Roma-Tomato-Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),  
('Tomato-Big Beef', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwfd7f2eb6/images/products/Big-Beef-Tomato-1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Turnip-Purple Top', 4, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw9f5f32f2/images/products/Purple-Top-White-Globe-Turnips.jpg?sw=450&sh=450','3,4,5,6,7,8,9'), 
('Watermelon-Harvest Moon Seedless', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw3662acd4/images/products/Harvest-Moon-Watermelon.png?sw=450&sh=450','3,4,5,6,7,8,9'),
('Watermelon-All Sweet', 3, 3.00, 'Sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dw31116792/images/products/All_Sweet_Watermelon_Seeds.jpg?sw=450&sh=450', '3,4,5,6,7,8,9');    

GO


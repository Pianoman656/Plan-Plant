BEGIN TRANSACTION;

--Create tables here
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL,
	zip varchar(20) NOT NULL,
	first_name varchar(100),
	last_name varchar(100),
    email varchar(100),
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE farms (
	farm_id int IDENTITY (1,1) NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT PK_farms PRIMARY KEY (farm_id),
	CONSTRAINT FK_farms_users FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE plots (
	plot_id int IDENTITY (1,1) NOT NULL,
	farm_id int NOT NULL,
	plot_name varchar(50) NOT NULL,
	sun_status varchar(15) NOT NULL,
	plot_square_footage decimal NOT NULL,
	zone_id int NOT NULL,

	CONSTRAINT PK_plots PRIMARY KEY (plot_id),
	CONSTRAINT FK_plots_farms FOREIGN KEY (farm_id) REFERENCES farms(farm_id),
	CONSTRAINT FK_plots_zones FOREIGN KEY (zone_id) REFERENCES hardiness
);

CREATE TABLE plants (
	plant_id int IDENTITY (1,1) NOT NULL,
	common_name varchar(50) NOT NULL,
	description varchar(1000),
	square_area decimal NOT NULL,
	cost decimal NOT NULL,
	sun_requirements varchar(50) NOT NULL,
	image_url varchar(500),
	temporary_usda_zones varchar(30)

	CONSTRAINT PK_plants PRIMARY KEY (plant_id)
);

CREATE TABLE hardiness (
	zone_id int IDENTITY (1,1),
	zone_name varchar(10),
	avg_last_frost_month varchar(10),
	avg_last_frost_day int,
	avg_first_frost_month varchar(10),
	avg_first_frost_day int,
	avg_growing_days int,
    CONSTRAINT PK_hardiness PRIMARY KEY (zone_id)
);

CREATE TABLE plots_plants (
	plots_plants_id int IDENTITY (1,1),
	plot_id int,
	plant_id int

	CONSTRAINT PK_plots_plants_id PRIMARY KEY (plots_plants_id)
	CONSTRAINT FK_plots_plants_plots FOREIGN KEY (plot_id) REFERENCES plots(plot_id),
	CONSTRAINT FK_plots_plants_plants FOREIGN KEY (plant_id) REFERENCES plants(plant_id)
);

CREATE TABLE supplies (
        supply_id int NOT NULL,
		description varchar(1000),
		image_url varchar(500),
        supply_name varchar(100) NOT NULL,
        supply_cost decimal NOT NULL,
        CONSTRAINT PK_supplies PRIMARY KEY (supply_id),
		--CONSTRAINT FK_supplies_farms FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);

CREATE TABLE supplies_farms(
	supply_id int,
	farm_id int,
	CONSTRAINT PK_supplies_farms PRIMARY KEY (supply_id, farm_id),
	CONSTRAINT FK_supplies_farms_supplies FOREIGN KEY (supply_id) REFERENCES supplies(supply_id),
	CONSTRAINT FK_supplies_farms_farms FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);

BEGIN TRANSACTION;
--CREAT TABLE etc to mirror your Capstone DB

--Example, from DAO Testing Day
--CREATE TABLE department (
--	department_id 	INT NOT NULL IDENTITY (1,1),
--	name 			VARCHAR(40) UNIQUE NOT NULL,
--	CONSTRAINT pk_department PRIMARY KEY (department_id)
--);

--Seed any data needed here
--INSERT INTO department (name)
--VALUES ('Department 1'); -- department_id will be 1
-- Need employees so we can add timesheets

INSERT INTO farm (user_id)
VALUES (1), (2), (4);

INSERT INTO plants (common_name, description, square_area, cost, sun_requirements, image_url, temporary_usda_zones) VALUES
('Anise', 'Anise is an annual/biennial herb that produces little, dainty white flowers and seed that has a refreshing licorice flavor. The small 1.5-2 feet tall plants have feather like green leaflets that are great for making aromatic tea. Anise seed produced from the plants can be used whole or ground in doughs or fillings of baked goods or brewed to make a delicate licorice-flavored tea', 1, 3.00, 'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwe4f23339/images/products/Pimpinella-anisum_flower.jpg?sw=450&sh=450','3,4,5,6,7,8,9'), 
('Artichoke-Green Globe', 'The Green Globe is America''s most popular artichoke! Large flower buds, harvest when plump, ornamental with bold blue 6" flowers. Artichokes are a very tender plant. With thick, fleshy scales and solid center, the flower heads should be harvested when they''re young. Native to the Mediterranean, globe artichokes have been grown in the US since Colonial times. Provided with a protective cover, the artichokes will successfully overwinter in colder areas.', 4, 3.00,'sun', 'https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb8c5d6cf/images/products/Artichoke_Seed1.jpg?sw=450&sh=450', '3,4,5,6,7,8,9'),
('Artichoke-Violet', 'Violet is a French heirloom with fine flavor! Beautiful purple buds that are lovely on the big, ornamental plants, especially when the buds open. Rare outside Europe.', 4, 3.00, 'sun','https://www.ufseeds.com/dw/image/v2/BFKV_PRD/on/demandware.static/-/Sites-master-urbanfarmer/default/dwb05414b4/images/products/Violet-Artichoke-Seed.jpg?sw=450&sh=450', '3,4,5,6,7,8,9');

INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('3', 'May', '15', 'September', '15', '123');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('4', 'May', '15', 'October', '1', '139');
INSERT INTO hardiness (zone_name, avg_last_frost_month, avg_last_frost_day, avg_first_frost_month, avg_first_frost_day, avg_growing_days) VALUES ('5', 'May', '1', 'October', '15', '168');

INSERT INTO supplies (supply_id, description, image_url, supply_name, supply_cost) VALUES ('1', 'This premium wood mulch will protect and enhance your landscape with a natural, finished look. By creating a protective barrier around your plants and over soil. Natural wood composition controls weed growth, has excellent moisture retention properties and keeps a more even ground temperature to protect tender plants and roots.', 'https://www.ruralking.com/media/catalog/product/5/8/58aa61ed9ff0f3f9adf298ebcb639977f69dc794_80190105.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=560&width=700&canvas=700:560', 'Brown Colored Mulch, 2 Cubic Feet', '2.49');
INSERT INTO supplies (supply_id, description, image_url, supply_name, supply_cost) VALUES ('2', 'Red Colored Mulch is a recycled product made from scrap pallets and virgin wood which is chip-ground into strips about ½" by 2-3 inches long and colored red. It does lose its color after about 2 years but a fresh annual cover keeps it looking red and vibrant.', 'https://www.ruralking.com/media/catalog/product/2/6/2603c6d24cef2ee51b111a6ce675119fa4dc3c34_80190095.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=560&width=700&canvas=700:560', 'Red Colored Mulch, 2 Cubic Feet', '2.49');
INSERT INTO supplies (supply_id, description, image_url, supply_name, supply_cost) VALUES ('3', 'Black mulch is dyed with carbon. Natural wood composition controls weed growth, has excellent moisture retention properties and keeps a more even ground temperature to protect tender plants and roots.', 'https://www.ruralking.com/media/catalog/product/e/3/e3f6719f9690fec61d89f5cf347179e17d55f17f_80190107.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=560&width=700&canvas=700:560', 'Black Colored Mulch, 2 Cubic Feet', '2.49');





COMMIT TRANSACTION;

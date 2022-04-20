--Farm Id can be accessed using tokin, subquery, and supply_name or supply_id can be passed from the user

INSERT INTO plots (farm_id,plot_name,sun_exposure,plot_square_footage,zone_id) VALUES
(1, 'First Plot', 'sun', 500, 6),
(1, 'Second Plot', 'sun', 500, 6),
(1, 'Third Plot', 'part-shade', 500, 6),
(1, 'Fourth Plot', 'part-shade', 500, 6),
(1, 'Fifth Plot', 'shade', 500, 6)

INSERT INTO plots_plants (plot_id, plant_id) VALUES
((SELECT plot_id FROM plots WHERE plot_name LIKE 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Bean-Bush')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Beet')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Broccoli')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Lemon Balm')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'Second Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Dill')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'Third Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Cumin')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'Fourth Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Comfrey')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'Fifth Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Carrot')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'Fifth Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Cabbage')),
((SELECT plot_id FROM plots WHERE plot_name LIKE 'Fifth Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Corn'))


--SEMANTICS

--the plots_plants_id references a specific plant in a specific plot
--plants in the plots_plants table can be refered to as "planted plants" or "plants in the ground"
--plots that exist in the plots_plants table can be referred to as "populated plots"

--farms in the supplies_farms_plants table can be referred to as "the farm that the shopping list belongs to"
--supplies in the supplies_farms_plants table can be refferd to as "supplies in shopping list"
--plants in the supplies_farms_plants table can be reffered to as "plants in shopping list"

--RESTRICTIONS 
--plants can ONLY be added to the plots if the "populated plot" has room (ie square area of plant is less than or equal to remaining area in plot)
--plants avaliable to become "planted plants" should only be shown to user when plot plant sun_requirements

INSERT INTO plots_plants (plot_id, plant_id) VALUES
((SELECT plot_id FROM plots WHERE plot_name = 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Corn'))


SELECT * FROM users
SELECT * FROM plots
SELECT * FROM farms
SELECT * FROM supplies_farms_plants --shopping list
SELECT * FROM plots_plants --planted plants 
SELECT * FROM supplies
SELECT * FROM users 
SELECT * FROM plants

SELECT * FROM plants p 
JOIN plots_plants pp 
ON pp.plant_id = p.plant_id 
JOIN plots pl 
ON pl.plot_id = pp.plot_id 
JOIN farms f
ON f.farm_id = pl.farm_id
JOIN users u
ON f.farm_id = u.user_id
JOIN hardiness h
ON h.zone_id = pl.zone_id
WHERE u.user_id = 1 -- this will give you ALL plants on user 1's farm(s).
ORDER BY pl.plot_id;



SELECT * FROM farms f
JOIN supplies_farms_plants sfp
ON f.farm_id = sfp.farm_id
JOIN supplies s
ON sfp.supply_id = s.supply_id
WHERE f.user_id = 3; -- this will give you ALL tools on user 1's farm



--for finding list of ALL farms' plants, their respective plots, and usernames
SELECT p.common_name, pl.plot_name, pl.plot_id, u.username, p.plant_id
FROM plants p
JOIN plots_plants pp 
ON pp.plant_id = p.plant_id 
JOIN plots pl 
ON pl.plot_id = pp.plot_id 
JOIN farms f
ON f.farm_id = pl.farm_id
JOIN users u
ON f.farm_id = u.user_id
JOIN hardiness h
ON h.zone_id = pl.zone_id
ORDER BY pl.plot_id;


UPDATE users
SET first_name = 'Joe', last_name = 'Hille', email = 'email'
WHERE username = user;

INSERT INTO supplies_farms_plants (supply_id, farm_id, plant_id) VALUES
(1,1,10),(20,1,20),(20,1,30),(6,1,40),(8,1,50),(8,1,60),(13,1,70),
(20,2,80),(50,2,21),(20,2,23);

SELECT u.username, s.supply_id, s.description, s.image_url, s.supply_name, s.supply_cost, p.common_name
FROM users u 
JOIN farms f 
ON u.user_id = f.farm_id 
JOIN supplies_farms_plants sfp 
ON sfp.farm_id = f.farm_id 
JOIN supplies s 
ON s.supply_id = sfp.supply_id 
JOIN plants p
ON sfp.plant_id = p.plant_id
WHERE u.user_id = 1;

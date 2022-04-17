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


--REMOVE PLANTS FROM PLOTS
--DELETE FROM plots_plants ???
--WHERE plots_plants_id = @plots_plants_id ???? plots_plants_id will identify ONE and only one plant in a plot.
--Question is = how to easily access plots_plants_id for identification.

--SEMANTICS
--plants in the plots_plants table can be refered to as "planted plants" or "plants in the ground"
--plots that exist in the plots_plants table can be referred to as "populated plots"
--farms in the supplies_farms table can be referred to as "farms with supplies"
--supplies in the supplies_farms table can be refferd to as "supplies on farms"

--RESTRICTIONS 
--plants can ONLY be added to the plots if the "populated plot" has room (ie square area of plant is less than or equal to remaining area in plot)
--plants avaliable to become "planted plants" should only be shown to user when plot plant sun_requirements

INSERT INTO plots_plants (plot_id, plant_id) VALUES
((SELECT plot_id FROM plots WHERE plot_name = 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Corn'))


SELECT * FROM users
SELECT * FROM plots
SELECT * FROM farms
SELECT * FROM supplies_farms
SELECT * FROM plots_plants
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
JOIN supplies_farms sf
ON f.farm_id = sf.farm_id
JOIN supplies s
ON sf.supply_id = s.supply_id
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

INSERT INTO supplies_farms (supply_id, farm_id) VALUES
(1,1),(20,1),(20,1),(6,1),(8,1),(8,1),(13,1),
(20,2),(50,2),(20,2);

SELECT u.username, s.supply_id, s.description, s.image_url, s.supply_name, s.supply_cost 
FROM users u 
JOIN farms f 
ON u.user_id = f.farm_id 
JOIN supplies_farms sf 
ON sf.farm_id = f.farm_id 
JOIN supplies s 
ON s.supply_id = sf.supply_id 
WHERE u.user_id = 1;



DELETE FROM supplies_farms
WHERE supplies_farms_id = 4;
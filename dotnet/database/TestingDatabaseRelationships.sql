--Farm Id can be accessed using tokin, subquery, and supply_name or supply_id can be passed from the user

INSERT INTO plots (farm_id,plot_name,sun_status,plot_square_footage,zone_id) VALUES
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

--
-- I believe this should be done using plot and plant ID subqueries from their respective tables instead of common names.
-- Using plot_name creates problems if someone names two plots with the same name.
--


INSERT INTO plots_plants (plot_id, plant_id) VALUES
((SELECT plot_id FROM plots WHERE plot_name = 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Corn'))


SELECT * FROM users
SELECT * FROM plots
SELECT * FROM farms
SELECT * FROM supplies_farms
SELECT * FROM plots_plants


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
WHERE f.user_id = 1 -- this will give you ALL tools on user 1's farm



--for finding list of ALL farms' plants, their respective plots, and usernames
SELECT p.common_name, pl.plot_name, u.username
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
WHERE username = user







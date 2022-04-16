--
--user_id = 1, farm_id = 1
INSERT INTO farms (user_id) VALUES
((SELECT user_id FROM users WHERE username = 'user'))

INSERT INTO supplies_farms (farm_id, supply_id) VALUES
(1, (SELECT supply_id FROM supplies WHERE supply_name = '2 cu ft. Bagged Brown Mulch')),
(1, (SELECT supply_id FROM supplies WHERE supply_name = '16-Tine Rake')),
(1, (SELECT supply_id FROM supplies WHERE supply_name = '48 in. Round Point Shovel')),
(1, (SELECT supply_id FROM supplies WHERE supply_name = '4- tined green hand rake')),
(1, (SELECT supply_id FROM supplies WHERE supply_name = 'Watering can')),
(1, (SELECT supply_id FROM supplies WHERE supply_name = '2 cu ft. Bagged Pine Bark Nuggets'))

INSERT INTO plots (farm_id,plot_name,sun_status,plot_square_footage,zone_id) VALUES
(1, 'First Plot', 'sun', 500, 6),
(1, 'Second Plot', 'sun', 500, 6),
(1, 'Third Plot', 'part-shade', 500, 6),
(1, 'Fourth Plot', 'part-shade', 500, 6),
(1, 'Fifth Plot', 'shade', 500, 6)

INSERT INTO plots_plants (plot_id, plant_id) VALUES
((SELECT plot_id FROM plots WHERE plot_name = 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Bean-Bush')),
((SELECT plot_id FROM plots WHERE plot_name = 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Beet')),
((SELECT plot_id FROM plots WHERE plot_name = 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Broccoli')),
((SELECT plot_id FROM plots WHERE plot_name = 'First Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Lemon Balm')),
((SELECT plot_id FROM plots WHERE plot_name = 'Second Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Dill')),
((SELECT plot_id FROM plots WHERE plot_name = 'Third Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Cumin')),
((SELECT plot_id FROM plots WHERE plot_name = 'Fourth Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Comfrey')),
((SELECT plot_id FROM plots WHERE plot_name = 'Fifth Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Carrot')),
((SELECT plot_id FROM plots WHERE plot_name = 'Fifth Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Cabbage')),
((SELECT plot_id FROM plots WHERE plot_name = 'Fifth Plot'), (SELECT plant_id FROM plants WHERE common_name LIKE 'Corn'))

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
ORDER BY pl.plot_id;


SELECT * FROM farms f
JOIN supplies_farms sf
ON f.farm_id = sf.farm_id
JOIN supplies s
ON sf.supply_id = s.supply_id

--for finding list of all farms plants
SELECT p.common_name, pl.plot_name
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
SET (first_name = 'Joe', last_name = 'Hille', email = 'email')
WHERE username = user







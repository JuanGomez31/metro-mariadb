USE metro;

BEGIN;

-- Types of trains

INSERT INTO 
    `trains_types`(name)
VALUES
    ('Tren de corta distancia'),
    ('Tren suburbano y regional'),
    ('Tren metropolitano'),
    ('Tren de alta velocidad'),
    ('Tren ligero'),
    ('Tren de levitación magnética'),
    ('Monorriel');

-- Trains

INSERT INTO 
    `trains`(`serial_number`, `type_id`, `year`)
VALUES
    ('RjH8Wimsy9', 1, 2019),
    ('BgpVwyPRt9', 1, 2023),
    ('v6z6EiLWed', 1, 1998),
    ('rHDeqPYXsa', 1, 1990),
    ('R5PYY2sGip', 2, 1999),
    ('7BNnbzYu8h', 2, 2000),
    ('8S7GXVCAPC', 2, 2010),
    ('Q94wBovd8z', 2, 2015);


-- Lines

INSERT INTO 
    `lines`(`name`, `colour`)
VALUES
    ('Linea 1', '#960A0A'),
    ('Linea 2', '#FF6A26'),
    ('Linea 3', '#200AFF'),
    ('Linea 4', '#08CBE8'),
    ('Linea 5', '#62224F'),
    ('Linea 6', '#C24A4A'),
    ('Linea 7', '#72D8B5'),
    ('Linea 8', '#8675FF');

-- Trains Lines

INSERT INTO 
    `trains_lines`(`train_serial_number`, `line_id`, `start_date`, `end_date`)
VALUES
    ('RjH8Wimsy9', 1, '2020-01-30', '2023-05-31'),
    ('RjH8Wimsy9', 2, '2015-03-30', '2020-02-01'),
    ('RjH8Wimsy9', 3, '2018-03-30', '2022-12-31'),
    ('BgpVwyPRt9', 3, '2020-01-01', '2020-12-30'),
    ('BgpVwyPRt9', 4, '2020-01-30', '2023-05-31');


INSERT INTO 
    `trains_lines`(`train_serial_number`, `line_id`, `start_date`)
VALUES
    ('RjH8Wimsy9', 3, '2020-12-31'),
    ('RjH8Wimsy9', 4, '2022-12-31'),
    ('RjH8Wimsy9', 1, '2022-10-31'),
    ('BgpVwyPRt9', 2, '2019-12-31'),
    ('BgpVwyPRt9', 3, '2019-12-31');

-- Stations

INSERT INTO 
    `stations` (`name`, `location`) 
VALUES
    ('El Salvador', POINT(-99.14433718, 19.40702104)),
    ('Dos de mayo', POINT(-99.173702, 19.49039233)),
    ('Buenafuente', POINT(-99.07262564, 19.4146103)),
    ('Millar', POINT(-99.18803573, 19.45913691)),
    ('Plaza Menor', POINT(-99.10554171, 19.48231101)),
    ('Plaza Mayor', POINT(-99.12120581, 19.40425847)),
    ('20 de enero', POINT(-99.06114578, 19.4613523)),
    ('15 de abril', POINT(-99.19593215, 19.49448847));

-- Lines Stations

INSERT INTO 
    `lines_stations`(`station_id`, `line_id`, `start_date`)
VALUES
    (1, 1, '2015-01-30'),
    (3, 1, '2015-03-30'),
    (4, 1, '2015-03-30'),
    (7, 1, '2015-03-30'),
    (1, 2, '2015-01-30'),
    (2, 2, '2015-03-30'),
    (6, 2, '2015-03-30'),
    (7, 2, '2015-03-30'),
    (2, 3, '2015-01-30'),
    (3, 3, '2015-03-30'),
    (4, 3, '2015-03-30'),
    (5, 3, '2015-03-30'),
    (3, 4, '2015-01-30'),
    (4, 4, '2015-03-30'),
    (5, 4, '2015-03-30'),
    (7, 4, '2015-03-30');

COMMIT;
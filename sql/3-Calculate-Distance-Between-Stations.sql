-- Distancia en metros desde una zona y otro

SELECT
    ST_Distance_Sphere(
    (
        SELECT `location`
        FROM stations
        WHERE id = 1
    ),
    (
        SELECT `location`
        FROM stations
        WHERE id = 2
    )
) AS distance_by_name;
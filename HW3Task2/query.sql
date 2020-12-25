SELECT count(c.planetIds) + MAX(c.flightsCnt) AS con
FROM (SELECT p.id AS planetIds, count(f.id) AS flightsCnt
      FROM planet p
               LEFT OUTER JOIN flight f on p.id = f.planet_id
      WHERE p.galaxy = 2
      GROUP BY p.id) AS c

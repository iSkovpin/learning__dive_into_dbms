WITH V AS (SELECT p.name      as planet,
                  ps.value    as psystem,
                  count(f.id) as flightNum
           FROM planet p
                    LEFT JOIN flight f ON p.id = f.planet_id
                    JOIN politicalsystem ps on ps.id = p.psystem_id
           GROUP BY p.name, ps.value)

SELECT V.planet,
       V.psystem,
--        V.flightNum,
       RANK() OVER (PARTITION BY V.psystem ORDER BY V.flightNum DESC) AS local_rank,
       RANK() OVER (ORDER BY V.flightNum DESC)                        AS globbal_rank
FROM V


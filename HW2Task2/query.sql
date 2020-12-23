SELECT p.conference
FROM Paper p
         LEFT JOIN Conference c ON (p.conference = c.value)
WHERE c.value IS NULL
UNION
SELECT p.conference
FROM Paper p
GROUP BY p.conference
HAVING count(DISTINCT p.location) > 1;

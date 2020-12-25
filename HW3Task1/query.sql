SELECT c.name, s.name, f.start_date
FROM flight f
         JOIN commander c on f.commander_id = c.id
         JOIN spacecraft s on s.id = f.spacecraft_id
WHERE f.commander_id = 6
ORDER BY f.id;

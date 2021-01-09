CREATE VIEW HighPaperAcceptance AS
SELECT C.name, CE.year, count(p.id) AS total_papers, (sum(accepted::INT)::FLOAT / count(p.id)::FLOAT)::NUMERIC(3,2) AS acceptance_ratio
FROM ConferenceEvent CE
         JOIN Conference C ON C.id = CE.conference_id
         LEFT JOIN paper p on CE.id = p.event_id
GROUP BY C.name, CE.year
HAVING count(p.id) > 5 AND (sum(accepted::INT)::FLOAT / count(p.id)::FLOAT)::NUMERIC(3,2) > 0.75

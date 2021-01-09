CREATE VIEW HighPaperAcceptance AS
SELECT C.name, CE.year, CE.total_papers, CE.acceptance_ratio
FROM ConferenceEvent CE
         JOIN Conference C ON C.id = CE.conference_id
WHERE CE.total_papers > 5 AND CE.acceptance_ratio > 0.75;

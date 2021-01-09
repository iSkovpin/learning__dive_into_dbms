ALTER TABLE ConferenceEvent DROP COLUMN total_papers;
ALTER TABLE ConferenceEvent DROP COLUMN accepted_papers;
ALTER TABLE ConferenceEvent DROP COLUMN acceptance_ratio;
CREATE TABLE Paper
(
    id       INT PRIMARY KEY,
    event_id INT REFERENCES ConferenceEvent,
    title    TEXT,
    accepted BOOLEAN
);

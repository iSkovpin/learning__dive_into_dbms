CREATE TABLE Conference
(
    id   INT PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE ConferenceEvent
(
    id            SERIAL PRIMARY KEY,
    conference_id INT, -- REFERENCES Conference,
    year          INT,
    UNIQUE (conference_id, year)
);

CREATE TABLE Paper
(
    id       INT PRIMARY KEY,
    event_id INT, -- REFERENCES ConferenceEvent,
    title    TEXT,
    accepted BOOLEAN
);

CREATE TABLE Reviewer
(
    id    INT PRIMARY KEY,
    email TEXT UNIQUE,
    name  TEXT
);

CREATE TABLE PaperReviewing
(
    paper_id    INT, -- REFERENCES Paper,
    reviewer_id INT, -- REFERENCES Reviewer,
    score       INT,
    UNIQUE (paper_id, reviewer_id)
);

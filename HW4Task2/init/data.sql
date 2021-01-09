INSERT INTO Conference(id, name)
VALUES (1, 'SIGMOD'),
       (2, 'VLDB');
INSERT INTO ConferenceEvent(conference_id, year)
VALUES (1, 2015),
       (1, 2016),
       (2, 2016);
INSERT INTO Reviewer(id, email, name)
VALUES (1, 'jennifer@stanford.edu', 'Jennifer Widom'),
       (2, 'donald@ethz.ch', 'Donald Kossmann'),
       (3, 'jeffrey@stanford.edu', 'Jeffrey Ullman'),
       (4, 'jeff@google.com', 'Jeffrey Dean'),
       (5, 'michael@mit.edu', 'Michael Stonebraker');

INSERT INTO Paper(id, event_id, title)
VALUES (1, 1, 'Paper1'),
       (2, 2, 'Paper2'),
       (3, 2, 'Paper3'),
       (4, 3, 'Paper4');

INSERT INTO PaperReviewing(paper_id, reviewer_id)
VALUES (1, 1),
       (1, 4),
       (1, 5),
       (2, 1),
       (2, 2),
       (2, 4),
       (3, 3),
       (3, 4),
       (3, 5),
       (4, 2),
       (4, 3),
       (4, 4);

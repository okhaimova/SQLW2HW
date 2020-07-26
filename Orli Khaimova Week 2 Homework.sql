
DROP TABLE IF EXISTS reviewers;
DROP TABLE IF EXISTS videos;


-- Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
	-- video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
	-- other publicly available resources.
    
CREATE TABLE videos
(
	video_id int AUTO_INCREMENT PRIMARY KEY,
    title varchar(100) NOT NULL,
    vid_length decimal(10,2) NOT NULL,
    URL varchar(1000) NOT NULL
);

INSERT INTO videos (title, vid_length, URL)
VALUES ('How to Create a MySQL Database for Beginners in MySQL Workbench', 6.67, 
	'https://www.youtube.com/watch?v=ImqxBiv5yIY'),
	('Create MySQL Database - MySQL Workbench Tutorial', 17.23, 
    'https://www.youtube.com/watch?v=K6w0bZjl_Lw'),
    ('Entity Relationship Diagram (ERD) Tutorial - Part 1', 6.95, 
    'https://www.youtube.com/watch?v=QpdhBUYk7Kk'),
    ('Primary & Foreign Keys', 8.40,
    'https://www.youtube.com/watch?v=B5r8CcTUs5Y');

SELECT * FROM videos;

-- Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
	-- at least two of the videos. These should be imaginary reviews that include columns for the user’s name
	-- (“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
	-- (“Loved it!”). There should be a column that links back to the ID column in the table of videos

CREATE TABLE reviewers
(
	name varchar(30) NOT NULL,
    rating int, CHECK (rating BETWEEN 0 AND 5),
    review varchar(100) NOT NULL,
    video_id int NOT NULL,
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);
    
INSERT INTO reviewers (name, rating, review, video_id) VALUES
	('Akinola', 5, 'Thank you, I learned how to do it!', 1),
	('Edward', 4, 'Great tutorial, thank you so much!', 1),
    ('Mauro', NULL, 'Straight to the point', 2),
    ('Amanda', 5, 'Thank you!!', 2),
    ('Alma', 5, 'you made it look sooo simple and interesting.', 3),
    ('McKay',5, 'I want to learn more', 3),
    ('LaFrog', 5, 'finally understand it', 4),
    ('Ivan', 4, 'injected in my brain forever', 4),
    ('Mario', 5, 'Wow, what a great explanation', 4);
    
SELECT * FROM reviewers;

-- Report on Video Reviews. Write a JOIN statement that shows information from both tables.

SELECT v.video_id, v.title, v.vid_length, name AS 'Reviewer', rating, review, v.URL
FROM reviewers r 
LEFT JOIN videos v ON v.video_id=r.video_id
ORDER BY v.video_id, Reviewer;
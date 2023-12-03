-- Create the MovieAwardCeremony database
CREATE DATABASE IF NOT EXISTS MovieAwardCeremony;
USE MovieAwardCeremony;

-- Create the Movies table
CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    ReleaseDate DATE,
    Duration INT,
    Description TEXT
);

-- Create the Actors table
CREATE TABLE Actors (
    ActorID INT AUTO_INCREMENT PRIMARY KEY,
    ActorName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactInformation VARCHAR(255),
    Biography TEXT
);

CREATE TABLE Directors (
    DirectorID INT AUTO_INCREMENT PRIMARY KEY,
    DirectorName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactInformation VARCHAR(255),
    DirectorVotes INT,
    DirectorLeader VARCHAR(255)
);

-- Add the Songs table
CREATE TABLE Songs (
    SongID INT AUTO_INCREMENT PRIMARY KEY,
    SongTitle VARCHAR(255) NOT NULL,
    MovieID INT,
    Singer VARCHAR(255),
    MusicDirector VARCHAR(255),
    LyricsBy VARCHAR(255),
    Votes INT,
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID)
);


-- Add the Producers table
CREATE TABLE Producers (
    ProducerID INT AUTO_INCREMENT PRIMARY KEY,
    ProducerName VARCHAR(255) NOT NULL,
    ProductionCompany VARCHAR(255),
    ContactInformation VARCHAR(255),
    Biography TEXT,
    Pvotes INT
);
    
-- Create the Awards table
CREATE TABLE Awards (
    AwardID INT AUTO_INCREMENT PRIMARY KEY,
    AwardName VARCHAR(255) NOT NULL,
    AwardCategory VARCHAR(100),
    Year INT,
    Description TEXT
);

-- Create the Winners table
CREATE TABLE Winners (
    WinnerID INT AUTO_INCREMENT PRIMARY KEY,
    AwardID INT,
    NomineeID INT,
    FOREIGN KEY (AwardID) REFERENCES Awards (AwardID)
);


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    address TEXT
);

CREATE TABLE user_votes (
    user_id INT,
    category VARCHAR(255),
    CONSTRAINT unique_user_category_vote UNIQUE (user_id, category)
);


CREATE TABLE votes (
    vote_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category VARCHAR(255),
    item_name VARCHAR(255),
    vote_count INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);


-- Create the Category table
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);



-- Insert sample data into the Movies table
INSERT INTO Movies (Title, Genre, ReleaseDate, Duration, Description)
VALUES
    ('The Dark Knight', 'Action, Crime, Drama', '2008-07-18', 152, 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.'),
    ('Pulp Fiction', 'Crime, Drama', '1994-10-14', 154, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.'),
    ('Inception', 'Sci-Fi, Action', '2010-07-16', 148, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'),
    ('The Matrix', 'Action, Sci-Fi', '1999-03-31', 136, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.'),
    ('Gladiator', 'Action, Drama', '2000-05-05', 155, 'A Roman general seeks justice for his murdered family and finds himself in the midst of political intrigue and gladiatorial combat.'),
    ('Forrest Gump', 'Drama, Romance', '1994-07-06', 142, 'The story of a man with a low IQ who accomplished great things in his life despite his limitations.'),
    ('The Lord of the Rings: The Return of the King', 'Action, Adventure, Drama', '2003-12-17', 201, 'Gandalf and Aragorn lead the World of Men against Sauron’s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.'),
    ('The Silence of the Lambs', 'Crime, Drama, Thriller', '1991-02-14', 118, 'A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.'),
    ('Schindler''s List', 'Biography, Drama, History', '1993-12-15', 195, 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.'),
    ('The Green Mile', 'Crime, Drama, Fantasy', '1999-12-10', 189, 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.');





-- Insert sample data into the Actors table
INSERT INTO Actors (ActorName, DateOfBirth, Gender, ContactInformation, Biography)
VALUES
    ('Cate Blanchett', '1969-05-14', 'Female', 'cate@example.com', 'Cate Blanchett is an Australian actress and theater director. She is known for her versatile roles in movies like Elizabeth and Blue Jasmine.'),
    ('Hugh Jackman', '1968-10-12', 'Male', 'hugh@example.com', 'Hugh Jackman is an Australian actor, singer, and producer. He gained fame for his portrayal of Wolverine in the X-Men film series.'),
    ('Emma Watson', '1990-04-15', 'Female', 'emma@example.com', 'Emma Watson is a British actress, model, and activist. She is best known for her role as Hermione Granger in the Harry Potter series.'),
    ('Idris Elba', '1972-09-06', 'Male', 'idris@example.com', 'Idris Elba is an English actor, writer, and producer. He is known for his roles in movies like Beasts of No Nation and Luther.'),
    ('Anne Hathaway', '1982-11-12', 'Female', 'anne@example.com', 'Anne Hathaway is an American actress and singer. She has received critical acclaim for her performances in movies like Les Misérables.'),
    ('Bradley Cooper', '1975-01-05', 'Male', 'bradley@example.com', 'Bradley Cooper is an American actor, director, and producer. He is known for his roles in movies like Silver Linings Playbook and American Sniper.'),
    ('Natalie Dormer', '1982-02-11', 'Female', 'natalie@example.com', 'Natalie Dormer is an English actress. She is famous for her roles in TV series like Game of Thrones and The Tudors.'),
    ('Javier Bardem', '1969-03-01', 'Male', 'javier@example.com', 'Javier Bardem is a Spanish actor. He is known for his performances in movies like No Country for Old Men and Skyfall.'),
    ('Charlize Theron', '1975-08-07', 'Female', 'charlize@example.com', 'Charlize Theron is a South African-American actress and producer. She has won an Academy Award for her role in Monster.'),
    ('Keanu Reeves', '1964-09-02', 'Male', 'keanu@example.com', 'Keanu Reeves is a Canadian actor and producer. He is famous for his roles in movies like The Matrix trilogy and John Wick series.');


INSERT INTO Directors (DirectorName, DateOfBirth, Gender, ContactInformation, DirectorVotes, DirectorLeader)
VALUES 
    ('John Doe', '1980-05-15', 'Male', '555-1234', 100, 'Quentin Tarantino'),
    ('Jane Smith', '1975-08-22', 'Female', '555-5678', 150, 'Steven Spielberg'),
    ('Sam Johnson', '1990-03-10', 'Male', '555-9876', 120, 'Martin Scorsese'),
    ('Sara Davis', '1985-11-30', 'Female', '555-4321', 200, 'James Cameron'),
    ('Michael Brown', '1978-09-25', 'Male', '555-8765', 180, 'Francis Ford Coppola'),
    ('Emily Wilson', '1982-07-18', 'Female', '555-3456', 160, 'George Lucas'),
    ('David Lee', '1995-01-05', 'Male', '555-6543', 140, 'Peter Jackson'),
    ('Olivia Taylor', '1987-06-12', 'Female', '555-7890', 170, 'Christopher Nolan'),
    ('Daniel Harris', '1989-12-01', 'Male', '555-2109', 190, 'Quentin Tarantino'),
    ('Sophia Martinez', '1970-04-20', 'Female', '555-9012', 110, 'Martin Scorsese');




-- Insert sample data into the Songs table
INSERT INTO Songs (SongTitle, MovieID, Singer, MusicDirector, LyricsBy,Votes)
VALUES
    ('Imagine', 4, 'John Lennon', 'John Lennon', 'John Lennon',80),
    ('Bohemian Rhapsody', 5, 'Queen', 'Freddie Mercury', 'Freddie Mercury',76),
    ('Let It Go', 6, 'Idina Menzel', 'Kristen Anderson-Lopez and Robert Lopez', 'Kristen Anderson-Lopez and Robert Lopez',92),
    ('Yesterday', 7, 'The Beatles', 'John Lennon, Paul McCartney', 'John Lennon, Paul McCartney',98),
    ('My Heart Will Go On', 8, 'Celine Dion', 'James Horner', 'Will Jennings',72),
    ('Shape of You', 9, 'Ed Sheeran', 'Ed Sheeran', 'Ed Sheeran',80),
    ('Dancing Queen', 10, 'ABBA', 'Benny Andersson, Björn Ulvaeus', 'Benny Andersson, Björn Ulvaeus',90),
    ('Sweet Child o'' Mine', 1, 'Guns N'' Roses', 'Guns N'' Roses', 'Axl Rose, Slash, Izzy Stradlin',77),
    ('Smells Like Teen Spirit', 2, 'Nirvana', 'Nirvana', 'Kurt Cobain, Krist Novoselic, Dave Grohl',88),
    ('Rolling in the Deep', 4, 'Adele', 'Adele, Paul Epworth', 'Adele, Paul Epworth',99);


INSERT INTO Producers (ProducerName, ProductionCompany, ContactInformation, Biography,Pvotes)
VALUES
    ('James Cameron', 'Lightstorm Entertainment', 'james@example.com', 'James Cameron is a Canadian film director, producer, and screenwriter. He is known for directing blockbusters like Titanic and Avatar.',94),
    ('Peter Jackson', 'WingNut Films', 'peter@example.com', 'Peter Jackson is a New Zealand film director, producer, and screenwriter. He is best known for directing The Lord of the Rings trilogy.',88),
    ('Greta Gerwig', 'LuckyChap Entertainment', 'greta@example.com', 'Greta Gerwig is an American actress, writer, and director. She gained acclaim for her directorial debut, Lady Bird.',78),
    ('Jordan Peele', 'Monkeypaw Productions', 'jordan@example.com', 'Jordan Peele is an American filmmaker, comedian, and actor. He is known for directing socially conscious horror films like Get Out and Us.',68),
    ('Ava DuVernay', 'Forward Movement', 'ava@example.com', 'Ava DuVernay is an American filmmaker and director. She is known for directing movies like Selma and A Wrinkle in Time.',75),
    ('Martin McDonagh', 'Blueprint Pictures', 'martin@example.com', 'Martin McDonagh is a British-Irish playwright, screenwriter, and film director. He is known for movies like In Bruges and Three Billboards Outside Ebbing, Missouri.',80),
    ('Lynne Ramsay', 'Film4', 'lynne@example.com', 'Lynne Ramsay is a Scottish film director, writer, producer, and cinematographer. She is known for her distinctive and emotionally intense filmmaking style.',92),
    ('Bong Joon-ho', 'Barunson E&A', 'bong@example.com', 'Bong Joon-ho is a South Korean film director and screenwriter. He is known for directing movies like Parasite and Snowpiercer.',72),
    ('Agnès Varda', 'Ciné-Tamaris', 'agnes@example.com', 'Agnès Varda was a Belgian-born French film director, screenwriter, and photographer. She is known as one of the pioneers of the French New Wave cinema.',77),
    ('Barry Levinson', 'Baltimore Pictures', 'barry@example.com', 'Barry Levinson is an American filmmaker, screenwriter, and producer. He is known for directing movies like Rain Man and Good Morning, Vietnam.',95) ;


-- Insert 10 unique values into the users table
INSERT INTO users (user_id, first_name, last_name, email, phone_number, address)
VALUES 
    (1, 'John', 'Doe', 'john@example.com', '555-555-5555', '123 Main St'),
    (2, 'Jane', 'Doe', 'jane@example.com', '555-555-5555', '456 Elm St'),
    (3, 'Bob', 'Smith', 'bob@example.com', '555-555-5555', '789 Oak St'),
    (4, 'Alice', 'Johnson', 'alice@example.com', '555-555-5555', '101 Maple Ave'),
    (5, 'Michael', 'Brown', 'michael@example.com', '555-555-5555', '202 Pine Blvd'),
    (6, 'Sara', 'Davis', 'sara@example.com', '555-555-5555', '303 Cedar Dr'),
    (7, 'David', 'Lee', 'david@example.com', '555-555-5555', '404 Birch Ln'),
    (8, 'Jennifer', 'Taylor', 'jennifer@example.com', '555-555-5555', '505 Spruce Rd'),
    (9, 'Mark', 'Johnson', 'mark@example.com', '555-555-5555', '606 Fir Ct'),
    (10, 'Laura', 'Williams', 'laura@example.com', '555-555-5555', '707 Redwood Pl');
    
-- Insert categories into the Category table
INSERT INTO Category (category_name) VALUES
    ('Movies'),
    ('Actors'),
    ('Directors'),
    ('Producers'),
    ('Songs');


-- Add the 'Votes' column to the 'Movies' table
ALTER TABLE Movies ADD COLUMN Votes INT;
ALTER TABLE Movies ADD COLUMN release_year INT;
ALTER TABLE movies ADD COLUMN director VARCHAR(255);



-- Update the 'Votes' column with random values within the range of 200 for each movie
UPDATE Movies
SET Votes = 0;


UPDATE Directors
SET DirectorVotes = 0,
    DirectorLeader = 'Quentin Tarantino'; -- Replace with actual director names


ALTER TABLE Actors
ADD COLUMN ActorVotes INT,
ADD COLUMN ActorLeader VARCHAR(255);

UPDATE Actors SET
ActorVotes = 0,
ActorLeader = 'John Travolta'; -- Replace with actual actor names

-- Add the 'ProducerID' column to the 'Movies' table
ALTER TABLE Movies ADD COLUMN ProducerID INT;

-- Update the 'ProducerID' column with corresponding producer IDs for each movie
UPDATE Movies
SET ProducerID = CASE
    WHEN Title = 'The Shawshank Redemption' THEN 1
    WHEN Title = 'The Godfather' THEN 2
    WHEN Title = 'Pulp Fiction' THEN 3
    ELSE NULL
END;
-- Display the updated records
SELECT * FROM Movies;


-- Modified stored procedure to allow voting for a specific title
DELIMITER //
CREATE PROCEDURE VoteForCategory(IN p_user_id INT, IN p_category VARCHAR(255), IN p_item_name VARCHAR(255))
BEGIN
    DECLARE existing_vote_count INT;

    -- Check if the user has already voted for the specific title in the given category
    SELECT COUNT(*) INTO existing_vote_count
    FROM user_votes
    WHERE user_id = p_user_id AND category = p_category AND item_name = p_item_name;

    IF existing_vote_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User has already voted for this category';
    ELSE
        -- Insert the vote
        CASE p_category
            WHEN 'Movie' THEN
                INSERT INTO votes (user_id, category, item_name, vote_count)
                VALUES (p_user_id, p_category, p_item_name, 1);
            WHEN 'Actor' THEN
                INSERT INTO votes (user_id, category, item_name, vote_count)
                VALUES (p_user_id, p_category, p_item_name, 1);
            WHEN 'Director' THEN
                INSERT INTO votes (user_id, category, item_name, vote_count)
                VALUES (p_user_id, p_category, p_item_name, 1);
            WHEN 'Producer' THEN
                INSERT INTO votes (user_id, category, item_name, vote_count)
                VALUES (p_user_id, p_category, p_item_name, 1);
            WHEN 'Song' THEN
                INSERT INTO votes (user_id, category, item_name, vote_count)
                VALUES (p_user_id, p_category, p_item_name, 1);

        END CASE;

        -- Insert the user's vote record
        INSERT INTO user_votes (user_id, category, item_name)
        VALUES (p_user_id, p_category, p_item_name);
    END IF;
END //
DELIMITER ;


DELIMITER //

CREATE TRIGGER UpdateVoteCounts
AFTER INSERT
ON votes FOR EACH ROW
BEGIN
    DECLARE category VARCHAR(255);
    DECLARE item_name VARCHAR(255);
    DECLARE vote_count INT;

    -- Get the values from the inserted row
    SET category = NEW.category;
    SET item_name = NEW.item_name;
    SET vote_count = NEW.vote_count;

    CASE category
        WHEN 'Movie' THEN
            UPDATE Movies
            SET Votes = Votes + vote_count
            WHERE Title = item_name;
        WHEN 'Actor' THEN
            UPDATE Actors
            SET Votes = Votes + vote_count
            WHERE ActorName = item_name;
        WHEN 'Director' THEN
            UPDATE Directors
            SET Votes = Votes + vote_count
            WHERE DirectorName = item_name;
        WHEN 'Producer' THEN
            UPDATE Producers
            SET Pvotes = Pvotes + vote_count
            WHERE ProducerName = item_name;
        WHEN 'Song' THEN
            UPDATE Songs
            SET Votes = Votes + vote_count
            WHERE SongTitle = item_name;
    END CASE;
END;

//
DELIMITER ;


DELIMITER //

CREATE FUNCTION GenerateVotingReportWithTies() RETURNS TEXT
BEGIN
    DECLARE result TEXT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE category VARCHAR(255);
    DECLARE item_name VARCHAR(255);
    DECLARE total_votes INT;
    DECLARE total_participants INT;

    -- Declare cursor for unique categories
    DECLARE category_cursor CURSOR FOR
        SELECT DISTINCT category
        FROM votes;

    -- Declare NOT FOUND handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET result = '';

    OPEN category_cursor;

    read_categories: LOOP
        FETCH category_cursor INTO category;
        IF done THEN
            LEAVE read_categories;
        END IF;

        -- Add report title for each category to the result
        SET result = CONCAT(result, CONCAT('Report for ', category), '\n');

        -- Declare cursor for unique items in the category
        DECLARE item_cursor CURSOR FOR
            SELECT DISTINCT item_name
            FROM votes
            WHERE category = category;

        OPEN item_cursor;

        read_items: LOOP
            FETCH item_cursor INTO item_name;
            IF done THEN
                LEAVE read_items;
            END IF;

            -- Get total votes for the item in the category
            SELECT
                item_name,
                SUM(vote_count) AS total_votes
            INTO
                item_name,
                total_votes
            FROM
                votes
            WHERE
                category = category
                AND item_name = item_name;

            -- Add item report to the result
            SET result = CONCAT(result, CONCAT(item_name, ': Total Votes = ', total_votes), '\n');

        END LOOP;

        CLOSE item_cursor;

        -- Innermost Subquery
        SELECT
            c.item_name,
            SUM(v.vote_count) AS total_votes
        FROM
            candidates c
        JOIN
            votes v ON c.item_name = v.item_name AND c.category = v.category
        WHERE
            c.category = 'category' 
        GROUP BY
            c.item_name;

        -- Intermediate Subquery
        SELECT
            MAX(total_votes)
        FROM
            (
                -- Innermost Subquery
                SELECT
                    c.item_name,
                    SUM(v.vote_count) AS total_votes
                FROM
                    candidates c
                JOIN
                    votes v ON c.item_name = v.item_name AND c.category = v.category
                WHERE
                    c.category = 'category'
                GROUP BY
                    c.item_name
            ) AS subquery;

        -- Main Query
        SELECT
            GROUP_CONCAT(item_name) AS tied_winners
        FROM
            (
                -- Innermost Subquery
                SELECT
                    c.item_name,
                    SUM(v.vote_count) AS total_votes
                FROM
                    candidates c
                JOIN
                    votes v ON c.item_name = v.item_name AND c.category = v.category
                WHERE
                    c.category = 'category' 
                GROUP BY
                    c.item_name
                HAVING
                    total_votes = (
                        -- Intermediate Subquery
                        SELECT
                            MAX(total_votes)
                        FROM
                            (
                                -- Innermost Subquery
                                SELECT
                                    c.item_name,
                                    SUM(v.vote_count) AS total_votes
                                FROM
                                    candidates c
                                JOIN
                                    votes v ON c.item_name = v.item_name AND c.category = v.category
                                WHERE
                                    c.category = 'category' 
                                GROUP BY
                                    c.item_name
                            ) AS subquery
                    )
            ) AS tied_winners_query;


        -- Add tied winners report to the result
        SET result = CONCAT(result, CONCAT('Tied Winners: ', item_name), '\n\n');

    END LOOP;

    CLOSE category_cursor;

    RETURN result;
END //

DELIMITER ;

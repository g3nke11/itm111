USE cwgames;

-- Rating table inserts
INSERT INTO rating
(rating_level)
VALUES
('E'),
('E10+'),
('T'),
('M'),
('NR');

-- Game table inserts
INSERT INTO game
(game_title, release_date, rating_id)
VALUES
('Assassins Creed: Black Flag','2013-10-29',(SELECT rating_id FROM rating WHERE rating_level = 'M')),
('Legend of Zelda: Twilight Princess','2006-11-19',(SELECT rating_id FROM rating WHERE rating_level = 'T')),
('Halo: The Master Chief Collection','2019-12-03',(SELECT rating_id FROM rating WHERE rating_level = 'M')),
('Undertale','2015-09-15',(SELECT rating_id FROM rating WHERE rating_level = 'E10+')),
('Spark the Electric Jester 3','2022-08-24',(SELECT rating_id FROM rating WHERE rating_level = 'NR')),
('Legend of Zelda: Ocarina of Time','1998-11-21',(SELECT rating_id FROM rating WHERE rating_level = 'E')),
('Scribblenauts Unmasked','2013-09-24',(SELECT rating_id FROM rating WHERE rating_level = 'E10+')),
('Octopath Traveller','2019-06-07',(SELECT rating_id FROM rating WHERE rating_level = 'T')),
('Fossil Fighters','2009-08-10',(SELECT rating_id FROM rating WHERE rating_level = 'E')),
('Fossil Fighters: Frontier','2014-02-27',(SELECT rating_id FROM rating WHERE rating_level = 'E10+')),
('Ori and the Will of the Wisps','2020-03-10',(SELECT rating_id FROM rating WHERE rating_level = 'E')),
('Crash Bandicoot 1','1996-09-09',(SELECT rating_id FROM rating WHERE rating_level = 'E10+')),
('Crash Bandicoot 2: Cortex Strikes Back','1997-10-31',(SELECT rating_id FROM rating WHERE rating_level = 'E10+')),
('Crash Bandicoot 3: Warped','1998-10-31',(SELECT rating_id FROM rating WHERE rating_level = 'E10+')),
('Uncharted 3: Drake''s Deception','2011-10-01',(SELECT rating_id FROM rating WHERE rating_level = 'T')),
('Tetris Evolution','2007-04-19',(SELECT rating_id FROM rating WHERE rating_level = 'E10+')),
('Medal of Honor: Pacific Assault','2004-10-04',(SELECT rating_id FROM rating WHERE rating_level = 'T')),
('Elder Scrolls V: Skyrim Special Edition','2011-11-11',(SELECT rating_id FROM rating WHERE rating_level = 'M'));

-- Genre inserts
INSERT INTO genre
( genre_type )
VALUES
('Action'),
('Adventure'),
('Open World'),
('Story'),
('Role-playing'),
('Puzzle'),
('FPS'),
('Strategy'),
('Indie'),
('Casual'),
('Third-person Shooter'),
('Fantasy');

-- Owner inserts
INSERT INTO owner
(first_name, last_name)
VALUES
('Nick','Boss'),
('Austin','Longhurst'),
('Christian','Mijangos');


-- Platform inserts
INSERT INTO platform
(platform_name)
VALUES
('PC'),
('Wii'),
('N64'),
('Playstation 1'),
('Playstation 3'),
('NDS'),
('3DS');


-- Company inserts
INSERT INTO company
(company_name, is_developer, is_publisher)
VALUES
('Ubisoft','y','n'),
('Nintendo','y','y'),
('343 Industries','y','n'),
('Bungee','y','n'),
('Xbox Game Studios','n','y'),
('Tobyfox','y','y'),
('Feperd Games','y','y'),
('Warner Bros. Interactive Media Entertainment','n','y'),
('Square Enix','n','y'),
('Moon Studios GmbH','y','n'),
('Sony','n','y'),
('Mass Media Inc','n','y'),
('Electronic Arts','y','y'),
('Bethesda','y','y');


-- Price inserts
INSERT INTO price
( price_value )
VALUES
(16.95),
(44.99),
(39.99),
(9.99),
(24.99),
(41.92),
(19.99),
(59.99),
(74.78),
(29.99),
(21.00),
(35.85),
(25.99);


-- gameCompany
INSERT INTO game_company
(game_id, company_id)
VALUES
(
    (SELECT game_id
	FROM   game
    WHERE  game_title = 'Assassins Creed: Black Flag')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Ubisoft')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Twilight Princess')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Nintendo')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Halo: The Master Chief Collection')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = '343 Industries')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Halo: The Master Chief Collection')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Bungee')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Halo: The Master Chief Collection')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Xbox Game Studios')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Undertale')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Tobyfox')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Spark the Electric Jester 3')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Feperd Games')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Ocarina of Time')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Nintendo')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Scribblenauts Unmasked')
,    (SELECT company_id
    FROM   company
    WHERE  company_name = 'Warner Bros. Interactive Media Entertainment')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Octopath Traveller')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Square Enix')
),
(   
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Fossil Fighters')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Nintendo')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Fossil Fighters: Frontier')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Nintendo')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Ori and the Will of the Wisps')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Moon Studios GmbH')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Ori and the Will of the Wisps')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Xbox Game Studios')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 1')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Sony')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 2: Cortex Strikes Back')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Sony')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 3: Warped')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Sony')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Uncharted 3: Drake''s Deception')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Sony')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Tetris Evolution')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Mass Media Inc')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Medal of Honor: Pacific Assault')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Electronic Arts')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Elder Scrolls V: Skyrim Special Edition')
,   (SELECT company_id
    FROM   company
    WHERE  company_name = 'Bethesda')
);

-- game_genre inserts
INSERT INTO game_genre
(game_id,genre_id)
VALUES
(
    (SELECT game_id
	FROM   game
    WHERE  game_title = 'Assassins Creed: Black Flag')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
	FROM   game
    WHERE  game_title = 'Assassins Creed: Black Flag')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
	FROM   game
    WHERE  game_title = 'Assassins Creed: Black Flag')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Open World')
),
(
    (SELECT game_id
	FROM   game
    WHERE  game_title = 'Assassins Creed: Black Flag')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Story')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Twilight Princess')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Twilight Princess')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Twilight Princess')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Role-Playing')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Twilight Princess')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Puzzle')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Halo: The Master Chief Collection')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'FPS')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Halo: The Master Chief Collection')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Story')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Halo: The Master Chief Collection')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Strategy')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Halo: The Master Chief Collection')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Undertale')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Indie')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Undertale')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Role-Playing')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Spark the Electric Jester 3')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Spark the Electric Jester 3')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Indie')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Ocarina of Time')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Ocarina of Time')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Ocarina of Time')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Puzzle')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Scribblenauts Unmasked')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Scribblenauts Unmasked')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Scribblenauts Unmasked')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Casual')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Scribblenauts Unmasked')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Strategy')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Octopath Traveller')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Role-Playing')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Fossil Fighters')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Role-Playing')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Fossil Fighters: Frontier')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Role-Playing')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Ori and the Will of the Wisps')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Ori and the Will of the Wisps')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 1')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 1')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 2: Cortex Strikes Back')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 2: Cortex Strikes Back')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 3: Warped')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 3: Warped')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Uncharted 3: Drake''s Deception')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Uncharted 3: Drake''s Deception')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Uncharted 3: Drake''s Deception')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Third-person Shooter')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Tetris Evolution')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Puzzle')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Medal of Honor: Pacific Assault')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'FPS')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Elder Scrolls V: Skyrim Special Edition')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Action')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Elder Scrolls V: Skyrim Special Edition')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Adventure')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Elder Scrolls V: Skyrim Special Edition')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Role-Playing')
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Elder Scrolls V: Skyrim Special Edition')
,   (SELECT genre_id
    FROM   genre
    WHERE  genre_type = 'Fantasy')
);

-- gamePlatform inserts
INSERT INTO game_platform
(game_id, platform_id, price_id, owner_id, has_played)
VALUES
(
    (SELECT game_id
	FROM   game
    WHERE  game_title = 'Assassins Creed: Black Flag')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 16.95)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Nick' AND last_name = 'Boss')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Twilight Princess')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'Wii')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 44.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Nick' AND last_name = 'Boss')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Halo: The Master Chief Collection')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 39.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Nick' AND last_name = 'Boss')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Undertale')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 9.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Austin' AND last_name = 'Longhurst')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Spark the Electric Jester 3')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 24.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Austin' AND last_name = 'Longhurst')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Legend of Zelda: Ocarina of Time')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'N64')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 41.92)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Nick' AND last_name = 'Boss')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Scribblenauts Unmasked')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 19.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Austin' AND last_name = 'Longhurst')
,   'n'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Octopath Traveller')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 59.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Austin' AND last_name = 'Longhurst')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Fossil Fighters')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'NDS')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 74.78)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Austin' AND last_name = 'Longhurst')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Fossil Fighters: Frontier')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = '3DS')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 29.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Austin' AND last_name = 'Longhurst')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Ori and the Will of the Wisps')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 29.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Nick' AND last_name = 'Boss')
,   'n'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 1')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'Playstation 1')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 19.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Christian' AND last_name = 'Mijangos')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 2: Cortex Strikes Back')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'Playstation 1')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 21.00)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Christian' AND last_name = 'Mijangos')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Crash Bandicoot 3: Warped')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'Playstation 1')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 21.00)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Christian' AND last_name = 'Mijangos')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Uncharted 3: Drake''s Deception')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'Playstation 3')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 35.85)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Christian' AND last_name = 'Mijangos')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Tetris Evolution')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'Playstation 3')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 19.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Christian' AND last_name = 'Mijangos')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Medal of Honor: Pacific Assault')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 25.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Christian' AND last_name = 'Mijangos')
,   'y'
),
(
    (SELECT game_id
    FROM   game
    WHERE  game_title = 'Elder Scrolls V: Skyrim Special Edition')
,   (SELECT platform_id
    FROM   platform
    WHERE  platform_name = 'PC')
,   (SELECT price_id 
    FROM price 
    WHERE price_value = 39.99)
,   (SELECT owner_id
    FROM   owner
    WHERE  first_name = 'Nick' AND last_name = 'Boss')
,   'y'
);

-- COPYRIGHT 2024, Nicholas Boss
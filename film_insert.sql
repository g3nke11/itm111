INSERT INTO actor
(actor_fname,
actor_lname)
VALUES
('Angela', 'Bassett'),
('Annie', 'Potts'),
('Carrie', 'Fisher'),
('Cyd', 'Charisse'),
('Danai', 'Gurira'),
('Emilia', 'Jones'),
('Gene', 'Kelly'),
('Harrison', 'Ford'),
('John', 'Ratzenberger'),
('Letitia', 'Wright'),
('Lupita', "Nyong'o"),
('Mark', 'Hamill'),
('Marlee', 'Matlin'),
('Tim', 'Allen'),
('Tom', 'Hanks'),
('Troy', 'Kotsur'),
('Van', 'Johnson');

INSERT INTO genre
(genre_type)
VALUES
('Action'),
('Adventure'),
('Animated'),
('Comedy'),
('Drama'),
('Family'),
('Fantasy'),
('Music'),
('Musical'),
('Romance'),
('Sci Fi'),
('Thriller');

INSERT INTO special_feature
(special_feature_type)
VALUES
('actor interviews'),
('bloopers'),
('cut scenes'),
('trailers');

INSERT INTO rating
(rating_type)
VALUES
('G'),
('PG'),
('PG-13');

INSERT INTO studio
(studio_name)
VALUES
('20th Century Fox'),
('Apple TV+'),
('Disney'),
('Marvel'),
('MGM'),
('Pixar');

INSERT INTO price
(price_amount)
VALUES
(19.95),
(19.99),
(24.95),
(35.00);

INSERT INTO media
(media_type)
VALUES
('blu-ray'),
('DVD'),
('HD'),
('Streaming');

INSERT INTO movie
(movie_title,
movie_year,
rating_id)
VALUES
('Toy Story',
1995,
(SELECT rating_id FROM rating WHERE rating_type = 'G')),
('Toy Story 2',
1999,
(SELECT rating_id FROM rating WHERE rating_type = 'G')),
('Brigadoone',
1954,
(SELECT rating_id FROM rating WHERE rating_type = 'G')),
('The Empire Strikes Back',
1977,
(SELECT rating_id FROM rating WHERE rating_type = 'PG')),
('Coda',
2021,
(SELECT rating_id FROM rating WHERE rating_type = 'PG-13')),
('Black Panther: Wakanda Forever',
2022,
(SELECT rating_id FROM rating WHERE rating_type = 'PG-13'));

INSERT INTO movie_actor
(movie_id,
actor_id)
VALUES
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Tom')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Tim')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Annie')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story'),
(SELECT actor_id FROM actor WHERE actor_fname = 'John')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Tim')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Tom')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2'),
(SELECT actor_id FROM actor WHERE actor_fname = 'John')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Annie')),
((SELECT movie_id FROM movie WHERE movie_title = 'Brigadoone'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Gene')),
((SELECT movie_id FROM movie WHERE movie_title = 'Brigadoone'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Cyd')),
((SELECT movie_id FROM movie WHERE movie_title = 'Brigadoone'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Van')),
((SELECT movie_id FROM movie WHERE movie_title = 'The Empire Strikes Back'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Harrison')),
((SELECT movie_id FROM movie WHERE movie_title = 'The Empire Strikes Back'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Carrie')),
((SELECT movie_id FROM movie WHERE movie_title = 'The Empire Strikes Back'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Mark')),
((SELECT movie_id FROM movie WHERE movie_title = 'Coda'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Emilia')),
((SELECT movie_id FROM movie WHERE movie_title = 'Coda'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Marlee')),
((SELECT movie_id FROM movie WHERE movie_title = 'Coda'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Troy')),
((SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Letitia')),
((SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Angela')),
((SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Danai')),
((SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'),
(SELECT actor_id FROM actor WHERE actor_fname = 'Lupita'));

INSERT INTO movie_genre
(genre_id,
movie_id)
VALUES
((SELECT genre_id FROM genre WHERE genre_type = 'Family'),
(SELECT movie_id FROM movie WHERE movie_title = 'Toy Story')),
((SELECT genre_id FROM genre WHERE genre_type = 'Animated'),
(SELECT movie_id FROM movie WHERE movie_title = 'Toy Story')),
((SELECT genre_id FROM genre WHERE genre_type = 'Family'),
(SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2')),
((SELECT genre_id FROM genre WHERE genre_type = 'Animated'),
(SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2')),
((SELECT genre_id FROM genre WHERE genre_type = 'Musical'),
(SELECT movie_id FROM movie WHERE movie_title = 'Brigadoone')),
((SELECT genre_id FROM genre WHERE genre_type = 'Romance'),
(SELECT movie_id FROM movie WHERE movie_title = 'Brigadoone')),
((SELECT genre_id FROM genre WHERE genre_type = 'Sci Fi'),
(SELECT movie_id FROM movie WHERE movie_title = 'The Empire Strikes Back')),
((SELECT genre_id FROM genre WHERE genre_type = 'Comedy'),
(SELECT movie_id FROM movie WHERE movie_title = 'Coda')),
((SELECT genre_id FROM genre WHERE genre_type = 'Drama'),
(SELECT movie_id FROM movie WHERE movie_title = 'Coda')),
((SELECT genre_id FROM genre WHERE genre_type = 'Music'),
(SELECT movie_id FROM movie WHERE movie_title = 'Coda')),
((SELECT genre_id FROM genre WHERE genre_type = 'Action'),
(SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever')),
((SELECT genre_id FROM genre WHERE genre_type = 'Adventure'),
(SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever')),
((SELECT genre_id FROM genre WHERE genre_type = 'Drama'),
(SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever')),
((SELECT genre_id FROM genre WHERE genre_type = 'Thriller'),
(SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever')),
((SELECT genre_id FROM genre WHERE genre_type = 'Fantasy'),
(SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever')),
((SELECT genre_id FROM genre WHERE genre_type = 'Sci Fi'),
(SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'));

INSERT INTO movie_price_media
(movie_id,
price_id,
media_id)
VALUES
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story'),
(SELECT price_id FROM price WHERE price_amount = 19.95),
(SELECT media_id FROM media WHERE media_type = 'DVD')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2'),
(SELECT price_id FROM price WHERE price_amount = 24.95),
(SELECT media_id FROM media WHERE media_type = 'DVD')),
((SELECT movie_id FROM movie WHERE movie_title = 'Brigadoone'),
(SELECT price_id FROM price WHERE price_amount = 19.95),
(SELECT media_id FROM media WHERE media_type = 'DVD')),
((SELECT movie_id FROM movie WHERE movie_title = 'The Empire Strikes Back'),
(SELECT price_id FROM price WHERE price_amount = 35.00),
(SELECT media_id FROM media WHERE media_type = 'blu-ray')),
((SELECT movie_id FROM movie WHERE movie_title = 'Coda'),
NULL,
(SELECT media_id FROM media WHERE media_type = 'Streaming')),
((SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'),
NULL,
(SELECT media_id FROM media WHERE media_type = 'Streaming')),
((SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'),
(SELECT price_id FROM price WHERE price_amount = 19.99),
(SELECT media_id FROM media WHERE media_type = 'HD'));

INSERT INTO movie_special_feature
(special_feature_id,
movie_id)
VALUES
((SELECT special_feature_id FROM special_feature WHERE special_feature_type = 'bloopers'),
(SELECT movie_id FROM movie WHERE movie_title = 'Toy Story')),
((SELECT special_feature_id FROM special_feature WHERE special_feature_type = 'actor interviews'),
(SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2')),
((SELECT special_feature_id FROM special_feature WHERE special_feature_type = 'cut scenes'),
(SELECT movie_id FROM movie WHERE movie_title = 'The Empire Strikes Back')),
((SELECT special_feature_id FROM special_feature WHERE special_feature_type = 'bloopers'),
(SELECT movie_id FROM movie WHERE movie_title = 'The Empire Strikes Back')),
((SELECT special_feature_id FROM special_feature WHERE special_feature_type = 'trailers'),
(SELECT movie_id FROM movie WHERE movie_title = 'Coda')),
((SELECT special_feature_id FROM special_feature WHERE special_feature_type = 'trailers'),
(SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever')),
((SELECT special_feature_id FROM special_feature WHERE special_feature_type = 'bloopers'),
(SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'));

INSERT INTO movie_studio
(movie_id,
studio_id)
VALUES
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story'),
(SELECT studio_id FROM studio WHERE studio_name = 'Pixar')),
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story 2'),
(SELECT studio_id FROM studio WHERE studio_name = 'Pixar')),
((SELECT movie_id FROM movie WHERE movie_title = 'Brigadoone'),
(SELECT studio_id FROM studio WHERE studio_name = 'MGM')),
((SELECT movie_id FROM movie WHERE movie_title = 'The Empire Strikes Back'),
(SELECT studio_id FROM studio WHERE studio_name = '20th Century Fox')),
((SELECT movie_id FROM movie WHERE movie_title = 'Coda'),
(SELECT studio_id FROM studio WHERE studio_name = 'Apple TV+')),
((SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'),
(SELECT studio_id FROM studio WHERE studio_name = 'Marvel')),
((SELECT movie_id FROM movie WHERE movie_title = 'Black Panther: Wakanda Forever'),
(SELECT studio_id FROM studio WHERE studio_name = 'Disney'));
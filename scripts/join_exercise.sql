-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.

-- SELECT specs.film_title, specs.release_year, MIN(revenue.worldwide_gross)
-- FROM specs
-- INNER JOIN revenue
-- USING (movie_id)
-- GROUP BY film_title, release_year, worldwide_gross
-- ORDER BY worldwide_gross ASC
-- LIMIT 1;
--Semi_Tough, 1977, 37,187,139

-- 2. What year has the highest average imdb rating?

-- SELECT specs.release_year, AVG(rating.imdb_rating) AS avg_imdb_rating
-- FROM rating
-- INNER JOIN specs
-- USING (movie_id)
-- GROUP BY specs.release_year
-- ORDER BY avg_imdb_rating DESC
-- LIMIT 1;
--1991	7.4500000000000000

-- 3. What is the highest grossing G-rated movie? Which company distributed it?

-- SELECT distributors.company_name, specs.film_title, specs.mpaa_rating, revenue.worldwide_gross
-- FROM specs
-- INNER JOIN distributors
-- ON specs.domestic_distributor_id = distributor_id
-- INNER JOIN revenue
-- USING (movie_id)
-- WHERE specs.mpaa_rating = 'G'
-- ORDER BY revenue.worldwide_gross DESC
-- LIMIT 1;
--"Walt Disney "	"Toy Story 4"	"G"	$1,073,394,593

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- SELECT (distributors.distributor_id), (distributors.company_name), count(specs.movie_id)
-- FROM specs
-- left join distributors
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- WHERE distributor_id IS NOT NULL
-- GROUP BY distributors.distributor_id, distributors.company_name; 

-- 5. Write a query that returns the five distributors with the highest average movie budget.

-- SELECT distributors.company_name, AVG(revenue.film_budget) as avg_budget
-- FROM specs
-- INNER JOIN distributors
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- INNER JOIN revenue
-- USING (movie_id)
-- GROUP BY distributors.company_name
-- ORDER BY avg_budget DESC
-- LIMIT 5;
--"Walt Disney"=148735526.31578947, "Sony Pictures"-139129032.25806452, "Lionsgate"-122600000.00000000, "DreamWorks"-121352941.17647059, "Warner Bros."-103430985.91549296

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

-- SELECT count(specs.film_title)
-- FROM specs
-- INNER JOIN distributors
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- where distributors.headquarters NOT LIKE '%CA';
-- 2 films, "My Big Fat Greek Wedding", "Dirty Dancing"

-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

-- SELECT (specs.length_in_min / 120) AS hours, AVG(rating.imdb_rating) AS avg_rating
-- FROM specs
-- INNER JOIN rating
-- USING(movie_id)
-- GROUP BY hours
-- ORDER BY hours DESC
--films over 2 hours get highest rating
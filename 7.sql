# http://sqlzoo.net/wiki/More_JOIN_operations

# Q1

SELECT id, title
FROM movie
WHERE yr=1962;

# Q2

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

# Q3

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

# Q4

SELECT title
FROM movie
WHERE id IN (11768, 11955, 21191);

# Q5

SELECT id
FROM actor
WHERE name = 'Glenn Close';

# Q6

SELECT id
FROM movie
WHERE title = 'Casablanca';

# Q7

SELECT name
FROM actor JOIN casting
ON id = actorid
WHERE movieid = 11768;

# Q8

SELECT name
FROM actor JOIN casting
ON id = actorid
WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien'); 

# Q9

SELECT title
FROM (movie JOIN casting ON movieid = id) JOIN actor 
ON actorid = actor.id
WHERE name = 'Harrison Ford';

# Q10

SELECT title
FROM (movie JOIN casting ON movieid = id) JOIN actor 
ON actorid = actor.id
WHERE name = 'Harrison Ford' AND ord <> 1;

# Q11

SELECT title, name
FROM (movie JOIN casting ON movieid = id) JOIN actor 
ON actorid = actor.id
WHERE yr = 1962 AND ord = 1;

# Harder Questions

# Q12

SELECT yr, COUNT(title) 
FROM movie JOIN casting ON movie.id = movieid JOIN actor
ON actorid = actor.id
WHERE name = 'John Travolta'
GROUP BY yr
HAVING COUNT(title) = (SELECT MAX(c) FROM (SELECT yr, COUNT(title) AS c FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE name = 'John Travolta' GROUP BY yr) AS t);

# Q13

SELECT title, name
FROM (movie JOIN casting ON movieid = id) JOIN actor
ON actor.id = actorid
WHERE ord = 1 AND movieid IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews'));

# Q14

SELECT name
FROM actor JOIN (SELECT actorid, COUNT(ord) AS count FROM casting WHERE ord = 1 GROUP BY actorid) a
ON actor.id = a.actorid
WHERE actor.id = a.actorid AND a.count >= 30;

# Q15 

# Even though the list is complete and matches the should-be answer, 
# I think because the movie name order generated by the engine doesn't match 
# the one saved on the website, it says 'Wrong answer. Some of the data is incorrect.'

SELECT title, COUNT(name)
FROM (movie JOIN casting ON movieid = id) JOIN actor
ON actor.id = actorid
WHERE movie.yr = 1978
GROUP BY title
ORDER BY COUNT(name) DESC;

# Q16

SELECT name
FROM actor JOIN casting 
ON actorid = id
WHERE name <> 'Art Garfunkel' AND movieid IN (SELECT movieid FROM actor JOIN casting ON actorid = id WHERE name = 'Art Garfunkel');
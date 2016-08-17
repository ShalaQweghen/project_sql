# http://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

# Q1

SELECT name 
FROM world
WHERE population > (SELECT population FROM world WHERE name='Russia');

# Q2

SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom');

# Q3

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia')
ORDER BY name;

# Q4

SELECT name, population
FROM world
WHERE population < (SELECT population FROM world WHERE name = 'Poland') AND population > (SELECT population FROM world WHERE name = 'Canada');

# Q5

SELECT name, CONCAT(ROUND((population*100)/(SELECT population FROM world WHERE name = 'Germany')), '%')
FROM world
WHERE continent = 'Europe';

# Q6

SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe');

# Q7

SELECT continent, name, area 
FROM world x
WHERE area >= ALL(SELECT area FROM world y WHERE y.continent=x.continent AND area>0);

# Q8

SELECT continent, name
FROM world a
WHERE name = (SELECT name FROM world b WHERE a.continent = b.continent ORDER BY name LIMIT 1);

# Difficult Questions

# Q9

SELECT a.name, a.continent, a.population
FROM world a, (SELECT COUNT(name) AS count_1, continent FROM world WHERE population <= 25000000 GROUP BY continent) b, (SELECT COUNT(name) as count_2, continent FROM world GROUP BY continent) c
WHERE b.continent = c.continent AND b.count_1 = c.count_2 AND a.continent = b.continent;

# Q10 - This one got me thinking for quiet a while!!!

SELECT name, continent
FROM world a
WHERE population > ALL(SELECT population * 3
FROM world b WHERE a.name <> b.name AND a.continent = b.continent);
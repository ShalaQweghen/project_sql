# http://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial

# Q1

SELECT name, continent, population 
FROM world;

# Q2

SELECT name 
FROM world
WHERE population >= 200000000;

# Q3

SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

# Q4

SELECT name, population / 1000000
FROM world
WHERE continent = 'South America';

# Q5

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

# Q6

SELECT name
FROM world
WHERE name LIKE 'United%';

# Q7

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

# Q8

SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

# Q9

SELECT name, ROUND(population / 1000000, 2), ROUND(gdp / 1000000000, 2)
FROM world
WHERE continent = 'South America';

# Q10

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000;

# Harder questions

# Q11

SELECT name, CASE WHEN continent = 'Oceania' THEN 'Australasia' ELSE continent END
FROM world
WHERE name LIKE 'N%';

# Q12

SELECT name, CASE WHEN continent = 'Europe' OR continent = 'Asia' THEN 'Eurasia' WHEN continent = 'North America' OR continent = 'South America' OR continent = 'Caribbean' THEN 'America' ELSE continent END
FROM world
WHERE name LIKE 'A%' OR name LIKE 'B%';

# Q13

SELECT name, continent, CASE WHEN continent = 'Oceania' THEN 'Australasia' WHEN continent = 'Eurasia' OR name = 'Turkey' THEN 'Europe/Asia' WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America' WHEN continent = 'Caribbean' AND name NOT LIKE 'B%' THEN 'South America' ELSE continent END
FROM world
ORDER BY name;
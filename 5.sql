# http://sqlzoo.net/wiki/SUM_and_COUNT

# Q1

SELECT SUM(population)
FROM world;

# Q2

SELECT DISTINCT continent
FROM world;

# Q3

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

# Q4

SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

# Q5

SELECT SUM(population)
FROM world
WHERE name IN ('France', 'Germany', 'Spain');

# Q6

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

# Q7

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

# Q8

SELECT DISTINCT a.continent
FROM world a, (SELECT continent, SUM(population) AS sum FROM world GROUP BY continent) b
WHERE b.sum >= 100000000 AND a.continent = b.continent;
# http://sqlzoo.net/wiki/SELECT_basics

# Q1

SELECT population
FROM world
WHERE name = 'Germany';

# Q2

SELECT name, population 
FROM world
WHERE name IN ('Ireland', 'Iceland', 'Denmark');

# Q3

SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000;
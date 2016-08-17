# http://sqlzoo.net/wiki/Self_join

# Q1

SELECT COUNT(id)
FROM stops;

# Q2

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

# Q3

SELECT id, name
FROM stops JOIN route
ON id = stop
WHERE num = 4 AND company = 'LRT';

# Q4

SELECT company, num, COUNT(*)
FROM route WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;

# Q5

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b 
ON (a.company = b.company AND a.num = b.num)
WHERE a.stop=53 AND  a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart') AND b.stop = (SELECT id FROM stops WHERE name = 'London Road');

# Q6

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'AND stopb.name = 'London Road';

# Q7

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 115 AND b.stop = 137;

# Q8

SELECT a.company, a.num
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart') AND b.stop = (SELECT id FROM stops WHERE name = 'Tollcross');

# Q9

SELECT name, a.company, a.num
FROM (route a JOIN route b ON a.company = b.company AND a.num = b.num) JOIN stops ON id = a.stop
WHERE b.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart');

# Q10

# Solution from fcarrara => https://github.com/fcarrara/sql_zoo/blob/master/9_self_join.sql

SELECT DISTINCT an, ac, stops.name, dn, dc
FROM (SELECT a.num as an, a.company as ac, b.stop as bstop
      FROM route a JOIN route b 
      JOIN stops s ON a.num=b.num AND s.id=a.stop
      WHERE s.name='Craiglockhart') T1
JOIN (SELECT d.num as dn, d.company as dc, c.stop as cstop
      FROM route c JOIN route d 
      JOIN stops s ON c.num=d.num AND c.company=d.company AND s.id=d.stop
      WHERE s.name='Sighthill') T2
JOIN stops ON bstop=cstop AND bstop=stops.id
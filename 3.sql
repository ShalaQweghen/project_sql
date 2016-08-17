# http://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial

# Q1

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

# Q2

SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature';

# Q3

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

# Q4

SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject = 'Peace';

# Q5

SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

# Q6

SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter');

# Q7

SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

# Q8

SELECT *
FROM nobel
WHERE (yr = 1980 AND subject = 'Physics') OR (yr = 1984 AND subject = 'Chemistry');

# Q9

SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

# Q10

SELECT *
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

# Harder Questions

# Q11

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

# Q12

SELECT *
FROM nobel
WHERE winner = 'EUGENE O\'NEILL';

# Q13

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir_%'
ORDER BY yr DESC;

# Q14

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'),subject,winner;
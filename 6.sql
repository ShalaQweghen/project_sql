# http://sqlzoo.net/wiki/The_JOIN_operation

# Q1

SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';

# Q2

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

# Q3

SELECT player, teamid, stadium, mdate
FROM game JOIN goal 
ON id = matchid
WHERE teamid = 'GER';

# Q4

SELECT team1, team2, player
FROM game JOIN goal 
ON id = matchid
WHERE player LIKE 'Mario%';

# Q5

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam
ON teamid = id
WHERE gtime <= 10;

# Q6

SELECT mdate, teamname
FROM game JOIN eteam
ON team1 = eteam.id
WHERE coach = 'Fernando Santos';

# Q7

SELECT player
FROM goal JOIN game
ON matchid = id
WHERE stadium = 'National Stadium, Warsaw';

# More Difficult Questions

# Q8

SELECT DISTINCT player
FROM game JOIN goal 
ON matchid = id 
WHERE (team1='GER' OR team2='GER') AND teamid <> 'GER';

# Q9

SELECT teamname, COUNT(matchid)
FROM eteam JOIN goal 
ON id = teamid
GROUP BY teamname;

# Q10

SELECT stadium, COUNT(matchid)
FROM game JOIN goal
ON id = matchid
GROUP BY stadium;

# Q11

SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal 
ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY mdate, matchid;

# Q12

SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal
ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

# Q13

# Two rows are missing from the database so it doesn't show as completed.

SELECT mdate, team1, SUM(score1) AS score1, team2, SUM(score2) AS score2
FROM (SELECT mdate, team1, CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1, team2, CASE WHEN teamid=team2 THEN 1 ELSE 0 END score2
FROM game JOIN goal 
ON matchid = id) a
GROUP BY mdate, team1, team2;


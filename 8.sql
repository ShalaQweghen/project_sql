# http://sqlzoo.net/wiki/Using_Null

# Q1

SELECT name
FROM teacher
WHERE dept IS NULL;

# Q2

SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON teacher.dept = dept.id;

# Q3

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept 
ON dept.id = teacher.dept;

# Q4

SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept 
ON dept.id = teacher.dept;

# Q5

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

# Q6

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
ON teacher.dept = dept.id;

# Q7

SELECT COUNT(name), COUNT(mobile)
FROM teacher;

# Q8

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept
ON teacher.dept = dept.id
GROUP BY dept.name;

# Q9

SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END
FROM teacher;

# Q10

SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END
FROM teacher;
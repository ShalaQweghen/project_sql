# http://sqlzoo.net/wiki/NSS_Tutorial

# Q1

SELECT A_STRONGLY_AGREE
FROM nss
WHERE question = 'Q01' AND institution = 'Edinburgh Napier University' AND subject = '(8) Computer Science';

# Q2

SELECT institution, subject
FROM nss
WHERE score >= 100 AND question = 'Q15';

# Q3

SELECT institution, score
FROM nss
WHERE question = 'Q15' AND subject = '(8) Computer Science' AND score < 50;

# Q4

SELECT subject, SUM(response)
FROM nss
WHERE question='Q22' AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

# Q5

SELECT subject, SUM((response*A_STRONGLY_AGREE)/100)
FROM nss
WHERE question='Q22' AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

# Q6, Q7, Q8 are mathematically too complex for me :)
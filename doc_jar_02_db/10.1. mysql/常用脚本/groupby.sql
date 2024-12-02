GROUP BY age
HAVING  COUNT(e.`age`) > 1;
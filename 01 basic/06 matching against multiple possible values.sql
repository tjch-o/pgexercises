SELECT *
FROM cd.facilities
WHERE facid % 4 = 1
LIMIT 2;
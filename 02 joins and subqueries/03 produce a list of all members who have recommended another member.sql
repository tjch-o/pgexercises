SELECT DISTINCT first.firstname,
    first.surname
FROM cd.members first
    JOIN cd.members second ON first.memId = second.recommendedBy
ORDER BY first.surname,
    first.firstname;
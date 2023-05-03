SELECT first.firstname,
    first.surname,
    second.firstname,
    second.surname
FROM cd.members first
    LEFT JOIN cd.members second ON second.memId = first.recommendedBy
ORDER BY (first.surname, first.firstname);
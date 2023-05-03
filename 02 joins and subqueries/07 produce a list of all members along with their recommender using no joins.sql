SELECT DISTINCT CONCAT(firstname, ' ', surname) as membername,
    (
        SELECT CONCAT(firstname, ' ', surname)
        FROM cd.members recommender
        WHERE member.recommendedBy = recommender.memId
    )
FROM cd.members member
ORDER BY membername;
SELECT name,
    CASE
        WHEN monthlymaintenance > 100 then 'expensive'
        ELSE 'cheap'
    END AS cost
FROM cd.facilities;
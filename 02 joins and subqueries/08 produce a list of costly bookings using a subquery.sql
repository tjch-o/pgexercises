SELECT member,
    facility,
    cost
FROM
    /* we calculate the cost inside a subquery then we will filter the result; without the subquery we
     would have to do the computation twice as seen in 06; we also need the aliasing "result" assigned 
     to the subquery so that the outer query knows to use the inside query */
    (
        SELECT CONCAT(firstname, ' ', surname) as member,
            facil.name as facility,
            CASE
                WHEN member.memid = 0 then bk.slots * guestcost
                ELSE bk.slots * membercost
            END AS cost
        FROM cd.members member
            JOIN cd.bookings bk ON member.memid = bk.memid
            JOIN cd.facilities facil ON bk.facid = facil.facid
        WHERE bk.starttime > '2012-09-14'
            AND bk.starttime < '2012-09-15'
    ) as result
WHERE cost > 30
ORDER BY cost DESC;
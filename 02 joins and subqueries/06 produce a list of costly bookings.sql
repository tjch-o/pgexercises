SELECT CONCAT(firstname, ' ', surname) as member,
    facil.name as facility,
    CASE
        WHEN members.memid = 0 THEN bookings.slots * facil.guestcost
        ELSE bookings.slots * facil.membercost
    END AS cost
FROM cd.members members
    JOIN cd.bookings bookings ON members.memid = bookings.memid
    JOIN cd.facilities facil ON bookings.facid = facil.facid
WHERE bookings.starttime > '2012-09-14'
    AND bookings.starttime < '2012-09-15'
    AND
    /* we cannot simply use cost > 30 because the WHERE is evaluated before the SELECT since the 
     filtering is done before the records are selected */
    (
        (
            members.memid = 0
            AND bookings.slots * facil.guestcost > 30
        )
        OR (
            members.memid != 0
            AND bookings.slots * facil.membercost > 30
        )
    )
ORDER BY cost DESC;
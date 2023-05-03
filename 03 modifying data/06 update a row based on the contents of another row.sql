UPDATE cd.facilities
SET membercost = (
        SELECT membercost * 1.1
        FROM cd.facilities
        WHERE name = 'Tennis Court 1'
    ),
    guestcost = (
        SELECT guestcost * 1.1
        FROM cd.facilities
        WHERE name = 'Tennis Court 1'
    )
WHERE name = 'Tennis Court 2';
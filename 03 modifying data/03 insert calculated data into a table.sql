INSERT INTO cd.facilities (
        facid,
        name,
        membercost,
        guestcost,
        initialoutlay,
        monthlymaintenance
    )
    /* in this case we are not inserting a constant value so VALUES does not work */
SELECT (
        SELECT MAX(facid)
        FROM cd.facilities
    ) + 1,
    'Spa',
    20,
    30,
    100000,
    800;
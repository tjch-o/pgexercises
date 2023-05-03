SELECT DISTINCT CONCAT(firstname, ' ', surname) as membername,
    facil.name
FROM cd.members as members
    JOIN cd.bookings as bookings ON members.memid = bookings.memid
    JOIN cd.facilities as facil ON bookings.facid = facil.facid
WHERE facil.name LIKE '%Tennis Court%'
ORDER BY membername,
    facil.name;
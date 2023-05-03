SELECT bk.starttime,
    facil.name
FROM cd.bookings bk
    JOIN cd.facilities facil ON facil.facid = bk.facid
WHERE bk.starttime > '2012-09-21'
    AND bk.starttime < '2012-09-22'
    AND facil.name LIKE '%Tennis Court%'
ORDER BY bk.starttime ASC;
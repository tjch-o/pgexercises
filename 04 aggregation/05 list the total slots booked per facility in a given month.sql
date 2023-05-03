select facid,
    sum(slots)
from cd.bookings
where starttime >= '2012-09-01'
    and starttime < '2012-10-01'
group by facid
order by sum(slots) ASC;
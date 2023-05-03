select facid,
    sum(slots)
from cd.bookings
group by facid
    /* having is different from the where clause since where filters what is passed into the aggregate
     function sum while having filters the values after they are output from the aggregate function  */
having sum(slots) > 1000
order by facid;
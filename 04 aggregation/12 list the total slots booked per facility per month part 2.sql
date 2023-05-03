select facid,
    extract(
        month
        from starttime
    ) as month,
    sum(slots)
from cd.bookings
where starttime >= '2012-01-01'
    and starttime < '2013-01-01'
/* must use rollup here because without it we do not handle the case where month is null for the
specific faculty */
group by rollup(facid, month)
order by facid,
    month;
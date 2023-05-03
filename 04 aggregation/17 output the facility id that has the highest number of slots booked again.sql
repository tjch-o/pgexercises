select facid,
    totalslots
from (
        select facid,
            sum(slots) totalslots,
            /* we use rank to pick all the tieing results to output */
            rank() over (
                order by sum(slots) desc
            )
        from cd.bookings
        group by facid
    ) as result
where rank = 1;
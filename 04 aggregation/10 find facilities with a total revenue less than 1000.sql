select name,
    revenue
from (
        select facil.name,
            sum(
                case
                    when bk.memid = 0 then bk.slots * facil.guestcost
                    else bk.slots * facil.membercost
                end
            ) as revenue
        from cd.facilities facil
            join cd.bookings bk on bk.facid = facil.facid
            /* if we group by facil.name then it must appear in the select statement or inside 
            the aggregate function */
        group by facil.name
    ) as result
where revenue < 1000
order by revenue;
select name,
    sum(
        case
            when bk.memid = 0 then bk.slots * facil.guestcost
            else bk.slots * facil.membercost
        end
    ) as revenue
from cd.facilities facil
    join cd.bookings bk on bk.facid = facil.facid
group by facil.name
order by revenue;
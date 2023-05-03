with result as (
    select f.name,
        f.monthlymaintenance,
        f.initialoutlay,
        case
            when bk.memid = 0 then bk.slots * guestcost
            else bk.slots * membercost
        end as revenue
    from cd.bookings bk
        join cd.facilities f on bk.facid = f.facid
)
select name,
    /* we found the sum of the booking revenues for 3 months so we have to divide by 3 for the 
    average of the 3 months */
    initialoutlay / (sum(revenue) / 3.0 - monthlymaintenance) as months
from result
group by name,
    monthlymaintenance,
    initialoutlay
order by name;
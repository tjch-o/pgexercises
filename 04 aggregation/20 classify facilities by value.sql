with revenues as (
    select f.name,
        case
            when memid = 0 then bk.slots * f.guestcost
            else bk.slots * f.membercost
        end as revenue
    from cd.bookings bk
        join cd.facilities f on f.facid = bk.facid
)
select name,
    case
        ntile(3) over (
            order by sum(revenue) desc
        )
        when 1 then 'high'
        when 2 then 'average'
        else 'low'
    end as class
from revenues
group by name
/* we cannot order using the class alias simply because it will order by the output "high" 
"average" "low" and 'high' will always be in the middle when what we actually want is to order by
the buckets */
order by ntile(3) over (
        order by sum(revenue) desc
    ),
    name;
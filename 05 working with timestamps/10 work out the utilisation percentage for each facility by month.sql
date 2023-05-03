with monthly_bookings as (
    select f.name,
        date_trunc('month', bk.starttime) as month,
        extract(
            /* date_trunc finds the first day of the month then we find how many days are there */
            day
            FROM (
                    date_trunc('month', bk.starttime) + '1 month' - date_trunc('month', bk.starttime)
                )
        ) as month_length,
        sum(bk.slots) as total_slots
    from cd.bookings bk
        join cd.facilities f on bk.facid = f.facid
    group by f.name,
        month
)
SELECT name,
    month,
    cast(
        /* there are 25 slots from 8am to 8.30pm */
        (total_slots * 100 / (25 * month_length)) as numeric (3, 1)
    ) as utilisation
from monthly_bookings
order by name,
    month;
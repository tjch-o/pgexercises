select date_trunc('month', bk.starttime) as month,
    count(*)
from cd.bookings bk
group by month
order by month;
select starttime,
    starttime + slots * (interval '30 minutes') as endtime
from cd.bookings
/* if you just do order by endtime, starttime desc they will treat that you want to sort endtime 
as asc and starttime as desc rather than both desc */
order by endtime desc,
    starttime desc
limit 10;
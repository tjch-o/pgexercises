select bk.facid,
    f.name,
    round(sum(slots * 0.5), 2)
from cd.bookings bk
    join cd.facilities f on f.facid = bk.facid
group by bk.facid,
    f.name
order by bk.facid;
select m.surname,
    m.firstname,
    m.memid,
    min(bk.starttime)
from cd.bookings bk
    join cd.members m on m.memid = bk.memid
where bk.starttime > '2012-09-01'
group by m.memid
order by m.memid;
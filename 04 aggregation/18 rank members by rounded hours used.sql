select firstname,
    surname,
    round(sum(bk.slots) * 0.5 / 10) * 10 as hours,
    rank() over (
        order by round(sum(bk.slots) * 0.5 / 10) * 10 desc
    ) as rank
from cd.members m
    join cd.bookings bk on m.memid = bk.memid
group by firstname,
    surname
order by rank,
    surname,
    firstname;
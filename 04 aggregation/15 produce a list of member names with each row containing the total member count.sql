select (
        select count(*)
        from cd.members
    ),
    firstname,
    surname
from cd.members
group by firstname,
    surname,
    joindate
order by joindate;
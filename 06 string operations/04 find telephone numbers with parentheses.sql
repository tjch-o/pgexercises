select memid,
    telephone
from cd.members
where telephone like '%(%'
    and telephone like '%)%';

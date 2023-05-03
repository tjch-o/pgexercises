select memid,
    telephone
from cd.members
where telephone ilike '%(%'
    and telephone like '%)%';
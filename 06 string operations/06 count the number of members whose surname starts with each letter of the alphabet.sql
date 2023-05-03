select substring(surname, 1, 1) as firstchar,
    /* cannot use firstchar here as it has not been defined yet when the count is evaluated they 
    are in the same clause */
    count(substring(surname, 1, 1))
from cd.members
group by firstchar
order by firstchar;
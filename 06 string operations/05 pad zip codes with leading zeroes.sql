select lpad(cast(zipcode as char(5)), 5, '0') as newzipcode
from cd.members
order by newzipcode;
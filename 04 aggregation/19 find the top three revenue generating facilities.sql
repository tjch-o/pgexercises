select name,
	rank
from (
		select f.name,
			rank() over (
				order by sum(
						case
							when bk.memid = 0 then slots * f.guestcost
							else slots * f.membercost
						end
					) desc
			) as rank
		from cd.bookings bk
			join cd.facilities f on f.facid = bk.facid
		group by f.name
	) as result
order by rank
limit 3;
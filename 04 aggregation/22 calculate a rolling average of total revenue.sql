select aug2012.date,
    (
        select sum(
                case
                    when bk.memid = 0 then slots * f.guestcost
                    else bk.slots * f.membercost
                end
            ) as revenue
        from cd.bookings bk
            join cd.facilities f on bk.facid = f.facid
        where bk.starttime >= aug2012.date - interval '14 days'
            and bk.starttime < aug2012.date + interval '1 day'
    ) / 15.0 as last15dayavg
from (
        /* we need to type cast here because generate series generates timestamps but we want the 
        date only */
        select cast(
                generate_series(timestamp '2012-08-01', '2012-08-31', '1 day') as date
            ) as date
    ) as aug2012
order by aug2012.date;
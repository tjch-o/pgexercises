SELECT bookings.starttime
FROM cd.bookings bookings,
    cd.members members
WHERE members.firstname = 'David'
    AND members.surname = 'Farrell'
    AND members.memid = bookings.memid;
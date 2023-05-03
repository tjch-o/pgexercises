DELETE FROM cd.members members
WHERE members.memid NOT IN (
        SELECT memid
        FROM cd.bookings
    );
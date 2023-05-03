/* you cannot just extract seconds it will give you 0 */
select extract(
        days
        from timestamp '2012-09-02 00:00:00' - timestamp '2012-08-31 01:00:00'
    ) * 24 * 60 * 60 + extract(
        hours
        from timestamp '2012-09-02 00:00:00' - timestamp '2012-08-31 01:00:00'
    ) * 60 * 60 + extract(
        minutes
        from timestamp '2012-09-02 00:00:00' - timestamp '2012-08-31 01:00:00'
    ) * 60 + extract(
        seconds
        from timestamp '2012-09-02 00:00:00' - timestamp '2012-08-31 01:00:00'
    );
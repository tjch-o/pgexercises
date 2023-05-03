select concat(
        extract(
            day
            from date_trunc('month', timestamp '2012-02-11') + '1 month' - timestamp '2012-02-11'
        ),
        ' days'
    );
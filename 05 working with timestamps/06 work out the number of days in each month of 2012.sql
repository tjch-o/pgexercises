select extract(
        month
        from result
    ) as month,
    (result + '1 month') - result as length
from generate_series(
        timestamp '2012-01-01',
        timestamp '2012-12-31',
        '1 month'
    ) as result;
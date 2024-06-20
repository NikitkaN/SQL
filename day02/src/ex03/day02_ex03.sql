WITH cte_missing_dates(missing_date) as (
    (SELECT days::DATE as missing_date
    FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') as days
    )
)
SELECT missing_date FROM cte_missing_dates
FULL JOIN
    (SELECT *
    FROM person_visits WHERE person_id = 1 or person_id = 2
    and visit_date BETWEEN '2022-01-01' and '2022-01-10') as d
on missing_date = d.visit_date WHERE d.person_id is NULL
ORDER BY missing_date;
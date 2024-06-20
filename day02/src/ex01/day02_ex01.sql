SELECT days::DATE as missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') as days
FULL JOIN
    (SELECT *
    FROM person_visits WHERE person_id = 1 or person_id = 2
    and visit_date between '2022-01-01' and '2022-01-10') as d
on days = d.visit_date
WHERE d.person_id is NULL
ORDER BY days;
SELECT (
    SELECT name
    FROM person 
    WHERE id = pv.person_id
    ) as person_name,
       
    (
    SELECT name
    FROM pizzeria
    WHERE id = pv.pizzeria_id
    ) as pizzeria_name,
    pv.visit_date
FROM (
    SELECT person_id, pizzeria_id, visit_date 
    FROM person_visits 
    WHERE visit_date between '2022-01-07' and '2022-01-09'
    ) as pv
ORDER by person_name, pizzeria_name desc;
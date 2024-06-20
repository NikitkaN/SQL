CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats as 
(SELECT pizzeria.name as pizzeria_name
FROM person_visits
INNER JOIN person on person_visits.person_id = person.id
INNER JOIN menu on person_visits.pizzeria_id = menu.pizzeria_id
INNER JOIN pizzeria on menu.pizzeria_id= pizzeria.id
WHERE person.name = 'Dmitriy' and price < 800 and visit_date = '2022-01-08'
ORDER BY pizzeria_name
);
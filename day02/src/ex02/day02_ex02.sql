SELECT COALESCE(person.name, '-'), visit_date as visit_date, 
	   COALESCE(pizzeria.name, '-') as pizzeria_name
FROM
    (SELECT *
     FROM person_visits
     WHERE visit_date between '2022-01-01' and '2022-01-03') as date
FULL JOIN pizzeria on date.pizzeria_id = pizzeria.id
FULL JOIN person on date.person_id = person.id
ORDER BY 1, 2, 3;
SELECT name, rating
FROM pizzeria
GROUP by rating, name
HAVING rating >= 3.5 and rating <= 5;

SELECT name, rating 
FROM pizzeria
WHERE rating between 3.5 and 5
ORDER by rating;
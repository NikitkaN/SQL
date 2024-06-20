WITH RECURSIVE total (tour, point1, point2, cost, total_cost) as (
    SELECT n.point1 as tour, n.point1, n.point2, n.cost, n.cost as total_cost
    FROM nodes n WHERE n.point1 = 'a'
    UNION ALL
    SELECT parent.tour || ',' || child.point1, child.point1, child.point2, child.cost, parent.total_cost + child.cost
    FROM total as parent
    INNER JOIN (SELECT * FROM nodes) as child on child.point1 = parent.point2
    WHERE tour NOT LIKE '%' || child.point1 || '%')


SELECT t.total_cost, '{' || t.tour || ',' || t.point2 || '}' as tour
FROM total t
WHERE point2 = 'a'
  AND length(tour) = 7
  AND (t.total_cost = (SELECT min(t.total_cost)
                       FROM total t
                       WHERE point2 = 'a' AND length(tour) = 7)
    or t.total_cost = (SELECT max(t.total_cost)
                       FROM total t
                       WHERE point2 = 'a' AND length(tour) = 7)
    )
ORDER BY t.total_cost, tour;
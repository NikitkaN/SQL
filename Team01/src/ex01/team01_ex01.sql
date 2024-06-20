insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

select coalesce("user".name, 'not defined') as name,
       coalesce("user".lastname, 'not defined') as lastname,
       c.name as currency_name,
       coalesce(cp.past, cp.future) * cp.money as currency_in_usd
from balance left join "user" ON balance.user_id = "user".id
    left join (select b.user_id,
                           b.money, b.currency_id,
                           (select c.rate_to_usd from currency c where c.id = b.currency_id
                                        and c.updated <= b.updated order by c.updated desc limit 1) as past,
                           (select c.rate_to_usd from currency c where c.id = b.currency_id
                                        and c.updated >= b.updated order by c.updated limit 1) as future
                    from balance b) as cp on balance.user_id = cp.user_id
         right join currency c on cp.currency_id = c.id
        group by "user".name, currency_in_usd, lastname, currency_name
order by name desc , lastname, currency_name asc;

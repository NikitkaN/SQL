WITH t1 AS( 
       SELECT COALESCE("user".name, 'not defined') AS name,
              COALESCE("user".lastname, 'not defined') AS lastname,
              balance.type, SUM(balance.money) AS volume, currency_id

       FROM balance
       LEFT JOIN currency ON currency.id = balance.currency_id AND currency.updated = balance.updated
       LEFT JOIN "user" ON "user".id = balance.user_id
       GROUP BY "user".id, balance.type, balance.currency_id
), t2 AS (
       SELECT currency.id, MAX(currency.updated) AS updated
       FROM currency
       GROUP BY currency.id
), t3 AS (
       SELECT currency.*
       FROM currency 
       RIGHT JOIN t2 ON currency.id = t2.id AND currency.updated = t2.updated)

SELECT t1.name, t1.lastname, t1.type, t1.volume,
       COALESCE(t3.name, 'not defined') AS currency_name,
       COALESCE(t3.rate_to_usd, 1) AS last_rate_to_usd,
       t1.volume * COALESCE(t3.rate_to_usd, 1) AS total_volume_in_usd

FROM t1
LEFT JOIN t3 ON t3.id = t1.currency_id
ORDER BY name DESC, lastname ASC, type ASC;
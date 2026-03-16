-- Клієнти, які ніколи не замовляли струни для гітари (category = 'guitar_strings')
-- через LEFT OUTER JOIN
SELECT c.customer_id, c.full_name
FROM customer c
LEFT JOIN "order" o
  ON o.customer_id = c.customer_id
LEFT JOIN order_item oi
  ON oi.order_id = o.order_id
LEFT JOIN product p
  ON p.product_id = oi.product_id
  AND p.category = 'guitar_strings'
GROUP BY c.customer_id, c.full_name
HAVING COUNT(p.product_id) = 0
ORDER BY c.customer_id;

-- через NOT EXISTS
SELECT c.customer_id, c.full_name
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM "order" o
    JOIN order_item oi ON oi.order_id = o.order_id
    JOIN product p     ON p.product_id = oi.product_id
    WHERE o.customer_id = c.customer_id
      AND p.category = 'guitar_strings'
)
ORDER BY c.customer_id;

-- через NOT IN
SELECT c.customer_id, c.full_name
FROM customer c
WHERE c.customer_id NOT IN (
    SELECT DISTINCT o.customer_id
    FROM "order" o
    JOIN order_item oi ON oi.order_id = o.order_id
    JOIN product p     ON p.product_id = oi.product_id
    WHERE p.category = 'guitar_strings'
)
ORDER BY c.customer_id;

-- через EXCEPT (операція над множинами)
SELECT c.customer_id, c.full_name
FROM customer c

EXCEPT

-- Клієнти, які хоч раз замовляли guitar_strings
SELECT DISTINCT c2.customer_id, c2.full_name
FROM customer c2
JOIN "order" o   ON o.customer_id = c2.customer_id
JOIN order_item oi ON oi.order_id = o.order_id
JOIN product p     ON p.product_id = oi.product_id
WHERE p.category = 'guitar_strings'
ORDER BY customer_id;


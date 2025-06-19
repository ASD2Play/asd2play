SELECT id, product_ids
FROM transactions
WHERE product_ids IS NOT NULL
LIMIT 10;

INSERT INTO transaction_products (transaction_id, product_id)
SELECT id as transaction_id,
    CAST(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(product_ids, ',', numbers.n), ',', -1)) AS UNSIGNED) as product_id
FROM transactions
CROSS JOIN (
    SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL 
    SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL 
    SELECT 9 UNION ALL SELECT 10
) numbers
WHERE product_ids IS NOT NULL
AND CHAR_LENGTH(product_ids) - CHAR_LENGTH(REPLACE(product_ids, ',', '')) >= numbers.n - 1;

SELECT p.id, p.product_name,
    COUNT(tp.product_id) as vezes_vendido
FROM products p
LEFT JOIN transaction_products tp ON p.id = tp.product_id
GROUP BY p.id, p.product_name
ORDER BY vezes_vendido DESC;

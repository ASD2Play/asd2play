-- Media de ventas por país, ordenada de mayor a menor
SELECT c.country as pais, AVG(t.amount) AS media_ventas
FROM company c
JOIN transaction t ON c.id = t.company_id
WHERE t.declined = 0
GROUP BY c.country
ORDER BY media_ventas DESC;

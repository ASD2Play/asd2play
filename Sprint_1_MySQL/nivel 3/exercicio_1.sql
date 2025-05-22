-- Transacciones entre 100-200 euros en fechas específicas
SELECT c.company_name AS nombre, c.phone AS telefono, c.country AS pais,
	DATE(t.timestamp) AS fecha, t.amount AS cantidad
FROM company c
JOIN transaction t ON c.id = t.company_id
WHERE t.amount BETWEEN 100 AND 200
		AND DATE(timestamp) IN ('2021-04-29', '2021-07-20', '2022-03-13')
ORDER BY t.amount DESC;
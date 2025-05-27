-- Lista de los países que están realizando compras
SELECT DISTINCT c.country
FROM company c
JOIN transaction t ON c.id = t.company_id
ORDER BY c.country;

-- Cantidad de países desde los que se realizan compras
SELECT COUNT(DISTINCT c.country) AS cantidad_paises
FROM company c
JOIN transaction t on c.id = t.company_id;

-- Empresa con el promedio más alto de ventas
SELECT c.id, c.company_name, c.country,
	AVG(t.amount) AS promedio_ventas
FROM company c
JOIN transaction t on c.id = t.company_id
WHERE t.declined = 0
GROUP BY c.id, c.company_name, c.country
ORDER BY promedio_ventas DESC
LIMIT 1;

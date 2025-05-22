-- Identifica los cinco días que generaron la mayor cantidad de ingresos por ventas
SELECT DATE(timestamp) AS fecha_transaccion,
		SUM(amount) AS ventas_totales
FROM transaction
WHERE declined = 0
GROUP BY DATE(timestamp)
ORDER BY ventas_totales DESC
LIMIT 5;

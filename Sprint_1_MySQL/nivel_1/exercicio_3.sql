-- Transações realizadas por empresas da Alemanha (usando apenas subconsultas)
SELECT t.id AS transaction_id, t.company_id, t.amount, t.timestamp, t.declined
FROM transaction t
WHERE t.company_id IN (SELECT c.id
			FROM company c
            WHERE c.country ='Germany')
ORDER BY t.timestamp;

SELECT t. *
FROM transaction t
WHERE t.company_id IN (SELECT c.id
			FROM company c
            WHERE c.country ='Germany')
ORDER BY t.timestamp;

-- Liste as empresas que realizaram transações por um valor superior à média de todas as transações
SELECT c.id, c.company_name, c.country
FROM company c
WHERE c.id IN (SELECT DISTINCT t.company_id
				FROM transaction t
                WHERE t.amount > (
					SELECT AVG(t2.amount)
                    FROM transaction t2))
ORDER BY c.company_name;

-- 3. Empresas sin transacciones registradas (que serán eliminadas del sistema)
SELECT 
    c.id, 
    c.company_name, 
    c.country
FROM 
    company c
WHERE 
    c.id NOT IN (
        SELECT DISTINCT t.company_id
        FROM transaction t
        WHERE t.company_id IS NOT NULL
    )
ORDER BY 
    c.company_name;

-- Esta consulta no devuelve resultados porque todas las 100 empresas 
-- en la base de datos tienen al menos una transacción registrada.
-- Por lo tanto, no hay empresas para eliminar del sistema.



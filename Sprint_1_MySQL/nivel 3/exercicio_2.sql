-- Clasificación de empresas según número de transacciones
SELECT 
    c.company_name AS nombre_empresa,
    c.country AS pais,
    COUNT(t.id) AS numero_transacciones,
    CASE
        WHEN COUNT(t.id) > 4 THEN 'Más de 4 transacciones'
        ELSE '4 o menos transacciones'
    END AS clasificacion
FROM 
    company c
LEFT JOIN 
    transaction t ON c.id = t.company_id
GROUP BY 
    c.id, c.company_name, c.country
ORDER BY 
    numero_transacciones DESC, c.company_name;

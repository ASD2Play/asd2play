-- Ver las tablas que vamos a usar
DESCRIBE company;

-- Ver la tabla transaction
DESCRIBE transaction;

-- Crear la vista VistaMarketing
CREATE VIEW VistaMarketing AS
SELECT c.company_name as 'Nombre de la compañia',
		c.phone AS 'Teléfono de contacto',
        c.country AS 'País de residencia',
        ROUND(AVG(t.amount), 2) AS 'Media de compra'
FROM company c
JOIN transaction t ON c.id = t.company_id
GROUP BY c.id, c.company_name, c.phone, c.country
ORDER BY AVG(t.amount) DESC;

-- Mostrar la vista creada
SELECT * FROM VistaMarketing;
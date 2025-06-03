-- Ver campos de cada tabla para la vista
DESCRIBE transaction;

-- Ver campos de user
DESCRIBE user;

-- Ver campos de credit_card
DESCRIBE credit_card;

-- Ver campos de company
DESCRIBE company;

-- Crear vista InformeTecnico
CREATE VIEW InformeTecnico AS
SELECT t.id AS 'ID Transacción',
		u.name AS 'Nombre Usuario',
        u.surname AS 'Apellido Usuario',
        cc.iban AS 'IBAN Tarjeta',
        c.company_name AS 'Nombre Compañía'
FROM transaction t
JOIN user u ON t.user_id = u.id
JOIN credit_card cc ON t.credit_card_id = cc.id
JOIN company c ON t.company_id = c.id
ORDER BY t.id DESC;

-- Mostrar resultados de la vista InformeTecnico
SELECT * FROM InformeTecnico;

-- Mostrar todas las vistas existentes
SHOW FULL TABLES WHERE table_type = 'VIEW';
-- SPRINT 3 - NIVEL 1 - EJERCICIO 1
-- Estado inicial: Verificar tablas existentes

USE transactions;

-- Ver qué tablas tenemos
SHOW TABLES;

-- Creación de la tabla credit_card
CREATE TABLE credit_card (id VARCHAR(20) PRIMARY KEY,
	iban VARCHAR(50), pan VARCHAR(20), pin VARCHAR(10),
    cvv VARCHAR(5), expiring_date VARCHAR(10));
    
-- Verificar que se creó correctamente
DESCRIBE credit_card;

-- Verificar que se creó correctamente
SELECT COUNT(*) as total_registros FROM credit_card;

DESCRIBE transaction;

DESCRIBE company;

-- Ver se já existem relações criadas
SHOW CREATE TABLE transaction;

-- Crear relación entre credit_card y transaction
ALTER TABLE transaction
ADD CONSTRAINT fk_credit_card
FOREIGN KEY (credit_card_id) REFERENCES credit_card(id);

-- Crear relación entre company y transaction
ALTER TABLE transaction
ADD CONSTRAINT fk_company
FOREIGN KEY (company_id) REFERENCES company(id);

-- Verificar que las Foreign Keys se crearon
SHOW CREATE TABLE transaction;
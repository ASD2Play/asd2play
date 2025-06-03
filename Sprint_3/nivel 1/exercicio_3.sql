-- Ver la estructura de la tabla transaction
DESCRIBE transaction;

-- Crear la tarjeta CcU-9999
INSERT INTO credit_card (id, iban, pan, pin, cvv, expiring_date) 
VALUES ('CcU-9999', 'XX999999999999999999', '9999999999999999', '9999', '999', '12/31/25');

-- Crear la empresa b-9999
INSERT INTO company (id, company_name, phone, email, country, website) 
VALUES ('b-9999', 'Empresa Test', '999-999-999', 'test@empresa.com', 'España', 'www.test.com');

-- Insertar la transacción
INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, amount, declined)
VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999', 'b-9999', 9999, 829.999, -117.999, 111.11, 0);
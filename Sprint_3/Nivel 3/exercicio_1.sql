-- Ver qué tablas tenemos actualmente
SHOW TABLES;

-- Crear índice para optimizar búsquedas
CREATE INDEX idx_user_id ON transaction(user_id);

-- Crear la tabla user
CREATE TABLE IF NOT EXISTS user (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        surname VARCHAR(100),
        phone VARCHAR(150),
        email VARCHAR(150),
        birth_date VARCHAR(100),
        country VARCHAR(150),
        city VARCHAR(150),
        postal_code VARCHAR(100),
        address VARCHAR(255)    
    );
    
-- Verificar que la tabla se creó
DESCRIBE user;

-- Desactivar verificación de foreign keys
SET foreign_key_checks = 0;

-- Insertamos datos de user
INSERT INTO user (id, name, surname, phone, email, birth_date, country, city, postal_code, address) VALUES (        "1", "Zeus", "Gamble", "1-282-581-0551", "interdum.enim@protonmail.edu", "Nov 17, 1985",         "United States", "Lowell", "73544", "348-7818 Sagittis St.");
INSERT INTO user (id, name, surname, phone, email, birth_date, country, city, postal_code, address) VALUES (        "2", "Garrett", "Mcconnell", "(718) 257-2412", "integer.vitae.nibh@protonmail.org", "Aug 23, 1992",         "United States", "Des Moines", "59464", "903 Sit Ave");
INSERT INTO user (id, name, surname, phone, email, birth_date, country, city, postal_code, address) VALUES (        "3", "Ciaran", "Harrison", "(522) 598-1365", "interdum.feugiat@aol.org", "Apr 29, 1998",         "United States", "Columbus", "56518", "736-2063 Tellus St.");

-- Verificar que los usuarios se insertaron
SELECT * FROM user;

-- Verificar el total de usuarios
SELECT COUNT(*) AS 'Total de usuarios' FROM user;

-- Reactivar verificación de foreign keys
SET foreign_key_checks = 1;

-- Ver las tablas finales del diagrama
SHOW TABLES;

-- Verificar la tabla
DESCRIBE transaction;

-- Ver conexiones foreign key existentes
SELECT 
    CONSTRAINT_NAME,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'transactions' 
AND REFERENCED_TABLE_NAME IS NOT NULL;

-- Ver estructura completa de transaction
SHOW CREATE TABLE transaction;

-- Crear conexión entre transaction y user
ALTER TABLE transaction 
ADD CONSTRAINT fk_user 
FOREIGN KEY (user_id) REFERENCES user(id);

-- Buscar user_id que faltan en tabla user
SELECT DISTINCT t.user_id 
FROM transaction t 
LEFT JOIN user u ON t.user_id = u.id 
WHERE u.id IS NULL 
AND t.user_id IS NOT NULL;

-- Crear usuario faltante (id 9999)
INSERT INTO user (id, name, surname, phone, email, birth_date, country, city, postal_code, address) 
VALUES (9999, 'Usuario', 'Desconocido', '000-000-0000', 'unknown@email.com', 'Jan 1, 1900', 'Unknown', 'Unknown', '00000', 'Dirección desconocida');

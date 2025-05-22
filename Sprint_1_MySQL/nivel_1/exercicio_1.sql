-- Análisis de la estructura de la base de datos
USE transactions;

-- Verificar las tablas existentes
SHOW TABLES;

-- Verificar la estructura de la tabla company
DESCRIBE company;

-- Verificar la estructura de la tabla transaction
DESCRIBE transaction;

-- Ver ejemplos de datos de la tabla company
SELECT * FROM company LIMIT 5;

-- Ver ejemplos de datos de la tabla transaction
SELECT * FROM transaction LIMIT 5;

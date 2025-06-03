-- Ver la estructura actual de credit_card
DESCRIBE credit_card;

-- Eliminar la columna 'pan'
ALTER TABLE credit_card DROP COLUMN pan;

-- Verificar que la columna se eliminó
DESCRIBE credit_card;
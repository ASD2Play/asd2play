-- Ver el dato actual
SELECT * FROM credit_card WHERE id = 'CcU-2938';

-- Hacer el cambio
UPDATE credit_card
SET iban = 'R323456312213576817699999'
WHERE id = 'CcU-2938';

-- Ver el dato actual
SELECT * FROM credit_card WHERE id = 'CcU-2938';
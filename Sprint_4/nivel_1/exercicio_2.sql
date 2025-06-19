SELECT company_id, company_name
FROM companies
WHERE company_name LIKE '%Donec%';

SELECT cc.iban, FORMAT(AVG(t.amount), 2) as media_amount
FROM credit_cards cc
JOIN transactions t ON cc.id = t.card_id
JOIN companies c ON t.business_id = c.company_id
WHERE c.company_name = 'Donec Ltd'
GROUP BY cc.iban
ORDER BY media_amount DESC;

SELECT FORMAT(AVG(t.amount), 2) as media_global
FROM credit_cards cc
JOIN transactions t ON cc.id = t.card_id
JOIN companies c ON t.business_id = c.company_id
WHERE c.company_name ='Donec ltd';
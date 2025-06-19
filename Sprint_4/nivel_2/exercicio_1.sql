SELECT DISTINCT declined
FROM transactions
ORDER BY declined;

SELECT id, card_id, declined, timestamp
FROM transactions
ORDER BY card_id, timestamp DESC
LIMIT 10;

CREATE TABLE card_status AS SELECT cc.id as card_id, cc.iban,
	CASE WHEN COUNT(CASE WHEN t.declined = '1' THEN 1 END) = 3
    THEN 'Inactive' ELSE 'Active' END as card_status
FROM credit_cards cc
LEFT JOIN (SELECT card_id, declined, ROW_NUMBER() OVER
	(PARTITION BY card_id ORDER BY timestamp DESC) as rn
FROM transactions) t ON cc.id = t.card_id AND t.rn <= 3
GROUP BY cc.id, cc.iban;

SELECT card_status, COUNT(*) as quantidade
FROM card_status
GROUP BY card_status;
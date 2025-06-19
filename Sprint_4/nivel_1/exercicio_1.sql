SHOW VARIABLES LIKE 'secure_file_priv';

CREATE DATABASE sprint4_estrela;

USE sprint4_estrela;

CREATE TABLE users(id INT PRIMARY KEY, name VARCHAR(50),
					 surname VARCHAR(50), phone VARCHAR(20),
                     email VARCHAR(100), birth_date DATE,
                     country VARCHAR(50), city VARCHAR(50),
                     postal_code VARCHAR(20), address VARCHAR(200));
                     
CREATE TABLE companies (company_id VARCHAR(10) PRIMARY KEY,
				company_name VARCHAR(100), phone VARCHAR(20),
                email VARCHAR(100), country VARCHAR(50),
                website VARCHAR(200));
                
CREATE TABLE products(id INT PRIMARY KEY, product_name VARCHAR(100),
				price DECIMAL(10,2), colour VARCHAR(20), weight DECIMAL(5,2));
                
CREATE TABLE credit_cards (id VARCHAR(10) PRIMARY KEY, user_id INT, iban VARCHAR(50),
				pan VARCHAR(20), pin VARCHAR(4), cvv VARCHAR(3), track1 VARCHAR(100),
                track2 VARCHAR(100), expiring_date VARCHAR(10),
                FOREIGN KEY (user_id) REFERENCES users(id));
                
CREATE TABLE transactions (id VARCHAR(50) PRIMARY KEY, card_id VARCHAR(10),
			business_id VARCHAR(10), timestamp DATETIME, amount DECIMAL(10,2),
			declined TINYINT, product_ids VARCHAR(100), user_id INT, lat DECIMAL(10,8),
			longitude DECIMAL(11,8), FOREIGN KEY (card_id) REFERENCES credit_cards(id),
			FOREIGN KEY (business_id) REFERENCES companies(company_id),
			FOREIGN KEY (user_id) REFERENCES users(id));
            
CREATE TABLE transaction_products (id INT AUTO_INCREMENT PRIMARY KEY,
			transaction_id VARCHAR(50), product_id INT,
            FOREIGN KEY (transaction_id) REFERENCES transactions(id),
            FOREIGN KEY (product_id) REFERENCES products(id));
            
            SHOW TABLES;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/american_users.csv'
INTO TABLE users
FIELDS TERMINATED BY','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT id, name, surname, birth_date
FROM users
LIMIT 5;

DELETE FROM users;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/american_users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, name, surname, phone, email, @birth_date_var, country, city, postal_code, address)
SET birth_date = STR_TO_DATE(@birth_date_var, '%b %d, %Y');

SELECT id, name, surname, birth_date, country
FROM users
limit 5;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/european_users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, name, surname, phone, email, @birth_date_var, country, city, postal_code, address)
SET birth_date = STR_TO_DATE(@birth_date_var, '%b %d, %Y');

SELECT id, name, surname, birth_date, country
FROM users
WHERE country = 'United Kingdom'
LIMIT 5;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/companies.csv'
INTO TABLE companies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DELETE FROM products;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, product_name, @price_with_dollar, colour, weight, @warehouse_id)
SET price = CAST(REPLACE(@price_with_dollar, '$', '') AS DECIMAL(10,2));

SELECT id, product_name, price, colour, weight
FROM products
LIMIT 5;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/credit_cards-2.csv'
INTO TABLE credit_cards
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT id, user_id, pan, expiring_date
FROM credit_cards
LIMIT 5;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/transactions-2.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, card_id, business_id, @timestamp_str, amount, declined, @product_ids, user_id, lat, longitude)
SET timestamp = STR_TO_DATE(@timestamp_str, '%m/%d/%y %H:%i'),
    product_ids = @product_ids;
    
SELECT id, card_id timestamp, lat, longitude, amount
FROM transactions
LIMIT 3;

ALTER TABLE transactions
MODIFY COLUMN lat DECIMAL(10,8),
MODIFY COLUMN longitude DECIMAL(11,8);

DELETE FROM transactions;

LOAD DATA LOCAL INFILE '/Users/alaindias/Desktop/BCIT/Sprint_4/Recursos/transactions-2.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, card_id, business_id, @timestamp_str, amount, declined, @product_ids, user_id, lat, longitude)
SET timestamp = STR_TO_DATE(@timestamp_str, '%Y-%m-%d %H:%i:%s'),
    product_ids = @product_ids;

SELECT COUNT(DISTINCT user_id) as total_usuarios
FROM transactions;

SELECT user_id, COUNT(*) as num_transaccions
FROM transactions
GROUP BY user_id
ORDER BY num_transaccions DESC
LIMIT 10;

SELECT u.id, u.name, u.surname, u.email, u.country
FROM users u
WHERE u.id IN (SELECT user_id
			FROM transactions
            GROUP BY user_id
            HAVING COUNT(*) > 80);

CREATE TABLE syntax_practice (
    user_id serial PRIMARY KEY,
    username character varying(12),
    city character varying(128),
    transactions_completed integer,
    transactions_attempted integer,
    account_balance numeric(12,2)
);

INSERT INTO syntax_practice (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 1, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);

--1. Get all users from Chicago:
SELECT * FROM "syntax_practice" WHERE "city"='chicago';

--2. Get all users with username containing 'a':
SELECT * FROM "syntax_practice" WHERE "username" LIKE '%a%';

SELECT * FROM "syntax_practice" WHERE ("account_balance"=0 AND transactions_attempted=0);

--3. Update users with no balance and no attempted transactions to a balance of 10:
UPDATE "syntax_practice" SET "account_balance"=10 WHERE ("account_balance"=0 AND transactions_attempted=0);

--4. Get users with at least 9 attempted transactions:
SELECT * FROM "syntax_practice" WHERE "transactions_attempted">8;

--5. Get 3 richest users, ordered high to low:
SELECT "username", "account_balance" FROM "syntax_practice" ORDER BY "account_balance" DESC LIMIT 3;

--6. Get 3 poorest users, ordered low to high:
SELECT "username", "account_balance" FROM "syntax_practice" ORDER BY "account_balance" LIMIT 3;

--7. Get all users with at least 100 balance:
SELECT * FROM "syntax_practice" WHERE "account_balance">100;

--8. Add a user:
INSERT INTO "syntax_practice" ("username", "city", "transactions_completed", "transactions_attempted", "account_balance")
VALUES ('milo', 'atlantis', 7, 12, 666.00);

--9. Delete users with fewer than 5 transactions in Miami and Phoenix:
DELETE FROM "syntax_practice" WHERE (("city"='phoenix' OR "city"='miami') AND "transactions_completed" < 5);

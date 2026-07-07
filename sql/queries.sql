-- Total records
SELECT COUNT(*) AS total_transactions
FROM credit_card_transactions;

-- Data preview
SELECT *
FROM credit_card_transactions
LIMIT 10;

--Fraud vs Non-Fraud count
SELECT
    class,
    COUNT(*) AS count
FROM credit_card_transactions
GROUP BY class;

-- Fraud percentage
SELECT
    class,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 4) AS percentage
FROM credit_card_transactions
GROUP BY class;

-- Check for NULL values
SELECT
    COUNT(*) - COUNT(time) AS time_nulls,
    COUNT(*) - COUNT(amount) AS amount_nulls,
    COUNT(*) - COUNT(class) AS class_nulls
FROM credit_card_transactions;

-- Summary statistics
SELECT
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    AVG(amount) AS avg_amount,
    STDDEV(amount) AS std_amount
FROM credit_card_transactions;

-- Top 10 highest transaction amounts
SELECT
    time,
    amount,
    class
FROM credit_card_transactions
ORDER BY amount DESC
LIMIT 10;

-- Fraud transaction amount statistics
SELECT
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    AVG(amount) AS avg_amount
FROM credit_card_transactions
WHERE class = 1;

-- Legitimate transaction amount statistics
SELECT
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    AVG(amount) AS avg_amount
FROM credit_card_transactions
WHERE class = 0;

-- Time range
SELECT
    MIN(time) AS first_transaction,
    MAX(time) AS last_transaction
FROM credit_card_transactions;

-- 1:1y (клієнт обов'язково має профіль, профіль завжди належить одному клієнту)
DROP TABLE IF EXISTS customer_profile_11y CASCADE;
DROP TABLE IF EXISTS customer_11y CASCADE;

CREATE TABLE customer_11y (
    customer_id   SERIAL PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL
);

CREATE TABLE customer_profile_11y (
    customer_id   INTEGER PRIMARY KEY,
    address       VARCHAR(200) NOT NULL,
    phone         VARCHAR(30),
    CONSTRAINT fk_profile_customer_11y
        FOREIGN KEY (customer_id)
        REFERENCES customer_11y (customer_id)
        ON DELETE CASCADE
);

INSERT INTO customer_11y (full_name) VALUES
    ('Olena 11y'),
    ('Oleksandr 11y'),
    ('Yaroslav 11y');

INSERT INTO customer_profile_11y (customer_id, address, phone) VALUES
    (1, 'Kyiv, Street A', '+380441111111'),
    (2, 'Lviv, Street B', '+380442222222'),
    (3, 'Odesa, Street C', '+380443333333');

-- всі клієнти мають записи профілю
SELECT
    c.customer_id,
    c.full_name,
    p.address,
    p.phone
FROM customer_11y c
JOIN customer_profile_11y p
    ON p.customer_id = c.customer_id
ORDER BY c.customer_id;


-- 1y:1y (обидві сторони з необов'язковою участю)
DROP TABLE IF EXISTS customer_profile_1y1y CASCADE;
DROP TABLE IF EXISTS customer_1y1y CASCADE;

CREATE TABLE customer_1y1y (
    customer_id   SERIAL PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL
);

CREATE TABLE customer_profile_1y1y (
    customer_id   INTEGER PRIMARY KEY,
    address       VARCHAR(200) NOT NULL,
    phone         VARCHAR(30),
    CONSTRAINT fk_profile_customer_1y1y
        FOREIGN KEY (customer_id)
        REFERENCES customer_1y1y (customer_id)
        ON DELETE CASCADE
);
-- Наповнення даними:
--  - у Olena та Oleksandr є профілі
--  - у Dave немає профілю
INSERT INTO customer_1y1y (full_name) VALUES
    ('Olena 1y1y'),
    ('Oleksandr 1y1y'),
    ('Yaroslav 1y1y');  -- без профілю

INSERT INTO customer_profile_1y1y (customer_id, address, phone) VALUES
    (1, 'Kyiv, Street X', '+380501111111'),
    (2, 'Lviv, Street Y', '+380502222222');

-- клієнти без профілю
SELECT
    c.customer_id,
    c.full_name,
    p.address,
    p.phone
FROM customer_1y1y c
LEFT JOIN customer_profile_1y1y p
    ON p.customer_id = c.customer_id
ORDER BY c.customer_id;

-- клієнти з профілем
SELECT
    c.customer_id,
    c.full_name,
    p.address,
    p.phone
FROM customer_1y1y c
JOIN customer_profile_1y1y p
    ON p.customer_id = c.customer_id
ORDER BY c.customer_id;


-- 1:1 (обидві сторони обов'язкові в логічній моделі)
DROP TABLE IF EXISTS customer_profile_11 CASCADE;
DROP TABLE IF EXISTS customer_11 CASCADE;

CREATE TABLE customer_11 (
    customer_id   SERIAL PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL
);


CREATE TABLE customer_profile_11 (
    customer_id   INTEGER PRIMARY KEY,
    address       VARCHAR(200) NOT NULL,
    phone         VARCHAR(30),
    CONSTRAINT fk_profile_customer_11
        FOREIGN KEY (customer_id)
        REFERENCES customer_11 (customer_id)
        ON DELETE CASCADE
);

-- Для демонстрації "обидві сторони обов'язкові" ми вставляємо профіль  для кожного клієнта

INSERT INTO customer_11 (full_name) VALUES
    ('Olena 11'),
    ('Oleksandr 11'),
    ('Yaroslav 11');

INSERT INTO customer_profile_11 (customer_id, address, phone) VALUES
    (1, 'Kyiv, Street 1', '+380111111111'),
    (2, 'Lviv, Street 2', '+380222222222'),
    (3, 'Odesa, Street 3', '+380333333333');

SELECT
    c.customer_id,
    c.full_name,
    p.address,
    p.phone
FROM customer_11 c
JOIN customer_profile_11 p
    ON p.customer_id = c.customer_id
ORDER BY c.customer_id;


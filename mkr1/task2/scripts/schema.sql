DROP TABLE IF EXISTS order_item CASCADE;
DROP TABLE IF EXISTS "order" CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS customer CASCADE;

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    full_name   VARCHAR(100) NOT NULL,
    email       VARCHAR(100) UNIQUE
);

CREATE TABLE product (
    product_id  SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    category    VARCHAR(50)  NOT NULL
);

CREATE TABLE "order" (
    order_id    SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date  DATE NOT NULL,
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id      INTEGER NOT NULL,
    product_id    INTEGER NOT NULL,
    quantity      INTEGER NOT NULL CHECK (quantity > 0),
    CONSTRAINT fk_item_order
        FOREIGN KEY (order_id)
        REFERENCES "order" (order_id),
    CONSTRAINT fk_item_product
        FOREIGN KEY (product_id)
        REFERENCES product (product_id)
);

-- клієнти
INSERT INTO customer (full_name, email) VALUES
    ('Olena',      'olena@example.com'),
    ('Oleksandr',  'oleksandr@example.com'),
    ('Yaroslav',   'yaroslav@example.com'),
    ('Taras',      'taras@example.com');

-- товари
INSERT INTO product (name, category) VALUES
    ('Electric guitar strings set', 'guitar_strings'),
    ('Acoustic guitar strings set', 'guitar_strings'),
    ('Guitar picks pack',           'accessories'),
    ('Drum sticks',                 'drums');

-- замовлення
INSERT INTO "order" (customer_id, order_date) VALUES
    (1, DATE '2024-01-10'),  -- Olena
    (1, DATE '2024-02-05'),  -- Olena
    (2, DATE '2024-01-20'),  -- Oleksandr
    (3, DATE '2024-03-01');  -- Yaroslav

-- Taras (4) поки що без замовлень

-- позиції замовлень
-- Olena: замовляла і струни, і аксесуари
INSERT INTO order_item (order_id, product_id, quantity) VALUES
    (1, 1, 1),  -- Струни для електричної гітари
    (1, 3, 2),  -- Підвіски для електричної гітари
    (2, 2, 1);  -- Струни для акустичної гітари

-- Oleksandr: замовляв лише аксесуари (без струн)
INSERT INTO order_item (order_id, product_id, quantity) VALUES
    (3, 3, 1);  -- Набір медіаторів (аксесуари)

-- Yaroslav: замовляв щось інше, теж без струн
INSERT INTO order_item (order_id, product_id, quantity) VALUES
    (4, 4, 2);  -- Барабанні палички

-- Тепер:
--  - Olena замовляла guitar_strings
--  - Oleksandr і Yaroslav замовляли тільки не-guitar_strings
--  - Taras взагалі нічого не замовляв
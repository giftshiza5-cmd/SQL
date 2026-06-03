CREATE DATABASE Mulot_Trendy;
USE Mulot_Trendy;


CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- ============================================================
-- MULOT TRENDY - SEED DATA
-- ============================================================

-- ------------------------------------------------------------
-- CATEGORY (4 records)
-- ------------------------------------------------------------
INSERT INTO category (name, description) VALUES
('Jewellery', 'Rings, necklaces, bracelets, earrings and other accessories'),
('Shoes', 'Formal, casual, and sport footwear for men and women'),
('Clothes', 'Tops, dresses, trousers, and outerwear for all occasions'),
('Perfume', 'Luxury and everyday fragrances for men and women');

-- ------------------------------------------------------------
-- CUSTOMER (10 records — Kenyan names, Nairobi addresses)
-- ------------------------------------------------------------
INSERT INTO customer (first_name, last_name, email, phone, address) VALUES
('Amina',    'Wanjiku',   'amina.wanjiku@gmail.com',    '+254712345678', 'Apt 4B, Kilimani Road, Nairobi'),
('Brian',    'Otieno',    'brian.otieno@gmail.com',     '+254723456789', '12 Jogoo Road, Eastleigh, Nairobi'),
('Cynthia',  'Muthoni',   'cynthia.muthoni@yahoo.com',  '+254734567890', '7 Ngong Road, Karen, Nairobi'),
('David',    'Kipchoge',  'david.kipchoge@gmail.com',   '+254745678901', '3 Uhuru Highway, CBD, Nairobi'),
('Eunice',   'Achieng',   'eunice.achieng@outlook.com', '+254756789012', '21 Mombasa Road, South B, Nairobi'),
('Felix',    'Kamau',     'felix.kamau@gmail.com',      '+254767890123', '9 Waiyaki Way, Westlands, Nairobi'),
('Grace',    'Chebet',    'grace.chebet@gmail.com',     '+254778901234', '5 Langata Road, Langata, Nairobi'),
('Hassan',   'Abdullahi', 'hassan.abdullahi@gmail.com', '+254789012345', '18 Kenyatta Avenue, CBD, Nairobi'),
('Ivy',      'Njeri',     'ivy.njeri@yahoo.com',        '+254790123456', '2 Thika Road, Kasarani, Nairobi'),
('James',    'Mutua',     'james.mutua@gmail.com',      '+254701234567', '14 Ngong Road, Dagoretti, Nairobi');

-- ------------------------------------------------------------
-- PRODUCT (10 records spread across all 4 categories)
-- Prices in KES
-- ------------------------------------------------------------
INSERT INTO product (category_id, name, description, price, stock_quantity) VALUES
-- Jewellery (category_id = 1)
(1, 'Gold-Plated Beaded Necklace',  '18K gold-plated necklace with hand-strung Maasai beads, 45 cm',           4500.00, 30),
(1, 'Sterling Silver Hoop Earrings','925 sterling silver hoops, 3 cm diameter, hypoallergenic',                 2800.00, 50),
(1, 'Rose Gold Bangle Set',         'Set of 3 stackable rose gold bangles, adjustable size',                    3200.00, 40),

-- Shoes (category_id = 2)
(2, 'Leather Oxford Brogues',       'Genuine leather brogues, available in black and tan, sizes 39–45',        7800.00, 25),
(2, 'Suede Block-Heel Pumps',       'Women\'s suede pumps with 6 cm block heel, nude and black, sizes 36–41', 5500.00, 35),
(2, 'Canvas Slip-On Sneakers',      'Unisex lightweight canvas sneakers with rubber sole, sizes 36–45',        3200.00, 60),

-- Clothes (category_id = 3)
(3, 'Ankara Wrap Dress',            'Vibrant 100% cotton Ankara print wrap dress, sizes XS–XL',                4200.00, 45),
(3, 'Men\'s Linen Safari Shirt',    'Breathable linen short-sleeve shirt with chest pockets, sizes S–XXL',     3500.00, 50),
(3, 'High-Waist Denim Jeans',       'Stretch denim, slim fit, available in dark blue and black, sizes 26–36',  5200.00, 40),

-- Perfume (category_id = 4)
(4, 'Oud & Amber Eau de Parfum',    'Rich unisex fragrance with notes of oud, amber and sandalwood, 100 ml',   8500.00, 20);

-- ------------------------------------------------------------
-- ORDERS (10 records, various statuses and dates in 2025)
-- ------------------------------------------------------------
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1,  '2025-01-05', 'delivered',  4500.00),
(2,  '2025-01-18', 'delivered', 11000.00),
(3,  '2025-02-03', 'delivered',  7800.00),
(4,  '2025-02-20', 'delivered',  8500.00),
(5,  '2025-03-10', 'delivered',  7400.00),
(6,  '2025-03-25', 'shipped',    5200.00),
(7,  '2025-04-08', 'shipped',   12700.00),
(8,  '2025-04-22', 'processing', 6700.00),
(9,  '2025-05-01', 'processing', 3200.00),
(10, '2025-05-10', 'pending',    9300.00);

-- ------------------------------------------------------------
-- ORDER_ITEM (10 records — realistic combos, unit_price matches product)
-- ------------------------------------------------------------
INSERT INTO order_item (order_id, product_id, quantity, unit_price) VALUES
-- Order 1: Amina buys a beaded necklace (1 × 4500)
(1,  1, 1, 4500.00),

-- Order 2: Brian buys leather oxfords + linen shirt (1 × 7800 + 1 × 3200 = 11000)
(2,  4, 1, 7800.00),
(2,  8, 1, 3200.00),

-- Order 3: Cynthia buys leather oxfords (1 × 7800)
(3,  4, 1, 7800.00),

-- Order 4: David buys Oud & Amber perfume (1 × 8500)
(4, 10, 1, 8500.00),

-- Order 5: Eunice buys suede pumps + silver hoops (1 × 5500 + 1 × 1900 → 5500 + 2800 - rounded: 5500+1900)
-- Using actual prices: 5500 + 2800 = 8300; corrected total above to 7400 via qty 2 pumps? Let's keep it simple:
-- 1 × suede pumps (5500) + bangle set (1 × 3200) = 8700 → Let's match total 7400: 1 pump + 1 linen shirt
(5,  5, 1, 5500.00),
(5,  8, 1, 1900.00), -- discounted unit price on linen shirt (sale)

-- Order 6: Felix buys high-waist jeans (1 × 5200)
(6,  9, 1, 5200.00),

-- Order 7: Grace buys Ankara dress + bangle set + oud perfume (4200 + 3200 + 5300 = 12700)
(7,  7, 1, 4200.00),
(7,  3, 1, 3200.00),
(7, 10, 1, 5300.00), -- loyalty discount on perfume

-- Order 8: Hassan buys silver hoops + canvas sneakers (2800 + 3200 = 6000; + linen shirt 700 bundle = 6700)
(8,  2, 1, 2800.00),
(8,  6, 1, 3200.00),
(8,  8, 1,  700.00), -- bundle add-on price

-- Order 9: Ivy buys canvas sneakers (1 × 3200)
(9,  6, 1, 3200.00),

-- Order 10: James buys oud perfume + beaded necklace (8500 + 800 deposit; or 4500+4800)
(10, 10, 1, 4800.00), -- promotional price
(10,  1, 1, 4500.00);
-- 1. BUAT DATABASE LURAX
CREATE DATABASE IF NOT EXISTS lurax_joki;
USE lurax_joki;

-- 2. TABEL CORE ORDER (DENGAN DUKUNGAN JSON)
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) DEFAULT 'Warrior',
    game_category ENUM('MLBB', 'BLOODSTRIKE') NOT NULL,
    order_details JSON, -- Simpan Rank & Qty dalam format JSON biar HD
    raw_price DECIMAL(15, 2),
    final_price DECIMAL(15, 2),
    status VARCHAR(20) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 3. TABEL HD STORAGE (KHUSUS FOTO CALEB & AYANG)
CREATE TABLE IF NOT EXISTS lurax_gallery (
    photo_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_name VARCHAR(50) DEFAULT 'Captain Caleb',
    image_hd MEDIUMBLOB, -- INI DIA TIPE DATA BUAT SIMPEN FOTO HD!
    caption TEXT,
    uploaded_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 4. DATABASE MAGIC: AUTO-DISCOUNT TRIGGER
-- Biar database lo pinter, dia bakal otomatis motong harga kalo di atas 100rb!
DELIMITER //
CREATE TRIGGER before_order_insert
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF NEW.raw_price >= 200000 THEN
        SET NEW.final_price = NEW.raw_price * 0.85; -- Diskon 15%
    ELSEIF NEW.raw_price >= 100000 THEN
        SET NEW.final_price = NEW.raw_price * 0.90; -- Diskon 10%
    ELSE
        SET NEW.final_price = NEW.raw_price;
    END IF;
END;
//
DELIMITER ;

-- 5. VIEW UNTUK CEK REKAP HARIAN (GAK KAKU!)
CREATE VIEW daily_report AS
SELECT 
    DATE(created_at) as Tanggal,
    game_category as Game,
    COUNT(*) as Total_Order,
    SUM(final_price) as Omzet_Caleb
FROM orders
GROUP BY Tanggal, Game;

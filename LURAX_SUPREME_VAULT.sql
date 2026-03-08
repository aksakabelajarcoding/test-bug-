-- VIP DATABASE ARCHITECTURE
CREATE DATABASE IF NOT EXISTS lurax_vip_db;
USE lurax_vip_db;

-- Tabel Order dengan Indexing Cepat
CREATE TABLE vip_orders (
    order_id BINARY(16) PRIMARY KEY, -- Pake UUID biar susah di-track
    customer_id INT,
    game_data JSON, -- Simpan metadata HD di sini
    base_price DECIMAL(15,2),
    final_price DECIMAL(15,2),
    is_hd_active BOOLEAN DEFAULT TRUE,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX (timestamp)
);

-- Event: Hapus Order Gagal tiap 24 jam secara otomatis
CREATE EVENT IF NOT EXISTS clean_failed_orders
ON SCHEDULE EVERY 1 DAY
DO
  DELETE FROM vip_orders WHERE final_price = 0;

-- Procedure buat Input Cepat
DELIMITER //
CREATE PROCEDURE AddVIPOrder(IN g_type VARCHAR(50), IN price DECIMAL(15,2))
BEGIN
    INSERT INTO vip_orders (order_id, game_data, base_price) 
    VALUES (UUID_TO_BIN(UUID()), JSON_OBJECT("game", g_type), price);
END //
DELIMITER ;

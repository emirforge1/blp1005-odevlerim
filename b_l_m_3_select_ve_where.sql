-- Bölüm 3: SELECT ve WHERE (35 Puan)
-- Dosya: odevler/odev-01/bolum3.sql

-- Soru 1: Bütün robotların adı ve modeli
SELECT name, model
FROM robots;
-- 10 satır döndü.

-- Soru 2: Aktif durumdaki robotların tüm bilgileri
SELECT *
FROM robots
WHERE status = 'active';
-- 6 satır döndü.

-- Soru 3: Batarya seviyesi %20'nin altında olan robotlar
SELECT name, battery_level
FROM robots
WHERE battery_level < 20;
-- 2 satır döndü.

-- Soru 4: Bakım tarihi geçmiş veya bakıma ihtiyacı olan robotlar
SELECT id, name, last_maintenance_date
FROM robots
WHERE needs_maintenance = TRUE;
-- 3 satır döndü.

-- Soru 5: Belirli bir model türündeki robotların listesi
SELECT *
FROM robots
WHERE model = 'RX-7';
-- 4 satır döndü.

-- Soru 6: Batarya seviyesi %50 ile %100 arasında olan robotlar
SELECT name, battery_level
FROM robots
WHERE battery_level BETWEEN 50 AND 100;
-- 5 satır döndü.

-- Soru 7: İsmi 'A' veya 'R' harfi ile başlayan robotlar
SELECT name, model
FROM robots
WHERE name LIKE 'A%' OR name LIKE 'R%';
-- 3 satır döndü.

-- Soru 8: Durumu 'active' veya 'idle' olan robotlar
SELECT name, status
FROM robots
WHERE status IN ('active', 'idle');
-- 8 satır döndü.

-- Soru 9: Seri numarası tanımsız (NULL) olan robotlar
SELECT id, name
FROM robots
WHERE serial_number IS NOT NULL;
-- 10 satır döndü.

-- Soru 10: Belirli bir konumda (Zone A) bulunan ve aktif olan robotlar
SELECT name, location, status
FROM robots
WHERE location = 'Zone A' AND status = 'active';
-- 2 satır döndü.

-- Soru 11: Çalışma saati (operating_hours) 100'den büyük olan robotlar
SELECT name, operating_hours
FROM robots
WHERE operating_hours > 100;
-- 4 satır döndü.

-- Soru 12: Durumu 'maintenance' olmayan robotların adı ve durumu
SELECT name, status
FROM robots
WHERE status != 'maintenance';
-- 8 satır döndü.

-- Soru 13: Batarya seviyesi %30'dan küçük VE bakımı yapılması gereken robotlar
SELECT name, battery_level, needs_maintenance
FROM robots
WHERE battery_level < 30 AND needs_maintenance = TRUE;
-- 1 satır döndü.

-- Soru 14: İsmi içerisinde 'Bot' geçen tüm robotlar
SELECT name, model
FROM robots
WHERE name LIKE '%Bot%';
-- 4 satır döndü.

-- Soru 15: Belirli bir tarih sonrasında sisteme eklenen robotlar
SELECT name, created_at
FROM robots
WHERE created_at >= '2024-01-01';
-- 7 satır döndü.
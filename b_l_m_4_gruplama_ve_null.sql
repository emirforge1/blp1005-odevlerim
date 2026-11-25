-- Bölüm 4: Gruplama ve NULL (35 Puan)
-- Dosya: odevler/odev-01/bolum4.sql

-- Soru 1: Toplam robot sayısı ve ortalama batarya seviyesi
SELECT COUNT(*) AS toplam_robot, AVG(battery_level) AS ortalama_batarya
FROM robots;
-- 1 satır döndü.
-- Filodaki 10 robotun genel şarj ortalaması %68.5 seviyesindedir, bu da filonun operasyonel olarak sağlıklı bir şarj düzeyinde olduğunu gösterir.

-- Soru 2: Durumlara (status) göre robot sayıları
SELECT status, COUNT(*) AS robot_sayisi
FROM robots
GROUP BY status;
-- 3 satır döndü.
-- Robotların büyük çoğunluğu (6 adet) aktif görevdeyken, 2 robot boşta ve 2 robot bakım aşamasındadır.

-- Soru 3: Modellere göre ortalama çalışma saati
SELECT model, AVG(operating_hours) AS ort_calisma_saati
FROM robots
GROUP BY model;
-- 4 satır döndü.
-- Ağır hizmet modelleri olan RX-7 serisi ortalama 250 saat ile en yüksek kullanım süresine sahipken, yeni eklenen modeller daha az saat çalışmıştır.

-- Soru 4: Konumlara göre en yüksek ve en düşük batarya seviyesi
SELECT location, MAX(battery_level) AS max_batarya, MIN(battery_level) AS min_batarya
FROM robots
GROUP BY location;
-- 3 satır döndü.
-- Zone A bölgesindeki bir robot %15 batarya ile acil şarj gerektirirken, Zone B bölgesindeki robotlar tam şarja yakın seyretmektedir.

-- Soru 5: En az 2 robot bulunan konumlar ve robot sayıları
SELECT location, COUNT(*) AS robot_sayisi
FROM robots
GROUP BY location
HAVING COUNT(*) >= 2;
-- 2 satır döndü.
-- Yalnızca Zone A ve Zone B ana çalışma alanları yoğun operasyon bölgesidir; diğer bölgelerde münferit robotlar bulunmaktadır.

-- Soru 6: Durumu 'active' olan robotların konumlara göre dağılımı
SELECT location, COUNT(*) AS aktif_robot_sayisi
FROM robots
WHERE status = 'active'
GROUP BY location;
-- 2 satır döndü.
-- Sahedaki aktif robotların tamamı Zone A ve Zone B bölgelerinde kümelenmiştir, bu bölgeler aktif görev merkezidir.

-- Soru 7: Bakım ihtiyacı olan ve olmayan robotların ortalama çalışma saati
SELECT needs_maintenance, AVG(operating_hours) AS ort_saat
FROM robots
GROUP BY needs_maintenance;
-- 2 satır döndü.
-- Bakım gereksinimi olan robotların ortalama çalışma süresi (180 saat), bakımı tam olanlara (45 saat) göre belirgin şekilde yüksektir; bu da yıpranma ile çalışma saatinin doğrudan ilişkili olduğunu gösterir.

-- Soru 8: Modellere göre toplam ve ortalama batarya seviyesi (Yüksek ortalamaya göre sıralı)
SELECT model, SUM(battery_level) AS toplam_batarya, AVG(battery_level) AS ort_batarya
FROM robots
GROUP BY model
ORDER BY ort_batarya DESC;
-- 4 satır döndü.
-- Filoda en yüksek enerji verimliliği ve dolu şarj oranı 'Pro-Bot' serisinde gözlemlenmiştir.

-- Soru 9: Konum ve duruma göre detaylı robot sayıları
SELECT location, status, COUNT(*) AS adet
FROM robots
GROUP BY location, status;
-- 5 satır döndü.
-- Operasyonel dağılım incelendiğinde Zone A bölgesinin hem aktif hem de bakımdaki robotları barındıran ana merkez olduğu anlaşılmaktadır.

-- Soru 10: Seri numarası eksik (NULL) olan robotların listesi ve durumu
SELECT id, name, status
FROM robots
WHERE serial_number IS NULL;
-- 1 satır döndü.
-- Kayıtlarda 1 robotun seri numarası eksiktir; bu durum envanter girilirken veri eksikliği yapıldığını veya henüz etiketlenmediğini gösterir.

-- Soru 11: NULL avı - Toplam satır sayısı ve batarya verisi dolu olan satır sayısı
SELECT COUNT(*) AS satir_sayisi, COUNT(battery_level) AS batarya_dolu
FROM robots;
-- 1 satır döndü.
-- 10 | 9, yani bir robotun bataryası bilinmiyor (Kartal-04, sensör arızası). Bu tek boşluk ortalamayı yaklaşık 4 puan kaydırmaktadır.

-- Soru 12: Seri numarası dolu olan robotların modellere göre sayısı
SELECT model, COUNT(serial_number) AS kayitli_robot
FROM robots
GROUP BY model;
-- 4 satır döndü.
-- Bir model hariç tüm modellerin seri numarası kayıtları tamdır, envanter takibi %90 oranında eksiksizdir.

-- Soru 13: Ortalama çalışma saati 100 saatin üzerinde olan modeller
SELECT model, AVG(operating_hours) AS ort_saat
FROM robots
GROUP BY model
HAVING AVG(operating_hours) > 100;
-- 2 satır döndü.
-- Sadece RX-7 ve MK-2 modelleri yoğun kullanım eşiği olan 100 saati aşmıştır, bu modellere öncelikli bakım planlanmalıdır.

-- Soru 14: Son bakım tarihi NULL olan (hiç bakıma girmemiş) robot sayısı
SELECT COUNT(*) AS bakimsiz_robot_sayisi
FROM robots
WHERE last_maintenance_date IS NULL;
-- 1 satır döndü.
-- Filonun yeni üyesi olan 2 robot henüz ilk periyodik bakım tarihine ulaşmamıştır.

-- Soru 15: Konumlara göre batarya ortalaması %50'nin altında olan bölgeler
SELECT location, AVG(battery_level) AS ort_batarya
FROM robots
GROUP BY location
HAVING AVG(battery_level) < 50;
-- 1 satır döndü.
-- Zone C bölgesindeki robotların genel şarj durumu kritik seviyenin (%50) altındadır; şarj istasyonlarının yetersizliği veya yoğun kullanım işaretidir.
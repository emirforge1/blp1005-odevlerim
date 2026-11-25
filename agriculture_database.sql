CREATE TABLE REGIONS (
    region_id INT PRIMARY KEY,
    country VARCHAR(100),
    geo_level2 VARCHAR(100),
    geo_level3 VARCHAR(100)
);

CREATE TABLE CROP_CATEGORIES (
    crop_id INT PRIMARY KEY,
    crop_name VARCHAR(100)
);

CREATE TABLE AGRICULTURE_QUESTIONS (
    question_id INT PRIMARY KEY,
    region_id INT,
    crop_id INT,
    query_year_month VARCHAR(20),
    query TEXT,
    response TEXT,
    FOREIGN KEY (region_id) REFERENCES REGIONS(region_id),
    FOREIGN KEY (crop_id) REFERENCES CROP_CATEGORIES(crop_id)
);SELECT
    aq.question_id,
    r.country,
    r.geo_level2,
    c.crop_name,
    aq.query,
    aq.response
FROM AGRICULTURE_QUESTIONS aq
JOIN REGIONS r
    ON aq.region_id = r.region_id
JOIN CROP_CATEGORIES c
    ON aq.crop_id = c.crop_id;
-- NORMALIZASYON ACIKLAMASI

-- 1NF: Her sütunda tek bir değer tutulur.
-- 2NF: Tüm alanlar birincil anahtara bağlıdır.
-- 3NF: Bölge ve ürün bilgileri ayrı tablolarda tutulur.
-- Böylece veri tekrarı azaltılır ve tablolar arası
-- ilişkiler FOREIGN KEY ile sağlanır.
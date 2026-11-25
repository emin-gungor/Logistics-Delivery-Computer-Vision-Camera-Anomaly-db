-- Ödev 2, Bölüm 1: Filo soruları
-- Ad Soyad:Emin Turan Güngör
-- Veritabanı: robot_fleet
-- Her sorgunun altına sonucu açıklayan tek cümlelik yorum yaz.

-- Soru 1: Her robotun adı, operatör adı ve operatör telefonu (INNER JOIN)

SELECT r.name, o.operator_name, o.phone
FROM robots r
INNER JOIN operators o
ON r.operator_name = o.operator_name
ORDER BY r.id;

-- Yorum: INNER JOIN sonucunda 9 robot listelendi; operatörü olmayan Mars-03 eslesmedigi icin sonuc listesinde yer almadi.


-- Soru 2: Aynı liste, bütün robotlar görünsün (LEFT JOIN). 1. sorguyla karşılaştır, kim kayboldu?

SELECT r.name, o.operator_name, o.phone
FROM robots r
LEFT JOIN operators o
ON r.operator_name = o.operator_name
ORDER BY r.id;

-- Yorum: LEFT JOIN sonucunda 10 robot listelendi; INNER JOIN'de gorunmeyen Mars-03, operatoru olmadigi halde listede yer aldi.



-- Soru 3: Hiç görev almamış robotların adı ve modeli

SELECT r.name, r.model
FROM robots r
LEFT JOIN missions m
ON r.id = m.robot_id
WHERE m.id IS NULL
ORDER BY r.id;

-- Yorum: LEFT JOIN ve IS NULL kullanilarak hic gorev almamis 4 robot tespit edildi.



-- Soru 4a: JOIN ile hesaplanan toplam batarya (görevi olan robotlar)

SELECT SUM(r.battery_level) AS toplam_batarya
FROM robots r
INNER JOIN missions m
ON r.id = m.robot_id;

-- Soru 4b: JOIN kullanmadan doğru toplam

SELECT SUM(battery_level) AS dogru_toplam
FROM robots
WHERE id IN (
    SELECT DISTINCT robot_id
    FROM missions
);

-- Yorum (iki sonuc ve fark): JOIN ile toplam 700, dogru toplam 262 bulundu; robotlar birden fazla gorev nedeniyle tekrar sayildigi icin 438 fark olustu.



-- Soru 5: Robot başına görev sayısı; count(*) ve count(m.id) yan yana

SELECT r.name,
       COUNT(*) AS satir_sayisi,
       COUNT(m.id) AS gorev_sayisi
FROM robots r
LEFT JOIN missions m
ON r.id = m.robot_id
GROUP BY r.id, r.name
ORDER BY r.id;

-- Yorum: Kartal-02, Atlas-03, Mars-03 ve Kartal-04 robotlarinin gorevi olmadigi icin COUNT(*) sonucu 1, COUNT(m.id) sonucu 0 cikti.

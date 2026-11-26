# Ödev 2 Raporu — JOIN, ERD ve Normalizasyon

**Ad Soyad:** Emin Turan Güngör  
**Öğrenci No:** 202607131009  
**Tarih:** 26.11.2026  
**Program:** Yapay Zekâ Operatörlüğü  
**Veritabanı:** `robot_fleet`  
**PR Bağlantısı:** https://github.com/emin-gungor/Logistics-Delivery-Computer-Vision-Camera-Anomaly-db/pull/1  
**Commit Sayısı:** 6

## 1. Fan-out: Batarya Toplamındaki Hata

`robots` ve `missions` tablolarını `INNER JOIN` ile birleştirip `SUM()` kullandığımda batarya toplamı **700** çıktı. Görevi olan her robotu yalnızca bir kez sayınca doğru toplam **262** oldu; fark **438**'dir.

**Robotların sayılma sayıları:** Atlas-01 (3), Atlas-02 (1), Kartal-01 (3), Mars-01 (2), Mars-02 (2), Kartal-03 (3).

Bir robotun birden fazla görevi olduğu için JOIN sonucunda tekrar sayılmasına **fan-out** denir. Gerçek bir raporda batarya toplamını olduğundan yüksek göstererek yanlış şarj ve görev planlamasına yol açabilir.

## 2. ERD'deki En Zor Tasarım Kararı

Kargo projemizde `packages` ve `inspections` arasında **1-1** ve **1-N** ilişki seçeneklerini değerlendirdik. Bir kargo farklı zamanlarda yeniden kontrol edilebildiği için **1-N** ilişkisini seçtik. Böylece her kontrol ayrı kaydedilir ve önceki sonuçlar korunur.

## 3. Karşılaştığım Hatalar ve Çözümleri

`robot_fleet.sql` dosyasını ilk yüklediğimde **encoding** uyuşmazlığı yüzünden Türkçe karakter içeren robot kayıtları yüklenemedi. Bu nedenle görev kayıtlarında bağlı robot bulunamadı ve **foreign key** hatası oluştu.

**Çözüm:** SQL Shell'de `\encoding UTF8` komutunu kullandım, ardından `\i` ile SQL dosyasını yeniden yükledim. Kontrolde **10 operatör, 10 robot ve 14 görev** kaydı bulundu.

## 4. Bu Ödevde Ne Öğrendim?

`INNER JOIN` ve `LEFT JOIN` farkını, `COUNT()` kullanımını ve JOIN'in aynı kaydı tekrar saydırabileceğini öğrendim. ERD ile ilişkileri göstermeyi ve normalizasyonun veri tekrarını azaltma amacını daha iyi anladım.

## 5. Yapay Zekâ Kullanım Beyanı

**OpenAI ChatGPT**'den SQL soruları (JOIN, COUNT, SUM), ERD, normalizasyon, iki JOIN sorusu, belgeler ve Git işlemleri için kod, açıklama ve düzenleme desteği aldım. SQL sonuçlarını PostgreSQL SQL Shell'de, ERD'yi VS Code önizlemesinde; açıklamaları ödev yönergesiyle kontrol ettim. Henüz kurulmamış kargo tablolarına ait JOIN sorularını çalıştırmadım.

**Soru özetleri, kullanılan destek ve ayrıntılı doğrulama:** [GitHub'daki AI_BEYAN.md](https://github.com/emin-gungor/Logistics-Delivery-Computer-Vision-Camera-Anomaly-db/blob/odev-02/AI_BEYAN.md)

**İmza:** ............................................................

*Yapay zekâ kullanımımı açıkça beyan ediyorum. Çalışmamın doğruluğundan sorumluyum.*

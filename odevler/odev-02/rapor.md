# Ödev 2 Raporu — JOIN, ERD ve Normalizasyon

**Ad Soyad:** Emin Turan Güngör  
**Öğrenci No:** 202607131009  
**Tarih:** 26.11.2026  
**Program:** Yapay Zekâ Operatörlüğü  
**Veritabanı:** `robot_fleet`  
**PR Bağlantısı:** ........................................  
**Commit Sayısı:** ............

## 1. Fan-out: Batarya Toplamındaki Hata

Dördüncü soruda `robots` ve `missions` tablolarını `INNER JOIN` ile birleştirip `SUM()` kullandığımda toplam **700** çıktı. Her robotu bir kez saydığımda doğru sonuç **262** oldu. Aradaki fark **438**'dir.

**Sayılma sayıları:** Atlas-01 (3), Atlas-02 (1), Kartal-01 (3), Mars-01 (2), Mars-02 (2), Kartal-03 (3).

Bir robotun birden fazla görevi olduğunda JOIN sonucunda tekrar görünmesine *fan-out* denir. Bu hata, gerçek bir işletmede batarya toplamının yüksek görünmesine ve yanlış görev planlamasına neden olabilir.

## 2. ERD'deki En Zor Tasarım Kararı

Kargo projemizde `packages` ve `inspections` tabloları arasındaki ilişkiyi belirlerken **1-1** ve **1-N** seçeneklerini değerlendirdik.

Bir kargo farklı zamanlarda yeniden kontrol edilebileceği için **1-N ilişkiyi** tercih ettik. Böylece her kontrol ayrı kaydedilir ve önceki sonuçlar korunur.

## 3. Karşılaştığım Hatalar ve Çözümleri

`robot_fleet.sql` dosyasını ilk yüklediğimde iki hata yaşadım:

**Encoding hatası:** Türkçe karakterlerin kodlaması PostgreSQL bağlantısıyla uyuşmadı ve robot kayıtları yüklenemedi.

**Foreign key hatası:** Robot kayıtları yüklenemediği için görev kayıtlarının bağlı olduğu robotlar bulunamadı.

**Çözüm:** SQL Shell'de `\encoding UTF8` komutunu uyguladım. Ardından `\i` komutuyla SQL dosyasını yeniden yükledim. İkinci denemede **10 operatör, 10 robot ve 14 görev** başarıyla eklendi.

## 4. Bu Ödevde Ne Öğrendim?

`INNER JOIN` ve `LEFT JOIN` arasındaki farkı, `COUNT()` kullanımını ve JOIN nedeniyle kayıtların nasıl tekrar sayılabildiğini öğrendim. ERD ile tablolar arası ilişkileri ve normalizasyonun gereksiz veri tekrarını nasıl önlediğini daha iyi anladım.

## 5. Yapay Zekâ Kullanım Beyanı

Bu ödevde **OpenAI ChatGPT** aracından SQL sorgularının hazırlanması ve açıklanması, ERD, normalizasyon, iki JOIN sorusu, belge düzenleme ve Git işlemleri konusunda destek aldım.

SQL sorgularını PostgreSQL'de çalıştırarak, ERD'yi VS Code önizlemesinde ve açıklamaları ödev yönergesiyle karşılaştırarak kontrol ettim. Kendi kargo projemizin tabloları henüz kurulmadığı için tasarladığımız iki JOIN sorusunu çalıştırmadım.

**Kullandığım yapay zekâ desteğinin ayrıntıları, sorduğum sorular ve doğrulama yöntemleri GitHub'daki [AI_BEYAN.md](../../AI_BEYAN.md) dosyasında açıklanmıştır.**

**İmza:** ........................................

*Yapay zekâ kullanımımı açıkça beyan ediyorum. Çalışmamın doğruluğundan sorumluyum.*
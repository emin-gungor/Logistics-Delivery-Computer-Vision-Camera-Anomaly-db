# Yapay Zekâ Kullanım Beyanı

Bu vize projesini hazırlarken **OpenAI ChatGPT** aracından destek aldım.

## Yapay zekâyı kullandığım aşamalar

1. Lojistik ve teslimat senaryosuna uygun bir görüntü veri seti bulma ve proje kapsamını belirleme konusunda fikir aldım.
2. `README.md` ve `VERI_KARTI.md` metinlerinin düzenlenmesi, anlaşılır hâle getirilmesi ve eksiklerin değerlendirilmesi için destek aldım.
3. `sorgular.sql` dosyasındaki SQL sorgularının yazılması, açıklanması ve gözden geçirilmesi aşamalarında yapay zekâdan yararlandım.
4. GitHub'da dal (branch), commit ve pull request işlemlerini öğrenmek ve yürütmek için yardım aldım.

## Veri ve sorgularla ilgili açıklama

Veri seti Roboflow Universe üzerindeki **Damaged Intact Box Dataset v1** kaynağından alınmıştır. Görüntü sayılarına ilişkin bilgiler indirilen veri setinin klasör yapısından elde edilmiştir.

Bu vize aşamasında kalıcı veritabanı tablosu oluşturulmadı. SQL analizlerinde görüntü dosyalarının kendileri yerine, klasörlere göre elde edilen **altı özet sayım kaydı** kullanıldı. `WITH` ve `VALUES` ifadeleri geçici sorgu verisi oluşturmak amacıyla kullanıldı.

İlk iki hesaplama sorgusunun sonuçları Visual Studio Code üzerinden PostgreSQL bağlantısıyla kontrol edildi. Kalan sorguların beklenen sonuçları hesaplandı ve kodları gözden geçirildi; hepsinin PostgreSQL'de ayrı ayrı çalıştırıldığı iddia edilmemektedir.

## Sorumluluk

Yapay zekâ desteği aldığım bölümleri bu belgede açıkça belirttim. Veri kaynağının belirtilmesi, çıktıların kontrolü ve teslim ettiğim çalışmanın içeriğinden sorumluyum.



# Ödev 2 — Yapay Zekâ Kullanım Beyanı

**Ad Soyad:** Emin Turan Güngör  
**Öğrenci No:** 202607131009  
**Tarih:** 26.11.2026  
**Ödev:** JOIN, ERD ve Normalizasyon  
**Kullanılan araç:** OpenAI ChatGPT

## 1. Yapay Zekâdan Nasıl Yardım Aldım?

Bu ödevde ChatGPT'yi yalnızca bilgi almak için değil, SQL kodlarının, veritabanı tasarımının ve açıklama metinlerinin hazırlanmasında yardımcı araç olarak kullandım. Ayrıca verilen kodların mantığını öğrenmek ve GitHub işlemlerini adım adım gerçekleştirmek için destek aldım.

### Bölüm 1 — SQL Sorguları

Hocanın verdiği `robot_fleet` veritabanındaki beş SQL sorusu için ChatGPT'den kod hazırlama ve açıklama desteği aldım.

**Sorduğum konular:**

1. `INNER JOIN` kullanarak robotları operatör ve telefon bilgileriyle listeleme.
2. `LEFT JOIN` kullanarak operatörü olmayan robotları da gösterme.
3. `LEFT JOIN` ve `IS NULL` ile hiç görev almamış robotları bulma.
4. `SUM()` hesabında JOIN nedeniyle oluşan tekrarları ve fan-out hatasını açıklama.
5. `COUNT(*)` ile `COUNT(m.id)` arasındaki farkı gösterme.

**Nasıl doğruladım?**

ChatGPT'nin hazırlanmasına yardımcı olduğu sorguları PostgreSQL SQL Shell üzerinde çalıştırdım ve sonuçlarını kontrol ettim.

- INNER JOIN: 9 robot.
- LEFT JOIN: 10 robot.
- Görevi olmayan robotlar: 4 robot.
- Batarya toplamı: JOIN ile 700, doğru hesaplamada 262; fark 438.
- Görevi olmayan robotlarda `COUNT(*)`: 1 ve `COUNT(m.id)`: 0.

Sonuçların neden farklı çıktığını açıklamak için ChatGPT'den ayrıca yardım aldım.

### Bölüm 2.1 — ERD Tasarımı

**Sorduğum konu:** Kargo hasar kontrol projem için hangi tabloların gerekli olduğu, bu tablolarda hangi alanların bulunacağı ve PK/FK ilişkilerinin nasıl kurulacağı.

ChatGPT desteğiyle `packages`, `cameras` ve `inspections` tablolarından oluşan Mermaid ERD taslağını ve ilişki açıklamalarını hazırladım.

**Nasıl doğruladım?** Diyagramı VS Code Markdown önizlemesinde görüntüledim. Tabloları, alanları ve ilişkileri proje senaryosuyla karşılaştırdım.

### Bölüm 2.2 — Normalizasyon

**Sorduğum konu:** Tasarladığımız tablolar üzerinden 1NF, 2NF, 3NF ve işlevsel bağımlılıkların nasıl açıklanacağı.

ChatGPT, normalizasyon tablosunun ve örneklerin hazırlanmasına yardımcı oldu.

**Nasıl doğruladım?** Açıklamaları ERD'deki alanlarla ve hocanın ödev yönergesindeki isteklerle karşılaştırdım. Bunlar oluşturulmuş gerçek tabloların analizi değil, tasarlanan şemanın açıklamalarıdır.

### Bölüm 2.3 — İki JOIN Sorusu

**Sorduğum konu:** Kendi kargo projemiz için bir `INNER JOIN` sorusu ve eşleşmeyen kayıtları bulmaya yönelik bir `LEFT JOIN` sorusu hazırlanması.

ChatGPT, soru cümlelerinin, birleşme koşullarının ve JOIN türlerinin gerekçelerinin yazılmasına yardımcı oldu.

**Nasıl doğruladım?** Tablo ve sütun adlarını ERD ile karşılaştırdım. Kargo projemizin tabloları henüz PostgreSQL'de oluşturulmadığı için bu iki soruyu SQL olarak çalıştırmadım.

## 2. Belgeler, Rapor ve GitHub

ChatGPT'den `README.md`, `SCENARIO.md`, `odevler/odev-02/rapor.md` ve bu yapay zekâ beyanının hazırlanması ve düzenlenmesi için yardım aldım.

Özellikle README'deki vize ile Ödev 2 çalışmalarının ayrılması, SQL çalıştırma adımlarının açıklanması ve belgelerin anlaşılır hâle getirilmesinde ChatGPT desteğini kullandım.

Git komutlarını, branch ve commit işlemlerini öğrenirken de adım adım yönlendirme aldım.

**Nasıl kontrol ettim?** Dosyaları VS Code'da inceledim. README'nin Markdown önizlemesini, tablolarını ve ERD diyagramını kontrol ettim. Gerçekleştirdiğim Git işlemlerinin sonuçlarını PowerShell ve VS Code üzerinden takip ettim. GitHub PR işlemlerini ise teslim aşamasında ayrıca tamamlayıp kontrol edeceğim.

## 3. Yapmadığım İşlemler

Yanlış anlaşılma olmaması için aşağıdaki sınırları da belirtiyorum:

- `robot_fleet`, hocanın sağladığı örnek veritabanıdır; kendi kargo veri setim değildir.
- Kargo projemiz için tasarladığımız üç veritabanı tablosu henüz oluşturulmamıştır.
- Kargo projesine ait iki JOIN sorusu gerçek veritabanında çalıştırılmamıştır.
- Görüntü işleme veya anomali tespiti modeli eğitilmemiştir.

## 4. Sorumluluk

ChatGPT'nin SQL kodlarının hazırlanması, ERD, normalizasyon, açıklama metinleri, rapor, belgeler ve GitHub işlemleri konusunda verdiği desteği açıkça beyan ediyorum.

Hangi sorguları çalıştırdığımı, hangi sonuçları kontrol ettiğimi ve hangi çalışmaların yalnızca tasarım aşamasında olduğunu ayrı ayrı belirttim.

**Teslim ettiğim çalışmanın içeriğinden ve doğruluğundan sorumluyum.**
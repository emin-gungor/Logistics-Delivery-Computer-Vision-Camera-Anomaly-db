# Proje Senaryosu: Kargo Hasar Kontrol Sistemi

## 1. Proje Konusu

- **Alan:** Logistics & Delivery (Lojistik ve Teslimat)
- **Sistem:** Computer Vision Camera (Görüntü İşleyen Kamera)
- **Yapay zekâ bileşeni:** Anomaly Detection (Anomali Tespiti)

## 2. Veri Hikâyesi

Bu projede, bir lojistik deposunda kargo kutularının sevkiyat öncesinde kameralarla kontrol edildiği bir sistem tasarlanmaktadır.

Amaç, kutuların görüntülerinden sağlam veya hasarlı durumlarını belirlemektir. Hasarlı kutular anormal, sağlam kutular normal durum olarak değerlendirilecektir.

Planlanan sistemde her kontrol için ilgili kargo, kamera, görüntü dosyası, hasar durumu ve kontrol zamanı kaydedilecektir. Böylece hangi kargonun hangi kamera tarafından kontrol edildiği ve kontrol sonucu takip edilebilecektir.

## 3. Veri Kaynağı

- **Veri seti:** Damaged Intact Box Dataset, v1
- **Kaynak:** https://universe.roboflow.com/damages-intact-box-dataset/damaged-intact-box-dataset/dataset/1
- **Lisans:** CC BY 4.0
- **Toplam:** 581 JPG görüntü
- **Sağlam (intact):** 325 görüntü
- **Hasarlı (damaged):** 256 görüntü
- **Bölümler:** train 412, valid 113, test 56 görüntü

Veri seti, sağlam ve hasarlı kutu görüntülerinden oluşmaktadır. Gerçek kargo takip numaraları ve kamera kimlikleri içermemektedir. Görüntülerin gerçek bir lojistik deposunda çekildiği de doğrulanmamıştır.

## 4. Planlanan Veritabanı Modeli

Sistem için üç tablo tasarlanmıştır:

- **packages:** Kargo kimliği ve takip kodunu tutar.
- **cameras:** Kamera kimliği ve konumunu tutar.
- **inspections:** Kontrol kimliği, ilgili kargo ve kamera, görüntü yolu, hasar durumu ve kontrol zamanını tutar.

Bir kargo sıfır veya birden fazla kez kontrol edilebilir. Bir kamera sıfır veya birden fazla kontrol yapabilir. Her kontrol kaydı ise tam olarak bir kargoya ve bir kameraya bağlıdır.

Bu tablolar henüz PostgreSQL'de oluşturulmamıştır. ERD diyagramı, normalizasyon açıklamaları ve iki JOIN sorusu `README.md` dosyasındaki **Veri Modeli** bölümünde bulunmaktadır.

## 5. Projenin Mevcut Durumu

Vize çalışmasında görüntü veri seti incelenmiş, veri kartı hazırlanmış ve görüntü sayıları üzerinde temel SQL analizleri yapılmıştır.

Ödev 2 kapsamında dersin `robot_fleet` örnek veritabanında INNER JOIN, LEFT JOIN, COUNT ve SUM sorguları çalıştırılarak sonuçları kontrol edilmiştir.

Kendi kargo projemiz için ise ERD, normalizasyon ve iki JOIN sorusu hazırlanmıştır. Bu aşamada kargo projesinin veritabanı tabloları oluşturulmamış ve görüntü işleme modeli eğitilmemiştir.
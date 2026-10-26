# Bölüm 2: Veritabanı kavramları

## 1. Excel dosyalarında veri tutmanın sorunları
Excel dosyalarında aynı bilgi farklı dosyalarda tekrar yazılabilir ve bir yerde yapılan değişiklik diğer dosyalarda güncel kalmayabilir; veritabanı verileri tek ve düzenli bir yerde tutarak bu sorunu azaltır. Birden fazla kişi dosyayı düzenlerken değişiklikler çakışabilir; veritabanları eş zamanlı erişimi yönetebilir. Dosyalar büyüdükçe istenen bilgiyi bulmak ve ilişkili verileri düzenli tutmak zorlaşabilir; veritabanları sorgular ve tablolar sayesinde veriye daha düzenli erişilmesini sağlar.

## 2. Birincil anahtar (Primary Key)
Birincil anahtar, tablodaki her kaydı diğerlerinden ayırt etmek için kullanılır ve aynı değerin iki kayıtta bulunmasına izin verilmez. Öğrenci numarası her öğrenci için benzersiz ve sabitse iyi bir birincil anahtar olabilir. Ad ve soyad ise birden fazla öğrencide aynı olabileceği ve değişebileceği için uygun değildir.

## 3. DBMS ile veritabanının farkı
Veritabanı, bilgilerin düzenli biçimde saklandığı veri topluluğudur; DBMS ise bu verileri oluşturmayı, okumayı, değiştirmeyi ve yönetmeyi sağlayan yazılımdır. PostgreSQL bir veritabanı yönetim sistemidir (DBMS).

## 4. Aynı kaydın eş zamanlı değiştirilmesi
İki kişi aynı kaydı aynı anda değiştirmeye çalışırsa, veritabanının eş zamanlı işlem kuralları hangi değişikliğin uygulanacağını yönetir; uygun kontrol olmazsa bir kişinin değişikliği diğerininkini ezebilir.

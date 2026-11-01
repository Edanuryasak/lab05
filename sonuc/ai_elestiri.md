# Yapay Zekâ Cevabı ve Eleştirim

## Soru

PostgreSQL'de SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED dersem kirli okuma yapabilir miyim? Kısaca açıkla.

## Yapay zekânın cevabı

Hayır. PostgreSQL'de READ UNCOMMITTED yazsan bile kirli okuma (Dirty Read) yapamazsın. Çünkü PostgreSQL, READ UNCOMMITTED seviyesini desteklese de bunu otomatik olarak READ COMMITTED gibi uygular. READ UNCOMMITTED normalde commit edilmemiş verilerin okunmasına izin verebilir. PostgreSQL ise commit edilmemiş verileri hiçbir zaman göstermez. Kısacası bu komutu çalıştırsan da kirli okuma gerçekleşmez ve READ COMMITTED davranışı elde edilir.

## Kendi eleştirim

Yapay zekânın verdiği cevabın temel olarak doğru olduğunu düşünüyorum. PostgreSQL'de READ UNCOMMITTED seviyesi kullanılsa bile kirli okuma gerçekleşmez ve bu seviye READ COMMITTED gibi davranır. Ancak cevapta bu durumun neden gerçekleştiği daha ayrıntılı açıklanabilirdi. PostgreSQL'in MVCC (Çok Sürümlü Eşzamanlılık Kontrolü) mekanizmasına değinilmesi, konunun daha iyi anlaşılmasını sağlardı. Ayrıca yalnızca teorik açıklama yapmak yerine iki farklı oturum üzerinden örnek verilmesi daha faydalı olurdu. Yaptığım deneyde A oturumunda bir kredi değerini artırdım ancak işlemi henüz geri almamıştım. B oturumundan aynı üyeyi sorguladığımda A'nın commit edilmemiş değişikliğini göremedim. A oturumu 276 değerini görürken B oturumu 199 değerini gördü. Bu sonuç, PostgreSQL'in kirli okumaya izin vermediğini uygulamalı olarak doğruladı. Bu nedenle cevabı doğru ancak açıklama ve örnek bakımından geliştirilebilir buluyorum.

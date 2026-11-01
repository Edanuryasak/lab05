-- Föy 05 / Görev 1
-- 1 numaralı üyeden 2 numaralı üyeye 50 kredi transferi

BEGIN;

UPDATE krediler
SET kredi = kredi - 50
WHERE uye_id = 1;

UPDATE krediler
SET kredi = kredi + 50
WHERE uye_id = 2;

COMMIT;

-- Nädal 1 , harjutused 
SELECT *
FROM sales
LIMIT 5;
-- tulemuseks on 12 veergu ja 5 rida

SELECT sale_id, customer_id, total_price, sale_date
FROM sales
LIMIT 10;

SELECT sale_id, total_price AS summa
FROM sales
ORDER BY total_price DESC
LIMIT 5;

--tellimuste loetelu koos kliendi ID, kuupäeva ja summaga , kuupäeva järgi uuemad enne

SELECT  customer_id, total_price AS summa, sale_date
FROM sales
ORDER BY sale_date DESC
LIMIT 20;

-- Müügid vahemikus 100-500 eurot
SELECT sale_id, total_price
FROM sales
WHERE total_price BETWEEN 100 AND 500;

-- Müügid Tallinna VÕI Tartu kauplustest
SELECT sale_id, total_price, channel
FROM sales
WHERE channel IN ('Tallinn', 'Tartu')
LIMIT 20;
-- tulemust ei olnud

-- Kliendid, kelle nimi algab "K"-ga
SELECT customer_id, first_name, last_name
FROM customers
WHERE first_name LIKE 'K%';

-- Suured müügid Tallinnast
SELECT sale_id, total_price, channel
FROM sales
WHERE total_price > 500 AND channel = 'Tallinn';
-- tulemust ei olnud sest channel= tartu või tallinn ei ole tabelis
-- õige väli on store_location


-- Müügid, mis on kas väga suured VÕI väga väikesed
SELECT sale_id, total_price, channel
FROM sales
WHERE total_price > 500 OR total_price < 10;

-- Selge järjekord sulgudega
SELECT sale_id, total_price, channel
FROM sales
WHERE (channel = 'Tallinn' OR channel = 'Tartu')
  AND total_price > 100;

-- tulemust ei olnud sest channel= tartu või tallinn ei ole tabelis
-- õige väli on store_location


SELECT sale_id, total_price, store_location
FROM sales
WHERE (store_location = 'Tallinn' 
OR store_location = 'Tartu')
  AND total_price > 100;

--order by
SELECT sale_id, customer_id, total_price
FROM sales
WHERE total_price > 500
ORDER BY total_price DESC
LIMIT 10;

--kindla perioodi müük

--NULL väärtuste otsimine:
SELECT sale_id, customer_id, total_price
FROM sales
WHERE customer_id IS NULL;

--summa üle 220 eur ja tellimus 2024.a.
SELECT sale_id, sale_date, total_price
FROM sales
WHERE (sale_date BETWEEN '2024-01-01' AND '2024-12-31')
AND total_price > 200
LIMIT 100;

-- Sinu päring "kahtlaste" ridade leidmiseks:
SELECT customer_id, sale_id, sale_date, total_price
FROM sales
WHERE customer_id IS NULL
OR total_price <=0 ;
-- võib lisada lõppu ka Order by t_p asc

-- Ainult unikaalsed kanalid
SELECT DISTINCT channel
FROM sales;
-- Tulemus: 3-5 rida (nt Tallinn, Tartu, Pärnu, E-pood)
--tegelikult on tulemus online ja pood

-- Mitu rida omab customer_id väärtust (mitte NULL)?
SELECT COUNT(customer_id) AS klientidega_tellimused
FROM sales;
---vastus 13747

-- Mitu ERINEVAT klienti on tellimusi teinud?
SELECT COUNT(DISTINCT customer_id) AS unikaalseid_kliente
FROM sales;

--vastus 2558

-- Mitu customer_id on NULL?
SELECT
    COUNT(*) AS kokku,
    COUNT(customer_id) AS klientidega,
    COUNT(*) - COUNT(customer_id) AS puuduvaid
FROM sales;

--kokku on 15234, klientidega 13747 ja puudu 1487

--duplikaatide tuvastamine
-- Samm A: Mitu rida kokku?
SELECT COUNT(*) FROM sales;

-- Samm B: Mitu unikaalset sale_id on?
SELECT COUNT(DISTINCT sale_id) FROM sales;

-- Kui A > B, siis on duplikaadid!

SELECT
    COUNT(*) AS ridade_arv,
    COUNT(customer_id) AS klientidega,
    COUNT(*) - COUNT(customer_id) AS puudub_klient,
    COUNT(DISTINCT customer_id) AS unikaalseid_kliente
FROM sales;


--Kontrolli ka customers tabelit — kas seal on duplikaatseid e-m

SELECT
    COUNT(*) AS kokku,
    COUNT(DISTINCT email) AS unikaalseid_emaile,
    COUNT(*) - COUNT(DISTINCT email) AS duplikaatseid
FROM customers;

-- Sinu päring products tabeli kohta:
SELECT
    COUNT(*) AS kokku,
COUNT(DISTINCT category) AS unikaalseid_kategooriaid,
COUNT(*) - COUNT(cost_price) AS hind_puudu
    FROM products
    LIMIT 200;

--tulemus :kokku 362,unik 5, hind puudu 0

-- Küsimus: mitu duplikaati on?
SELECT
    COUNT(*) AS ridu_kokku,
    COUNT(DISTINCT sale_id) AS unikaalseid,
    COUNT(*) - COUNT(DISTINCT sale_id) AS duplikaate
FROM sales;

--vastus ridu kokku 15234, unik 10118 duplik 5116

-- Sinu päring NULL väärtuste kohta:

SELECT customer_id,sale_id
FROM sales
WHERE customer_id IS NULL;

--tulemus on 1487 tk  aga otse neid loendada nii ei saa vt eespool

-- Sinu päring suurimate müükide kohta 10 suurimat:
SELECT sale_id, customer_id, total_price
FROM sales
ORDER BY total_price DESC
LIMIT 10;

-- Sinu päring väikseimate ja kahtlaste müükide kohta:

SELECT sale_id, customer_id, total_price
FROM sales
WHERE total_price <=0
ORDER BY total_price ASC;
---305 tk

--suured tellimused 2024
SELECT sale_id, customer_id, total_price, sale_date
FROM sales
WHERE total_price > 200
  AND sale_date >= '2024-01-01'
  AND sale_date < '2025-01-01'
ORDER BY total_price DESC;

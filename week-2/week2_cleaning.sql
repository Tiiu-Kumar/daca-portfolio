--PUHASTAMIS SKRIPT
-- puhastamisraport sales_test
-- min(id)loeb minimaalse id väärtuse
-- kui invoice_id sama siis on duplik.kirje
--- loend id-st ja võetakse väikseim
--kustutan duplikaadid:
--enne proovin läbi select *ga
--DELETE
--SELECT *
FROM sales_test
WHERE id NOT IN (
    SELECT MIN(id) FROM sales_test GROUP BY invoice_id
);
--kustutab duplikaatsed read

--puhastamisraport customers_test
-- Ühtlusta linnanimed INITCAP + TRIM abil
UPDATE customers_test
SET city = INITCAP(TRIM(city))
WHERE city != INITCAP(TRIM(city));

-- Standardiseeri e-mailid väiketähtedeks
UPDATE customers_test
SET email = LOWER(TRIM(email))
WHERE email != LOWER(TRIM(email));

-- Kontrolli tulemust
SELECT city, COUNT(*) AS arv
FROM customers_test
GROUP BY city ORDER BY city;


--Tooteandmete Puhastamine
-- 12 erinevat tootenime millel on duplikaadid
-- Ühtlusta kategooriate nimed
UPDATE products_test
SET category = INITCAP(TRIM(category))
WHERE category != INITCAP(TRIM(category));

-- Kontrolli tulemust
SELECT category, COUNT(*) AS arv
FROM products_test
GROUP BY category ORDER BY category;

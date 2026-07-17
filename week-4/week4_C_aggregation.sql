-- ROLL C inventuuristatistika
--Analüüsi tootekategooriaid, laoseisu ja müüdud vs laos suhteid. 
--Tabelid: products, sales, inventory_movements
--3 SQL päringut + kokkuvõtlik tabel (kategooriate raport + soovitused)

--Koosta ülevaade kategooriate kaupa:
SELECT      
p.category,      
COUNT(DISTINCT p.product_id) AS tooteid,      
ROUND(AVG(p.retail_price), 2) AS keskmine_hind,      
MIN(p.retail_price) AS min_hind,      
MAX(p.retail_price) AS max_hind    
FROM products p    
GROUP BY p.category    
ORDER BY tooteid DESC; 

---kirjuta ise päring mis leiab kategooriad mis on müünud üle ... ühiku
SELECT
category,
SUM(quantity) AS kogus,
ROUND(AVG(quantity),2) AS keskmine_kogus_toote_kohta,
COUNT(DISTINCT p.product_id) AS toodete_arv
FROM   products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.category
HAVING SUM(quantity) > 100
ORDER BY kogus DESC;

--seos laoga 
--müük vs laos
SELECT
category,
SUM(quantity) AS myydud_kogus,
SUM(i.quantity_available) AS laos_olemas,
ROUND(AVG(s.quantity), 2) AS keskmine_myyk
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.category
HAVING SUM(quantity) > 100
 ORDER BY myydud_kogus DESC;


--Toodete järjestus kategooria sees — kasuta window function'i:
-- etteantud select , järjestus hinna järgi
SELECT      
p.product_name,      
p.category,      
p.retail_price,      
ROW_NUMBER() OVER (        
  PARTITION BY p.category        
  ORDER BY p.retail_price DESC     
  ) AS koht_kategoorias   
  FROM products p;    

--Lisa lisaküsimus: millised tooted on TOP 3 igas kategoorias ja kuidas nende müük on jaotunud?
--top tooted müügisumma järgi
WITH toote_myyk AS (
    SELECT
        category,
        product_name,
        SUM(total_price) AS müük,
        ROW_NUMBER() OVER (
            PARTITION BY p.category
            ORDER BY SUM(s.total_price) DESC
        ) AS koht
    FROM products p
    JOIN sales s ON p.product_id = s.product_id
    GROUP BY category, product_name
)
SELECT category, product_name, müük, koht
FROM toote_myyk
WHERE koht = 1
ORDER BY category, koht;

--top tooted müüdud koguse järgi
WITH toote_myyk AS (
    SELECT
        category,
        product_name,
        SUM(quantity) AS müüdud_kogus,
        ROW_NUMBER() OVER (
            PARTITION BY p.category
            ORDER BY SUM(s.quantity) DESC
        ) AS koht
    FROM products p
    JOIN sales s ON p.product_id = s.product_id
    GROUP BY category, product_name
)
SELECT category, product_name, müüdud_kogus, koht
FROM toote_myyk
WHERE koht = 1
ORDER BY category, koht;

-- kontroll
  select COUNT(DISTINCT product_id) from products;
  --tulemus on 362
  select COUNT(product_id) from products;
  -- tulemus on samuti 362 - s.t. et tuplikaatseid tooteid ei ole 

--see päring leiab tooted, mida on laos üle 200 , kuid mida pole viimase 6  kuu jooksul müüdud
  SELECT 
  p.category,
  p.product_name, 
  i.location,
    i.quantity_available, 
    COALESCE(SUM(s.quantity), 0) AS myydud_viimase_6kuuga
FROM products p
JOIN inventory i ON p.product_id = i.product_id
-- Kasutame LEFT JOIN-i, et näha ka müümata tooteid
LEFT JOIN sales s ON p.product_id = s.product_id 
    AND s.sale_date > CURRENT_DATE - INTERVAL '6 month'
WHERE i.quantity_available > 200
GROUP BY p.category, p.product_name, i.location, i.quantity_available
-- HAVING filtreerib grupeeritud tulemust (summat)
HAVING COALESCE(SUM(s.quantity), 0) = 0
ORDER BY quantity_available DESC;

--sellisedi tooteid on 218 tk mida onüle 200 tk ja mida pole müüdud viimase 6 kuu jooksul
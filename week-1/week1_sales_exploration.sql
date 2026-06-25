--nädal 1 grupitöö
--vaatan kanalitega seotud veerge :
SELECT channel, store_location, payment_method    
FROM sales    
LIMIT 20;  

..leian kõik müügikanalid mida US kasutab:
SELECT DISTINCT channel 
FROM sales;   
-- tulemuseks on 2 kanalit: online ja pood

--leia kõik kaupluste asukohad kus US poed asuvad:
SELECT DISTINCT store_location 
FROM sales;
-- tulemuseks on Tallinn,Tartu,Pärnu, NULL (s.t et asukoht pole märgitud, võib olla veebipood?)

--leia kõik makseviisid mida kliendid kasutavad

SELECT DISTINCT payment_method FROM sales;

--tulemus : järelmaks, kaart, sularaha

--Leia tehingud, mis on tehtud veebipoe kaudu:

SELECT * FROM sales    
WHERE channel = 'online'    
ORDER BY total_price DESC    
LIMIT 15;  

--Leia tehingud ilma asukoha infota. Mitu tehingut on, kus kaupluse asukoht on puudu (NULL)?

SELECT COUNT(*) AS puuduv_asukoht    
FROM sales    
WHERE store_location IS NULL;

--tulemus on 5284 tk
--sama tulemuse annab päring kui otsida Where channel=online

--minu lisapäring
--online channelil peaks asukoht olema alati NULL 
--aga vastuolu maksemeetodis - online ei saa maksta sularahas
SELECT channel, store_location, payment_method    
FROM sales    
WHERE store_location IS NULL
LIMIT 100; 

--lisaülesanded
--Loe tehingud kokku iga kaupluse asukoha kohta:
SELECT  store_location, 
COUNT(sale_id) AS tehinguid
FROM     sales
WHERE store_location IS NOT NULL
GROUP BY  store_location
ORDER BY tehinguid DESC;   
--see töötab

--aga see mitte
SELECT store_location,
COUNT(*) AS tehinguid
FROM     sales
WHERE store_location IS NOT NULL
ORDER BY tehinguid DESC;



--otsin online tehingute arvu
SELECT COUNT(*) AS online_tehinguid   
FROM sales   
WHERE channel = 'online';
-- tulemus on 5204

--poe tehingute arv:
SELECT COUNT(*) AS poe_tehinguid   
FROM sales   
WHERE channel = 'pood';   `
-- tulemus on 10030

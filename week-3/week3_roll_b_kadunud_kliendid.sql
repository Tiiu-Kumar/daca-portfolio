-- nädal 3 ROLL B 
 -- leia kliendid kellel pole ühtegi ostu
 SELECT
    c.first_name ,
    c.last_name,
    c.email,
    c.city,
    c.registration_date,
    s.sale_id
  FROM customers c 
 LEFT JOIN sales s ON c.customer_id = s.customer_id  
 WHERE s.sale_id IS NULL;

 --Loe kokku, mitu "kadunud" klienti on:
SELECT COUNT(*) AS kadunud_kliente
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id  
WHERE s.sale_id IS NULL;
selliseid kliente on 599

-- analüüsi kadunud kliente linnade kaupa
SELECT        
c.city, COUNT(*) AS kadunud_kliente 
FROM customers c 
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL
GROUP BY c.city
ORDER BY kadunud_kliente DESC;

-- Millal kadunud kliendid registreerusid? 
SELECT        
c.first_name || ' ' || c.last_name AS klient,  
c.registration_date,
c.city,
c.loyalty_tier
FROM customers c  
LEFT JOIN sales s ON c.customer_id = s.customer_id  
WHERE s.sale_id IS NULL
ORDER BY c.registration_date DESC;
---
-- Võrdle kadunud vs aktiivsete klientide arvu:
SELECT        CASE    
 WHEN s.sale_id IS NULL THEN 'Kadunud (pole ostnud)' 
 ELSE 'Aktiivne (on ostnud)'        
 END AS staatus, 
 COUNT(DISTINCT c.customer_id) AS kliente  
 FROM customers c 
 LEFT JOIN sales s ON c.customer_id = s.customer_id   
 GROUP BY        
 CASE            
 WHEN s.sale_id IS NULL THEN 'Kadunud (pole ostnud)'            
 ELSE 'Aktiivne (on ostnud)'        
 END;

 -- edasijõudnud tase  
  --grupeeri kadunud kliendid registreerimiskuu kaupa ja otsi mustreid:
SELECT 
DATE_TRUNC('month', c.registration_date) AS registreerimis_kuu, 
COUNT(*) AS kadunud_kliente
 FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id 
WHERE s.sale_id IS NULL   
GROUP BY DATE_TRUNC('month', c.registration_date)   
--ORDER BY registreerimis_kuu;  
ORDER BY kadunud_kliente DESC;
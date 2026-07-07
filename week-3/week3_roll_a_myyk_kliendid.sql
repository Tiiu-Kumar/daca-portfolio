
--grupitöö ROLL A
-- mmügi ja klientide ühendamine
SELECT        
c.first_name,
c.last_name,
c.email,  
c.city,
s.sale_id,
s.sale_date,
s.total_price 
 FROM sales s    
 INNER JOIN customers c ON s.customer_id = c.customer_id    
 LIMIT 20;    


 --Leia TOP 10 klienti kogumüügi järgi
SELECT
    c.first_name || ' ' || c.last_name AS klient,
    c.city AS linn,
    COUNT(DISTINCT s.sale_id) AS ostude_arv,
    SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY kogumuuk DESC
LIMIT 20;

 --Leia TOP 10 klienti kogumüügi ja kategooriate  järgi:
SELECT
    c.first_name || ' ' || c.last_name AS klient,
    c.city AS linn,
    COUNT(DISTINCT s.sale_id) AS ostude_arv,
    p.category AS kategooria,
    SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.city, p.category
ORDER BY kogumuuk DESC
LIMIT 20;

-- müük linnade kaupa
SELECT
    c.city AS linn,
    COUNT(DISTINCT c.customer_id) AS kliente, 
    COUNT(s.sale_id) AS ostude_arv,
    SUM(s.total_price) AS kogumüük 
    FROM sales s
     INNER JOIN customers c ON s.customer_id = c.customer_id  
     GROUP BY c.city   
     ORDER BY kogumüük DESC; 
--Uuri loyalty_tier jaotust:
SELECT        
c.loyalty_tier,        
COUNT(DISTINCT c.customer_id) AS kliente,        
SUM(s.total_price) AS kogumüük    
FROM sales s    
INNER JOIN customers c ON s.customer_id = c.customer_id    
GROUP BY c.loyalty_tier    
ORDER BY kogumüük DESC;    `

--leia kliendid, kelle kogumüük on üle keskmise:

SELECT       
c.first_name || ' ' || c.last_name AS klient,       
SUM(s.total_price) AS kogumüük   
FROM sales s   
INNER JOIN customers c ON s.customer_id = c.customer_id   
GROUP BY c.customer_id, c.first_name, c.last_name   
HAVING SUM(s.total_price) > (       
  SELECT AVG(kliendi_müük)       
  FROM (           SELECT SUM(total_price) AS kliendi_müük           
  FROM sales           
  GROUP BY customer_id       ) AS keskmised   )   
  ORDER BY kogumüük DESC;   

  -- 762 klienti

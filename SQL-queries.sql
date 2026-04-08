/*
SELECT c.customer_firstname, 
       c.customer_lastname, 
       c.customer_email, 
       s.salesperson_first_name, 
       s.salesperson_last_name
FROM customer c
JOIN salesperson s ON c.salesperson_id = s.salesperson_id;

SELECT c.customer_firstname, 
       c.customer_lastname, 
       c.customer_email, 
       s.salesperson_first_name, 
       s.salesperson_last_name
FROM customer c
JOIN salesperson s ON c.salesperson_id = s.salesperson_id;

SELECT o.order_id, 
       o.order_date, 
       o.order_status, 
       p.payment_status, 
       pm.pm_display_name
FROM [Order] o
JOIN payment p ON o.order_id = p.order_id
JOIN payment_method pm ON p.pm_id = pm.pm_id;

SELECT a.asset_id, 
       a.asset_status, 
       p.productName, 
       p.productPrice
FROM Asset a
JOIN Product p ON a.product_id = p.productId
WHERE a.customer_id = 1;

SELECT c.customer_firstname, 
       c.customer_lastname, 
       c.customer_email
FROM customer c
JOIN [Order] o ON c.customer_id = o.customer_id
WHERE o.order_date >= DATEADD(DAY, -30, GETDATE());

SELECT pm.pm_display_name, 
       AVG(p.payment_amount) AS average_payment
FROM payment p
JOIN payment_method pm ON p.pm_id = pm.pm_id
GROUP BY pm.pm_display_name;

SELECT v.vendor_name, 
       vpo.vpo_status, 
       SUM(vpo.vpo_price * vpo.vpo_quantity) AS total_order_value
FROM vendor v
JOIN vendor_purchase_order vpo ON v.vendor_id = vpo.vendor_id
GROUP BY v.vendor_name, vpo.vpo_status;

UPDATE salesperson
SET salesperson_status = 'Inactive'
WHERE salesperson_id NOT IN (
    SELECT DISTINCT salesperson_id 
    FROM customer
    WHERE customer_create_at > DATEADD(YEAR, -1, GETDATE())
);

UPDATE Shipping
SET shipping_status = 'Cancelled'
WHERE shipping_picked_date IS NULL 
  AND shipping_create_date < DATEADD(DAY, -15, GETDATE());
  
*/
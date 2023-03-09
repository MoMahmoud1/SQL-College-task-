use my_guitar_shop;

/* question 1.	
Write a SELECT statement that inner joins the Products table to the Categories
 table and returns the columns product_name, category_name, and list_price with the aliases Product,
 Category, and Price, respectively.
Sort the result set by Category and then by Price in ascending sequence.
*/
SELECT 
    product_name , 
    category_name , 
    list_price
FROM products p INNER JOIN categories c
 ON p.category_id = c.category_id
ORDER BY Category_name, list_Price;

/*
. Write a SELECT statement that joins the Customers table to the Addresses table and returns
these columns: first_name, last_name, line1, city, state, zip_code.
 Return one row for each address for the customer with an email address of
allan.sherwood@yahoo.com.
*/
SELECT first_name, last_name,concat( line1, ', ',city, ', ',state, ', ',zip_code) as customer_address
from customers c JOIN addresses a
ON c.customer_id = a.customer_id
WHERE email_address  LIKE 'allan.sherwood@yahoo.com';
/*
 Write a SELECT statement that joins the Customers table to the Addresses table and returns
these columns: first_name, last_name, line1, city, state, zip_code. 
Return one row for each customer, but only return addresses that are the shipping address
for a customer.
*/
SELECT first_name, last_name ,concat( line1,', ', city,', ', state,', ' ,zip_code) as shipping_address
FROM customers c JOIN addresses a 
ON c.customer_id = a.customer_id;

/*
 Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products
tables. This statement should return these columns:
 last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity. 
 Use aliases for the tables. Sort the final result set by the last_name, order_date, and product_name columns.
*/

SELECT  c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity
FROM customers c join orders o
ON c.customer_id = o.customer_id
join order_items oi 
on o.order_id = oi.order_id
join products p 
on oi.product_id = p.product_id
order by last_name, order_date , product_name;

/*
. Write a SELECT statement that returns the product_name and list_price columns from the
Products table. Return one row for each product that has the same list price as another product. 
Hint: Use a self-join to check that the product_id columns aren’t equal but the list_price
columns are equal. Sort the result set by the product_name column
*/

select p1.product_name , p1.list_price
from products p1 join products p2
on p1.product_id != p2.product_id
and p1.list_price = p2.list_price 
order by product_name ;

/*
 Write a SELECT statement that returns these two columns:
category_name The category_name column from the Categories table
product_id The product_id column from the Products table
Return one row for each category that has never been used. Hint: Use an outer join and only
return rows where the product_id column 
*/

select c.category_name, p.product_id
from categories c left outer join products p 
on c.category_id = p.category_id
where  product_id is null ;

/*
 Use the UNION operator to generate a result set consisting of three columns from the
Orders table:
ship_status A calculated column that contains a value of SHIPPED or
NOT SHIPPED
order_id The order_id column
order_date The order_date column
If the order has a value in the ship_date column, the ship_status column should contain a
value of SHIPPED. Otherwise, it should contain a value of NOT SHIPPED. 
Sort the final result set by the order_date column
*/

select 'shipped' as ship_status , order_id, order_date 
from orders 
where ship_date is not null 
union select 'not shipped' as ship_status , order_id, order_date 
from orders 
where ship_date is null
order by order_date;

















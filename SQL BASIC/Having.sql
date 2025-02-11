CREATE TABLE minimarket_sales (
    transaction_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(50),
    sales_amount DECIMAL(10, 2)
);

INSERT INTO minimarket_sales (transaction_id, product_name, product_category, sales_amount)
VALUES
    (1, 'Product A', 'Category 1', 100.00),
    (2, 'Product B', 'Category 2', 150.00),
    (3, 'Product C', 'Category 1', 75.00),
    (4, 'Product D', 'Category 3', 200.00),
    (5, 'Product E', 'Category 2', 120.00),
    (6, 'Product F', 'Category 1', 50.00),
    (7, 'Product G', 'Category 2', 180.00),
    (8, 'Product H', 'Category 1', 90.00),
    (9, 'Product I', 'Category 3', 220.00),
    (10, 'Product J', 'Category 2', 80.00),
    (11, 'Product K', 'Category 1', 120.00),
    (12, 'Product L', 'Category 3', 300.00),
    (13, 'Product M', 'Category 2', 170.00),
    (14, 'Product N', 'Category 1', 110.00),
    (15, 'Product O', 'Category 3', 250.00),
    (16, 'Product P', 'Category 2', 70.00),
    (17, 'Product Q', 'Category 1', 130.00),
    (18, 'Product R', 'Category 3', 280.00),
    (19, 'Product S', 'Category 2', 160.00),
    (20, 'Product T', 'Category 1', 95.00);

   
-- cek hasil insert 
--HAVING ni mcm kau nak kira berapa nilai yang kau dapat dalam haritu, kau boleh tentukan nak berapa, lebih dari 5 ke, 10 ke sama dgn 100 ke
select *
from minimarket_sales ;

-- menggunakan group by dengan fungsi agregat count

select product_category, count(*)
from minimarket_sales 
group by product_category
order by product_category;

-- memfilter data hasil agregasi menggunakan HAVING
select product_category, count(*)
from minimarket_sales 
group by product_category
having count(*) > 5
order by count(*) DESC;

-- menggunakan group by dengan fungsi agregat sum
select product_category, sum(sales_amount)
from minimarket_sales 
group by product_category;

-- memfilter data hasil agregasi menggunakan HAVING
select product_category, sum(sales_amount)
from minimarket_sales 
group by product_category
having sum(sales_amount) >= 1000
order by sum(sales_amount) ;

-- drop table / hapus
drop table minimarket_sales ;

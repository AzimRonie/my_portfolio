-- membuat table products

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_category VARCHAR(50),
    product_subcategory VARCHAR(50),
    product_name VARCHAR(100)
);

-- insert data ke dalam tabel products

INSERT INTO products (product_id, product_category, product_subcategory, product_name)
VALUES
    (1, 'Electronics', 'Smartphones', 'iPhone 12'),
    (2, 'Electronics', 'Smartphones', 'Samsung Galaxy S21'),
    (3, 'Electronics', 'Laptops', 'Dell XPS 13'),
    (4, 'Clothing', 'T-Shirts', 'Plain White T-Shirt'),
    (5, 'Clothing', 'Jeans', 'Slim Fit Blue Jeans'),
    (6, 'Electronics', 'Tablets', 'iPad Pro'),
    (7, 'Electronics', 'Laptops', 'HP Spectre x360'),
    (8, 'Clothing', 'T-Shirts', 'Graphic Print T-Shirt'),
    (9, 'Clothing', 'Jeans', 'Relaxed Fit Black Jeans'),
    (10, 'Furniture', 'Chairs', 'Leather Recliner Chair'),
    (11, 'Furniture', 'Sofas', 'Sectional Sofa'),
    (12, 'Electronics', 'Headphones', 'Sony WH-1000XM4'),
    (13, 'Furniture', 'Chairs', 'Wooden Dining Chair'),
    (14, 'Clothing', 'Dresses', 'Floral Sundress'),
    (15, 'Furniture', 'Sofas', 'Leather Loveseat'),
    (16, 'Electronics', 'Headphones', 'Bose QuietComfort 35 II'),
    (17, 'Furniture', 'Tables', 'Coffee Table'),
    (18, 'Clothing', 'Dresses', 'Little Black Dress'),
    (19, 'Electronics', 'Tablets', 'Samsung Galaxy Tab S7'),
    (20, 'Furniture', 'Tables', 'Dining Table');

-- cek hasil create dan insert 

select *
from products ;
   
-- pertanyaan : sebutkan kategori produk apa saja yang ada di dalam tabel products ?

select distinct product_category
from products;

select count(distinct product_category)
from products;

-- pertanyaan : kombinasi product_category dan product_subcategory

select distinct product_category, product_subcategory
from products
order by product_category;


drop table products ;

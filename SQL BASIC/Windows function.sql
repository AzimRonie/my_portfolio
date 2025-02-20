/*Apa itu windows Function
 -Kira nilai dalam "jendela" tertentu tanpa ubah jumlah baris dalam result.
 -Basic syntax
SELECT 
    column1, 
    column2, 
    AGGREGATE_FUNCTION() OVER (PARTITION BY columnX ORDER BY columnY)
FROM table_name;
 */

CREATE TABLE jualan(
    id SERIAL PRIMARY KEY,
    salesperson VARCHAR(50),
    department VARCHAR(50),
    sales_amount INT,
    sale_date DATE
);

INSERT INTO jualan (salesperson, department, sales_amount, sale_date) 
VALUES
('Ali', 'IT', 500, '2024-01-01'),
('Abu', 'IT', 700, '2024-01-02'),
('Aisyah', 'HR', 1000, '2024-01-03'),
('Siti', 'HR', 1200, '2024-01-04'),
('Bakar', 'Finance', 400, '2024-01-05'),
('Farah', 'Finance', 900, '2024-01-06'),
('Ali', 'IT', 800, '2024-01-07'),
('Abu', 'IT', 600, '2024-01-08'),
('Aisyah', 'HR', 1100, '2024-01-09'),
('Siti', 'HR', 1300, '2024-01-10'),
('Bakar', 'Finance', 500, '2024-01-11'),
('Farah', 'Finance', 950, '2024-01-12');

select *
from jualan;

select sum(sales_amount) as jumlah_jualan
from jualan;

--SUM() OVER() - Jumlah Keseluruhan & Per Department
select 
salesperson,department,sales_amount,
sum(sales_amount) over() as total_sales,
sum(sales_amount) over(partition by department) as dept_total_sales--Kira jumlah sales untuk setiap department secara berasingan.
from jualan;

--RANK() OVER() - Ranking Sales
select
salesperson,department,sales_amount,
rank() over (order by sales_amount desc) as sales_rank--wajib followed by 'order by' kalau rank ni
from jualan;

select 
salesperson,department, sales_amount,
rank() over(
partition by department --akan dirank kan dalam kelompok department diorang saja
order by sales_amount desc) as sales_rank -- dan rank tu akan dinilai pada sales_amount
from jualan;

--dense_rank() and rank()
--lebih kurang je dua ni , tapi rank akan skip nom dan dense_rank akan xskip nombor
select
salesperson,department,sales_amount,
rank() over (order by sales_amount desc) as rank_sales,
dense_rank() over (order by sales_amount desc) as dense_rank_sales
from jualan;

--lag() and lead() - bandingkan data sebelum dan selepas
select
salesperson,department, sales_amount, sale_date,
lag(sales_amount) over (partition by department order by sale_date) as jualan_sebelum, --ambik nilai sebelum mengikut tarikh
lead(sales_amount) over (partition by department order by sale_date) as jualan_selepas --ambik nilai selepas mengikut tarikh
from jualan;
--maksudnya pada lead tu, dia akan nilai pada 6 hb 1 (nom 1)
-- lag plk akan ambik nilai pada 5 hb 1 (nom 2)



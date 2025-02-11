
-- Table creation
CREATE TABLE OrderDetails (
    OrderID INT PRIMARY KEY,
    OrderReference VARCHAR(50)
);

-- Sample data insertion
INSERT INTO OrderDetails (OrderID, OrderReference) VALUES
(1, 'JKT192839BDG'),
(2, 'NYC123456LAX'),
(3, 'LON987654PAR'),
(4, 'LAH456789ISL'),
(5, 'TKY987654OSK'),
(6, 'SYD456123MEL'),
(7, 'DEL789456MUM'),
(8, 'MIA654321ORL'),
(9, 'AMS987654BER'),
(10, 'ROM123456MIL');


-- 
select *
from orderdetails o ;


-- string function left
select left(orderreference,3) as origin_code
from orderdetails o ;

-- string function right
select right(orderreference,3) as destination_code
from orderdetails o ;

-- string function substring
select substring(orderreference,4,6) as order_id --dia ambik start pada digit 4, dan dia ambik sebanyak 6 digit start digit 4 tu
from orderdetails o ;

-- final result
select 
orderreference ,
left(orderreference,3) as origin_code ,
right(orderreference,3) as destination_code ,
substring(orderreference,4,6) as order_id 
from orderdetails o ;


-- drop table
drop table orderdetails ;

-- STRING FUNCTION LOWER UPPER INITCAP

-- create new table named messy_names
CREATE TABLE messy_names (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- insert the data into the table
INSERT INTO messy_names (first_name, last_name) VALUES
    ('john', 'smith'),
    ('MARY', 'jones'),
    ('pETER', 'Brown'),
    ('alice', 'WILLIAMS'),
    ('sTeVe', 'miller'),
    ('jennifer', 'PARKER'),
    ('mIcHaeL', 'davis'),
    ('ELIZABETH', 'wang'),
    ('david', 'NGUYEN');

-- check data insertion result
select *
from messy_names mn ;

-- lower function
select lower(first_name)
from messy_names mn ;

-- upper function
select upper(first_name)
from messy_names mn ;

-- initcap function
select initcap(first_name)
from messy_names mn ;

select lower(first_name) as first_name, lower(last_name) as last_name, upper(first_name), initcap(first_name)
from messy_names mn ;


-- drop table
drop table messy_names ;

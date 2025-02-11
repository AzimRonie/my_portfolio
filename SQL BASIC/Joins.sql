drop table books, authors, editors, translators ;

-- membuat table books

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    type VARCHAR(50),
    author_id INT,
    editor_id INT,
    translator_id INT
);

INSERT INTO books (title, type, author_id, editor_id, translator_id) VALUES
('Time to Grow Up!', 'original', 11, 21, NULL),
('Your Trip', 'translated', 15, 22, 32),
('Lovely Love', 'original', 14, 24, NULL),
('Dream Your Life', 'original', 11, 24, NULL),
('Oranges', 'translated', 12, 25, 31),
('Your Happy Life', 'translated', 15, 22, 33),
('Applied AI', 'translated', 13, 23, 34),
('My Last Book', 'original', 11, 28, NULL);

-- membuat table authors

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

INSERT INTO authors (id, first_name, last_name) VALUES
(11, 'Ellen', 'Writer'),
(12, 'Olga', 'Savelieva'),
(13, 'Jack', 'Smart'),
(14, 'Donald', 'Brain'),
(15, 'Yao', 'Dou');

-- membuat table editors

CREATE TABLE editors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

INSERT INTO editors (id, first_name, last_name) VALUES
(21, 'Daniel', 'Brown'),
(22, 'Mark', 'Johnson'),
(23, 'Maria', 'Evans'),
(24, 'Cathrine', 'Roberts'),
(25, 'Sebastian', 'Wright'),
(26, 'Barbara', 'Jones'),
(27, 'Matthew', 'Smith');

-- membuat table translators

CREATE TABLE translators (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

INSERT INTO translators (id, first_name, last_name) VALUES
(31, 'Ira', 'Davies'),
(32, 'Ling', 'Weng'),
(33, 'Kristian', 'Green'),
(34, 'Roman', 'Edwards');

select *
from books;

select *
from authors ;

select *
from editors ;

select *
from translators;

-- inner join
-- #1 books and their authors
select 
A.title, 
B.first_name as authors_first_name,
B.last_name as authors_last_name
from books A
join authors B 
on A.author_id = B.id; 

-- #2 books and their translators
select 
a.title, 
B.first_name as translator_name
from books a
join translators B 
on a.translator_id = B.id;

-- left join
-- #3 books with their editors (if there is any)
select 
a.title , 
a.type ,
b.first_name 
from books a
left join editors b --left join maksudnyo dio ambik semua data dari table A (kiri) , walau ada 1000 data, 1000 la dio ambik, data di B(kanan) xdiambik kira
on a.editor_id = b.id ;

-- #4 books with their translators (if there is any)
select 
a.title, 
a.type, 
t.first_name as translator_name
from books a
left join translators t
on a.translator_id = t.id

-- right join

-- #5 books with their editors (if there is any)
select 
a.title, 
a.type, 
b.first_name as editor_name
from books a
right join editors b --right join maksudnyo dio ambik semua data dari table B(kanan),walau ada 1000 data, 1000 la dio ambik, data di A(kiri) xdiambik kira
on a.editor_id = b.id

-- #6 books with their translators (if there is any)
select 
a.title, 
a.type, 
t.first_name as translator_name
from books a
right join translators t
on a.translator_id = t.id

-- full join, all books and editors
SELECT 
b.id, 
b.title, 
e.last_name AS editor
FROM books b
FULL JOIN editors e 
ON b.editor_id = e.id; 

--inner join/join ni dia ambik data kalau dua2 table tu ada info yang sama, kalau xsama, dia xkan outputkan data tu
--left join ni dia ambik semua data dari table A (kiri) , walau ada 1000 data, 1000 la dio ambik, data di B(kanan) xdiambik kira
--right join ni dia ambik semua data dari table B(kanan),walau ada 1000 data, 1000 la dio ambik, data di A(kiri) xdiambik kira
--full join ni dia 

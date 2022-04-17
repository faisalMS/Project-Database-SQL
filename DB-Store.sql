# DDL - Create
CREATE DATABASE store;
CREATE TABLE countries(
 code INT PRIMARY KEY,
 name VARCHAR(20) NOT NULL,
 continent_name VARCHAR(20) UNIQUE
);
CREATE TABLE users(
   id INT PRIMARY KEY,
   full_name VARCHAR(20),
   email VARCHAR(20) UNIQUE,
   gender VARCHAR(1) CHECK(gender='M' or gender='F'),
   date_of_birth VARCHAR(15),
   created_at DATETIME,
   country_code INT,
   FOREIGN KEY (id) REFERENCES countries(id)
);
CREATE TABLE orders(
	id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
	status VARCHAR(6) CHECK(status='start' or status='finish'),
    ceated_at DATETIME
);
CREATE TABLE order_products(
    order_id INT,
    product_id INT,
	quantity INT DEFAULT 0,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
CREATE TABLE products(
    id INT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    price INTEGER DEFAULT 0,
    status VARCHAR(10) CHECK(status='valid' or status='expired'),
    created_at DATETIME
);

# DML - Insert
insert into countries values (1 , 'Saudi Arabia', 'Asia');
insert into users values (1 , 'FAISAL', 'faisalmalsofyani@gmail.com', 'm', 1995-10-28, '2022-04-17 02:00:00', 1);
insert into orders values (1 ,'note', 5,'valid','2022-04-17 02:00:00');
insert into products values (1 ,'note', 5,'valid','2022-04-17 02:00:00');
insert into order_products values (1 ,1, 1);

# DML - Update
update countries set name='Saudi' where code='1';

# DML - Delete
delete from products where id='1';


# DQL Select 
select * from users;
select * from countries;
select * from orders;
select * from order_products;
select * from products;
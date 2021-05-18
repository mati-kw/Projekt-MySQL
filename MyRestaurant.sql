create table employees (
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	salary INT,
	job VARCHAR(6),
	PRIMARY KEY (id)
)ENGINE=InnoDB;

create table menu (
	id INT NOT NULL AUTO_INCREMENT,
	dish VARCHAR(19),
	price DECIMAL(4,2),
	vegetarian VARCHAR(50),
	gluten_free VARCHAR(50),
	PRIMARY KEY (id)
)ENGINE=InnoDB;

create table customers (
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	telephone VARCHAR(50),
	PRIMARY KEY (id)
)ENGINE=InnoDB;

create table pending_orders (
	order_id INT NOT NULL,
	dish_id INT NOT NULL,
	order_time DATETIME,
	customer_id INT NOT NULL,
	FOREIGN KEY (dish_id) REFERENCES menu(id),
    	FOREIGN KEY (customer_id) REFERENCES customers(id)
)ENGINE=InnoDB;

create table completed_orders (
	order_id INT NOT NULL,
	dish_id INT NOT NULL,
	order_time DATETIME,
	completed_time DATETIME,
	employee_id INT NOT NULL,
	customer_id INT NOT NULL,
	FOREIGN KEY (dish_id) REFERENCES menu(id),
	FOREIGN KEY (employee_id) REFERENCES employees(id),
	FOREIGN KEY (customer_id) REFERENCES customers(id)
)ENGINE=InnoDB;

create table shops (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	mail VARCHAR(50),
	iban VARCHAR(50),
	city VARCHAR(50),
	type VARCHAR(21),
	PRIMARY KEY (id)
)ENGINE=InnoDB;



create table supply_orders (
	id INT NOT NULL AUTO_INCREMENT,
	shop_id INT NOT NULL,
	employee_id INT NOT NULL,
	supp_val FLOAT(7,2),
	supply_date DATETIME,
	PRIMARY KEY (id),
	FOREIGN KEY (shop_id) REFERENCES shops(id),
	FOREIGN KEY (employee_id) references employees(id)
)ENGINE=InnoDB;



insert into employees (first_name, last_name, email, salary, job) values ('Shae', 'Youngs', 'syoungs0@woothemes.com', 4498, 'Cook');
insert into employees (first_name, last_name, email, salary, job) values ('Kerrie', 'Kerins', 'kkerins1@admin.ch', 4854, 'Waiter');
insert into employees (first_name, last_name, email, salary, job) values ('Sukey', 'Daniau', 'sdaniau2@webs.com', 3856, 'Waiter');
insert into employees (first_name, last_name, email, salary, job) values ('Loydie', 'Penni', 'lpenni3@tiny.cc', 4753, 'Waiter');
insert into employees (first_name, last_name, email, salary, job) values ('Sarina', 'Luipold', 'sluipold4@independent.co.uk', 3926, 'Waiter');
insert into employees (first_name, last_name, email, salary, job) values ('Toby', 'Cescot', 'tcescot5@foxnews.com', 4440, 'Waiter');
insert into employees (first_name, last_name, email, salary, job) values ('Jake', 'Clark', 'jk@foxnews.com', 6700, 'Man');


insert into menu (dish, price, vegetarian, gluten_free) values ('Spaghetti Carbonara', 32.11, true, true);
insert into menu (dish, price, vegetarian, gluten_free) values ('Spaghetti Bolognese', 49.14, false, true);
insert into menu (dish, price, vegetarian, gluten_free) values ('Pizza Margarita', 66.08, true, true);
insert into menu (dish, price, vegetarian, gluten_free) values ('Pizza Cipolla', 71.12, true, false);
insert into menu (dish, price, vegetarian, gluten_free) values ('Pizza Pepperoni', 30.8, true, false);
insert into menu (dish, price, vegetarian, gluten_free) values ('Pizza Salami', 35.48, true, false);
insert into menu (dish, price, vegetarian, gluten_free) values ('Bacon Burger', 45.54, false, false);
insert into menu (dish, price, vegetarian, gluten_free) values ('Fries', 56.57, true, false);
insert into menu (dish, price, vegetarian, gluten_free) values ('Onion Rings', 51.49, false, true);
insert into menu (dish, price, vegetarian, gluten_free) values ('Pineapple', 55.51, true, false);


insert into shops (name, mail, iban, city, type) values ('Gulgowski-Grady', 'gbowness0@techcrunch.com', 'GB76 JJEI 6923 4330 3564 05', 'Chambéry', 'Meat');
insert into shops (name, mail, iban, city, type) values ('Wehner-Hills', 'mcolbron1@prweb.com', 'FR52 9300 5046 00F6 GFRY EIDB A04', 'Huayllati', 'Meat');
insert into shops (name, mail, iban, city, type) values ('Kunde-O''Keefe', 'sapthorpe2@webeden.co.uk', 'SM73 E455 1106 893Y GPM7 BLGJ GMQ', 'Las Flores', 'Bakery');
insert into shops (name, mail, iban, city, type) values ('Pfannerstill LLC', 'wpirozzi3@hud.gov', 'IE45 HXWH 6819 3842 6019 91', 'Mae Charim', 'Bakery');
insert into shops (name, mail, iban, city, type) values ('Waters, McDermott and Quigley', 'acoon4@mozilla.com', 'FR24 0996 6613 31S9 T50Q 1HMY R07', 'Enschede', 'Meat');
insert into shops (name, mail, iban, city, type) values ('Kirlin-Kuhn', 'gbourgeois5@cargocollective.com', 'LU03 420G VH1P P7SG 2CVY', 'Svilengrad', 'Meat');
insert into shops (name, mail, iban, city, type) values ('Yundt, Cole and Stanton', 'toshevlan6@a8.net', 'GB20 CAJV 3331 5254 3921 92', 'Batanovtsi', 'Fruits and Vegetables');
insert into shops (name, mail, iban, city, type) values ('Goyette, Jones and Homenick', 'bcordaroy7@e-recht24.de', 'SE72 0732 4580 7319 2827 9460', 'Nyalindung', 'Fruits and Vegetables');

insert into customers (first_name, last_name, telephone) values ('Niko', 'Aslie', 200438581);
insert into customers (first_name, last_name, telephone) values ('Mallorie', 'Colleton', 105080410);
insert into customers (first_name, last_name, telephone) values ('Raffarty', 'Hayworth', 747164808);
insert into customers (first_name, last_name, telephone) values ('Cecily', 'Cotterel', 131827196);
insert into customers (first_name, last_name, telephone) values ('Clair', 'Calton', 895895795);
insert into customers (first_name, last_name, telephone) values ('Malva', 'Saunder', 985796619);
insert into customers (first_name, last_name, telephone) values ('Berna', 'Longley', 467012919);
insert into customers (first_name, last_name, telephone) values ('Levin', 'Crawford', 976516168);
insert into customers (first_name, last_name, telephone) values ('Tomas', 'Gjerde', 955046302);
insert into customers (first_name, last_name, telephone) values ('Carol', 'Fender', 291679631);



DELIMITER //
create procedure finalize_order (IN or_id INT, IN emp_id INT)
BEGIN
    INSERT INTO completed_orders (order_id, dish_id, order_time, completed_time, employee_id,customer_id)
    SELECT pending_orders.order_id, pending_orders.dish_id,pending_orders.order_time, now(), emp_id, pending_orders.customer_id
    FROM pending_orders
    WHERE order_id=or_id;
    DELETE FROM pending_orders WHERE pending_orders.order_id = or_id;
end //

-- call finalize_order(1,3);



DELIMITER //
create procedure make_order (IN or_id INT, IN di_id INT, IN cus_id INT)
BEGIN
    INSERT INTO pending_orders (order_id, dish_id, order_time, customer_id)
    VALUES (or_id, di_id,NOW(),cus_id);
end //

-- call make_order(9,1,1);

DELIMITER //
create procedure make_supply_order (IN sh_id INT, IN emp_id INT, IN sup_val FLOAT(7,2))
BEGIN
    INSERT INTO supply_orders ( shop_id, employee_id, supp_val, supply_date)
    VALUES (sh_id, emp_id,sup_val,NOW());
end //

-- call make_supply_order(1,1,599.99);

DELIMITER //
create procedure order_val (IN or_id INT)
BEGIN
    select order_id, sum(price) from completed_orders INNER JOIN menu m on completed_orders.dish_id = m.id where order_id = or_id
    group by order_id;
end //

-- calla order_val(9);

DELIMITER //
create procedure update_menu (IN item_id INT, IN up_dish VARCHAR(19), IN up_price DECIMAL(4,2),IN up_veg VARCHAR(50), IN up_gluten VARCHAR(50) )
BEGIN
    UPDATE menu SET dish = up_dish, price = up_price, vegetarian = up_veg, gluten_free = up_gluten WHERE item_id = id;
end //

-- call update_menu(10,'Pineapple',10,1,1);

DELIMITER //
create procedure add_to_menu (IN up_dish VARCHAR(19), IN up_price DECIMAL(4,2),IN up_veg VARCHAR(50), IN up_gluten VARCHAR(50) )
BEGIN
    INSERT INTO menu (dish, price, vegetarian, gluten_free) VALUES (up_dish,up_price,up_veg,up_gluten);
end //

-- call add_to_menu('Apple',2,1,1);

DELIMITER //
create procedure delete_from_menu (IN item_id INT)
BEGIN
    DELETE from menu where id = item_id;
end //

-- call delete_from_menu(11);

DELIMITER //
create procedure delete_pending (IN item_id INT)
BEGIN
    DELETE from pending_orders where order_id = item_id;
end //

DELIMITER //
create procedure delete_finalized (IN item_id INT)
BEGIN
    DELETE from completed_orders where order_id = item_id;
end //


create view vegetarian_menu AS
    select id,dish, price from menu WHERE menu.vegetarian =1;
-- select * from vegetarian_menu;

create view gluten_free_menu AS
    select id,dish, price from menu WHERE menu.gluten_free =1;
-- select * from gluten_free_menu;

create view completion_time AS
select order_id, price, dish, last_name, (completed_time - order_time)/60 as 'time'
from menu INNER JOIN completed_orders co on menu.id = co.dish_id INNER JOIN customers c on co.customer_id = c.id ORDER BY time;

-- select * from completion_time;

create view most_popular_dish AS
select dish_id, dish , COUNT(*) as "number of times ordered" from completed_orders
    INNER JOIN menu m on completed_orders.dish_id = m.id
    GROUP BY dish_id ORDER BY COUNT(*) DESC;

-- select * from most_popular_dish;

create view employees_dishes_served AS
select id as "employee id", last_name, COUNT(order_id) as "dishes served" from employees INNER JOIN completed_orders co on employees.id = co.employee_id
GROUP BY last_name, id ORDER BY COUNT(order_id) DESC;

-- select * from employees_dishes_served;

DELIMITER //
create trigger proper_pending BEFORE INSERT ON pending_orders FOR EACH ROW
    BEGIN
        DECLARE errormsg VARCHAR(255);
        set errormsg = CONCAT('there already exist order with id: ',NEW.order_id);
        IF NEW.order_id IN (select order_id from completed_orders) then
            signal sqlstate '45000' set message_text = errormsg;
        END IF;
end //
DELIMITER ;


DELIMITER //
create trigger chek_if_man BEFORE INSERT ON supply_orders FOR EACH ROW
    BEGIN
        DECLARE errormsg VARCHAR(255);
        set errormsg = CONCAT('Watch out, Your id: ',NEW.employee_id, ' is not proper for this operation! ');
        IF NEW.employee_id NOT IN (select id from employees where job = 'Man') then
            signal sqlstate '45000' set message_text = errormsg;
        END IF;
end //
DELIMITER ;






DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE  pizzeria;
USE pizzeria;


 CREATE TABLE IF NOT EXISTS region (
     region_id INT  UNSIGNED AUTO_INCREMENT NOT NULL,
     region_name VARCHAR(45) UNIQUE NOT NULL,
     
     PRIMARY KEY(region_id)
);

INSERT INTO region (region_id, region_name)
VALUES (1, 'Charlotte'), (2, 'Someville'), (3, 'Holly Creek'), (4, 'Winston');


CREATE TABLE IF NOT EXISTS city (
    city_id INT  UNSIGNED AUTO_INCREMENT NOT NULL,
    city_name VARCHAR(45) UNIQUE NOT NULL,
    region_id INT  UNSIGNED NOT NULL,
    
    PRIMARY KEY(city_id),
    FOREIGN KEY (region_id) REFERENCES region (region_id)
);
INSERT INTO city (city_id, city_name, region_id)
VALUES (1,'Jamarfurt',3),(2,'South Harmonyhaven',2),(3,'New Jammieshire',3),(4,'Jennifermouth',1),(5,'Francisstad',3),(6,'Greggmouth',4),(7,'Kianaview',1),(8,'Rosendoside',3),(9,'New Porter',2),(10,'West Mauricechester',3);



CREATE TABLE IF NOT EXISTS client_data (
    client_id INT  UNSIGNED AUTO_INCREMENT NOT NULL,
    first_name  VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    client_address  VARCHAR(225) NOT NULL,
    zip_code VARCHAR(45) NOT NULL,
    city_id INT  UNSIGNED NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (client_id),
    FOREIGN KEY (city_id) REFERENCES city (city_id)
    
);

INSERT INTO client_data ( client_id, first_name, last_name, client_address, zip_code, city_id, phone_number)
VALUES (1,'Jessika','Blanda','14285 Robin Unions Apt. 423','26028',9,'222.879.9369'),
(2,'Flavio','Parisian','04924 Devyn Route','19869',1,'517-835-8536x6933'),
(3,'Jany','Berge','947 Frami Street','72212',4,'03459239557'),
(4,'Mona','Walsh','0373 Brandon Causeway Suite 150','65255-7642',6,'532-827-0810x043'),
(5,'Rhea','Kilback','546 Wiegand Springs','60643',5,'1-729-644-1568'),(
6,'Jalon','Jaskolski','24644 Tillman Place','47746-7939',8,'(245)943-2075'),
(7,'Uriel','Hammes','385 Bettie Meadows','00399',6,'+88(1)0287880499'),
(8,'Vernice','Stroman','9098 Baylee Forks','27078',7,'363-206-8341x6394'),
(9,'Reba','Hansen','5000 Nickolas Burgs Apt. 152','78071',7,'639.987.5333x751'),
(10,'Marcelle','Rutherford','63518 Elfrieda Ville Suite 572','21916',5,'05122158083');


CREATE TABLE IF NOT EXISTS pizza_category (
    category_id TINYINT  UNSIGNED AUTO_INCREMENT NOT NULL,
    category_name VARCHAR(45),
    PRIMARY KEY (category_id)

);

INSERT INTO pizza_category (category_id, category_name)
VALUES (1, 'season specials'), (2, 'low cost'), (3, 'recommended'), (4, 'celebrity pizza'), (5, 'classics');

CREATE TABLE IF NOT EXISTS product_image (
    image_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    image_name VARCHAR(45) NOT NULL,
    image_url VARCHAR(2048) NOT NULL,
    PRIMARY KEY(image_id)
);

INSERT INTO product_image (image_id, image_name, image_url)
VALUES (1, 'default_pizza', 'https://fastfoodt2u.com/archive/def_pizza.jpg'), (2, 'default_burger', 'https:/fastfoodt2u/archive/def_burger.jpg'), 
(3, 'default_beverage', 'https:/fastfoodt2u/archive/def_beverage.jpg');

CREATE TABLE IF NOT EXISTS product (
    product_id INT UNSIGNED AUTO_INCREMENT  NOT NULL,
    product_name VARCHAR(45) NOT NULL,
    product_description TEXT NOT NULL,
    product_type ENUM('pizza', 'hamburger', 'beverages'),
    image_id INT UNSIGNED NOT NULL, 
    product_price DECIMAL(6,2) NOT NULL,
    category_id TINYINT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_id) REFERENCES pizza_category (category_id),
    FOREIGN KEY (image_id) REFERENCES product_image (image_id)
);

INSERT INTO product (product_id, product_name, product_description, product_type, image_id, product_price, category_id)
VALUES (1, 'Chickadee Pizza', 'Spinach, eggs, pinenuts and raisins on wholegrain crust', 'pizza', 1, 7.99, 1), 
(2, 'Hawaii Pizza', 'Tomato, mozzarella, ham and fresh pineapple', 'pizza', 1, 6.99,  4), (3, 'Vegetarian Pizza', 'Tomato, onion, mockarella, artichoke and black olives', 'pizza', 1,8.99,  3), 
(4, 'Capricciosa Pizza', 'Tomato, mozzarella, prosciutto and mushrooms', 'pizza', 1, 7.99,  5), (5, 'Cheeseburger', 'Sourdough bun, freerange meat, mustard greens, and cheddar', 'hamburger', 2, 4.50, NULL),
(6, 'Vego burger', 'Sourdough bun, beetroot and frijolbuger, guacamole and cilantro. ','hamburger', 2, 6.50, 1), 
(7, 'Banana milkshake', 'Banana, vanilla, and milk', 'beverages', 2, 3.50, NULL), (8 , 'Jamaica', 'Refreshing hibiscus tea  with demerara sugar.','beverages', 3, 4.50, NULL);

CREATE TABLE IF NOT EXISTS shop (
    shop_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    shop_address VARCHAR(45) NOT NULL,
    zip_code VARCHAR(45) NOT NULL,
    city_id INT UNSIGNED NOT NULL,
    
    PRIMARY KEY (shop_id),
    FOREIGN KEY (city_id) REFERENCES city (city_id)
);

INSERT INTO shop (shop_id, shop_address, zip_code, city_id)
VALUES  (1,'32504 Dare Trail Suite 490','90422',3),(2,'725 Carmine Road Apt. 407','05020',8),
(3,'040 Jaylin Villages','39348-1521',1),(4,'56061 Wisoky Green Apt. 882','42898',6),
(5,'00853 Metz Locks Apt. 206','04341',2),(6,'629 Kitty Turnpike','71334-9751',3),
(7,'83051 Cameron Trace','31764-1650',5),(8,'738 Camden Mission Apt. 384','11566',2),
(9,'427 Gusikowski Ridge','42530',6),(10,'6777 Murazik Square','76800-9269',7),
(11,'8052 Leif Wells Suite 688','82871',5),(12,'51179 Emmitt Drives Apt. 437','57370-3637',5),
(13,'853 Kulas Knolls','19121',2),(14,'35966 Walsh Garden','24319',9),
(15,'85148 Smith Ferry Apt. 167','29874-0880',7),
(16,'1463 Rowe Tunnel Suite 924','47869-6182',4),(17,'07879 Franz Creek','95002',7),
(18,'9129 Marco Knolls','04937',2),(19,'28247 Janice Ramp','48091',10),
(20,'1985 Ettie Throughway Apt. 329','35170-1965',6);

;


CREATE TABLE IF NOT EXISTS employee (
    employee_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    first_name  VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    employee_nif VARCHAR(12) UNIQUE NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    employee_position ENUM('delivery', 'preparation'),
    shop_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY(shop_id) REFERENCES shop (shop_id)

);

INSERT INTO employee (employee_id, first_name, last_name, employee_nif, phone_number, employee_position, shop_id)
VALUES
(1,'Lolita','Bechtelar','6783092840O','1-848-166-1724','preparation',4),
(2,'Haylee','Kassulke','0483759265K ','1-415-816-4815','preparation',3),
(3,'Amalia','Altenwerth','9473650273P','744.180.4181x90686','delivery',1),
(4,'Daron','Blick','0687945567G ','1-574-764-8210x198','delivery',7),
(5,'Mathias','Mayer','0576823154U','358.400.0642x97897','preparation',8),
(6,'Isaias','Lang','7612300758K ','(521)613-4452','preparation',6),
(7,'Orpha','Metz','2199604607F','(511)315-8852x6261','preparation',12),
(8,'Raleigh','Jacobs','1212308958P ','715-648-0840','preparation',9),
(9,'Elijah','Hackett','8796045313O','06452396195','delivery',8),
(10,'Verda','Stokes','2944786038I','183.764.2426','delivery',1),
(11,'Kiley','Conroy','4689276849M','404-114-3584','delivery',7),
(12,'Magdalena','Balistreri','6577411208N','(755)735-9431x19842','preparation',9),
(13,'Athena','Thompson','8796055313V ','+74(7)3952387095','preparation',11),
(14,'Dayne','Stehr','4796045313L ','+68(9)0643768146','delivery',6),
(15,'Lori','Williamson','9797545313T','936.465.6692x85147','preparation',6),
(16,'Idell','Jast','8996045318H','1-083-190-9201','preparation',3),
(17,'Alek','Kautzer','6796065318Y','(277)968-9117','delivery',4),
(18,'Lelia','King','2196045318L','(106)004-4607','preparation',4),
(19,'Jewel','Medhurst','5696045317J','093-522-2524','delivery',2),
(20,'Amani','Ortiz','2696098317J','340-242-1671','preparation',7);


CREATE TABLE IF NOT EXISTS  order_detail (
    order_detail_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    product_id INT  UNSIGNED NOT NULL,
    quantity SMALLINT UNSIGNED NOT NULL,
    total_price SMALLINT UNSIGNED NOT NULL,
    order_date DATETIME NOT NULL,
    PRIMARY KEY(order_detail_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

INSERT INTO order_detail (order_detail_id, product_id, quantity, total_price, order_date)
VALUES (1,8,17,35,'2021-11-23 14:27:23'),(2,2,8,5,'2021-12-11 02:05:52'),(3,2,2,3,'2021-12-02 10:43:35'),(4,2,3,12,'2021-12-30 07:17:01'),(5,1,8,26,'2021-09-29 08:46:51'),(6,8,4,4,'2021-11-24 00:02:00'),(7,5,5,6,'2021-05-04 06:34:24'),(8,5,5,2,'2021-10-22 10:58:16'),(9,6,5,1,'2021-10-12 02:06:15'),(10,2,7,1,'2021-11-26 05:42:19'),(11,4,2,1,'2021-08-14 15:26:42'),(12,7,4,4,'2021-02-25 14:22:43'),(13,2,2,1,'2021-04-25 21:43:24'),(14,8,1,6,'2021-02-07 12:52:34'),(15,4,5,6,'2021-03-17 20:20:59'),(16,5,2,1,'2021-04-04 13:34:02'),(17,8,4,8,'2021-04-18 05:18:43'),(18,2,9,2,'2021-11-15 16:28:37'),(19,2,5,8,'2021-07-03 08:40:26'),(20,1,3,6,'2021-06-08 15:45:39');


 CREATE TABLE IF NOT EXISTS order_invoice (
	order_invoice_id INT UNSIGNED  AUTO_INCREMENT NOT NULL,
	client_id INT UNSIGNED NOT NULL,
	shop_id INT UNSIGNED NOT NULL,
	employee_id INT UNSIGNED NOT NULL,
    order_detail_id INT UNSIGNED NOT NULL,
	ordertype ENUM('take away', 'delivery'),
    delivery_id INT UNSIGNED DEFAULT NULL, 
    delivery_time TIME, 
    PRIMARY KEY (order_invoice_id),
    FOREIGN KEY (client_id) REFERENCES client_data (client_id),
    FOREIGN KEY (shop_id) REFERENCES shop (shop_id),
    FOREIGN KEY(employee_id) REFERENCES employee (employee_id),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail (order_detail_id)
 );
 
 
 INSERT INTO order_invoice(order_invoice_id, client_id, shop_id, employee_id, order_detail_id, ordertype, delivery_id, delivery_time)
 VALUES (1,5,2,1,1,'take away',NULL,'07:34:10'),
 (2,3,9,9,8,'delivery',3,'11:20:17'),
 (3,8,1,7,1,'delivery',4, '19:16:21'),
 (4,2,6,6,4,'delivery',10, '19:47:38'),
 (5,4,4,9,4,'delivery',11,'12:02:30'),
 (6,5,6,3,6,'delivery',14, '11:40:49'),
 (7,6,2,6,3,'take away', NULL, '03:38:39'),
 (8,7,2,8,8,'delivery',17, '15:50:09'),
 (9,6,9,9,3,'delivery',19, '06:59:01'),
 (10,1,1,2,6,'delivery',3, '14:22:26'),
 (11,9,7,1,5,'delivery',4, '14:44:30'),
 (12,6,3,4,2,'delivery',17, '19:11:48'),
 (13,5,8,2,1,'delivery',19, '12:51:52'),
 (14,8,9,6,4,'delivery',11,'00:28:45'),
 (15,8,3,3,1,'take away',NULL, '11:52:12'),
 (16,5,9,1,7,'take away',NULL,'01:05:23'),
 (17,8,2,8,6,'take away',NULL, '00:22:19'),(
 18,6,6,6,3,'delivery',10,'09:28:20'),
 (19,3,7,1,7,'take away',NULL,'06:26:26'),
 (20,4,9,9,1,'delivery',3,'18:01:29'), 
  (21,4,1,2,1,'delivery',3,'18:01:29'),
 (22,3,1,1,1,'delivery',3,'17:01:29');


 -- Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat


SELECT SUM(order_detail.quantity) AS "Total beverages sold in Jaylin Villages shop"
FROM order_detail
JOIN order_invoice 
   ON  order_detail.order_detail_id = order_invoice.order_detail_id
JOIN shop
	ON order_invoice.shop_id = shop.shop_id
WHERE order_detail.product_id 
IN (7,8)
   AND shop.city_id = 3;


-- Llista quantes comandes ha efectuat un determinat empleat
SELECT COUNT(order_invoice_id) AS "Total sales made by Iasias Lang" FROM order_invoice
WHERE employee_id = 6;
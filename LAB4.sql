Create Database if not exists `order-directory`;
use `order-directory`;
CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID)
);
CREATE TABLE IF NOT EXISTS category(
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);
CREATE TABLE IF NOT EXISTS product(
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR (20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR (60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
);
CREATE TABLE IF NOT EXISTS supplier_pricing(
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
FOREIGN KEY(SUPP_ID) REFERENCES SUPPLIER (SUPP_ID)
);
CREATE TABLE IF NOT EXISTS `order`(
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER (CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);
CREATE TABLE IF NOT EXISTS rating(
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);
INSERT INTO SUPPLIER VAlUES (1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VAlUES (2,"Appario Ltd.","Mumbai", '2589631470');
INSERT INTO SUPPLIER VAlUES(3, "Knome products", "Banglore", '9785462315');
INSERT INTO SUPPLIER VAlUES(4, "Bansal Retails", "Kochi", '8975463285');
INSERT INTO SUPPLIER VAlUES(5,"Mittal Ltd.", "Lucknow", '7898456532');

INSERT INTO CUSTOMER VAlUES (1, "AAKASH", '9999999999', "DELHI", 'M');
INSERT INTO CUSTOMER VAlUES(2, "AMAN",'9785463215',"NOIDA ",'M');
INSERT INTO CUSTOMER VAlUES(3, "NEHA", '9999999999', "MUMBAI",'F');
INSERT INTO CUSTOMER VAlUES(4, "MEGHA", '9994562399',"KOLKATA", 'F');
INSERT INTO CUSTOMER VAlUES(5, "PULKIT",'7895999999',"LUCKNOW", 'M');

INSERT INTO CATEGORY VAlUES (1, "BOOKS");
INSERT INTO CATEGORY VAlUES(2, "GAMES");
INSERT INTO CATEGORY VAlUES(3, "GROCERIES");
INSERT INTO CATEGORY VAlUES(4, "ELECTRONICS5 CLOTHES");
INSERT INTO CATEGORY VAlUES (5, "CLOTHES");

INSERT INTO PRODUCT VAlUES (1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
INSERT INTO PRODUCT VAlUES (2, "TSHIRT", "SIZE-L with Black, Blue and White variations" ,5);
INSERT INTO PRODUCT VAlUES (3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
INSERT INTO PRODUCT VAlUES (4, "OATS","Highly Nutritious from Nestle", 3);
INSERT INTO PRODUCT VAlUES (5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
INSERT INTO PRODUCT VAlUES (6, "MILK", "1L Toned MIlk", 3);
INSERT INTO PRODUCT VAlUES (7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4);
INSERT INTO PRODUCT VAlUES (8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
INSERT INTO PRODUCT VAlUES (9, "Project IGI", "compatible with windows 7 and above", 2);
INSERT INTO PRODUCT VAlUES (10,"Hoodie","Black GUCCI for 13 yrs and above", 5);
INSERT INTO PRODUCT VAlUES (11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
INSERT INTO PRODUCT VAlUES (12, "Train Your Brain", "By Shireen Stephen", 1);

INSERT INTO SUPPLIER_PRICING VAlUES (1, 1, 2, 1500);
INSERT INTO SUPPLIER_PRICING VAlUES(2, 3, 5, 30000);
INSERT INTO SUPPLIER_PRICING VAlUES(3, 5, 1, 3000);
INSERT INTO SUPPLIER_PRICING VAlUES(4, 2, 3, 2500);
INSERT INTO SUPPLIER_PRICING VAlUES(5, 4, 1, 1000);
INSERT INTO SUPPLIER_PRICING VAlUES(6, 12, 2, 780);
INSERT INTO SUPPLIER_PRICING VAlUES(7, 12, 4, 789);
INSERT INTO SUPPLIER_PRICING VAlUES(8, 3, 1, 31000);
INSERT INTO SUPPLIER_PRICING VAlUES(9, 1, 5, 1450);
INSERT INTO SUPPLIER_PRICING VAlUES(10, 4, 2, 999);
INSERT INTO SUPPLIER_PRICING VAlUES(11, 7, 3, 549);
INSERT INTO SUPPLIER_PRICING VAlUES(12, 7, 4, 529);
INSERT INTO SUPPLIER_PRICING VAlUES(13, 6, 2, 105);
INSERT INTO SUPPLIER_PRICING VAlUES(14, 6, 1, 99);
INSERT INTO SUPPLIER_PRICING VAlUES(15, 2, 5, 2999);
INSERT INTO SUPPLIER_PRICING VAlUES(16, 5, 2, 2999);

 INSERT INTO `ORDER` VAlUES (101, 1500, "2021-10-06", 2, 1);
 INSERT INTO `ORDER` VAlUES(102, 1000, "2021-10-12", 3, 5);
 INSERT INTO `ORDER` VAlUES(103, 30000, "2021-09-16", 5, 2);
 INSERT INTO `ORDER` VAlUES(104, 1500, "2021-10-05", 1, 1);
 INSERT INTO `ORDER` VAlUES(105, 3000, "2021-08-16",4, 3);
 INSERT INTO `ORDER` VAlUES(106, 1450, "2021-08-18", 1, 9);
 INSERT INTO `ORDER` VAlUES(107, 789, "2021-09-01", 3, 7);
 INSERT INTO `ORDER` VAlUES(108, 780, "2021-09-07", 5, 6);
 INSERT INTO `ORDER` VAlUES(109, 3000, "2021-00-10", 5, 3);
 INSERT INTO `ORDER` VAlUES(110, 2500, "2021-09-10", 2, 4);
 INSERT INTO `ORDER` VAlUES(111, 1000, "2021-09-15", 4, 5);
 INSERT INTO `ORDER` VAlUES(112, 789, "2021-09-16", 4, 7);
 INSERT INTO `ORDER` VAlUES(113, 31000, "2021-09-16", 1, 8);
 INSERT INTO `ORDER` VAlUES(114, 1000, "2021-09-16", 3, 5);
 INSERT INTO `ORDER` VAlUES(115, 3000, "2021-09-16", 5, 3);
 INSERT INTO `ORDER` VAlUES(116, 99, "2021-09-17", 2 ,14);

INSERT INTO RATING VALUES (1, 101, 4);
INSERT INTO RATING VALUES (2, 102, 3);
INSERT INTO RATING VALUES (3, 103, 1);
INSERT INTO RATING VALUES (4, 104, 2);
INSERT INTO RATING VALUES (5, 105, 4);
INSERT INTO RATING VALUES (6, 106, 3);
INSERT INTO RATING VALUES (7, 107, 4);
INSERT INTO RATING VALUES (8, 108, 4);
INSERT INTO RATING VALUES (9, 109, 3);
INSERT INTO RATING VALUES (10, 110, 5);
INSERT INTO RATING VALUES (11, 111, 3);
INSERT INTO RATING VALUES(12, 112, 4);
INSERT INTO RATING VALUES (13, 113, 2);
INSERT INTO RATING VALUES (14, 114, 1);
INSERT INTO RATING VALUES (15, 115, 1);
INSERT INTO RATING VALUES (16, 116, 0);
 
 SELECT * FROM SUPPLIER;
 SELECT * FROM CUSTOMER;
 SELECT * FROM CATEGORY;
 SELECT * FROM PRODUCT;
 SELECT * FROM SUPPLIER_PRICING;
 SELECT * FROM `ORDER`;
SELECT * FROM RATING;

 -- Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000
SELECT 
 c.cus_gender, count(c.cus_gender) as count
FROM customer c
INNER JOIN 
(
SELECT c.cus_id as customerId
FROM customer c
INNER JOIN `order` o ON o.cus_id=c.cus_id
where o.ord_amount>=3000
group by c.cus_id 
) as v ON v.customerId=c.cus_id
group by c.cus_gender

-- Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT  p.pro_name, o.*
FROM `order` o
INNER JOIN customer c ON c.cus_id=o.cus_id
INNER JOIN SUPPLIER_PRICING sp ON sp.pricing_id=o.pricing_id
INNER JOIN PRODUCT p ON p.pro_id=sp.pro_id
where c.cus_id=2

-- Display the Supplier details who can supply more than one product.

SELECT s.* , v.totalProducts
FROM SUPPLIER s
INNER JOIN (
SELECT sp.supp_id, COUNT(sp.pro_id) as totalProducts
FROM SUPPLIER_PRICING sp
GROUP BY sp.supp_id
) as v ON v.supp_id=s.supp_id
where v.totalProducts>1

-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product

SELECT c.cat_id, c.cat_name, min(min_price) as min_price FROM category c
INNER JOIN(
SELECT p.*, v.min_price
FROM PRODUCT p
INNER JOIN (
SELECT sp.pro_id, MIN(sp.supp_Price) as min_Price
FROM SUPPLIER_PRICING sp
group by sp.pro_id
) as v ON p.pro_id=v.pro_id
) as vv ON vv.cat_id=c.cat_id
group by c.cat_id

-- Display the Id and Name of the Product ordered after “2021-10-05”

SELECT p.pro_id, p.pro_name 
FROM `Order` o
INNER JOIN supplier_pricing sp ON sp.pricing_id=o.pricing_id
INNER JOIN product p ON p.pro_id=sp.pro_id
where o.ord_date>'2021-10-5'
 
 -- Display customer name and gender whose names start or end with character 'A'
 
 SELECT * FROM Customer c
 where c.cus_name like 'A%'
 OR c.cus_name like '%A'
 
-- Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
-- Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
-- Service” else print “Poor Service”. Note that there should be one rating per supplier

SELECT 
report.supp_id, report.supp_name,
CASE 
WHEN report.average=5 THEN 'Excellent Service'
WHEN report.average>4 THEN 'Good Service'
WHEN report.average>2 THEN 'Average Service'
ELSE 'Poor Service'

END as Type_of_Service
FROM 
(
SELECT s.* ,final.average 
FROM Supplier s
INNER JOIN (
SELECT vv.supp_id, AVG(vv.rat_ratstars) as average FROM (
SELECT sp.pricing_id, sp.pro_id, sp.supp_id , sp.supp_price, v.ord_id,v.rat_ratstars FROM 
supplier_pricing sp
INNER JOIN (
SELECT o.ord_id, o.pricing_id, r.rat_ratstars
FROM `order` o
inner join rating r ON r.ord_id=o.ord_id
) as v ON sp.pricing_id=v.pricing_id
) as vv
group by vv.supp_id
) as final ON final.supp_id=s.supp_id
)as report 


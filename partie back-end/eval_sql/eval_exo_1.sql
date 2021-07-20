CREATE TABLE employee(
   Id_employee COUNTER,
   emp_name VARCHAR(50),
   emp_salary VARCHAR(50),
   emp_commercial VARCHAR(50),
   emp_gender VARCHAR(50),
   emp_kids VARCHAR(50),
   emp_store VARCHAR(50),
   PRIMARY KEY(Id_employee)
);

CREATE TABLE customers(
   Id_customers COUNTER,
   cus_firsname VARCHAR(50),
   cus_lastname VARCHAR(50),
   cus_mdp VARCHAR(50),
   cus_dated_A VARCHAR(50),
   cus_dated_M VARCHAR(50),
   PRIMARY KEY(Id_customers)
);

CREATE TABLE ordered(
   Id_ordered COUNTER,
   ord_payment VARCHAR(50),
   ord_adress VARCHAR(50),
   ord_dated_M DATE,
   ord_delivery VARCHAR(50),
   ord_price DECIMAL(4,2),
   PRIMARY KEY(Id_ordered)
);

CREATE TABLE category(
   Id_category COUNTER,
   cat_name VARCHAR(50),
   PRIMARY KEY(Id_category)
);

CREATE TABLE provider(
   Id_provider COUNTER,
   prov_name VARCHAR(50),
   Id_employee INT,
   PRIMARY KEY(Id_provider),
   FOREIGN KEY(Id_employee) REFERENCES employee(Id_employee)
);

CREATE TABLE store(
   Id_store COUNTER,
   PRIMARY KEY(Id_store)
);

CREATE TABLE products(
   Id_product COUNTER,
   prod_dispo LOGICAL,
   prod_name VARCHAR(50),
   prod_dated_A DATE,
   prod_dated_M DATE,
   prod_media VARCHAR(50),
   prod_stock_A VARCHAR(50),
   prod_stock_P VARCHAR(50),
   prod_code INT,
   prod_price DECIMAL(4,2),
   prod_ref VARCHAR(50),
   prod_description TEXT,
   prod_color VARCHAR(50),
   prod_libelle VARCHAR(50),
   Id_category INT NOT NULL,
   PRIMARY KEY(Id_product),
   UNIQUE(Id_category),
   FOREIGN KEY(Id_category) REFERENCES category(Id_category)
);

CREATE TABLE validate(
   Id_customers INT,
   Id_ordered INT,
   PRIMARY KEY(Id_customers, Id_ordered),
   FOREIGN KEY(Id_customers) REFERENCES customers(Id_customers),
   FOREIGN KEY(Id_ordered) REFERENCES ordered(Id_ordered)
);

CREATE TABLE propose(
   Id_product INT,
   Id_provider INT,
   PRIMARY KEY(Id_product, Id_provider),
   FOREIGN KEY(Id_product) REFERENCES products(Id_product),
   FOREIGN KEY(Id_provider) REFERENCES provider(Id_provider)
);

CREATE TABLE compose(
   Id_product INT,
   Id_ordered INT,
   quantity VARCHAR(50),
   discount VARCHAR(50),
   PRIMARY KEY(Id_product, Id_ordered),
   FOREIGN KEY(Id_product) REFERENCES products(Id_product),
   FOREIGN KEY(Id_ordered) REFERENCES ordered(Id_ordered)
);

CREATE TABLE contain(
   Id_category INT,
   Id_category_1 INT,
   PRIMARY KEY(Id_category, Id_category_1),
   FOREIGN KEY(Id_category) REFERENCES category(Id_category),
   FOREIGN KEY(Id_category_1) REFERENCES category(Id_category)
);

CREATE TABLE occupy(
   Id_employee INT,
   Id_store INT,
   PRIMARY KEY(Id_employee, Id_store),
   FOREIGN KEY(Id_employee) REFERENCES employee(Id_employee),
   FOREIGN KEY(Id_store) REFERENCES store(Id_store)
);

CREATE TABLE have(
   Id_employee INT,
   Id_employee_1 INT,
   PRIMARY KEY(Id_employee, Id_employee_1),
   FOREIGN KEY(Id_employee) REFERENCES employee(Id_employee),
   FOREIGN KEY(Id_employee_1) REFERENCES employee(Id_employee)
);

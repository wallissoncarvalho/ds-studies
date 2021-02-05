-- To create a new database:
CREATE DATABASE IF NOT EXISTS Sales;
-- Similarly we can use, in MySQL both comands are synonyms:
CREATE SCHEMA IF NOT EXISTS Sales;

-- To tell to the computer which database we want to apply the following commands:
USE Sales;

-- Creating a Table
CREATE TABLE sales (
    purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);

DROP  TABLE sales;

-- Constraints 
-- Another way to indicate a primary key
CREATE TABLE sales (
    purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number)
);

CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

CREATE TABLE items (
    item_code VARCHAR(10),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255),
    PRIMARY KEY (item_code)
);

CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT,
    PRIMARY KEY (company_id)
);

-- Adding Foreign Keys

-- First Aprroach: Deleting the existing table and creating aggain.
DROP  TABLE sales;
CREATE TABLE sales (
    purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number),
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON DELETE CASCADE
);

-- Second Approach: Alter table
ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

-- DROP EVERYTHING
DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;


-- Adding Unique Keys

CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id),
    UNIQUE KEY (email_address)
);
-- Second Approach
ALTER TABLE customers
ADD UNIQUE KEY (email_address);

-- To remove an unique key
ALTER TABLE customers
DROP INDEX email_address;-- We use INDEX to drop instead os UNIQUE KEY

CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT DEFAULT 0,
    PRIMARY KEY (customer_id),
    UNIQUE KEY (email_address)
);

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_nale, last_name, gender)
VALUES ('Peter', 'Figaro', 'M');
SELECT * FROM customers;

DROP DATABASE sales
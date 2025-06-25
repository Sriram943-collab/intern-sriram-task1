Drop the table if it already exists to avoid duplicate primary key errors
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Payments;
-- Create Database
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Sample Data Inserts

-- Insert sample customers
INSERT INTO Customers (name, email, phone, address)
VALUES 
('Sriram', 'sriram@example.com', '1234567890', 'Hyderabad'),
('Aarav', 'aarav@example.com', '9876543210', 'Bangalore');

-- Insert sample products
INSERT INTO Products (name, description, price, stock)
VALUES 
('Keyboard', 'Mechanical Keyboard', 1500.00, 50),
('Mouse', 'Wireless Mouse', 700.00, 100);

-- Insert sample orders
INSERT INTO Orders (customer_id, status)
VALUES (1, 'Placed');

-- Insert sample order items
INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES (1, 1, 2, 3000.00); -- 2 Keyboards

-- Insert sample payment
INSERT INTO Payments (order_id, payment_method, amount)
VALUES (1, 'UPI', 3000.00);

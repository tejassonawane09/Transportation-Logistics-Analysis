-- ============================================
-- Database & Table Schema
-- Transportation & Logistics Analysis Project
-- ============================================

CREATE DATABASE IF NOT EXISTS Transportation_Logistics_Analysis_Project;
USE Transportation_Logistics_Analysis_Project;

-- ----------------------------
-- Orders Table
-- ----------------------------
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_value DECIMAL(10,2),
    region VARCHAR(100)
);

-- ----------------------------
-- Vehicles Table
-- ----------------------------
CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_type VARCHAR(50),
    capacity INT,
    cost_per_km DECIMAL(10,2)
);

-- ----------------------------
-- Drivers Table
-- ----------------------------
CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(100),
    experience_years INT,
    rating DECIMAL(3,2)
);

-- ----------------------------
-- Routes Table
-- ----------------------------
CREATE TABLE Routes (
    route_id INT PRIMARY KEY,
    distance_km DECIMAL(10,2),
    average_traffic_level VARCHAR(50),
    average_duration INT
);

-- ----------------------------
-- Deliveries Table
-- ----------------------------
CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    vehicle_id INT,
    driver_id INT,
    pickup_location VARCHAR(255),
    drop_location VARCHAR(255),
    start_time DATETIME,
    end_time DATETIME,
    delivery_status VARCHAR(50),
    route_id INT,
    
    -- Foreign Keys
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

-- ============================================
-- Sample Data Insertion
-- ============================================

USE Transportation_Logistics_Analysis_Project;

-- ----------------------------
-- Orders Data
-- ----------------------------
INSERT INTO Orders VALUES
(101, 1, '2026-01-10', 100.50, 'North'),
(102, 2, '2026-01-10', 75.00, 'South'),
(103, 3, '2026-01-11', 50.75, 'East'),
(104, 4, '2026-01-11', 120.00, 'West'),
(105, 5, '2026-01-12', 60.00, 'North');

-- ----------------------------
-- Vehicles Data
-- ----------------------------
INSERT INTO Vehicles VALUES
(1, 'Truck', 1000, 12.50),
(2, 'Van', 600, 9.00),
(3, 'Bike', 100, 4.50);

-- ----------------------------
-- Drivers Data
-- ----------------------------
INSERT INTO Drivers VALUES
(1, 'John Doe', 5, 4.8),
(2, 'Alice Smith', 3, 4.5),
(3, 'Bob Johnson', 7, 4.9);

-- ----------------------------
-- Routes Data
-- ----------------------------
INSERT INTO Routes VALUES
(1, 10.5, 'High', 45),
(2, 7.8, 'Medium', 30),
(3, 15.2, 'Low', 50);

-- ----------------------------
-- Deliveries Data
-- ----------------------------
INSERT INTO Deliveries VALUES
(1001, 101, 1, 1, 'Warehouse A', 'Customer X', '2026-01-10 09:00:00', '2026-01-10 09:40:00', 'Delivered', 1),
(1002, 102, 2, 2, 'Warehouse B', 'Customer Y', '2026-01-10 10:00:00', '2026-01-10 10:50:00', 'Delivered', 2),
(1003, 103, 3, 3, 'Warehouse C', 'Customer Z', '2026-01-11 08:30:00', '2026-01-11 09:30:00', 'Delayed', 3),
(1004, 104, 1, 1, 'Warehouse A', 'Customer W', '2026-01-11 11:00:00', '2026-01-11 12:00:00', 'Delivered', 1),
(1005, 105, 2, 2, 'Warehouse B', 'Customer V', '2026-01-12 09:00:00', '2026-01-12 09:55:00', 'Delivered', 2);

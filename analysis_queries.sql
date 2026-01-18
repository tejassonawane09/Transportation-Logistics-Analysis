-- ============================================
-- Business Analysis Queries
-- ============================================

USE Transportation_Logistics_Analysis_Project;

-- 1. Average delivery time per route
SELECT 
    route_id,
    AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS avg_delivery_time_minutes
FROM Deliveries
GROUP BY route_id;

-- 2. Delayed deliveries
SELECT 
    delivery_id,
    order_id,
    delivery_status
FROM Deliveries
WHERE delivery_status = 'Delayed';

-- 3. Driver efficiency (avg delivery time + total deliveries)
SELECT 
    driver_id,
    AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS avg_delivery_time,
    COUNT(*) AS total_deliveries
FROM Deliveries
GROUP BY driver_id
ORDER BY avg_delivery_time;

-- 4. Cost-effectiveness by vehicle type
SELECT 
    v.vehicle_type,
    AVG(TIMESTAMPDIFF(MINUTE, d.start_time, d.end_time)) AS avg_delivery_time,
    SUM(v.cost_per_km * r.distance_km) AS total_cost
FROM Deliveries d
JOIN Vehicles v ON d.vehicle_id = v.vehicle_id
JOIN Routes r ON d.route_id = r.route_id
GROUP BY v.vehicle_type;

-- 5. Regions with highest delays
SELECT 
    o.region,
    COUNT(*) AS delayed_deliveries
FROM Deliveries d
JOIN Orders o ON d.order_id = o.order_id
WHERE d.delivery_status = 'Delayed'
GROUP BY o.region
ORDER BY delayed_deliveries DESC;

-- 6. Revenue vs cost per route
SELECT 
    d.route_id,
    SUM(o.order_value) AS total_revenue,
    SUM(v.cost_per_km * r.distance_km) AS total_cost
FROM Deliveries d
JOIN Orders o ON d.order_id = o.order_id
JOIN Vehicles v ON d.vehicle_id = v.vehicle_id
JOIN Routes r ON d.route_id = r.route_id
GROUP BY d.route_id;

-- 7. Day-wise delay analysis
SELECT 
    DAYNAME(start_time) AS delivery_day,
    COUNT(*) AS delayed_orders
FROM Deliveries
WHERE delivery_status = 'Delayed'
GROUP BY delivery_day
ORDER BY delayed_orders DESC;

-- 8. Drivers prone to delays
SELECT 
    driver_id,
    COUNT(*) AS delayed_orders
FROM Deliveries
WHERE delivery_status = 'Delayed'
GROUP BY driver_id
ORDER BY delayed_orders DESC;

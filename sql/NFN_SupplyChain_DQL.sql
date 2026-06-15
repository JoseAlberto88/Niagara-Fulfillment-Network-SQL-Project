-- =====================================================================
-- NFN SUPPLY CHAIN DATABASE SYSTEM
-- DATA QUERY LANGUAGE (DQL)
-- Views • Stored Procedures • Triggers • Indexes • Validation Queries
-- Complex Analytical Queries • ML Dataset Extraction
-- =====================================================================

USE supply_chain;

-- #####################################################################
-- SECTION 1 — VIEWS
-- #####################################################################

-- ============================================================
-- VIEW 1: Supplier Performance Summary
-- ============================================================
CREATE VIEW vw_supplier_performance AS
SELECT 
    s.supplier_id,
    s.name AS supplier_name,
    COUNT(po.po_id) AS total_purchase_orders,
    SUM(poi.quantity) AS total_units_ordered,
    AVG(JSON_EXTRACT(s.supplier_metadata_json, '$.rating')) AS avg_rating
FROM Suppliers s
LEFT JOIN Purchase_Orders po ON s.supplier_id = po.supplier_id
LEFT JOIN Purchase_Order_Items poi ON po.po_id = poi.po_id
GROUP BY s.supplier_id, s.name;

-- ============================================================
-- VIEW 2: Inventory Summary
-- ============================================================
CREATE VIEW vw_inventory_summary AS
SELECT 
    w.warehouse_id,
    w.name AS warehouse_name,
    p.product_id,
    p.name AS product_name,
    i.quantity,
    i.reorder_point,
    (i.quantity - i.reorder_point) AS stock_buffer
FROM Inventory i
JOIN Warehouses w ON i.warehouse_id = w.warehouse_id
JOIN Products p ON i.product_id = p.product_id;

-- #####################################################################
-- SECTION 2 — STORED PROCEDURES
-- #####################################################################

-- ============================================================
-- PROCEDURE 1: Mark Shipment as Arrived
-- ============================================================
DELIMITER //
CREATE PROCEDURE sp_receive_shipment(IN IN_shipment_id INT)
BEGIN
    UPDATE Shipments
    SET status = 'Arrived'
    WHERE shipment_id = IN_shipment_id;
END //
DELIMITER ;

-- ============================================================
-- PROCEDURE 2: Update Inventory After Customer Order
-- ============================================================
DELIMITER //
CREATE PROCEDURE sp_update_inventory_after_order(IN IN_order_id INT)
BEGIN
    UPDATE Inventory i
    JOIN Orders o ON i.warehouse_id = o.warehouse_id
    JOIN Order_Items oi ON oi.product_id = i.product_id
    SET i.quantity = i.quantity - oi.quantity
    WHERE o.order_id = IN_order_id
      AND oi.order_id = IN_order_id;
END //
DELIMITER ;

-- #####################################################################
-- SECTION 3 — TRIGGERS
-- #####################################################################

-- ============================================================
-- TRIGGER 1: Auto-update inventory when shipment arrives
-- ============================================================
DELIMITER //
CREATE TRIGGER trg_shipment_arrived_update_inventory
AFTER UPDATE ON Shipments
FOR EACH ROW
BEGIN
    IF NEW.status = 'Arrived' AND OLD.status <> 'Arrived' THEN
        UPDATE Inventory i
        JOIN Shipment_Items si ON si.product_id = i.product_id
        SET i.quantity = i.quantity + si.quantity_received
        WHERE si.shipment_id = NEW.shipment_id
          AND i.warehouse_id = NEW.warehouse_id;
    END IF;
END //
DELIMITER ;

-- ============================================================
-- TRIGGER 2: Prevent negative inventory
-- ============================================================
DELIMITER //
CREATE TRIGGER trg_inventory_prevent_negative
BEFORE UPDATE ON Inventory
FOR EACH ROW
BEGIN
    IF NEW.quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Inventory cannot be negative';
    END IF;
END //
DELIMITER ;

-- #####################################################################
-- SECTION 4 — INDEXES
-- #####################################################################

CREATE INDEX idx_inventory_product ON Inventory(product_id);
CREATE INDEX idx_orders_customer ON Orders(customer_id);
CREATE INDEX idx_shipments_po ON Shipments(po_id);
CREATE FULLTEXT INDEX ft_products_name ON Products(name);

-- JSON rating index via generated column
ALTER TABLE Suppliers
ADD COLUMN supplier_rating DECIMAL(3,2)
    GENERATED ALWAYS AS (JSON_UNQUOTE(JSON_EXTRACT(supplier_metadata_json, '$.rating'))) STORED;

CREATE INDEX idx_supplier_rating ON Suppliers(supplier_rating);

-- #####################################################################
-- SECTION 5 — VALIDATION QUERIES
-- #####################################################################

-- Referential Integrity Check
SELECT 
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.status AS order_status,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS total_item_cost
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
LIMIT 5;

-- JSON Update Check
SELECT 
    supplier_id,
    name,
    supplier_metadata_json,
    JSON_EXTRACT(supplier_metadata_json, '$.rating') AS extracted_rating,
    JSON_EXTRACT(supplier_metadata_json, '$.preferred_carrier') AS extracted_carrier
FROM Suppliers
WHERE name = 'Maple Industrial Supplies Ltd.';

-- XML Update Check
SELECT 
    warehouse_id,
    name,
    location,
    warehouse_config_xml
FROM Warehouses
WHERE warehouse_config_xml LIKE '%<temp_control>true</temp_control>%';

-- Analytics Readiness Check
SELECT 
    p.product_id,
    p.name AS product_name,
    p.category AS product_category,
    SUM(oi.quantity) AS total_units_sold,
    AVG(oi.unit_price) AS average_selling_price,
    COUNT(DISTINCT o.customer_id) AS unique_customers_count,
    IFNULL(SUM(oi.quantity * oi.unit_price), 0.00) AS total_revenue_generated
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
LEFT JOIN Orders o ON oi.order_id = o.order_id
GROUP BY p.product_id, p.name, p.category
ORDER BY total_revenue_generated DESC;

-- #####################################################################
-- SECTION 6 — COMPLEX ANALYTICAL QUERIES
-- #####################################################################

-- ============================================================
-- COMPLEX QUERY 1: Customer Behavior Analysis
-- ============================================================
SELECT
    c.customer_id,
    c.name AS customer_name,
    JSON_EXTRACT(c.customer_profile_json, '$.type') AS customer_type,
    COUNT(o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_spent,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS spending_rank
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name, customer_type;

-- ============================================================
-- COMPLEX QUERY 2: Order Cancellation Prediction Dataset
-- ============================================================
SELECT
    o.order_id,
    o.customer_id,
    o.warehouse_id,
    o.status,
    EXTRACTVALUE(o.order_meta_xml, '/meta/priority') AS priority,
    EXTRACTVALUE(o.order_meta_xml, '/meta/channel') AS channel,
    SUM(oi.quantity) AS total_items,
    SUM(oi.quantity * oi.unit_price) AS order_value
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_id, o.warehouse_id, o.status, priority, channel;

-- ============================================================
-- COMPLEX QUERY 3: Full-text Product Search + JSON Filter
-- ============================================================
SELECT
    product_id,
    name,
    category,
    attributes_json,
    JSON_EXTRACT(attributes_json, '$.material') AS material
FROM Products
WHERE MATCH(name) AGAINST ('safety' IN NATURAL LANGUAGE MODE)
  AND JSON_EXTRACT(attributes_json, '$.material') IS NOT NULL;

-- ============================================================
-- COMPLEX QUERY 4: 7-Day Moving Average Forecast
-- ============================================================
SET @forecast_days = 7;

WITH daily_demand AS (
    SELECT
        o.warehouse_id,
        oi.product_id,
        o.order_date,
        SUM(oi.quantity) AS daily_quantity
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    WHERE o.status IN ('Shipped', 'Delivered')
    GROUP BY o.warehouse_id, oi.product_id, o.order_date
),
moving_avg AS (
    SELECT
        warehouse_id,
        product_id,
        order_date,
        daily_quantity,
        AVG(daily_quantity) OVER (
            PARTITION BY warehouse_id, product_id
            ORDER BY order_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS moving_avg_7d
    FROM daily_demand
),
latest_moving_avg AS (
    SELECT
        warehouse_id,
        product_id,
        moving_avg_7d,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY warehouse_id, product_id
            ORDER BY order_date DESC
        ) AS rn
    FROM moving_avg
)
SELECT
    i.warehouse_id,
    i.product_id,
    p.name AS product_name,
    i.quantity AS current_stock,
    i.reorder_point,
    l.order_date AS last_demand_date,
    l.moving_avg_7d AS daily_demand_forecast,
    (l.moving_avg_7d * @forecast_days) AS forecast_demand_horizon,
    (i.quantity - (l.moving_avg_7d * @forecast_days)) AS projected_stock_after_horizon,
    CASE
        WHEN (i.quantity - (l.moving_avg_7d * @forecast_days)) < i.reorder_point
        THEN (i.reorder_point - (i.quantity - (l.moving_avg_7d * @forecast_days)))
        ELSE 0
    END AS recommended_reorder_qty
FROM Inventory i
JOIN Products p ON p.product_id = i.product_id
LEFT JOIN latest_moving_avg l
    ON l.warehouse_id = i.warehouse_id
   AND l.product_id = i.product_id
   AND l.rn = 1;

-- #####################################################################
-- SECTION 7 — MACHINE LEARNING DATASETS
-- #####################################################################

-- ============================================================
-- ML DATASET 1 — CLASSIFICATION (Order Cancellation)
-- ============================================================
SELECT
    o.order_id,
    o.customer_id,
    o.warehouse_id,
    o.status AS target_label,
    JSON_EXTRACT(c.customer_profile_json, '$.type') AS customer_type,
    EXTRACTVALUE(o.order_meta_xml, '/meta/priority') AS priority,
    EXTRACTVALUE(o.order_meta_xml, '/meta/channel') AS channel,
    SUM(oi.quantity) AS total_items,
    SUM(oi.quantity * oi.unit_price) AS order_value,
    COUNT(oi.product_id) AS num_products
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_id, o.warehouse_id, o.status,
         customer_type, priority, channel;

-- ============================================================
-- ML DATASET 2 — REGRESSION (Delivery Delay)
-- ============================================================
SELECT
    sh.shipment_id,
    sh.po_id,
    sh.warehouse_id,
    DATEDIFF(sh.arrival_date, sh.shipped_date) AS delivery_delay_days,
    s.name AS supplier_name,
    JSON_EXTRACT(s.supplier_metadata_json, '$.rating') AS supplier_rating,
    w.location AS warehouse_location,
    COUNT(si.product_id) AS num_products,
    SUM(si.quantity_received) AS total_units_received
FROM Shipments sh
JOIN Purchase_Orders po ON sh.po_id = po.po_id
JOIN Suppliers s ON po.supplier_id = s.supplier_id
JOIN Warehouses w ON sh.warehouse_id = w.warehouse_id
JOIN Shipment_Items si ON sh.shipment_id = si.shipment_id
WHERE sh.arrival_date IS NOT NULL
GROUP BY sh.shipment_id, sh.po_id, sh.warehouse_id,
         delivery_delay_days, supplier_name, supplier_rating, warehouse_location;

-- ============================================================
-- ML DATASET 3 — CLUSTERING (Supplier Segmentation)
-- ============================================================
SELECT
    s.supplier_id,
    s.name AS supplier_name,
    AVG(JSON_EXTRACT(s.supplier_metadata_json, '$.rating')) AS avg_rating,
    COUNT(po.po_id) AS total_purchase_orders,
    SUM(poi.quantity) AS total_units_ordered,
    AVG(DATEDIFF(sh.arrival_date, sh.shipped_date)) AS avg_delivery_delay
FROM Suppliers s
LEFT JOIN Purchase_Orders po ON s.supplier_id = po.supplier_id
LEFT JOIN Purchase_Order_Items poi ON po.po_id = poi.po_id
LEFT JOIN Shipments sh ON sh.po_id = po.po_id
GROUP BY s.supplier_id, s.name;

-- #####################################################################
-- END OF FILE
-- #####################################################################

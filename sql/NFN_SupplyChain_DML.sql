USE supply_chain;

# In this part, we'll generate the full population of the database base on 
# the following assumptions
-- 300+ realistic Canadian records
-- Dates from 2023-2024 (2 years)
-- Niagara Falls as the main hub
-- JSON and XML fields populated
-- No FK errors
-- Includes INSERT, UPDATE, DELETE examples



-- =============================================================
-- Phase 1 Suppliers 15 realistic Canadian suppliers
-- =============================================================
INSERT INTO Suppliers (name, contact_email, phone, address, supplier_metadata_json)
VALUES
('Maple Industrial Supplies Ltd.', 'contact@mapleindustrial.ca', '416-555-1023', '120 Front St W, Toronto, ON', '{"rating": 4.6, "category": "Industrial"}'),
('Northern Steel Components', 'sales@northernsteel.ca', '905-555-8832', '44 River Rd, Hamilton, ON', '{"rating": 4.4, "category": "Metals"}'),
('Great Lakes Packaging Corp.', 'info@greatlakespack.ca', '519-555-2211', '88 Wellington St, London, ON', '{"rating": 4.7, "category": "Packaging"}'),
('WestCoast Plastics & Resins', 'support@westcoastplastics.ca', '604-555-9921', '2000 Kingsway, Vancouver, BC', '{"rating": 4.5, "category": "Plastics"}'),
('Prairie Mechanical Parts', 'orders@prairiemech.ca', '204-555-7712', '300 Portage Ave, Winnipeg, MB', '{"rating": 4.3, "category": "Mechanical"}'),
('Atlantic Chemical Solutions', 'service@atlanticchem.ca', '902-555-4411', '55 Barrington St, Halifax, NS', '{"rating": 4.2, "category": "Chemicals"}'),
('Ontario Fasteners Inc.', 'sales@ontfasteners.ca', '647-555-3344', '15 Dufferin St, Toronto, ON', '{"rating": 4.8, "category": "Hardware"}'),
('Canadian Electronics Wholesale', 'contact@cew.ca', '613-555-7788', '120 Sparks St, Ottawa, ON', '{"rating": 4.5, "category": "Electronics"}'),
('Niagara Packaging Solutions', 'info@niagarapack.ca', '289-555-1122', '5000 Dorchester Rd, Niagara Falls, ON', '{"rating": 4.6, "category": "Packaging"}'),
('TrueNorth Automotive Parts', 'orders@truenorthautoparts.ca', '780-555-6611', '100 Jasper Ave, Edmonton, AB', '{"rating": 4.4, "category": "Automotive"}'),
('Superior Cleaning Supplies', 'support@superiorclean.ca', '905-555-9090', '22 Geneva St, St. Catharines, ON', '{"rating": 4.3, "category": "Cleaning"}'),
('Canadian Timber & Woodworks', 'sales@ctwoodworks.ca', '250-555-3322', '10 Douglas St, Victoria, BC', '{"rating": 4.5, "category": "Wood"}'),
('Polar Refrigeration Components', 'info@polarref.ca', '514-555-7781', '400 Rue Sainte-Catherine, Montreal, QC', '{"rating": 4.6, "category": "HVAC"}'),
('Summit Safety Gear', 'orders@summitsafety.ca', '416-555-6677', '77 Bloor St W, Toronto, ON', '{"rating": 4.7, "category": "Safety"}'),
('Great North Tools & Hardware', 'contact@greatnorthtools.ca', '705-555-8899', '12 Bay St, Sudbury, ON', '{"rating": 4.4, "category": "Tools"}');



-- =============================================================
-- Phase 2 Warehouses 6 Canadians warehouses, Niagara focused
-- =============================================================

INSERT INTO Warehouses (name, location, capacity, warehouse_config_xml)
VALUES
('Niagara Falls Distribution Center', 'Niagara Falls, ON', 50000, '<config><temp_control>true</temp_control><dock_doors>12</dock_doors></config>'),
('Toronto Central Warehouse', 'Toronto, ON', 120000, '<config><temp_control>false</temp_control><dock_doors>25</dock_doors></config>'),
('Hamilton Logistics Hub', 'Hamilton, ON', 80000, '<config><temp_control>true</temp_control><dock_doors>18</dock_doors></config>'),
('Ottawa East Storage Facility', 'Ottawa, ON', 60000, '<config><temp_control>false</temp_control><dock_doors>10</dock_doors></config>'),
('London Regional Warehouse', 'London, ON', 70000, '<config><temp_control>true</temp_control><dock_doors>14</dock_doors></config>'),
('Mississauga Fulfillment Center', 'Mississauga, ON', 110000, '<config><temp_control>false</temp_control><dock_doors>22</dock_doors></config>');


-- ===============================================================
-- Phase 3 Products 40 realistic Canadian supply-chain products
-- ===============================================================
# Industrial, packaging, electrical, automotive, etc.

INSERT INTO Products (name, category, unit_price, attributes_json)
VALUES
('Corrugated Shipping Boxes - Large', 'Packaging', 2.50, '{"size": "24x18x12", "material": "cardboard"}'),
('Corrugated Shipping Boxes - Medium', 'Packaging', 1.80, '{"size": "18x14x10", "material": "cardboard"}'),
('Industrial Nitrile Gloves (100-pack)', 'Safety', 14.99, '{"size": "L", "color": "blue"}'),
('Heavy-Duty Pallet Wrap', 'Packaging', 19.99, '{"gauge": 80, "length_ft": 1500}'),
('Stainless Steel Bolts (50-pack)', 'Hardware', 12.49, '{"diameter": "8mm", "length": "40mm"}'),
('Hex Nuts (100-pack)', 'Hardware', 8.99, '{"diameter": "8mm"}'),
('LED Shop Light 48-inch', 'Electronics', 39.99, '{"lumens": 5000, "color_temp": 5000}'),
('Industrial Extension Cord 50ft', 'Electronics', 29.99, '{"gauge": "12/3", "rating": "15A"}'),
('Safety Hard Hat - White', 'Safety', 22.99, '{"certified": true}'),
('High-Visibility Safety Vest', 'Safety', 17.99, '{"class": "CSA Class 2"}'),
('Cleaning Degreaser 4L', 'Cleaning', 11.99, '{"type": "industrial"}'),
('Floor Cleaner Concentrate 4L', 'Cleaning', 9.99, '{"dilution_ratio": "1:20"}'),
('Automotive Brake Pads - Standard', 'Automotive', 49.99, '{"vehicle_type": "sedan"}'),
('Automotive Oil Filter', 'Automotive', 12.99, '{"compatibility": "multi"}'),
('HVAC Air Filter 20x20x1', 'HVAC', 7.99, '{"merv": 8}'),
('HVAC Air Filter 16x25x1', 'HVAC', 8.49, '{"merv": 11}'),
('Wooden Pallets - Standard', 'Wood', 14.00, '{"size": "48x40"}'),
('Plastic Pallets - Heavy Duty', 'Plastics', 29.00, '{"capacity_lb": 2500}'),
('Steel Shelving Unit', 'Industrial', 129.99, '{"shelves": 5}'),
('Metal Storage Cabinet', 'Industrial', 199.99, '{"height_in": 72}'),
('Packing Tape (6-pack)', 'Packaging', 7.99, '{"width": "2in"}'),
('Bubble Wrap Roll', 'Packaging', 18.99, '{"length_ft": 250}'),
('Zip Ties (500-pack)', 'Hardware', 9.99, '{"length_in": 8}'),
('Industrial Drill Bit Set', 'Tools', 34.99, '{"pieces": 21}'),
('Hammer - Fiberglass Handle', 'Tools', 14.99, '{"weight_oz": 16}'),
('Screwdriver Set (10-piece)', 'Tools', 19.99, '{"magnetic": true}'),
('Electrical Tape (10-pack)', 'Electronics', 6.99, '{"color": "black"}'),
('Power Strip 6-outlet', 'Electronics', 12.99, '{"surge_protection": true}'),
('Shop Towels (200-pack)', 'Cleaning', 15.99, '{"material": "cotton"}'),
('Hand Sanitizer 1L', 'Cleaning', 6.99, '{"alcohol_pct": 70}'),
('Plastic Storage Bins (5-pack)', 'Plastics', 24.99, '{"capacity_l": 20}'),
('Steel Workbench', 'Industrial', 249.99, '{"surface": "maple"}'),
('Ratchet Strap Set (4-pack)', 'Automotive', 22.99, '{"capacity_lb": 1500}'),
('Windshield Washer Fluid 4L', 'Automotive', 4.99, '{"season": "all"}'),
('Safety Goggles', 'Safety', 9.99, '{"anti_fog": true}'),
('Ear Protection Muffs', 'Safety', 14.99, '{"rating_db": 26}'),
('Cable Management Sleeves', 'Electronics', 11.99, '{"length_ft": 10}'),
('Industrial Fan 20-inch', 'Industrial', 89.99, '{"speed_settings": 3}'),
('HVAC Duct Tape', 'HVAC', 12.99, '{"width_in": 2}'),
('Shop Vacuum 12-gallon', 'Tools', 129.99, '{"horsepower": 5}');

-- ===============================================================
-- Phase 4 Customers 40 realistoc Canadian Customers
-- ===============================================================
INSERT INTO Customers (name, email, phone, customer_profile_json)
VALUES
('Sarah Thompson', 'sarah.thompson@example.ca', '289-555-1001', '{"type": "retail", "loyalty": "gold"}'),
('Michael Chen', 'michael.chen@example.ca', '416-555-2022', '{"type": "business", "industry": "automotive"}'),
('Aisha Patel', 'aisha.patel@example.ca', '905-555-3344', '{"type": "retail"}'),
('Jean-Luc Tremblay', 'jeanluc.tremblay@example.ca', '514-555-7788', '{"type": "business", "industry": "construction"}'),
('Emily Robertson', 'emily.robertson@example.ca', '613-555-8899', '{"type": "retail"}'),
('David Wilson', 'david.wilson@example.ca', '905-555-1123', '{"type": "business", "industry": "manufacturing"}'),
('Olivia Martin', 'olivia.martin@example.ca', '289-555-2234', '{"type": "retail"}'),
('Noah Anderson', 'noah.anderson@example.ca', '416-555-4455', '{"type": "retail"}'),
('Liam Campbell', 'liam.campbell@example.ca', '905-555-6677', '{"type": "business", "industry": "HVAC"}'),
('Emma Wright', 'emma.wright@example.ca', '289-555-7788', '{"type": "retail"}'),
('Lucas Brown', 'lucas.brown@example.ca', '613-555-9911', '{"type": "retail"}'),
('Chloe Nguyen', 'chloe.nguyen@example.ca', '416-555-5566', '{"type": "business", "industry": "electronics"}'),
('Benjamin Scott', 'benjamin.scott@example.ca', '905-555-7789', '{"type": "retail"}'),
('Sophie Adams', 'sophie.adams@example.ca', '289-555-8890', '{"type": "retail"}'),
('Jackson Lee', 'jackson.lee@example.ca', '416-555-9900', '{"type": "business", "industry": "logistics"}'),
('Grace Hall', 'grace.hall@example.ca', '905-555-2211', '{"type": "retail"}'),
('Ethan Young', 'ethan.young@example.ca', '289-555-3322', '{"type": "retail"}'),
('Isabella King', 'isabella.king@example.ca', '416-555-4433', '{"type": "retail"}'),
('Henry Turner', 'henry.turner@example.ca', '905-555-5544', '{"type": "business", "industry": "cleaning"}'),
('Mia White', 'mia.white@example.ca', '289-555-6655', '{"type": "retail"}'),
('Oliver Harris', 'oliver.harris@example.ca', '613-555-7766', '{"type": "retail"}'),
('Charlotte Baker', 'charlotte.baker@example.ca', '905-555-8877', '{"type": "retail"}'),
('James Parker', 'james.parker@example.ca', '416-555-9988', '{"type": "business", "industry": "tools"}'),
('Amelia Brooks', 'amelia.brooks@example.ca', '289-555-0099', '{"type": "retail"}'),
('Logan Mitchell', 'logan.mitchell@example.ca', '905-555-1212', '{"type": "retail"}'),
('Harper Evans', 'harper.evans@example.ca', '416-555-2323', '{"type": "retail"}'),
('Daniel Morris', 'daniel.morris@example.ca', '905-555-3434', '{"type": "business", "industry": "packaging"}'),
('Ella Foster', 'ella.foster@example.ca', '289-555-4545', '{"type": "retail"}'),
('William Gray', 'william.gray@example.ca', '416-555-5656', '{"type": "retail"}'),
('Ava Cooper', 'ava.cooper@example.ca', '905-555-6767', '{"type": "retail"}'),
('Jacob Ward', 'jacob.ward@example.ca', '289-555-7878', '{"type": "retail"}'),
('Madison Hughes', 'madison.hughes@example.ca', '416-555-8989', '{"type": "retail"}'),
('Sebastian Price', 'sebastian.price@example.ca', '905-555-9090', '{"type": "business", "industry": "automotive"}'),
('Victoria Bell', 'victoria.bell@example.ca', '289-555-0101', '{"type": "retail"}'),
('Nathan Cox', 'nathan.cox@example.ca', '416-555-1213', '{"type": "retail"}'),
('Aria Richardson', 'aria.richardson@example.ca', '905-555-1415', '{"type": "retail"}'),
('Matthew Howard', 'matthew.howard@example.ca', '289-555-1617', '{"type": "business", "industry": "industrial"}'),
('Scarlett Murphy', 'scarlett.murphy@example.ca', '416-555-1819', '{"type": "retail"}'),
('Wyatt Rogers', 'wyatt.rogers@example.ca', '905-555-2021', '{"type": "retail"}');

-- ===============================================================
-- Phase 5 Purchase Orders 2023-2024
-- We'll create 3- realistic POs, spread across 2 years, with proper
-- supplier relationship
-- DATE LOGIC:
-- order_date between 2023-01-05 and 2024-12-20
-- expected_delivery 5-20 days after order_date
-- Status varies realistically: Pending, Shipped, Delivered, Cancelled
-- ===============================================================

INSERT INTO Purchase_Orders (supplier_id, order_date, expected_delivery, status, po_details_json)
VALUES
(1, '2023-01-10', '2023-01-20', 'Delivered', '{"priority": "normal"}'),
(3, '2023-01-22', '2023-02-05', 'Delivered', '{"priority": "high"}'),
(2, '2023-02-14', '2023-02-28', 'Delivered', '{"priority": "normal"}'),
(5, '2023-03-03', '2023-03-18', 'Delivered', '{"priority": "normal"}'),
(4, '2023-03-20', '2023-04-02', 'Delivered', '{"priority": "urgent"}'),
(6, '2023-04-05', '2023-04-20', 'Delivered', '{"priority": "normal"}'),
(7, '2023-04-22', '2023-05-05', 'Delivered', '{"priority": "normal"}'),
(8, '2023-05-10', '2023-05-25', 'Delivered', '{"priority": "high"}'),
(9, '2023-06-01', '2023-06-15', 'Delivered', '{"priority": "normal"}'),
(10, '2023-06-18', '2023-07-02', 'Delivered', '{"priority": "normal"}'),
(11, '2023-07-05', '2023-07-20', 'Delivered', '{"priority": "normal"}'),
(12, '2023-07-22', '2023-08-05', 'Delivered', '{"priority": "normal"}'),
(13, '2023-08-10', '2023-08-25', 'Delivered', '{"priority": "high"}'),
(14, '2023-09-01', '2023-09-15', 'Delivered', '{"priority": "normal"}'),
(15, '2023-09-20', '2023-10-05', 'Delivered', '{"priority": "normal"}'),
(1, '2023-10-10', '2023-10-25', 'Delivered', '{"priority": "normal"}'),
(3, '2023-11-01', '2023-11-18', 'Delivered', '{"priority": "urgent"}'),
(2, '2023-11-20', '2023-12-05', 'Delivered', '{"priority": "normal"}'),
(4, '2023-12-10', '2023-12-22', 'Delivered', '{"priority": "normal"}'),
(5, '2024-01-08', '2024-01-20', 'Delivered', '{"priority": "normal"}'),
(6, '2024-01-25', '2024-02-10', 'Delivered', '{"priority": "normal"}'),
(7, '2024-02-12', '2024-02-28', 'Delivered', '{"priority": "high"}'),
(8, '2024-03-01', '2024-03-15', 'Delivered', '{"priority": "normal"}'),
(9, '2024-03-20', '2024-04-05', 'Delivered', '{"priority": "normal"}'),
(10, '2024-04-10', '2024-04-25', 'Delivered', '{"priority": "normal"}'),
(11, '2024-05-01', '2024-05-18', 'Delivered', '{"priority": "normal"}'),
(12, '2024-05-20', '2024-06-05', 'Delivered', '{"priority": "normal"}'),
(13, '2024-06-10', '2024-06-25', 'Delivered', '{"priority": "normal"}'),
(14, '2024-07-01', '2024-07-15', 'Pending', '{"priority": "normal"}'),
(15, '2024-07-18', '2024-08-02', 'Shipped', '{"priority": "normal"}');


-- ==============================================================================
-- Phase 6 Purchase Order Items 2023-2024
-- Each PO gets 1-3 items, so 60 realistic PO items referencing your 40 products
-- ===============================================================================

INSERT INTO Purchase_Order_Items (po_id, product_id, quantity, unit_cost)
VALUES
(1, 1, 500, 1.90), (1, 4, 200, 17.50),
(2, 3, 300, 12.00),
(3, 5, 400, 10.00), (3, 6, 600, 7.20),
(4, 7, 150, 32.00),
(5, 8, 120, 25.00), (5, 9, 200, 18.00),
(6, 10, 250, 14.00),
(7, 11, 300, 9.00),
(8, 12, 350, 8.00), (8, 13, 180, 40.00),
(9, 14, 500, 10.00),
(10, 15, 200, 6.50),
(11, 16, 300, 7.00),
(12, 17, 150, 12.00),
(13, 18, 100, 25.00),
(14, 19, 80, 110.00),
(15, 20, 60, 160.00),
(16, 21, 500, 6.00),
(17, 22, 400, 15.00),
(18, 23, 300, 7.00),
(19, 24, 200, 30.00),
(20, 25, 150, 12.00),
(21, 26, 300, 5.00),
(22, 27, 400, 10.00),
(23, 28, 350, 9.00),
(24, 29, 200, 12.00),
(25, 30, 150, 5.00),
(26, 31, 120, 20.00),
(27, 32, 100, 200.00),
(28, 33, 180, 18.00),
(29, 34, 300, 3.50),
(30, 35, 250, 8.00);

-- ==============================================================================
-- Phase 7 Shipments 
-- Each PO generates a shipment 
-- DATE LOGIC
-- shipped_date = order_date + 1-5 days
-- arrival_date = shipped_date + 3-10 days
-- Status realistic: In Transit, Arrived, Delayed
-- ===============================================================================

INSERT INTO Shipments (po_id, warehouse_id, shipped_date, arrival_date, status)
VALUES
(1, 1, '2023-01-12', '2023-01-19', 'Arrived'),
(2, 1, '2023-01-25', '2023-02-03', 'Arrived'),
(3, 2, '2023-02-16', '2023-02-26', 'Arrived'),
(4, 3, '2023-03-06', '2023-03-15', 'Arrived'),
(5, 1, '2023-03-22', '2023-03-30', 'Arrived'),
(6, 4, '2023-04-07', '2023-04-17', 'Arrived'),
(7, 1, '2023-04-24', '2023-05-02', 'Arrived'),
(8, 2, '2023-05-12', '2023-05-22', 'Arrived'),
(9, 1, '2023-06-03', '2023-06-12', 'Arrived'),
(10, 3, '2023-06-20', '2023-06-29', 'Arrived'),
(11, 1, '2023-07-07', '2023-07-17', 'Arrived'),
(12, 4, '2023-07-24', '2023-08-02', 'Arrived'),
(13, 1, '2023-08-12', '2023-08-20', 'Arrived'),
(14, 2, '2023-09-03', '2023-09-12', 'Arrived'),
(15, 1, '2023-09-22', '2023-10-01', 'Arrived'),
(16, 3, '2023-10-12', '2023-10-20', 'Arrived'),
(17, 1, '2023-11-03', '2023-11-12', 'Arrived'),
(18, 4, '2023-11-22', '2023-12-01', 'Arrived'),
(19, 1, '2023-12-12', '2023-12-20', 'Arrived'),
(20, 1, '2024-01-10', '2024-01-18', 'Arrived'),
(21, 2, '2024-01-27', '2024-02-05', 'Arrived'),
(22, 1, '2024-02-14', '2024-02-22', 'Arrived'),
(23, 3, '2024-03-03', '2024-03-12', 'Arrived'),
(24, 1, '2024-03-22', '2024-03-30', 'Arrived'),
(25, 4, '2024-04-12', '2024-04-20', 'Arrived'),
(26, 1, '2024-05-03', '2024-05-12', 'Arrived'),
(27, 2, '2024-05-22', '2024-06-01', 'Arrived'),
(28, 1, '2024-06-12', '2024-06-20', 'Arrived'),
(29, 3, '2024-07-03', '2024-07-12', 'In Transit'),
(30, 1, '2024-07-20', '2024-07-29', 'In Transit');


-- ==============================================================================
-- Phase 8 Shipment items 60 rows
-- Each shipment reveives the same products as its corresponding PO, with 
-- realistic received quantities (slightly less, equal, or slightly more)
-- Logic used:
-- If PO ordered 500 units -> shipment reives 480-520
-- If PO ordered 150 units -> shipment receives 145-160
-- All values >= 0
-- All product IDs match your PO items
-- ===============================================================================
INSERT INTO Shipment_Items (shipment_id, product_id, quantity_received)
VALUES
(1, 1, 495), (1, 4, 198),
(2, 3, 298),
(3, 5, 402), (3, 6, 598),
(4, 7, 148),
(5, 8, 118), (5, 9, 201),
(6, 10, 248),
(7, 11, 299),
(8, 12, 349), (8, 13, 179),
(9, 14, 498),
(10, 15, 199),
(11, 16, 298),
(12, 17, 149),
(13, 18, 101),
(14, 19, 79),
(15, 20, 61),
(16, 21, 501),
(17, 22, 398),
(18, 23, 299),
(19, 24, 199),
(20, 25, 149),
(21, 26, 298),
(22, 27, 399),
(23, 28, 349),
(24, 29, 199),
(25, 30, 148),
(26, 31, 119),
(27, 32, 101),
(28, 33, 181),
(29, 34, 299),
(30, 35, 249);


-- ==============================================================================
-- Phase 8 Shipment items 60 rows
-- Each shipment reveives the same products as its corresponding PO, with 
-- realistic received quantities (slightly less, equal, or slightly more)
-- Logic used:
-- If PO ordered 500 units -> shipment reives 480-520
-- If PO ordered 150 units -> shipment receives 145-160
-- All values >= 0
-- All product IDs match your PO items
-- ===============================================================================



-- ========================================================================
-- Phase 9 WAREHOUSE INVENTORY IN 6 BLOCKS TO AVOID A LARGE INSERTATION QUERY
-- ========================================================================

-- =========================================================================
-- WAREHOUSE 1 Niagara Falls Distribution Center (High Stock)
-- warehouse_id = 1
-- Stock levels: 500-2000 units
-- Reorder points: 150-400
-- ===========================================================================

INSERT INTO Inventory (warehouse_id, product_id, quantity, reorder_point)
VALUES
(1, 1, 1500, 300), (1, 2, 1400, 280), (1, 3, 900, 200), (1, 4, 1600, 320),
(1, 5, 1200, 250), (1, 6, 1100, 220), (1, 7, 800, 180), (1, 8, 950, 200),
(1, 9, 700, 150), (1, 10, 850, 180), (1, 11, 1300, 260), (1, 12, 1250, 250),
(1, 13, 1000, 220), (1, 14, 1050, 230), (1, 15, 900, 200), (1, 16, 950, 200),
(1, 17, 1400, 280), (1, 18, 1350, 270), (1, 19, 1500, 300), (1, 20, 1600, 320),
(1, 21, 1700, 340), (1, 22, 1650, 330), (1, 23, 900, 200), (1, 24, 850, 180),
(1, 25, 800, 170), (1, 26, 750, 160), (1, 27, 700, 150), (1, 28, 950, 200),
(1, 29, 1000, 220), (1, 30, 1100, 240), (1, 31, 1200, 260), (1, 32, 1300, 280),
(1, 33, 1400, 300), (1, 34, 1500, 320), (1, 35, 1600, 340), (1, 36, 1700, 350),
(1, 37, 1800, 360), (1, 38, 1900, 380), (1, 39, 2000, 400), (1, 40, 1750, 350);


-- =========================================================================
-- WAREHOUSE 2 Toronto Central Warehouse (Medium High Stock)
-- warehouse_id = 2
-- Stock levels: 300-1500 units
-- Reorder points: 120-300
-- ===========================================================================
INSERT INTO Inventory (warehouse_id, product_id, quantity, reorder_point)
VALUES
(2, 1, 1200, 250), (2, 2, 1100, 230), (2, 3, 700, 150), (2, 4, 1300, 260),
(2, 5, 900, 180), (2, 6, 850, 170), (2, 7, 600, 130), (2, 8, 750, 150),
(2, 9, 500, 120), (2, 10, 650, 140), (2, 11, 1000, 200), (2, 12, 950, 190),
(2, 13, 800, 160), (2, 14, 850, 170), (2, 15, 700, 150), (2, 16, 750, 150),
(2, 17, 1100, 230), (2, 18, 1050, 220), (2, 19, 1200, 250), (2, 20, 1300, 260),
(2, 21, 1400, 280), (2, 22, 1350, 270), (2, 23, 700, 150), (2, 24, 650, 140),
(2, 25, 600, 130), (2, 26, 550, 120), (2, 27, 500, 120), (2, 28, 750, 150),
(2, 29, 800, 160), (2, 30, 900, 180), (2, 31, 1000, 200), (2, 32, 1100, 220),
(2, 33, 1200, 240), (2, 34, 1300, 260), (2, 35, 1400, 280), (2, 36, 1500, 300),
(2, 37, 1350, 270), (2, 38, 1250, 250), (2, 39, 1150, 230), (2, 40, 900, 180);


-- =========================================================================
-- WAREHOUSE 3 Hamilton Logistic Hub (Medium Stock)
-- warehouse_id = 3
-- Stock levels: 200-1000 units
-- Reorder points: 80-200
-- ===========================================================================
INSERT INTO Inventory (warehouse_id, product_id, quantity, reorder_point)
VALUES
(3, 1, 900, 180), (3, 2, 850, 170), (3, 3, 500, 120), (3, 4, 950, 190),
(3, 5, 700, 150), (3, 6, 650, 140), (3, 7, 450, 100), (3, 8, 550, 120),
(3, 9, 350, 90), (3, 10, 450, 100), (3, 11, 800, 160), (3, 12, 750, 150),
(3, 13, 600, 130), (3, 14, 650, 140), (3, 15, 500, 120), (3, 16, 550, 120),
(3, 17, 850, 170), (3, 18, 800, 160), (3, 19, 900, 180), (3, 20, 950, 190),
(3, 21, 1000, 200), (3, 22, 950, 190), (3, 23, 500, 120), (3, 24, 450, 100),
(3, 25, 400, 90), (3, 26, 350, 80), (3, 27, 300, 80), (3, 28, 550, 120),
(3, 29, 600, 130), (3, 30, 700, 150), (3, 31, 800, 160), (3, 32, 850, 170),
(3, 33, 900, 180), (3, 34, 950, 190), (3, 35, 1000, 200), (3, 36, 900, 180),
(3, 37, 850, 170), (3, 38, 800, 160), (3, 39, 750, 150), (3, 40, 650, 140);

-- =========================================================================
-- WAREHOUSE 4 Ottawa East Storage Facility (Lower Stock)
-- warehouse_id = 4
-- Stock levels: 100-600 units
-- Reorder points: 50-150
-- ===========================================================================
INSERT INTO Inventory (warehouse_id, product_id, quantity, reorder_point)
VALUES
(4, 1, 600, 150), (4, 2, 550, 140), (4, 3, 300, 80), (4, 4, 650, 150),
(4, 5, 450, 100), (4, 6, 400, 90), (4, 7, 250, 70), (4, 8, 350, 80),
(4, 9, 200, 60), (4, 10, 300, 70), (4, 11, 500, 120), (4, 12, 480, 110),
(4, 13, 400, 90), (4, 14, 420, 100), (4, 15, 350, 80), (4, 16, 360, 80),
(4, 17, 550, 130), (4, 18, 520, 120), (4, 19, 600, 150), (4, 20, 580, 140),
(4, 21, 500, 120), (4, 22, 480, 110), (4, 23, 300, 80), (4, 24, 280, 70),
(4, 25, 260, 70), (4, 26, 240, 60), (4, 27, 220, 60), (4, 28, 350, 80),
(4, 29, 380, 90), (4, 30, 420, 100), (4, 31, 450, 110), (4, 32, 500, 120),
(4, 33, 520, 120), (4, 34, 550, 130), (4, 35, 580, 140), (4, 36, 600, 150),
(4, 37, 550, 130), (4, 38, 500, 120), (4, 39, 450, 110), (4, 40, 400, 100);

-- =========================================================================
-- WAREHOUSE 5 London Regional Warehouse (Medium Stock)
-- warehouse_id = 5
-- Stock levels: 150-800 units
-- Reorder points: 60-180
-- ===========================================================================
INSERT INTO Inventory (warehouse_id, product_id, quantity, reorder_point)
VALUES
(5, 1, 800, 180), (5, 2, 750, 170), (5, 3, 450, 100), (5, 4, 820, 180),
(5, 5, 600, 130), (5, 6, 550, 120), (5, 7, 350, 90), (5, 8, 450, 100),
(5, 9, 300, 80), (5, 10, 400, 90), (5, 11, 650, 150), (5, 12, 620, 140),
(5, 13, 500, 120), (5, 14, 520, 120), (5, 15, 450, 100), (5, 16, 480, 110),
(5, 17, 700, 160), (5, 18, 680, 150), (5, 19, 750, 170), (5, 20, 780, 180),
(5, 21, 800, 180), (5, 22, 750, 170), (5, 23, 450, 100), (5, 24, 420, 90),
(5, 25, 400, 90), (5, 26, 380, 80), (5, 27, 350, 80), (5, 28, 500, 120),
(5, 29, 520, 120), (5, 30, 580, 130), (5, 31, 600, 140), (5, 32, 650, 150),
(5, 33, 700, 160), (5, 34, 750, 170), (5, 35, 780, 180), (5, 36, 800, 180),
(5, 37, 750, 170), (5, 38, 700, 160), (5, 39, 650, 150), (5, 40, 600, 140);

-- =========================================================================
-- WAREHOUSE 6 Mississauga Fulfillment Center (High Outbound Volume)
-- warehouse_id = 6
-- Stock levels: 300-1200 units
-- Reorder points: 100-250
-- ===========================================================================
INSERT INTO Inventory (warehouse_id, product_id, quantity, reorder_point)
VALUES
(6, 1, 1200, 250), (6, 2, 1150, 240), (6, 3, 650, 140), (6, 4, 1250, 250),
(6, 5, 900, 180), (6, 6, 850, 170), (6, 7, 550, 130), (6, 8, 650, 140),
(6, 9, 450, 110), (6, 10, 550, 130), (6, 11, 900, 180), (6, 12, 880, 170),
(6, 13, 750, 150), (6, 14, 780, 160), (6, 15, 650, 140), (6, 16, 700, 150),
(6, 17, 1000, 200), (6, 18, 950, 190), (6, 19, 1100, 220), (6, 20, 1150, 230),
(6, 21, 1200, 250), (6, 22, 1150, 240), (6, 23, 650, 140), (6, 24, 600, 130),
(6, 25, 580, 120), (6, 26, 550, 120), (6, 27, 520, 110), (6, 28, 700, 150),
(6, 29, 750, 160), (6, 30, 800, 170), (6, 31, 850, 180), (6, 32, 900, 190),
(6, 33, 950, 200), (6, 34, 1000, 210), (6, 35, 1100, 220), (6, 36, 1150, 230),
(6, 37, 1000, 200), (6, 38, 950, 190), (6, 39, 900, 180), (6, 40, 850, 170);


-- ==================================================================
-- Phase 10 Orders 
-- Ecah order include:
-- customer_id (1-40)
-- warehouse_id (1-60)
-- order_date
-- status
-- order_meta_xml 
-- ===================================================================
INSERT INTO Orders (customer_id, warehouse_id, order_date, status, order_meta_xml)
VALUES
(1, 1, '2023-01-12', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(5, 1, '2023-01-25', 'Shipped', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(12, 2, '2023-02-03', 'Processing', '<meta><priority>high</priority><channel>online</channel></meta>'),
(7, 3, '2023-02-18', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(9, 1, '2023-03-02', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),
(14, 4, '2023-03-15', 'Packed', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(3, 1, '2023-03-28', 'Delivered', '<meta><priority>high</priority><channel>online</channel></meta>'),
(18, 2, '2023-04-10', 'Shipped', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(22, 1, '2023-04-22', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(30, 3, '2023-05-05', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),

(11, 1, '2023-05-18', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(6, 2, '2023-06-01', 'Processing', '<meta><priority>high</priority><channel>online</channel></meta>'),
(15, 1, '2023-06-14', 'Delivered', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(19, 4, '2023-06-28', 'Shipped', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(8, 1, '2023-07-10', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),
(2, 3, '2023-07-22', 'Packed', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(27, 1, '2023-08-05', 'Delivered', '<meta><priority>high</priority><channel>online</channel></meta>'),
(33, 2, '2023-08-18', 'Delivered', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(10, 1, '2023-09-01', 'Shipped', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(21, 3, '2023-09-14', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),

(4, 1, '2023-09-28', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(16, 2, '2023-10-10', 'Processing', '<meta><priority>high</priority><channel>online</channel></meta>'),
(23, 1, '2023-10-22', 'Delivered', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(29, 4, '2023-11-05', 'Cancelled', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(13, 1, '2023-11-18', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),
(31, 3, '2023-12-01', 'Shipped', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(20, 1, '2023-12-14', 'Delivered', '<meta><priority>high</priority><channel>online</channel></meta>'),
(26, 2, '2023-12-28', 'Packed', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(17, 1, '2024-01-10', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(34, 3, '2024-01-22', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),

(1, 1, '2024-02-05', 'Shipped', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(5, 2, '2024-02-18', 'Delivered', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(12, 1, '2024-03-01', 'Processing', '<meta><priority>high</priority><channel>online</channel></meta>'),
(7, 3, '2024-03-14', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(9, 1, '2024-03-28', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),
(14, 4, '2024-04-10', 'Pending', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(3, 1, '2024-04-22', 'Delivered', '<meta><priority>high</priority><channel>online</channel></meta>'),
(18, 2, '2024-05-05', 'Shipped', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(22, 1, '2024-05-18', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(30, 3, '2024-06-01', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),

(11, 1, '2024-06-14', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(6, 2, '2024-06-28', 'Processing', '<meta><priority>high</priority><channel>online</channel></meta>'),
(15, 1, '2024-07-10', 'Delivered', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(19, 4, '2024-07-22', 'Shipped', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(8, 1, '2024-08-05', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>'),
(2, 3, '2024-08-18', 'Packed', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(27, 1, '2024-09-01', 'Delivered', '<meta><priority>high</priority><channel>online</channel></meta>'),
(33, 2, '2024-09-14', 'Delivered', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(10, 1, '2024-09-28', 'Shipped', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(21, 3, '2024-10-10', 'Delivered', '<meta><priority>normal</priority><channel>email</channel></meta>');

INSERT INTO Orders (customer_id, warehouse_id, order_date, status, order_meta_xml)
VALUES
(28, 2, '2024-10-22', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(6, 1, '2024-11-05', 'Shipped', '<meta><priority>high</priority><channel>online</channel></meta>'),
(19, 3, '2024-11-18', 'Processing', '<meta><priority>normal</priority><channel>email</channel></meta>'),
(12, 4, '2024-12-01', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(33, 1, '2024-12-14', 'Packed', '<meta><priority>normal</priority><channel>phone</channel></meta>'),
(7, 2, '2024-12-22', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(25, 3, '2025-01-05', 'Pending', '<meta><priority>normal</priority><channel>email</channel></meta>'),
(14, 1, '2025-01-12', 'Delivered', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(30, 4, '2025-01-20', 'Cancelled', '<meta><priority>normal</priority><channel>online</channel></meta>'),
(3, 2, '2025-01-28', 'Shipped', '<meta><priority>high</priority><channel>online</channel></meta>');


-- ==================================================================
-- Phase 10 Order items 
-- Order IDs will be 1 through 60 
-- ===================================================================
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price)
VALUES
(1, 5, 3, 13.74), (1, 12, 2, 10.59),
(2, 8, 1, 32.39), (2, 19, 4, 142.99),
(3, 2, 5, 1.98), (3, 14, 3, 13.64),
(4, 7, 2, 43.19), (4, 21, 1, 8.79),
(5, 9, 4, 24.84), (5, 3, 2, 16.19),
(6, 11, 3, 12.59), (6, 6, 1, 9.44),
(7, 4, 2, 21.59), (7, 18, 3, 31.03),
(8, 10, 1, 19.79), (8, 25, 2, 16.49),
(9, 13, 3, 54.99), (9, 7, 2, 43.99),
(10, 16, 4, 9.34), (10, 22, 1, 10.49),

(11, 5, 2, 13.24), (11, 9, 3, 24.14),
(12, 14, 1, 14.29), (12, 30, 2, 7.69),
(13, 3, 4, 16.94), (13, 17, 2, 15.40),
(14, 8, 3, 31.49), (14, 12, 1, 10.79),
(15, 19, 2, 138.49), (15, 6, 3, 9.89),
(16, 21, 1, 8.39), (16, 4, 2, 20.99),
(17, 25, 3, 16.19), (17, 10, 2, 18.89),
(18, 7, 4, 41.99), (18, 13, 1, 52.49),
(19, 22, 2, 10.99), (19, 15, 3, 8.39),
(20, 11, 1, 12.29), (20, 5, 2, 13.74),

(21, 18, 3, 30.45), (21, 9, 2, 23.69),
(22, 6, 4, 9.89), (22, 14, 1, 13.24),
(23, 3, 2, 15.89), (23, 20, 3, 209.99),
(24, 12, 1, 10.19), (24, 7, 2, 41.49),
(25, 16, 3, 9.24), (25, 24, 2, 36.74),
(26, 10, 4, 18.49), (26, 5, 1, 12.99),
(27, 8, 2, 30.49), (27, 19, 3, 143.99),
(28, 13, 1, 53.49), (28, 22, 2, 10.79),
(29, 4, 3, 21.19), (29, 11, 2, 12.49),
(30, 17, 4, 15.19), (30, 6, 1, 9.24),

(31, 9, 2, 24.49), (31, 25, 3, 16.89),
(32, 14, 1, 13.49), (32, 3, 2, 16.49),
(33, 7, 4, 42.49), (33, 18, 1, 30.19),
(34, 12, 3, 10.29), (34, 10, 2, 18.49),
(35, 5, 2, 13.49), (35, 21, 3, 8.19),
(36, 6, 1, 9.19), (36, 16, 2, 9.59),
(37, 19, 3, 141.49), (37, 8, 2, 31.49),
(38, 22, 4, 10.49), (38, 14, 1, 13.79),
(39, 11, 2, 12.19), (39, 4, 3, 20.49),
(40, 3, 1, 15.49), (40, 17, 2, 15.89),

(41, 7, 3, 41.99), (41, 12, 2, 10.39),
(42, 10, 1, 18.29), (42, 25, 3, 16.59),
(43, 14, 2, 13.49), (43, 6, 1, 9.39),
(44, 19, 4, 147.99), (44, 8, 2, 30.99),
(45, 21, 3, 8.49), (45, 5, 1, 13.19),
(46, 16, 2, 9.39), (46, 11, 3, 12.39),
(47, 24, 1, 37.49), (47, 9, 2, 23.49),
(48, 18, 3, 30.99), (48, 7, 2, 42.19),
(49, 13, 4, 54.49), (49, 3, 1, 16.29),
(50, 22, 2, 10.99), (50, 10, 3, 18.79),

(51, 6, 1, 9.29), (51, 14, 2, 13.99),
(52, 19, 3, 142.49), (52, 8, 2, 31.19),
(53, 21, 4, 8.29), (53, 5, 1, 13.49),
(54, 16, 2, 9.49), (54, 11, 3, 12.79),
(55, 24, 1, 36.99), (55, 9, 2, 24.19),
(56, 18, 3, 31.49), (56, 7, 2, 41.79),
(57, 13, 4, 53.99), (57, 3, 1, 16.09),
(58, 22, 2, 10.39), (58, 10, 3, 18.59),
(59, 6, 1, 9.49), (59, 14, 2, 13.29),
(60, 19, 3, 144.49), (60, 8, 2, 30.79);

-- ==================================================================
-- Phase 11 Delivery Routes
-- ===================================================================
INSERT INTO Delivery_Routes (warehouse_id, route_name, distance_km, route_json)
VALUES
(1, 'Niagara Falls → Toronto', 130.00, '{"estimated_time_days": 1, "carrier": "Canada Post", "region": "GTA", "notes": "High-volume daily route"}'),
(1, 'Niagara Falls → Hamilton', 75.00, '{"estimated_time_days": 1, "carrier": "Purolator", "region": "Hamilton", "notes": "Frequent pallet shipments"}'),
(1, 'Niagara Falls → London', 205.00, '{"estimated_time_days": 2, "carrier": "UPS", "region": "Southwest Ontario"}'),
(1, 'Niagara Falls → Ottawa', 540.00, '{"estimated_time_days": 3, "carrier": "FedEx", "region": "Eastern Ontario"}'),

(2, 'Toronto → Mississauga', 35.00, '{"estimated_time_days": 1, "carrier": "Canada Post", "region": "Peel Region"}'),
(2, 'Toronto → Barrie', 110.00, '{"estimated_time_days": 1, "carrier": "Purolator", "region": "Simcoe County"}'),
(2, 'Toronto → Kingston', 265.00, '{"estimated_time_days": 2, "carrier": "UPS", "region": "Eastern Ontario"}'),
(2, 'Toronto → Windsor', 370.00, '{"estimated_time_days": 3, "carrier": "FedEx", "region": "Southwest Ontario"}'),

(3, 'Hamilton → Brantford', 40.00, '{"estimated_time_days": 1, "carrier": "Canada Post", "region": "Brant County"}'),
(3, 'Hamilton → Guelph', 55.00, '{"estimatedestimated_time_days": 1, "carrier": "Purolator", "region": "Wellington County"}'),
(3, 'Hamilton → Kitchener', 65.00, '{"estimated_time_days": 1, "carrier": "UPS", "region": "Waterloo Region"}'),
(3, 'Hamilton → Sudbury', 430.00, '{"estimated_time_days": 3, "carrier": "FedEx", "region": "Northern Ontario"}'),

(4, 'Ottawa → Montreal', 200.00, '{"estimated_time_days": 1, "carrier": "Canada Post", "region": "Quebec"}'),
(4, 'Ottawa → Quebec City', 450.00, '{"estimated_time_days": 2, "carrier": "Purolator", "region": "Quebec"}'),
(4, 'Ottawa → North Bay', 350.00, '{"estimated_time_days": 2, "carrier": "UPS", "region": "Northern Ontario"}'),
(4, 'Ottawa → Toronto', 450.00, '{"estimated_time_days": 2, "carrier": "FedEx", "region": "GTA"}'),

(5, 'London → Windsor', 190.00, '{"estimated_time_days": 1, "carrier": "Canada Post", "region": "Southwest Ontario"}'),
(5, 'London → Kitchener', 110.00, '{"estimated_time_days": 1, "carrier": "Purolator", "region": "Waterloo Region"}'),
(5, 'London → Sarnia', 110.00, '{"estimated_time_days": 1, "carrier": "UPS", "region": "Lambton County"}'),
(5, 'London → Toronto', 200.00, '{"estimated_time_days": 2, "carrier": "FedEx", "region": "GTA"}');



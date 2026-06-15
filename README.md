# Niagara Fulfillment Network — SQL Project

A complete end‑to‑end Supply Chain and Logistics Management Database System designed for operational analytics, forecasting, and automation. This project implements a fully normalized 12‑table relational schema, JSON and XML semi‑structured fields, stored procedures, triggers, performance‑optimized indexes, complex analytical SQL queries, and machine‑learning‑ready dataset extraction. Python integration is included for data validation, dataset generation, and model development.

This repository demonstrates professional SQL engineering practices, data modeling, and analytics‑driven database design suitable for real‑world supply chain operations.

---

## Skills Demonstrated

- Relational database design (3NF normalization, PK/FK integrity)
- Semi‑structured data modeling using JSON and XML
- Stored procedures for operational automation
- Triggers for real‑time inventory updates
- Performance optimization using indexes and generated columns
- Complex analytical SQL queries (window functions, full‑text search)
- Machine‑learning dataset extraction (classification, regression, clustering)
- Python integration for data processing and ML workflows
- Clean GitHub project organization and documentation

---

## Project Structure

```
Niagara-Fulfillment-Network-SQL-Project/
│
├── sql/
│   ├── NFN_SupplyChain_DDL.sql        # Schema creation (12 tables)
│   ├── NFN_SupplyChain_DML.sql        # 300+ synthetic records + updates
│   └── NFN_SupplyChain_DQL.sql        # Views, procedures, triggers, ML queries
│
├── python/
│   └── NFN_Python_Notebook.ipynb      # MySQL connection + ML dataset extraction
│
├── docs/
│   ├── Final_Report.pdf
│   ├── Execution_Evidence.pdf
│   ├── ERD_Diagram.png
│   └── Presentation_Slides.pdf
│
└── README.md
```

---

## Database Features

### Schema Design
- 12 fully normalized tables  
- JSON fields for flexible supplier and product metadata  
- XML fields for order and warehouse configuration  
- Cascading deletes and referential integrity  
- Unique constraints, CHECK constraints, and composite keys  

### Operational Logic
- Stored procedures for shipment processing and inventory deduction  
- Triggers for automatic inventory updates and validation  
- Indexes for performance optimization, including full‑text search  

### Analytics and Machine Learning
- Customer behavior analysis  
- Order cancellation prediction dataset  
- Delivery delay regression dataset  
- Supplier performance clustering dataset  
- Seven‑day moving average demand forecasting  

---

## Team Contributions

| Student Name | Role / Responsibility | Contribution Details | Use of AI Tools |
|--------------|-----------------------|----------------------|-----------------|
| José Alberto Martinez Morales | Database Design Lead (SQL and Analytics) | Finalized full NFN schema (12 tables), normalization, JSON/XML placement, ERD structure. Created core DDL tables (Suppliers, Purchase_Orders, Purchase_Order_Items, Shipments). Developed Complex Query #1 (Supplier Reliability Score). Contributed to report writing and appendix preparation. | Used Microsoft Copilot for SQL drafting, JSON/XML structuring, query optimization, documentation refinement, and generating synthetic examples. |
| Nicolas | SQL Developer (Procedures and Operational Tables) | Created operational DDL tables (Warehouses, Inventory, Shipment_Items, Delivery_Routes). Implemented stored procedures (sp_receive_shipment, sp_update_inventory_after_order). Developed Complex Query #2 (Warehouse Stock Forecasting). Contributed to ERD and report review. | Used Microsoft Copilot for coding suggestions, procedure optimization, debugging, and improving SQL clarity. |
| Sravani | SQL Developer (Customer and Order Tables, XML/JSON) | Created Customer and Order DDL tables (Customers, Orders, Order_Items). Implemented triggers for inventory updates and shipment status logging. Developed Complex Query #3 (Customer Order Behavior). Assisted with ERD and documentation. | Used Microsoft Copilot for JSON/XML extraction examples, trigger debugging, and improving documentation structure. |
| Diego | Data Entry, Validation and Documentation | Inserted synthetic DML data for Products, Customers, Warehouses, and Delivery_Routes. Performed validation queries (FK checks, JSON/XML verification). Created Complex Query #4 (Product Demand Summary). Captured screenshots for execution evidence and helped assemble the final PDF appendix. | Used Microsoft Copilot for generating synthetic data ideas, writing simple SELECT queries, and organizing documentation. |

---

## Purpose of This Repository

This project demonstrates the ability to:

- Design and implement a production‑grade SQL database
- Integrate structured and semi‑structured data
- Automate operational workflows using SQL logic
- Build analytics‑ready datasets directly from SQL
- Apply forecasting and machine‑learning insights to supply chain operations
- Document and organize a technical project for academic and professional review

---

## Contact

José Alberto Martinez Morales  
Machine Learning and Data Analytics  
Niagara Falls, Ontario, Canada

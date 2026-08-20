# Totally Toothy Dental Clinic — Database Systems Design & Implementation

A comprehensive relational database design and implementation project developed for **CST2340 – Database Systems: Design and Implication** at **Middlesex University London**.

## 📋 Project Overview

This project involved the end-to-end design and implementation of a **dental clinic management database**, covering the full database development lifecycle — from requirements analysis and conceptual modelling to relational implementation and advanced SQL querying.

The system was designed to support the management of patients, doctors, treatments, appointments, treatment plans, allergies, rooms, and invoices while maintaining data integrity, consistency, and efficient information retrieval.

## 🗂️ Project Structure

### Part A — Database Design

* Analysed the Totally Toothy Dental Clinic case study and identified key business requirements and data relationships.
* Designed an **Entity-Relationship Diagram (ERD)** representing the clinic's core entities and relationships.
* Validated the conceptual model and identified and resolved a **chasm trap** between `TREATMENT PLAN` and `APPOINTMENT`.
* Evaluated the strengths and limitations of the relational database model.
* Compared relational databases with **NoSQL database types**, including document, key-value, column-family, and graph databases, and explored their potential applications in healthcare.
* Examined professional, legal, and ethical considerations surrounding healthcare databases, including **GDPR, data privacy, security, informed consent, data integrity, and access control**.

### Part B — Database Implementation

* Transformed the conceptual model into a **normalised relational database structure**.
* Defined appropriate data types, primary keys, foreign keys, and integrity constraints for each attribute.
* Implemented the database in **MySQL Workbench** using SQL DDL and DML.
* Created and populated **9 interconnected tables**:

  * `Patient`
  * `Doctor`
  * `Treatment`
  * `Room`
  * `Allergy`
  * `Patient_Allergy`
  * `TreatmentPlan`
  * `Appointment`
  * `Invoice`
* Populated the database with realistic sample data to demonstrate its functionality and support meaningful analysis.

### Part C — SQL Query Development

Developed **10 advanced SQL queries** demonstrating a range of database techniques:

1. **Multi-table JOINs** to generate comprehensive billing and appointment reports.
2. **Filtered JOINs** for location-based patient analysis.
3. **Subqueries** comparing booked treatment sessions with required sessions.
4. **Self-JOINs** to identify patients assigned to the same doctor.
5. **Aggregation and GROUP BY** to analyse treatment demand and revenue.
6. **UNION operations** to create a combined patient and doctor contact directory.
7. **Parameterised queries** for retrieving individual patient appointment histories.
8. **Nested EXISTS queries** for financial and clinical condition checks.
9. **Correlated subqueries** to compare individual doctor workloads against role averages.
10. **Relational division using double NOT EXISTS** to identify patients who received multiple specified treatments.

## 🛠️ Technologies & Tools

* **MySQL Workbench**
* **SQL**
* DDL & DML
* ER Modelling
* Relational Database Design
* Normalisation
* JOINs & Subqueries
* Aggregation & Set Operations
* Database Constraints

## 👥 Authors

**Reeva Josephine Deepak** — M01036971
**Mutsawashe Audrey Mandinde** — M01033270


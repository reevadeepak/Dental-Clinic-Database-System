# Totally Toothy Dental Clinic — Database Systems Design & Implementation

A full relational database design and implementation project for Totally Toothy Dental Clinic, built as coursework for CST2340 – Database Systems: Design and Implication at Middlesex University London.

📋 Overview

This project covers the complete database development lifecycle for a dental clinic management system — from conceptual modelling through to a working MySQL implementation with complex analytical queries.

🗂️ Project Structure

Part A – Database Design

Case study analysis of clinic operations (patients, doctors, treatments, appointments, invoicing, and long-term treatment plans)
Entity-Relationship Diagram (ERD) modelling all core entities and relationships
Model validation, including identification and resolution of a chasm trap between TREATMENT PLAN and APPOINTMENT
Critical evaluation of the relational model's strengths and limitations
Comparison with NoSQL database types (document, key-value, column-family, graph) and how each could apply to clinic operations
Discussion of professional, legal, and ethical issues in healthcare database management (GDPR, data privacy, security, informed consent, data integrity, and access control)

Part B – Database Implementation

Conversion of the relational model into normalised tables with defined data types and constraints
Justification of datatype choices for every attribute
Full implementation in MySQL Workbench, including CREATE TABLE statements with primary/foreign key constraints across 9 tables:
Patient, Doctor, Treatment, Room, Allergy, Patient_Allergy, TreatmentPlan, Appointment, Invoice
Populated with realistic sample data (10+ records per table)

Part C – SQL Queries
A set of 10 SQL queries demonstrating a range of techniques:

Multi-table JOIN for a complete billing/appointment report
Filtered joins for location-based patient analysis
Subqueries comparing booked vs. required treatment sessions
Self-joins to identify patients sharing the same doctor
Aggregation (COUNT/SUM/GROUP BY/HAVING) for treatment demand and revenue
UNION queries to build a combined patient/doctor contact directory
Parameterised lookup queries for patient appointment history
Nested EXISTS queries for financial/clinical condition checks
Correlated subqueries comparing doctor workload against role averages
Relational division (double NOT EXISTS) to find patients who underwent multiple specific treatments

🛠️ Tools Used

MySQL Workbench
SQL (DDL, DML, joins, subqueries, aggregation, set operations)
ER modelling tools

👥 Authors

Reeva Josephine Deepak (M01036971)
Mutsawashe Audrey Mandinde (M01033270)

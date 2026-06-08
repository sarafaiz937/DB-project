# 🚌 Bus Ticket Counter System

## 📌 Project Overview
This project is a **Bus Ticket Counter System Database** designed to automate and manage bus transportation operations such as passenger management, ticket booking, scheduling, payments, and cancellations.  
It removes manual record keeping and improves efficiency, accuracy, and reliability.

---

## 🎓 Institution
:contentReference[oaicite:0]{index=0}  
**Database System Project**

---

## 👩‍🎓 Project Members
- Ansa Sharif (70153983)  
- Saira Bibi (70153984)  
- Khizra Khan (70154055)  

---

## 🎯 Objectives
- Manage passenger records efficiently  
- Handle bus and route information  
- Automate ticket booking system  
- Manage payments and refunds  
- Reduce manual errors and paperwork  
- Improve system performance and data accuracy  

---

## 🧩 Database Entities

The system consists of the following entities:

- Passenger  
- Bus  
- Route  
- Schedule  
- Seat  
- Ticket  
- Payment  
- Admin  
- Staff  
- Cancellation  
- Feedback  

---

## 🔗 Relationships
- One Passenger → Many Tickets  
- One Bus → Many Schedules  
- One Route → Many Schedules  
- One Schedule → Many Tickets  
- One Ticket → One Payment  
- One Ticket → One Cancellation  
- One Passenger → Many Feedback entries  

---

## ⚙️ Technologies Used
- PostgreSQL (SQL Database)
- Relational Database Design
- Primary & Foreign Keys
- Constraints & Joins

---

## 🏗️ Database Features

### 1. Passenger Management
Stores passenger details like name, CNIC, contact, and address.

### 2. Bus Management
Stores bus information such as bus number, type, seats, and driver name.

### 3. Route Management
Stores source, destination, and distance.

### 4. Schedule Management
Manages departure and arrival times of buses.

### 5. Ticket Booking
Handles ticket reservation with seat number and fare.

### 6. Payment System
Stores payment method, amount, and status.

### 7. Cancellation System
Handles ticket cancellation and refund details.

### 8. Feedback System
Stores passenger reviews and ratings.

---

## 📊 Sample Queries Included
- View all passengers and buses  
- Join query for ticket details  
- Total revenue calculation  
- Available seats listing  
- Average feedback rating  
- Total number of tickets  

---

## 🚀 How to Run This Project

1. Open PostgreSQL or any SQL editor  
2. Create database:
```sql
CREATE DATABASE BusTicketCounterSystem;
3. Run full SQL script provided in project

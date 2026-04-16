# Smart Clinic Management System

## Overview

Smart Clinic Management System is a full-stack application designed to manage clinical operations including patient records, doctor management, appointment scheduling, and prescription tracking. The system demonstrates practical implementation of backend services, database design, containerization, and frontend integration.

This project was developed as part of the **Java Development Capstone Project by IBM Skills Network** course on Coursera.

Certificate: [https://www.coursera.org/account/accomplishments/verify/KQFKF7WJ3OE4](https://www.coursera.org/account/accomplishments/verify/KQFKF7WJ3OE4)

---

## Key Features

### Patient Management

* Patient registration and authentication
* Secure storage of personal information
* Profile management

### Doctor Management

* Doctor registration and profile handling
* Specialty-based filtering
* Account locking and login attempt tracking

### Appointment System

* Schedule appointments between patients and doctors
* Track appointment status (Scheduled, Completed, Cancelled)
* Manage time slots

### Prescription Management (MongoDB)

* Store prescriptions linked to appointments
* Track medication, dosage, and doctor notes

### Authentication & Security

* Password-protected accounts
* Failed login attempt tracking
* Account locking mechanism

### DevOps & Deployment

* Dockerized services
* Docker Compose orchestration
* Workflow automation support

---

## Tech Stack

### Backend

* Java
* Spring Boot
* Maven

### Frontend

* HTML
* CSS
* JavaScript

### Databases

* MySQL (Relational data)
* MongoDB (Prescription storage)

### DevOps

* Docker
* Docker Compose

---

## Database Design

### MySQL Schema

#### patients

* id (INT, PK, Auto Increment)
* name (VARCHAR(100), NOT NULL)
* email (VARCHAR(100), UNIQUE, NOT NULL)
* password (VARCHAR(255), NOT NULL)
* phone (VARCHAR(15), NOT NULL)
* address (VARCHAR(255), NOT NULL)

#### doctors

* id (INT, PK, Auto Increment)
* name (VARCHAR(100), NOT NULL)
* specialty (VARCHAR(50), NOT NULL)
* email (VARCHAR(100), UNIQUE, NOT NULL)
* password (VARCHAR(255), NOT NULL)
* phone (VARCHAR(15), NOT NULL)
* is_active (TINYINT(1))
* failed_login_attempts (INT)
* is_locked (TINYINT(1))

#### appointments

* id (INT, PK, Auto Increment)
* doctor_id (FK → doctors.id)
* patient_id (FK → patients.id)
* appointment_time (DATETIME)
* status (INT: 0 = Scheduled, 1 = Completed, 2 = Cancelled)

#### admins

* id (INT, PK, Auto Increment)
* username (VARCHAR(50), UNIQUE, NOT NULL)
* password (VARCHAR(255), NOT NULL)
* failed_login_attempts (INT)
* is_locked (TINYINT(1))

---

### MongoDB Collection

#### prescriptions

* _id (ObjectId)
* patient_name (String)
* appointment_id (INT)
* medication (String)
* dosage (String)
* doctor_notes (String)

---

## System Architecture

The system follows a layered architecture:

* **Frontend Layer**: Handles UI/UX and user interactions
* **Backend Layer**: REST APIs and business logic (Spring Boot)
* **Database Layer**:

  * MySQL for structured relational data
  * MongoDB for flexible prescription data
* **Container Layer**: Dockerized services managed via Docker Compose

Refer to:

* schema-architecture.md for architecture diagrams
* schema-design.md for detailed schema

---

## Project Structure

```
Smart-clinic-management-system/
│
├── src/
│   ├── main/
│   │   ├── java/com/rungrukuk/smart_clinic_management_system/
│   │   │   ├── config/        
│   │   │   ├── controller/    
│   │   │   ├── domain/        
│   │   │   ├── dto/           
│   │   │   ├── repository/    
│   │   │   ├── security/      
│   │   │   ├── service/       
│   │   │   └── SmartClinicManagementSystemApplication.java  
│   │   │
│   │   └── resources/
│   │       ├── static/
│   │       │   ├── assets/    
│   │       │   ├── js/        
│   │       │   ├── pages/    
│   │       │   └── index.html 
│   │       ├── templates/     
│   │       └── application.yaml 
│   │
│   └── test/                 
│                
├── docker-compose.yml        
├── Dockerfile                
├── pom.xml 
├── schema-design.md
├── schema-architecture.md
├── user-stories.md
├── db-query-outputs.txt
├── request-outputs.txt
├── HELP.md           
└── README.md
```
# Application Architecture

---

## Overview

This application follows a layered architecture combining both MVC and REST patterns. Admin and Doctor dashboards created with Thymeleaf while REST APIs handle the other modules such as patient features, and appointment management. Application uses 2 databases:

1. MySQL - stores patients, doctors, appointments and admin records
2. MongoDB - stores flexible prescriptions

---

## Layer Breakdown

### 1. User Interface Layer
Consists of two types of client interactions. Thymeleaf templates to render HTML pages and REST API Clients which returns JSON responses.

---

### 2. Controller Layer
Incoming requests are routed to the appropriate controller based on URL path and HTTP method. Thymeleaf controllers handle server-side rendering, while REST controllers validates input, applies backend logic then return structured JSON response.

---

### 3. Service Layer
The controllers uses service layer to apply business logic. Using service layer also helps coordinating workflows accross multiple entities.

---

### 4. Repository Layer
Repository Layer - Services use repositories to access data stored in database without handling the complex SQL queries. This system has 2 types of repositories. MySQL Repositories and MongoDB Repositories.
---

### 5. Database Layer
Each repository communicates directly with database layer to access or edit data. Each repository can access it's own appropriate database.

---

### 6. Model Binding
After data retrieved from database its mapped into java model. `@Entity` and `@Document` used on domain entites for mapping the entites.

---

### 7. Response Construction
Bound models are used to construct the final response delivered back to the client. MVC flow sends HTML pages while REST flow sends JSON data as a response.
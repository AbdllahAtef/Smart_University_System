# Smart_University_System
# Smart University Management System

## Project Overview

Smart University Management System is a full-stack university management platform designed to simplify academic and administrative operations.

The system provides role-based access for Admins, Doctors, and Students, allowing management of courses, enrollments, attendance, quizzes, assignments, grades, events, and academic reports.

The project also includes an AI-powered academic analysis module developed using Python FastAPI to evaluate student performance and detect at-risk students.

---

# Repository Structure

```text
/src
    Backend/
    Frontend/
    AI-Service/
    Flutter-Mobile/


README.md
```

---

# Technologies Used

## Backend

* ASP.NET Core Web API
* Entity Framework Core
* SQL Server
* JWT Authentication
* BCrypt Password Hashing
* Swagger / OpenAPI

## Frontend

* HTML
* Tailwind CSS
* JavaScript

## Mobile Application

* Flutter
* Dart

## AI Service

* Python 3
* FastAPI
* Uvicorn

---

# System Features

## Admin Features

* Manage faculties and departments
* Add and manage students and doctors
* Create and manage courses
* Manage enrollments
* Publish student results
* View AI academic analysis
* Manage news and events

## Doctor Features

* Upload lectures
* Create assignments and quizzes
* Record attendance
* Grade assignments and quizzes
* View enrolled students
* Analyze student performance using AI

## Student Features

* View enrolled courses
* Submit assignments
* Take quizzes
* View grades and transcript
* View published results
* View AI academic analysis

---

# System Architecture

The project follows a layered architecture using Domain-Driven Design (DDD) principles.

## Layers

### Presentation Layer

Responsible for the user interface using HTML, Tailwind CSS, JavaScript, and Flutter.

### API Layer

Contains ASP.NET Core Controllers responsible for handling HTTP requests and responses.

### Application Layer

Contains services, DTOs, and business logic.

### Domain Layer

Contains entities, interfaces, and core business rules.

### Infrastructure Layer

Handles repositories, Entity Framework Core, database operations, and external integrations.

### AI Service Layer

Built using Python FastAPI and responsible for academic performance analysis.

---

# Prerequisites and Dependencies

Before running the project, make sure the following tools are installed:

## Required Software

* .NET 10 SDK
* SQL Server
* Visual Studio 2026 
* Python 3.14+
* Flutter SDK
* Android Studio or VS Code (for Flutter emulator)

## Python Libraries

Install:

```bash
pip install fastapi uvicorn
```

## Flutter Dependencies

```bash
flutter pub get
```

---

# Installation Steps

## 1. Clone Repository

```bash
git clone <repository-link>
```

```bash
cd SmartUniversity
```

---

# Backend Setup

## 1. Navigate to Backend Folder

```bash
cd src/Backend
```

## 2. Restore Packages

```bash
dotnet restore
```

## 3. Configure Database

Update the connection string inside:

```text
appsettings.json
```

Example:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=.;Database=SmartUniversityDB;Trusted_Connection=True;TrustServerCertificate=True"
}
```

## 4. Apply Database Migrations

```bash
update-database
```

## 5. Run Backend

```bash
dotnet run
```

Backend will run on:

```text
https://localhost:7146
```

Swagger:

```text
https://localhost:7146/swagger
```

---

# AI Service Setup

## 1. Navigate to AI Service Folder

```bash
cd src/AI-Service
```

## 2. Install Dependencies

```bash
pip install fastapi uvicorn
```

## 3. Run AI Service

```bash
python -m uvicorn main:app --reload
```

AI Service will run on:

```text
http://127.0.0.1:8000
```

Swagger:

```text
http://127.0.0.1:8000/docs
```

---

# Frontend Setup

## Open Frontend

Navigate to:

```text
src/Frontend
```

Open:

```text
edu-admin.html
```

You can run it using:

* VS Code Live Server
* Any static web server

---

# Flutter Mobile Setup

## 1. Navigate to Flutter Project

```bash
cd src/Flutter-Mobile
```

## 2. Install Packages

```bash
flutter pub get
```

## 3. Run Application

```bash
flutter run
```

## Android Emulator

Use Android Studio Device Manager to create and run an emulator.

Recommended:

* API 33 or API 34

---

# AI Academic Analysis

The system integrates an AI module that analyzes:

* Attendance
* Quiz scores
* Assignment grades
* Academic trends

The AI service predicts:

* Academic score
* Risk level
* Failure probability

---

# User Guide

## Admin

1. Login to the dashboard.
2. Add faculties and departments.
3. Add students and doctors.
4. Create courses.
5. Enroll students into courses.
6. Publish student results.
7. View AI academic insights.
8. Manage events and news.

## Doctor

1. Login to the system.
2. Create assignments and quizzes.
3. Upload lectures.
4. Record attendance.
5. Grade submissions.
6. View AI analysis for courses.

## Student

1. Login to the student portal.
2. View enrolled courses.
3. Submit assignments.
4. Take quizzes.
5. View transcript and results.
6. Check AI academic analysis.

---

# Implementation Overview

The backend was developed using ASP.NET Core Web API following Domain-Driven Design principles.

Entity Framework Core was used for database management and migrations.

Authentication and authorization were implemented using JWT tokens and role-based access control.

The frontend dashboard was developed using HTML, Tailwind CSS, and JavaScript with dynamic API integration.

The mobile application was developed using Flutter and Dart.

The AI academic analysis module was implemented using Python FastAPI and integrated with the backend using HTTP APIs.

---

# References

* Microsoft ASP.NET Core Documentation
* Entity Framework Core Documentation
* SQL Server Documentation
* FastAPI Documentation
* Flutter Documentation
* Tailwind CSS Documentation
* Swagger OpenAPI Documentation

---

# Team Information

## Project Name

Smart University Management System

## Developed By

* Ahmed Yahia
* Abdllah Atef
* Youssef Mohamed 
* Nariman Boutros

---

# License

This project was developed for educational purposes.

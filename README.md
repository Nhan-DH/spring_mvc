# LaptopShop - Spring MVC E-commerce Project

[![Java](https://img.shields.io/badge/Java-21-orange)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.5-6DB33F)](https://spring.io/projects/spring-boot)
[![Spring Security](https://img.shields.io/badge/Security-Spring%20Security-2E8B57)](https://spring.io/projects/spring-security)
[![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1)](https://www.mysql.com/)
[![Build](https://img.shields.io/badge/Build-Maven-C71A36)](https://maven.apache.org/)

A full-stack e-commerce web application for laptop retail, built with **Spring Boot + Spring MVC + JSP**.  
This project demonstrates practical backend engineering skills: authentication/authorization, session-based cart, order lifecycle, admin dashboard, file upload, and layered architecture.

## Why This Project Stands Out

- Built with a clear **Controller - Service - Repository** architecture.
- Implements **role-based access control** (`ADMIN` / `USER`) with Spring Security.
- Covers end-to-end business flows:
  - product browsing and filtering
  - cart and checkout
  - order history for users
  - product/user/order management for admin
- Uses **BCrypt** password hashing and CSRF protection.
- Includes profile management flows:
  - view account
  - update personal info on a dedicated page
  - change password on a dedicated page

## Feature Highlights

### Client Features
- Register/Login/Logout
- Browse products on homepage
- View product details
- Add/update/remove cart items
- Checkout and place orders
- View order history (`/client/my-orders`)
- Manage account (`/client/account`)
  - edit info (`/client/account/edit-info`)
  - change password (`/client/account/change-password`)

### Admin Features
- Dashboard overview
- Manage users
- Manage products (including image upload)
- Manage orders and status

## Tech Stack

- **Language:** Java 21
- **Framework:** Spring Boot 3.2.5
- **Web:** Spring MVC, JSP, JSTL
- **Security:** Spring Security, Remember-me, Session management
- **Data:** Spring Data JPA, Hibernate
- **Database:** MySQL
- **Validation:** Jakarta Validation + custom validators
- **Build Tool:** Maven Wrapper (`mvnw`)

## Project Structure

```text
src/main/java/com/devteria/spring_mvc
|-- config/                 # Security, MVC config, success handler
|-- controller/
|   |-- admin/              # Admin controllers
|   `-- client/             # Client controllers
|-- domain/                 # JPA entities and DTOs
|-- repository/             # Spring Data repositories
`-- service/                # Business logic

src/main/Webapp/WEB-INF/view
|-- admin/                  # Admin JSP views
`-- client/                 # Client JSP views

src/main/resources
`-- application.properties
```

## Security Notes

- Passwords are encoded with `BCryptPasswordEncoder`.
- CSRF token repository is enabled in security config.
- Route authorization:
  - public routes: `/`, `/login`, `/register`, `/product/**`, ...
  - admin routes: `/admin/**` requires `ROLE_ADMIN`
- Session policy includes concurrent session control and remember-me integration.

## Getting Started

### 1. Prerequisites
- JDK 21
- MySQL 8+
- Git

### 2. Clone and enter project

```bash
git clone <your-repo-url>
cd spring_mvc
```

### 3. Configure database

Create a MySQL database named `laptopshop`, then adjust credentials in `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/laptopshop
spring.datasource.username=root
spring.datasource.password=123456
```

### 4. Run the application

```bash
./mvnw spring-boot:run
```

On Windows PowerShell:

```powershell
.\mvnw.cmd spring-boot:run
```

### 5. Access the app

- Home: `http://localhost:8080/`
- Login: `http://localhost:8080/login`
- Register: `http://localhost:8080/register`

## Build and Test

```bash
./mvnw clean package
./mvnw test
```

## Engineering Decisions

- Chose JSP for server-side rendering to focus on backend and MVC fundamentals.
- Kept domain-centric service layer to isolate business logic from controllers.
- Leveraged JPA repositories for rapid CRUD and query composition.
- Added custom validation annotations to improve input quality.

## Roadmap

- Add API documentation (OpenAPI/Swagger)
- Add unit/integration tests for service and controller layers
- Add Docker setup for one-command local run
- Add CI pipeline (GitHub Actions)
- Improve observability with structured logs and metrics dashboard

## Author

**Nhan Dinh**  
Backend-focused developer with strong interest in Java/Spring ecosystem and production-ready system design.

If you are a recruiter or hiring manager, this project showcases practical skills in:
- secure authentication and authorization
- layered backend architecture
- e-commerce business flow implementation
- maintainable Java/Spring coding practices

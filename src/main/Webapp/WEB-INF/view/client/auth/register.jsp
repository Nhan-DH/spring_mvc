<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />

                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>NYAN SHOP</title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">


                <link href="/client/css/style.css" rel="stylesheet">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

                <style>
                    body {
                        background: linear-gradient(rgba(255, 255, 255, 0.9),
                                rgba(255, 255, 255, 0.9)),
                            url("/client/img/tech-background.jpg");

                        background-size: cover;
                        background-position: center;
                    }

                    .register-card {
                        border-radius: 16px;
                    }

                    .form-control {
                        height: 45px;
                    }

                    .btn-primary {
                        height: 45px;
                    }
                </style>

            </head>

            <body>

                <div class="container">

                    <div class="row justify-content-center align-items-center vh-100">

                        <div class="col-lg-6 col-md-8">

                            <div class="card shadow-lg border-0 register-card">

                                <div class="card-header text-center bg-white border-0">

                                    <h2 class="text-primary fw-bold mt-3">NyanShop</h2>

                                    <p class="text-muted">Create your account</p>

                                </div>

                                <div class="card-body px-5 pb-5">

                                    <form:form action="/register" method="post" modelAttribute="registerUser">
                                        <c:set var="errorPassword">
                                            <form:errors path="password" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorConfirmPassword">
                                            <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorEmail">
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                        </c:set>
                                        <div class="row mb-3">

                                            <div class="col-md-6">

                                                <label class="form-label">First Name</label>

                                                <div class="input-group">
                                                    <span class="input-group-text">
                                                        <i class="fas fa-user"></i>
                                                    </span>

                                                    <form:input type="text" path="firstName" class="form-control"
                                                        placeholder="First name" />

                                                </div>

                                            </div>

                                            <div class="col-md-6">

                                                <label class="form-label">Last Name</label>

                                                <div class="input-group">
                                                    <span class="input-group-text">
                                                        <i class="fas fa-user"></i>
                                                    </span>

                                                    <form:input type="text" path="lastName" class="form-control"
                                                        placeholder="Last name" required="true" />

                                                </div>

                                            </div>

                                        </div>

                                        <div class="mb-3">

                                            <label class="form-label">Email</label>

                                            <div class="input-group">

                                                <span class="input-group-text">
                                                    <i class="fas fa-envelope"></i>
                                                </span>

                                                <form:input type="email" path="email"
                                                    class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                    placeholder="Enter your email" required="true" />
                                                ${errorEmail}
                                            </div>

                                        </div>

                                        <div class="row mb-3">

                                            <div class="col-md-6">

                                                <label class="form-label">Password</label>

                                                <div class="input-group">

                                                    <span class="input-group-text">
                                                        <i class="fas fa-lock"></i>
                                                    </span>

                                                    <form:input type="password" path="password"
                                                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                        placeholder="Create password" required="true" />
                                                    ${errorPassword}
                                                </div>

                                            </div>

                                            <div class="col-md-6">

                                                <label class="form-label">Confirm Password</label>

                                                <div class="input-group">

                                                    <span class="input-group-text">
                                                        <i class="fas fa-lock"></i>
                                                    </span>

                                                    <form:input type="password" path="confirmPassword"
                                                        class="form-control ${not empty errorConfirmPassword ? 'is-invalid' : ''}"
                                                        placeholder="Confirm password" required="true" />
                                                    ${errorConfirmPassword}
                                                </div>

                                            </div>

                                        </div>

                                        <div class="d-grid mt-4">

                                            <button class="btn btn-primary">
                                                Create Account
                                            </button>

                                        </div>

                                    </form:form>

                                </div>

                                <div class="card-footer text-center bg-white">

                                    Already have an account?

                                    <a href="/login" class="text-primary">
                                        Login here
                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

            </body>

            </html>



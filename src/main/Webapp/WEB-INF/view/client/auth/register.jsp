<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>

                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>NyanShop | Register</title>

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

                                                <form:input type="email" path="email" class="form-control"
                                                    placeholder="Enter your email" required="true" />

                                            </div>

                                        </div>

                                        <div class="row mb-3">

                                            <div class="col-md-6">

                                                <label class="form-label">Password</label>

                                                <div class="input-group">

                                                    <span class="input-group-text">
                                                        <i class="fas fa-lock"></i>
                                                    </span>

                                                    <form:input type="password" path="password" class="form-control"
                                                        placeholder="Create password" required="true" />

                                                </div>

                                            </div>

                                            <div class="col-md-6">

                                                <label class="form-label">Confirm Password</label>

                                                <div class="input-group">

                                                    <span class="input-group-text">
                                                        <i class="fas fa-lock"></i>
                                                    </span>

                                                    <form:input type="password" path="confirmPassword"
                                                        class="form-control" placeholder="Confirm password"
                                                        required="true" />

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
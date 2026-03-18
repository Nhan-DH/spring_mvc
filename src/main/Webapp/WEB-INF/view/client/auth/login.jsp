<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>

                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>NyanShop | Login</title>

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

                    .login-card {
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

                        <div class="col-lg-5 col-md-7">

                            <div class="card shadow-lg border-0 login-card">

                                <div class="card-header text-center bg-white border-0">

                                    <h2 class="text-primary fw-bold mt-3">NyanShop</h2>

                                    <p class="text-muted">Login to your account</p>

                                </div>

                                <div class="card-body px-5 pb-5">

                                    <form action="/login" method="post">
                                        <c:if test="${param.error != null}">
                                            <div class="alert alert-danger">
                                                Login failed! Email or password is incorrect.
                                            </div>
                                        </c:if>
                                        <c:if test="${param.logout != null}">
                                            <div class="alert alert-success">
                                                Logout success
                                            </div>
                                        </c:if>
                                        <div class="mb-3">

                                            <label class="form-label">Email</label>

                                            <div class="input-group">

                                                <span class="input-group-text">
                                                    <i class="fas fa-envelope"></i>
                                                </span>

                                                <input type="email" name="username" class="form-control"
                                                    placeholder="Enter your email" required>

                                            </div>

                                        </div>

                                        <div class="mb-3">

                                            <label class="form-label">Password</label>

                                            <div class="input-group">

                                                <span class="input-group-text">
                                                    <i class="fas fa-lock"></i>
                                                </span>

                                                <input type="password" name="password" class="form-control"
                                                    placeholder="Enter password" required>

                                            </div>
                                            <div>
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                            </div>

                                        </div>

                                        <div class="d-flex justify-content-between mb-3">

                                            <div class="form-check">

                                                <input class="form-check-input" type="checkbox" name="remember">

                                                <label class="form-check-label">
                                                    Remember me
                                                </label>

                                            </div>

                                            <a href="#" class="text-primary small">
                                                Forgot password?
                                            </a>

                                        </div>

                                        <div class="d-grid mt-3">

                                            <button class="btn btn-primary">
                                                Login
                                            </button>

                                        </div>

                                    </form>

                                </div>

                                <div class="card-footer text-center bg-white">

                                    Don't have an account?

                                    <a href="/register" class="text-primary">
                                        Create account
                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

            </body>

            </html>
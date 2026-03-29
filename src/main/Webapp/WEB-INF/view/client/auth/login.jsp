<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link rel="icon" type="image/svg+xml"
                    href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />

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

                                        <div class="d-grid mt-2">

                                            <a href="/" class="btn btn-outline-secondary">
                                                Return to Home
                                            </a>

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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="container-fluid fixed-top">

            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <svg width="32" height="32" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                        <rect width="100" height="100" rx="20" fill="#0A0A0A" />
                        <path d="M 20 20 h 30 a 30 30 0 0 1 30 30 a 30 30 0 0 1 -30 30 h -30 v -60 z 
                                M 32 32 v 36 h 18 a 18 18 0 0 0 18 -18 a 18 18 0 0 0 -18 -18 h -18 z" fill="#2d2d2d" />
                        <circle cx="50" cy="50" r="8" fill="#0066FF" />
                    </svg>
                    <a href="/" class="navbar-brand ms-3">
                        <h1 class="text-primary display-6 fw-bold">NYAN</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white justify-content-between mx-5" id="navbarCollapse">
                        <div class="navbar-nav ">
                            <a href="/" class="nav-item nav-link active">Home</a>
                            <a href="/client/product/{id}" class="nav-item nav-link">Shop</a>
                            <a href="/client/contact" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <c:if test="${pageContext.request.userPrincipal != null}">
                                <a href="#" class="position-relative me-4 my-auto">
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span class="position-absolute rounded-circle 
d-flex align-items-center justify-content-center text-white px-1"
                                        style="top:-5px; left:15px; height:20px; min-width:20px; background:#0066ff;">
                                        3
                                    </span>
                                </a>
                                <div class="dropdown my-auto">
                                    <a href="#" class="dropdown-toggle" role="button" id="dropdownMenuLink"
                                        data-bs-toggle="dropdown" aria-expanded="false">

                                        <i class="fas fa-user fa-2x"></i>
                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">

                                        <!-- Avatar + tên -->
                                        <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                            <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                src="/images/avatar/${sessionScope.avatar}" />

                                            <div class="text-center my-3">
                                                <c:out value="${sessionScope.fullName}" />
                                            </div>
                                        </li>

                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <!-- Menu -->
                                        <li>
                                            <a class="dropdown-item" href="#">Quản lý tài khoản</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">Lịch sử mua hàng</a>
                                        </li>

                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li>
                                            <form method="post" action="/logout">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item text-danger">Đăng
                                                    xuất</button>

                                            </form>
                                        </li>

                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login" class="position-realative me-4 my-auto "
                                    style="background-color: rgb(11, 126, 241); color: white ;padding :5px 10px ; border-radius: 10%;">Login</a>
                            </c:if>

                        </div>
                    </div>
                </nav>
            </div>
        </div>
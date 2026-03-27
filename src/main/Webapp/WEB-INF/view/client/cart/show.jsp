<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
                    <meta charset="utf-8">
                    <title>NYAN SHOP</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Navbar start -->
                    <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
                    <!-- Navbar End -->




                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb>-item"><a href="/">Home/</a></li>
                                    <li class="breadcrumb-item active">CartDetail</li>
                                </ol>
                            </div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Products</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Handle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/image/${cartDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <a
                                                            href="/client/product/${cartDetail.product.id}">${cartDetail.product.name}</a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.product.price}" />$
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <div class="input-group-btn">
                                                            <button
                                                                class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                        </div>
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${cartDetail.quantity}"
                                                            data-cart-detail-id="${cartDetail.id}"
                                                            data-cart-detail-price="${cartDetail.price}"
                                                            data-cart-detail-index="${status.index}">
                                                        <div class="input-group-btn">
                                                            <button
                                                                class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value=" ${cartDetail.price*cartDetail.quantity}" />$

                                                    </p>
                                                </td>
                                                <td>
                                                    <form action="/delete-cart-detail/${cartDetail.id}" method="post"
                                                        class="delete-cart-detail-form"
                                                        data-cart-detail-id="${cartDetail.id}">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button class="btn btn-md rounded-circle bg-light border mt-4">
                                                            <i class="fa fa-times text-danger"></i>
                                                        </button>
                                                    </form>

                                                </td>

                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                            <div class="mt-5">
                                <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4"
                                    placeholder="Coupon Code">
                                <button class="btn border-secondary rounded-pill px-4 py-3 text-primary"
                                    type="button">Apply
                                    Coupon</button>
                            </div>
                            <div class="row g-4 justify-content-start">
                                <div class="col-12"></div>
                                <div class="col-12 col-sm-12 col-md-7 col-lg-6 col-xl-6">
                                    <div class="bg-light rounded">
                                        <div class="p-4">
                                            <h1 class="display-6 mb-4">Cart Total</h1>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="mb-0 me-4">Subtotal:</h5>
                                                <p class="mb-0" data-cart-total-price="${total}">${total}$</p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-0 me-4">Shipping</h5>
                                                <div class="">
                                                    <p class="mb-0">Flat rate: $0.00</p>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                            <h5 class="mb-0 ps-4 me-4">Total</h5>
                                            <p class="mb-0 pe-4" data-cart-total-price="${total}">${total}$</p>
                                        </div>
                                        <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div style="display : none;">
                                                <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                    varStatus="status">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <label>ID :</label>
                                                            <form:input type="text" class="form-control"
                                                                value="${cartDetail.id}"
                                                                path="cartDetails[${status.index}].id" />

                                                        </div>
                                                        <div class="form-group">
                                                            <label>Quantity :</label>
                                                            <form:input type="text" class="form-control"
                                                                value="${cartDetail.quantity}"
                                                                path="cartDetails[${status.index}].quantity"
                                                                data-cart-detail-index="${status.index}" />


                                                        </div>
                                                    </div>

                                                </c:forEach>
                                            </div>
                                            <button class="btn border-secondary rounded-pill px-4 py-3 text-primary
                                                text-uppercase mb-4 ms-4" type="submit">
                                                Proceed Checkout
                                            </button>
                                        </form:form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Cart Page End -->






                    <!-- Footer Start -->
                    <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
                    <!-- Footer End -->


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>

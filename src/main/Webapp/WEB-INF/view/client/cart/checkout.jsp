<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Home</title>
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

                                                        </div>
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${cartDetail.quantity}"
                                                            data-cart-detail-id="${cartDetail.id}"
                                                            data-cart-detail-price="${cartDetail.price}"
                                                            data-cart-detail-index="${status.index}">
                                                        <div class="input-group-btn">

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


                                                </td>

                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>
                            </div>

                            <div class="row g-4 justify-content-start mt-5">
                                <form:form action="/place-order" method="post" modelAttribute="cart" class="row g-4">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />


                                    <!-- Receiver info -->
                                    <div class="col-12 col-lg-7">
                                        <div class="bg-light rounded p-4">
                                            <h1 class="display-6 mb-4">Receiver Information</h1>

                                            <div class="row g-3">
                                                <div class="col-12 col-md-6">
                                                    <label class="form-label">Full Name</label>
                                                    <input type="text" name="receiverName" class="form-control"
                                                        placeholder="Enter full name">
                                                </div>

                                                <div class="col-12 col-md-6">
                                                    <label class="form-label">Phone Number</label>
                                                    <input type="text" name="receiverPhone" class="form-control"
                                                        placeholder="Enter phone number">
                                                </div>



                                                <div class="col-12">
                                                    <label class="form-label">Address</label>
                                                    <input type="text" name="receiverAddress" class="form-control"
                                                        placeholder="Enter address">
                                                </div>

                                                <div class="col-12">
                                                    <label class="form-label">Note</label>
                                                    <textarea name="receiverNote" rows="4" class="form-control"
                                                        placeholder="Enter note for delivery"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Cart total -->
                                    <div class="col-12 col-lg-5">
                                        <div class="bg-light rounded">
                                            <div class="p-4">
                                                <h1 class="display-6 mb-4">Cart Total</h1>

                                                <div class="d-flex justify-content-between mb-3">
                                                    <h5 class="mb-0 me-4">Subtotal:</h5>
                                                    <p class="mb-0" data-cart-total-price="${total}">
                                                        <fmt:formatNumber type="number" value="${total}" />$
                                                    </p>
                                                </div>

                                                <div class="d-flex justify-content-between mb-3">
                                                    <h5 class="mb-0 me-4">Shipping:</h5>
                                                    <p class="mb-0">0$</p>
                                                </div>

                                                <div class="d-flex justify-content-between mb-3">
                                                    <h5 class="mb-0 me-4">Discount:</h5>
                                                    <p class="mb-0">0$</p>
                                                </div>
                                            </div>

                                            <div
                                                class="py-4 px-4 border-top border-bottom d-flex justify-content-between">
                                                <h5 class="mb-0 me-4">Total</h5>
                                                <p class="mb-0">
                                                    <fmt:formatNumber type="number" value="${total}" />$
                                                </p>
                                            </div>

                                            <div class="p-4">
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase w-100"
                                                    type="submit">
                                                    Place Order
                                                </button>
                                                <a href="/cart"
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase w-100 mt-3">
                                                    Back to Cart
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
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
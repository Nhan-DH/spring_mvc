<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>History Orders</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                <link href="/client/css/style.css" rel="stylesheet">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />

                <div class="container-fluid py-5 ">
                    <div class="container py-5">
                        <h1 class="mb-4">History Orders</h1>

                        <c:if test="${empty orders}">
                            <div class="alert alert-info">
                                You have no orders yet.
                            </div>
                        </c:if>

                        <c:forEach var="order" items="${orders}">
                            <div class="card mb-5 shadow-sm">
                                <div class="card-header bg-light">
                                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                                        <div>
                                            <h5 class="mb-1">Order #${order.id}</h5>
                                            <span>Status: <strong>${order.status}</strong></span>
                                        </div>
                                        <div class="text-end">
                                            <div>Total Price:</div>
                                            <strong>
                                                <fmt:formatNumber type="number" value="${order.totalPrice}" /> $
                                            </strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <p class="mb-1"><strong>Receiver:</strong> ${order.receiverName}</p>
                                            <p class="mb-1"><strong>Phone:</strong> ${order.receiverPhone}</p>
                                            <p class="mb-1"><strong>Address:</strong> ${order.receiverAddress}</p>
                                            <p class="mb-1"><strong>Note:</strong> ${order.receiverNote}</p>
                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table align-middle">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>Image</th>
                                                    <th>Product</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                    <tr>
                                                        <td style="width: 100px;">
                                                            <img src="/images/image/${orderDetail.product.image}"
                                                                class="img-fluid rounded"
                                                                style="width: 70px; height: 70px; object-fit: cover;"
                                                                alt="${orderDetail.product.name}">
                                                        </td>
                                                        <td>
                                                            <a href="/client/product/${orderDetail.product.id}"
                                                                class="text-decoration-none">
                                                                ${orderDetail.product.name}
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price}" /> $
                                                        </td>
                                                        <td>${orderDetail.quantity}</td>
                                                        <td>
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price * orderDetail.quantity}" /> $
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <a href="/" class="btn btn-primary">Back to Home</a>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />

                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/js/main.js"></script>
            </body>

            </html>
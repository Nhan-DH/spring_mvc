<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link rel="icon" type="image/svg+xml"
                    href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
                <meta charset="utf-8">
                <title>Confirm Order - NYAN SHOP</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />

                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="row g-4">
                            <div class="col-12">
                                <div class="bg-light rounded p-4">
                                    <h2 class="mb-3">Confirm Your Order</h2>
                                    <p class="mb-0">Please review all order details before placing your order.</p>
                                </div>
                            </div>

                            <div class="col-12 col-lg-7">
                                <div class="bg-light rounded p-4 h-100">
                                    <h4 class="mb-4">Receiver Information</h4>
                                    <div class="mb-2"><strong>Full Name:</strong> ${receiverName}</div>
                                    <div class="mb-2"><strong>Phone Number:</strong> ${receiverPhone}</div>
                                    <div class="mb-2"><strong>Address:</strong> ${receiverAddress}</div>
                                    <div class="mb-0"><strong>Note:</strong> ${empty receiverNote ? 'No note' : receiverNote}</div>
                                </div>
                            </div>

                            <div class="col-12 col-lg-5">
                                <div class="bg-light rounded p-4 h-100">
                                    <h4 class="mb-4">Order Summary</h4>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span>Subtotal</span>
                                        <span><fmt:formatNumber type="number" value="${total}" />$</span>
                                    </div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span>Shipping</span>
                                        <span>0$</span>
                                    </div>
                                    <hr>
                                    <div class="d-flex justify-content-between fw-bold">
                                        <span>Total</span>
                                        <span><fmt:formatNumber type="number" value="${total}" />$</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="table-responsive bg-light rounded p-4">
                                    <h4 class="mb-4">Order Items</h4>
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="cartDetail" items="${cartDetails}">
                                                <tr>
                                                    <td>${cartDetail.product.name}</td>
                                                    <td><fmt:formatNumber type="number" value="${cartDetail.price}" />$</td>
                                                    <td>${cartDetail.quantity}</td>
                                                    <td><fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" />$</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="col-12 d-flex gap-3 justify-content-end">
                                <c:url value="/confirm-checkout" var="backToEditUrl">
                                    <c:param name="receiverName" value="${receiverName}" />
                                    <c:param name="receiverPhone" value="${receiverPhone}" />
                                    <c:param name="receiverAddress" value="${receiverAddress}" />
                                    <c:param name="receiverNote" value="${receiverNote}" />
                                </c:url>
                                <a href="${backToEditUrl}" class="btn border-secondary rounded-pill px-4 py-3 text-primary">
                                    Back To Edit
                                </a>

                                <form action="/place-order/confirm" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="hidden" name="receiverName" value="${receiverName}" />
                                    <input type="hidden" name="receiverPhone" value="${receiverPhone}" />
                                    <input type="hidden" name="receiverAddress" value="${receiverAddress}" />
                                    <input type="hidden" name="receiverNote" value="${receiverNote}" />
                                    <button type="submit" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase">
                                        Confirm And Place Order
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/js/main.js"></script>
            </body>

            </html>

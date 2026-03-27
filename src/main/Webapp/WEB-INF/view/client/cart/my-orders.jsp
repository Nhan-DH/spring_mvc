<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
                <meta charset="utf-8">
                <title>NYAN SHOP</title>
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

                <style>
                    .order-card {
                        border: none;
                        border-radius: 12px;
                        overflow: hidden;
                        transition: all 0.3s ease;
                        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                    }

                    .order-card:hover {
                        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.12);
                        transform: translateY(-2px);
                    }

                    .order-header {
                        background: linear-gradient(135deg, #4287ee 0%, #3366cc 100%);
                        color: white;
                        padding: 16px;
                    }

                    .order-header h5 {
                        color: white;
                        margin-bottom: 8px;
                        font-weight: 700;
                    }

                    .order-status {
                        display: inline-block;
                        padding: 4px 12px;
                        background: rgba(255, 255, 255, 0.2);
                        border-radius: 20px;
                        font-size: 13px;
                        font-weight: 600;
                    }

                    .order-body {
                        padding: 16px;
                    }

                    .order-info {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 12px;
                        margin-bottom: 12px;
                        font-size: 14px;
                    }

                    .order-info p {
                        margin-bottom: 4px;
                    }

                    .order-info strong {
                        color: #4287ee;
                        display: block;
                        font-size: 12px;
                        text-transform: uppercase;
                    }

                    .order-total {
                        background: #f8f9fa;
                        padding: 12px;
                        border-radius: 8px;
                        text-align: right;
                        margin-top: 12px;
                    }

                    .order-total .total-price {
                        font-size: 20px;
                        font-weight: 700;
                        color: #dc3545;
                    }

                    .collapse-details {
                        margin-top: 12px;
                        padding-top: 12px;
                        border-top: 1px solid #e9ecef;
                    }

                    .table-compact {
                        font-size: 13px;
                        margin-bottom: 0;
                    }

                    .table-compact img {
                        border-radius: 6px;
                    }

                    .btn-back-container {
                        display: flex;
                        justify-content: flex-end;
                        margin-top: 30px;
                    }

                    .btn-back {
                        padding: 10px 24px;
                        font-weight: 600;
                        border-radius: 8px;
                    }

                    .filter-section {
                        display: flex;
                        align-items: center;
                        gap: 12px;
                    }

                    .filter-label {
                        font-weight: 600;
                        color: #212529;
                        font-size: 14px;
                    }

                    .filter-select {
                        padding: 8px 16px;
                        border: 1px solid #dee2e6;
                        border-radius: 6px;
                        background-color: white;
                        font-size: 14px;
                        cursor: pointer;
                        transition: all 0.2s ease;
                        min-width: 150px;
                    }

                    .filter-select:hover {
                        border-color: #4287ee;
                        box-shadow: 0 0 0 3px rgba(0, 102, 255, 0.1);
                    }

                    .filter-select:focus {
                        outline: none;
                        border-color: #4287ee;
                        box-shadow: 0 0 0 3px rgba(0, 102, 255, 0.1);
                    }

                    .order-card[data-status] {
                        display: block;
                    }

                    .order-card.hidden {
                        display: none;
                    }
                </style>
            </head>

            <body>
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />

                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h1 class="mb-0">My Orders</h1>
                            <div class="filter-section">
                                <span class="badge bg-primary rounded-pill" style="font-size: 14px;">
                                    ${orders.size()} Orders
                                </span>
                                <label class="filter-label" for="statusFilter">Filter by Status:</label>
                                <select class="filter-select" id="statusFilter">
                                    <option value="">All Orders</option>
                                    <option value="PENDING">Pending</option>
                                    <option value="CONFIRMED">Confirmed</option>
                                    <option value="SHIPPING">Shipping</option>
                                    <option value="DELIVERED">Delivered</option>
                                    <option value="CANCELLED">Cancelled</option>
                                </select>
                            </div>
                        </div>

                        <c:if test="${empty orders}">
                            <div class="alert alert-info" role="alert">
                                <i class="fas fa-info-circle me-2"></i>
                                You have no orders yet.
                            </div>
                        </c:if>

                        <c:if test="${not empty orders}">
                            <div class="row g-4">
                                <c:forEach var="order" items="${orders}">
                                    <div class="col-lg-6">
                                        <div class="card order-card" data-status="${order.status}">
                                            <div class="order-header">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <h5>Order #${order.id}</h5>
                                                        <span class="order-status">${order.status}</span>
                                                    </div>
                                                    <div class="text-center">
                                                        <div style="font-size: 15px; font-weight: 700; opacity: 0.95;">
                                                            Order Date</div>
                                                        <div style="color: #fff; font-size: 15px; font-weight: 600;">
                                                            <fmt:formatDate value="${order.createdDate}"
                                                                pattern="dd/MM/yyyy HH:mm" />
                                                        </div>
                                                    </div>
                                                    <div class="text-end">
                                                        <div style="font-size: 12px; opacity: 0.9;">Total Price</div>
                                                        <div class="total-price" style="color: #fff; font-size: 18px;">
                                                            <fmt:formatNumber type="number"
                                                                value="${order.totalPrice}" /> $
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="order-body">
                                                <div class="order-info">
                                                    <div>
                                                        <strong>Receiver</strong>
                                                        <p>${order.receiverName}</p>
                                                    </div>
                                                    <div>
                                                        <strong>Phone</strong>
                                                        <p>${order.receiverPhone}</p>
                                                    </div>
                                                    <div>
                                                        <strong>Order Date</strong>
                                                        <p>
                                                            <fmt:formatDate value="${order.createdDate}"
                                                                pattern="dd/MM/yyyy HH:mm" />
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <strong>Status</strong>
                                                        <p>${order.status}</p>
                                                    </div>
                                                    <div>
                                                        <strong>Address</strong>
                                                        <p>${order.receiverAddress}</p>
                                                    </div>
                                                    <div>
                                                        <strong>Note</strong>
                                                        <p>${order.receiverNote}</p>
                                                    </div>
                                                </div>

                                                <div class="collapse-details">
                                                    <button class="btn btn-sm btn-outline-primary mb-3" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#details${order.id}">
                                                        <i class="fas fa-chevron-down me-1"></i>View Items
                                                    </button>

                                                    <div class="collapse" id="details${order.id}">
                                                        <div class="table-responsive">
                                                            <table class="table table-compact align-middle">
                                                                <thead class="table-light">
                                                                    <tr>
                                                                        <th style="width: 60px;">Image</th>
                                                                        <th>Product</th>
                                                                        <th style="width: 60px;">Qty</th>
                                                                        <th style="width: 80px;">Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="orderDetail"
                                                                        items="${order.orderDetails}">
                                                                        <tr>
                                                                            <td>
                                                                                <img src="/images/image/${orderDetail.product.image}"
                                                                                    class="img-fluid"
                                                                                    style="width: 50px; height: 50px; object-fit: cover;"
                                                                                    alt="${orderDetail.product.name}">
                                                                            </td>
                                                                            <td>
                                                                                <a href="/client/product/${orderDetail.product.id}"
                                                                                    class="text-decoration-none text-dark"
                                                                                    style="font-size: 13px;">
                                                                                    ${orderDetail.product.name}
                                                                                </a>
                                                                            </td>
                                                                            <td>${orderDetail.quantity}</td>
                                                                            <td>
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${orderDetail.price * orderDetail.quantity}" />
                                                                                $
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>

                        <div class="btn-back-container">
                            <a href="/" class="btn btn-primary btn-back" style="color: #f0f1f1;">
                                <i class="fas fa-arrow-left me-2"></i>Back to Home
                            </a>
                        </div>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />

                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/js/main.js"></script>

                <!-- Filter Orders Script -->
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const statusFilter = document.getElementById('statusFilter');
                        const orderCards = document.querySelectorAll('.order-card');

                        statusFilter.addEventListener('change', function () {
                            const selectedStatus = this.value.toUpperCase();

                            orderCards.forEach(card => {
                                const cardStatus = card.getAttribute('data-status').toUpperCase();
                                const cardCol = card.closest('.col-lg-6');

                                if (selectedStatus === '' || cardStatus === selectedStatus) {
                                    cardCol.style.display = '';
                                } else {
                                    cardCol.style.display = 'none';
                                }
                            });
                        });
                    });
                </script>
            </body>

            </html>



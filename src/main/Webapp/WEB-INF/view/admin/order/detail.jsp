<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Order Detail" />
                    <meta name="author" content="" />
                    <title>NYAN SHOP</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet" />
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link rel="stylesheet" href="/css/style.css">
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <style>
                        .detail-header {
                            background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                            color: white;
                            padding: 2rem;
                            border-radius: 0.5rem;
                            margin-bottom: 2rem;
                        }

                        .detail-header h1 {
                            margin: 0;
                            display: flex;
                            align-items: center;
                            gap: 0.75rem;
                            font-size: 2rem;
                        }

                        .detail-header p {
                            margin: 0.5rem 0 0 0;
                            opacity: 0.9;
                        }

                        .detail-card {
                            border: none;
                            border-radius: 0.5rem;
                            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                            transition: box-shadow 0.3s ease;
                        }

                        .detail-card:hover {
                            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
                        }

                        .detail-card-header {
                            background-color: #f8f9fa;
                            border-bottom: 2px solid #dee2e6;
                            padding: 1.25rem;
                            font-weight: 600;
                            color: #495057;
                            display: flex;
                            align-items: center;
                            gap: 0.5rem;
                        }

                        .info-section {
                            padding: 1.5rem;
                        }

                        .info-item {
                            margin-bottom: 1.5rem;
                            padding-bottom: 1.5rem;
                            border-bottom: 1px solid #e9ecef;
                        }

                        .info-item:last-child {
                            margin-bottom: 0;
                            padding-bottom: 0;
                            border-bottom: none;
                        }

                        .info-label {
                            font-size: 0.875rem;
                            font-weight: 600;
                            color: #6c757d;
                            text-transform: uppercase;
                            letter-spacing: 0.5px;
                            margin-bottom: 0.5rem;
                            display: flex;
                            align-items: center;
                            gap: 0.5rem;
                        }

                        .info-label i {
                            color: #0dcaf0;
                            width: 1rem;
                        }

                        .info-value {
                            font-size: 1.125rem;
                            color: #212529;
                            font-weight: 500;
                        }

                        .total-price {
                            font-size: 2rem;
                            font-weight: bold;
                            color: #0dcaf0;
                        }

                        .status-badge {
                            font-size: 1rem;
                            padding: 0.5rem 1rem;
                        }

                        .table-card {
                            border: none;
                            border-radius: 0.5rem;
                            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                        }

                        .table-products table {
                            margin-bottom: 0;
                        }

                        .table-products th {
                            background-color: #f8f9fa;
                            font-weight: 600;
                            color: #495057;
                            border-bottom: 2px solid #dee2e6;
                        }

                        .table-products th i {
                            margin-right: 0.5rem;
                            color: #0dcaf0;
                        }

                        .table-products tbody tr {
                            transition: background-color 0.2s ease;
                        }

                        .table-products tbody tr:hover {
                            background-color: #f8f9fa;
                        }

                        .product-img-thumb {
                            width: 60px;
                            height: 60px;
                            object-fit: cover;
                            border-radius: 0.375rem;
                        }

                        .action-footer {
                            padding: 1.5rem;
                            border-top: 1px solid #e9ecef;
                            display: flex;
                            gap: 0.75rem;
                            flex-wrap: wrap;
                        }

                        .btn-group-custom .btn {
                            padding: 0.5rem 1.5rem;
                            font-weight: 500;
                            border-radius: 0.375rem;
                        }

                        .summary-item {
                            display: flex;
                            justify-content: space-between;
                            padding: 0.75rem 0;
                            border-bottom: 1px solid #e9ecef;
                        }

                        .summary-item:last-child {
                            border-bottom: none;
                        }

                        .summary-label {
                            font-weight: 600;
                            color: #6c757d;
                        }

                        .summary-value {
                            font-weight: 600;
                            color: #212529;
                        }
                    </style>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4 py-4">
                                    <!-- Breadcrumb -->
                                    <nav aria-label="breadcrumb" class="mb-4">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/admin"><i class="fas fa-home"></i>
                                                    Dashboard</a></li>
                                            <li class="breadcrumb-item"><a href="/admin/order"><i
                                                        class="fas fa-shopping-bag"></i> Orders</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><i
                                                    class="fas fa-info-circle"></i> Detail</li>
                                        </ol>
                                    </nav>

                                    <!-- Header -->
                                    <div class="detail-header">
                                        <h1><i class="fas fa-receipt"></i> Order #${id}</h1>
                                        <p>Detailed order information and delivery details</p>
                                    </div>

                                    <!-- Main Content -->
                                    <div class="row">
                                        <!-- Products Table -->
                                        <div class="col-lg-8">
                                            <div class="table-card mb-4">
                                                <div class="detail-card-header">
                                                    <i class="fas fa-list"></i> Order Items
                                                </div>
                                                <div class="table-products table-responsive">
                                                    <table class="table table-hover align-middle">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th style="width: 80px;"><i class="fas fa-image"></i>
                                                                    Image</th>
                                                                <th><i class="fas fa-box"></i> Product</th>
                                                                <th style="width: 100px;"><i
                                                                        class="fas fa-dollar-sign"></i> Price</th>
                                                                <th style="width: 80px;"><i class="fas fa-cubes"></i>
                                                                    Qty</th>
                                                                <th style="width: 120px; text-align: right;"><i
                                                                        class="fas fa-calculator"></i> Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="orderDetail" items="${orderDetails}">
                                                                <tr>
                                                                    <td>
                                                                        <img src="/images/image/${orderDetail.product.image}"
                                                                            alt="${orderDetail.product.name}"
                                                                            class="product-img-thumb" />
                                                                    </td>
                                                                    <td>
                                                                        <a href="/client/product/${orderDetail.product.id}"
                                                                            class="text-decoration-none">
                                                                            <strong>${orderDetail.product.name}</strong>
                                                                        </a>
                                                                    </td>
                                                                    <td>$
                                                                        <fmt:formatNumber type="number"
                                                                            value="${orderDetail.product.price}" />
                                                                    </td>
                                                                    <td><strong>${orderDetail.quantity}</strong></td>
                                                                    <td style="text-align: right;"><strong>$
                                                                            <fmt:formatNumber type="number"
                                                                                value="${orderDetail.price * orderDetail.quantity}" />
                                                                        </strong></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Order Summary & Delivery -->
                                        <div class="col-lg-4">
                                            <!-- Order Summary -->
                                            <div class="detail-card mb-4">
                                                <div class="detail-card-header">
                                                    <i class="fas fa-receipt"></i> Order Summary
                                                </div>
                                                <div class="info-section">
                                                    <div class="info-item">
                                                        <div class="info-label"><i class="fas fa-list-check"></i> Status
                                                        </div>
                                                        <div class="info-value">
                                                            <c:choose>
                                                                <c:when test="${order.status == 'Pending'}"><span
                                                                        class="badge bg-warning text-dark status-badge">Pending</span>
                                                                </c:when>
                                                                <c:when test="${order.status == 'Completed'}"><span
                                                                        class="badge bg-success status-badge">Completed</span>
                                                                </c:when>
                                                                <c:when test="${order.status == 'Cancelled'}"><span
                                                                        class="badge bg-danger status-badge">Cancelled</span>
                                                                </c:when>
                                                                <c:otherwise><span
                                                                        class="badge bg-secondary status-badge">${order.status}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                    <div class="info-item">
                                                        <div class="info-label"><i class="fas fa-dollar-sign"></i> Total
                                                            Amount</div>
                                                        <div class="total-price">$
                                                            <fmt:formatNumber type="number"
                                                                value="${order.totalPrice}" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Delivery Information -->
                                            <div class="detail-card">
                                                <div class="detail-card-header">
                                                    <i class="fas fa-truck"></i> Delivery Information
                                                </div>
                                                <div class="info-section">
                                                    <div class="info-item">
                                                        <div class="info-label"><i class="fas fa-user"></i> Receiver
                                                            Name</div>
                                                        <div class="info-value">${order.receiverName}</div>
                                                    </div>
                                                    <div class="info-item">
                                                        <div class="info-label"><i class="fas fa-phone"></i> Phone
                                                            Number</div>
                                                        <div class="info-value">${order.receiverPhone}</div>
                                                    </div>
                                                    <div class="info-item">
                                                        <div class="info-label"><i class="fas fa-map-marker-alt"></i>
                                                            Address</div>
                                                        <div class="info-value">${order.receiverAddress}</div>
                                                    </div>
                                                    <div class="info-item">
                                                        <div class="info-label"><i class="fas fa-sticky-note"></i>
                                                            Delivery Note</div>
                                                        <div class="info-value" style="font-style: italic;">
                                                            ${order.receiverNote}</div>
                                                    </div>
                                                </div>
                                                <div class="action-footer">
                                                    <a href="/admin/order" class="btn btn-outline-info"
                                                        title="Go back to orders list">
                                                        <i class="fas fa-arrow-left"></i> Back to List
                                                    </a>
                                                    <a href="/admin/order/update/${id}" class="btn btn-warning"
                                                        title="Edit this order">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                </body>

                </html>



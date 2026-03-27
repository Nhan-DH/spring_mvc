<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <link rel="icon" type="image/svg+xml"
                        href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Update Order" />
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
                        .update-header {
                            background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                            color: white;
                            padding: 2rem;
                            border-radius: 0.5rem;
                            margin-bottom: 2rem;
                        }

                        .update-header h1 {
                            margin: 0;
                            display: flex;
                            align-items: center;
                            gap: 0.75rem;
                            font-size: 2rem;
                        }

                        .form-container {
                            background: white;
                            border-radius: 0.5rem;
                            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                            padding: 2rem;
                        }

                        .form-section {
                            margin-bottom: 2rem;
                        }

                        .form-section-title {
                            font-size: 1.125rem;
                            font-weight: 600;
                            color: #495057;
                            margin-bottom: 1.5rem;
                            padding-bottom: 0.75rem;
                            border-bottom: 2px solid #0099CC;
                            display: flex;
                            align-items: center;
                            gap: 0.5rem;
                        }

                        .form-section-title i {
                            color: #0099CC;
                        }

                        .form-group label {
                            font-weight: 600;
                            color: #495057;
                            margin-bottom: 0.5rem;
                            display: flex;
                            align-items: center;
                            gap: 0.5rem;
                        }

                        .form-control,
                        .form-select {
                            border: 1px solid #dee2e6;
                            border-radius: 0.375rem;
                            padding: 0.625rem 0.875rem;
                            font-size: 0.95rem;
                            transition: border-color 0.3s ease, box-shadow 0.3s ease;
                        }

                        .form-control:focus,
                        .form-select:focus {
                            border-color: #0099CC;
                            box-shadow: 0 0 0 0.2rem rgba(0, 153, 204, 0.25);
                        }

                        .info-card {
                            background-color: #f8f9fa;
                            border-radius: 0.5rem;
                            border: 1px solid #dee2e6;
                            padding: 1.5rem;
                        }

                        .info-row {
                            display: flex;
                            justify-content: space-between;
                            padding: 0.75rem 0;
                            border-bottom: 1px solid #e9ecef;
                        }

                        .info-row:last-child {
                            border-bottom: none;
                        }

                        .info-label {
                            font-weight: 600;
                            color: #495057;
                        }

                        .info-value {
                            color: #212529;
                        }

                        .action-buttons {
                            display: flex;
                            gap: 1rem;
                            justify-content: center;
                            margin-top: 2.5rem;
                            padding-top: 2rem;
                            border-top: 1px solid #e9ecef;
                        }

                        .btn-submit {
                            background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                            border: none;
                            color: white;
                            padding: 0.75rem 2.5rem;
                            font-weight: 600;
                            border-radius: 0.375rem;
                            transition: transform 0.2s ease, box-shadow 0.2s ease;
                        }

                        .btn-submit:hover {
                            color: white;
                            transform: translateY(-2px);
                            box-shadow: 0 0.5rem 1rem rgba(0, 153, 204, 0.4);
                        }

                        .btn-cancel {
                            background-color: #6c757d;
                            border: none;
                            color: white;
                            padding: 0.75rem 2.5rem;
                            font-weight: 600;
                            border-radius: 0.375rem;
                            transition: background-color 0.2s ease;
                            text-decoration: none;
                        }

                        .btn-cancel:hover {
                            background-color: #5a6268;
                            color: white;
                            text-decoration: none;
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
                                    <nav aria-label="breadcrumb" class="mb-4">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/admin"><i class="fas fa-home"></i>
                                                    Dashboard</a></li>
                                            <li class="breadcrumb-item"><a href="/admin/order"><i
                                                        class="fas fa-shopping-bag"></i> Orders</a></li>
                                            <li class="breadcrumb-item active"><i class="fas fa-edit"></i> Update Order
                                            </li>
                                        </ol>
                                    </nav>
                                    <div class="update-header">
                                        <h1><i class="fas fa-receipt"></i> Update Order #${newOrder.id}</h1>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-8 mx-auto">
                                            <div class="form-container">
                                                <form:form method="post" action="/admin/order/update"
                                                    modelAttribute="newOrder">
                                                    <form:hidden path="id" />
                                                    <form:hidden path="receiverPhone" />
                                                    <form:hidden path="receiverAddress" />
                                                    <form:hidden path="receiverNote" />
                                                    <form:hidden path="totalPrice" />
                                                    <form:hidden path="user" />

                                                    <div class="form-section">
                                                        <div class="form-section-title">
                                                            <i class="fas fa-tasks"></i> Order Status
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 mb-3">
                                                                <div class="form-group">
                                                                    <label for="status"><i
                                                                            class="fas fa-list-check"></i> Current
                                                                        Status *</label>
                                                                    <form:select path="status" class="form-select"
                                                                        id="status" required="true">
                                                                        <form:option value="">-- Select Status --
                                                                        </form:option>
                                                                        <form:option value="PENDING">Pending
                                                                        </form:option>
                                                                        <form:option value="CONFIRMED">Confirmed
                                                                        </form:option>
                                                                        <form:option value="SHIPPING">Shipping
                                                                        </form:option>
                                                                        <form:option value="COMPLETED">Completed
                                                                        </form:option>
                                                                        <form:option value="CANCELLED">Cancelled
                                                                        </form:option>
                                                                    </form:select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-section">
                                                        <div class="form-section-title">
                                                            <i class="fas fa-info-circle"></i> Order Details
                                                        </div>
                                                        <div class="info-card">
                                                            <div class="info-row">
                                                                <span class="info-label"><i class="fas fa-receipt"></i>
                                                                    Order ID:</span>
                                                                <span class="info-value">${newOrder.id}</span>
                                                            </div>
                                                            <div class="info-row">
                                                                <span class="info-label"><i
                                                                        class="fas fa-dollar-sign"></i> Total
                                                                    Price:</span>
                                                                <span class="info-value">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${newOrder.totalPrice}" /> $
                                                                </span>
                                                            </div>
                                                            <div class="info-row">
                                                                <span class="info-label"><i class="fas fa-user"></i>
                                                                    Customer Email:</span>
                                                                <span class="info-value">${newOrder.user.email}</span>
                                                            </div>
                                                            <div class="info-row">
                                                                <span class="info-label"><i
                                                                        class="fas fa-calendar-alt"></i> Order
                                                                    Date:</span>
                                                                <span class="info-value">
                                                                    <fmt:formatDate value="${newOrder.createdDate}"
                                                                        pattern="dd/MM/yyyy HH:mm" />
                                                                </span>
                                                            </div>
                                                            <div class="info-row">
                                                                <span class="info-label"><i class="fas fa-phone"></i>
                                                                    Receiver Phone:</span>
                                                                <span
                                                                    class="info-value">${newOrder.receiverPhone}</span>
                                                            </div>
                                                            <div class="info-row">
                                                                <span class="info-label"><i
                                                                        class="fas fa-map-marker-alt"></i> Delivery
                                                                    Address:</span>
                                                                <span
                                                                    class="info-value">${newOrder.receiverAddress}</span>
                                                            </div>
                                                            <div class="info-row">
                                                                <span class="info-label"><i
                                                                        class="fas fa-sticky-note"></i> Note:</span>
                                                                <span class="info-value">${newOrder.receiverNote}</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="action-buttons">
                                                        <button type="submit" class="btn btn-submit">
                                                            <i class="fas fa-save"></i> Update Order
                                                        </button>
                                                        <a href="/admin/order" class="btn btn-cancel">
                                                            <i class="fas fa-times"></i> Cancel
                                                        </a>
                                                    </div>
                                                </form:form>
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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Delete Order" />
    <meta name="author" content="" />
    <title>Delete Order - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        .delete-header { background: linear-gradient(135deg, #dc3545 0%, #bd2130 100%); color: white; padding: 2rem; border-radius: 0.5rem; margin-bottom: 2rem; }
        .delete-header h1 { margin: 0; display: flex; align-items: center; gap: 0.75rem; font-size: 2rem; }
        .delete-card { background: white; border-radius: 0.5rem; box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); border-left: 4px solid #dc3545; }
        .delete-card-body { padding: 2rem; }
        .warning-section { background-color: #fff3cd; border-left: 4px solid #ffc107; padding: 1.5rem; border-radius: 0.375rem; margin-bottom: 2rem; }
        .warning-section h5 { color: #856404; margin-bottom: 0.75rem; display: flex; align-items: center; gap: 0.5rem; }
        .warning-section p { color: #856404; margin: 0; font-weight: 500; }
        .info-section { background-color: #e7f3ff; border-left: 4px solid #0099CC; padding: 1.5rem; border-radius: 0.375rem; margin-bottom: 2rem; }
        .info-section h5 { color: #004085; margin-bottom: 1rem; display: flex; align-items: center; gap: 0.5rem; }
        .info-item { display: flex; justify-content: space-between; padding: 0.75rem 0; border-bottom: 1px solid #b3d9ff; }
        .info-item:last-child { border-bottom: none; }
        .info-label { font-weight: 600; color: #004085; }
        .info-value { color: #004085; }
        .action-buttons { display: flex; gap: 1rem; justify-content: center; margin-top: 2.5rem; padding-top: 2rem; border-top: 2px solid #dee2e6; }
        .btn-delete { background-color: #dc3545; border: none; color: white; padding: 0.75rem 2.5rem; font-weight: 600; border-radius: 0.375rem; transition: transform 0.2s ease, box-shadow 0.2s ease; }
        .btn-delete:hover { color: white; background-color: #c82333; transform: translateY(-2px); box-shadow: 0 0.5rem 1rem rgba(220, 53, 69, 0.4); }
        .btn-cancel { background-color: #6c757d; border: none; color: white; padding: 0.75rem 2.5rem; font-weight: 600; border-radius: 0.375rem; transition: background-color 0.2s ease; text-decoration: none; }
        .btn-cancel:hover { background-color: #5a6268; color: white; text-decoration: none; }
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
                            <li class="breadcrumb-item"><a href="/admin"><i class="fas fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="/admin/order"><i class="fas fa-shopping-bag"></i> Orders</a></li>
                            <li class="breadcrumb-item active"><i class="fas fa-trash"></i> Delete Order</li>
                        </ol>
                    </nav>

                    <div class="delete-header">
                        <h1><i class="fas fa-exclamation-triangle"></i> Delete Order</h1>
                    </div>

                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <div class="delete-card">
                                <div class="delete-card-body">
                                    <div class="warning-section">
                                        <h5><i class="fas fa-exclamation-circle"></i> Warning: This Action Cannot Be Undone</h5>
                                        <p>Once you delete this order, all associated data will be permanently removed from the system.</p>
                                    </div>

                                    <div class="info-section">
                                        <h5><i class="fas fa-receipt"></i> Order Information</h5>
                                        <div class="info-item">
                                            <span class="info-label">Order ID:</span>
                                            <span class="info-value">${newOrder.id}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Customer Email:</span>
                                            <span class="info-value">${newOrder.user.email}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Receiver Name:</span>
                                            <span class="info-value">${newOrder.receiverName}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Status:</span>
                                            <span class="info-value"><span class="badge bg-warning text-dark">${newOrder.status}</span></span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Total Price:</span>
                                            <span class="info-value"><strong>$<fmt:formatNumber type="number" value="${newOrder.totalPrice}" /></strong></span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Phone:</span>
                                            <span class="info-value">${newOrder.receiverPhone}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Address:</span>
                                            <span class="info-value">${newOrder.receiverAddress}</span>
                                        </div>
                                    </div>

                                    <div class="alert alert-danger" role="alert">
                                        <i class="fas fa-exclamation-circle"></i> <strong>Are you absolutely sure?</strong> This will permanently delete the order and cannot be reversed.
                                    </div>

                                    <form:form method="post" action="/admin/order/delete" modelAttribute="newOrder">
                                        <form:hidden path="id" />
                                        <div class="action-buttons">
                                            <button type="submit" class="btn btn-delete">
                                                <i class="fas fa-check-circle"></i> Confirm Delete
                                            </button>
                                            <a href="/admin/order" class="btn btn-cancel">
                                                <i class="fas fa-arrow-left"></i> Cancel
                                            </a>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>

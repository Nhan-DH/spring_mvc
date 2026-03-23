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
                    <title>Update Order</title>

                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link rel="stylesheet" href="/css/style.css">
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />

                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />

                        <div id="layoutSidenav_content">
                            <main>
                                <div class="ms-5 mt-3">
                                    <h1>Order Management</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/order">Order</a></li>
                                        <li class="breadcrumb-item active">Update Order</li>
                                    </ol>
                                </div>

                                <div class="container mt-4">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h3>Update Order ID = ${newOrder.id}</h3>
                                            </div>
                                            <hr />

                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="card mb-4">
                                                        <div class="card-header">
                                                            <h5 class="mb-0">Update Order Information</h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <form:form method="post" action="/admin/order/update"
                                                                modelAttribute="newOrder">

                                                                <!-- hidden id để update đúng order -->
                                                                <form:hidden path="id" />

                                                                <!-- Nếu service save toàn bộ object thì nên giữ lại các field không sửa -->
                                                                <form:hidden path="receiverPhone" />
                                                                <form:hidden path="receiverAddress" />
                                                                <form:hidden path="receiverNote" />
                                                                <form:hidden path="totalPrice" />
                                                                <form:hidden path="user" />



                                                                <div class="mb-3">
                                                                    <label class="form-label">Status</label>
                                                                    <form:select path="status" cssClass="form-select">
                                                                        <form:option value="PENDING" label="PENDING" />
                                                                        <form:option value="CONFIRMED"
                                                                            label="CONFIRMED" />
                                                                        <form:option value="SHIPPING"
                                                                            label="SHIPPING" />
                                                                        <form:option value="COMPLETED"
                                                                            label="COMPLETED" />
                                                                        <form:option value="CANCELLED"
                                                                            label="CANCELLED" />
                                                                    </form:select>
                                                                </div>

                                                                <button type="submit"
                                                                    class="btn btn-warning">Update</button>
                                                                <a href="/admin/order"
                                                                    class="btn btn-secondary ms-2">Back</a>
                                                            </form:form>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5 class="mb-0">Order Detail</h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <p class="card-text">
                                                                <strong>Total Price:</strong>
                                                                <fmt:formatNumber type="number"
                                                                    value="${newOrder.totalPrice}" /> $
                                                            </p>
                                                            <p class="card-text">
                                                                <strong>Name:</strong> ${newOrder.user.email}
                                                            </p>
                                                            <p class="card-text">
                                                                <strong>Phone:</strong> ${newOrder.receiverPhone}
                                                            </p>
                                                            <p class="card-text">
                                                                <strong>Address:</strong> ${newOrder.receiverAddress}
                                                            </p>
                                                            <p class="card-text">
                                                                <strong>Note:</strong> ${newOrder.receiverNote}
                                                            </p>
                                                        </div>
                                                    </div>
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
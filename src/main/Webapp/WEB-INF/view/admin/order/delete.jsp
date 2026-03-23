<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <title>Delete Order</title>

                    <link rel="stylesheet" href="/css/style.css">
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />

                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />

                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container mt-4">
                                    <h2 class="text-danger">Delete Order</h2>
                                    <hr />

                                    <div class="card border-danger">
                                        <div class="card-header bg-danger text-white">
                                            Confirm Delete
                                        </div>

                                        <div class="card-body">
                                            <p>Are you sure you want to delete this order?</p>

                                            <ul class="list-group mb-3">
                                                <li class="list-group-item">
                                                    <strong>ID:</strong> ${newOrder.id}
                                                </li>
                                                <li class="list-group-item">
                                                    <strong>Receiver:</strong> ${newOrder.receiverName}
                                                </li>
                                                <li class="list-group-item">
                                                    <strong>Status:</strong> ${newOrder.status}
                                                </li>
                                                <li class="list-group-item">
                                                    <strong>Total Price:</strong>
                                                    <fmt:formatNumber value="${newOrder.totalPrice}" /> $
                                                </li>
                                            </ul>

                                            <!-- FORM DELETE -->
                                            <form:form method="post" action="/admin/order/delete"
                                                modelAttribute="newOrder">

                                                <!-- ID để backend xóa -->
                                                <form:hidden path="id" />

                                                <button type="submit" class="btn btn-danger">
                                                    Delete
                                                </button>

                                                <a href="/admin/order" class="btn btn-secondary ms-2">
                                                    Cancel
                                                </a>

                                            </form:form>
                                        </div>
                                    </div>

                                </div>
                            </main>

                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>

                </body>

                </html>
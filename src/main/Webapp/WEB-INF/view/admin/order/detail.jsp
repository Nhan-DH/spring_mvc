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
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Create product</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link rel="stylesheet" href="/css/style.css">
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>

                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="ms-5">
                                    <h1>Product Management</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb>-item"><a href="/admin">Dashboard/</a></li>
                                        <li class="breadcrumb>-item"><a href="/admin/order">Order/</a></li>
                                        <li class="breadcrumb-item active">View Detail</li>
                                    </ol>
                                </div>
                                <div class="container mt-5">
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h3>Order Detail with id = ${id}</h3>

                                                </div>
                                                <hr />
                                                <div>
                                                    <div class="card mb-4">
                                                        <div class="card-header">
                                                            <h5 class="mb-0">Products in Order</h5>
                                                        </div>
                                                        <div class="card-body p-0">
                                                            <div class="table-responsive">
                                                                <table
                                                                    class="table table-bordered table-hover align-middle mb-0">
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
                                                                        <c:forEach var="orderDetail"
                                                                            items="${orderDetails}">
                                                                            <tr>
                                                                                <td style="width: 90px;">
                                                                                    <img src="/images/image/${orderDetail.product.image}"
                                                                                        class="img-fluid rounded"
                                                                                        style="width: 60px; height: 60px; object-fit: cover;"
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
                                                                                        value="${orderDetail.product.price}" />
                                                                                    $
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
                                                <div class="card" style=" width: 26rem;">
                                                    <div class="card-body">



                                                        <p class="card-text">Total Price: ${order.totalPrice}</p>
                                                        <p class="card-text">Status: ${order.status}</p>
                                                        <p class="card-text">Name: ${order.receiverName}</p>
                                                        <p class="card-text">Phone: ${order.receiverPhone}</p>
                                                        <p class="card-text">Address: ${order.receiverAddress}</p>
                                                        <p class="card-text">Note: ${order.receiverNote}</p>

                                                        <div class="col-12 mb-3">
                                                            <img style="display:none; max-height: 200px;"
                                                                alt="avatar preview" id="avatarPreview">
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <button onclick="window.location.href='/admin/order'"
                                                class="btn btn-primary"
                                                style="margin-top: 20px; width : 100px">Return</button>
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
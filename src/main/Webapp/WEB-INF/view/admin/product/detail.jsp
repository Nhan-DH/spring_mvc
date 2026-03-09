<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Create product</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="/css/style.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="ms-5">
                                <h1>product Management</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb>-item"><a href="/admin">Dashboard/</a></li>
                                    <li class="breadcrumb-item active">product</li>
                                </ol>
                            </div>
                            <div class="container mt-5">
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h3>product Detail</h3>
                                                <h1>Information for product ID: ${id}</h1>
                                            </div>
                                            <hr />
                                            <div class="card" style=" width: 18rem;">
                                                <div class="card-body">
                                                    <h5 class="card-title">Name: ${product.name}</h5>
                                                    <p class="card-text">Price: ${product.price}</p>
                                                    <p class="card-text"> DetailDecs: ${product.detailDecs}</p>
                                                    <p class="card-text">ShortDesc: ${product.shortDesc}</p>
                                                    <p class="card-text">Factory: ${product.factory}</p>
                                                    <p class="card-text">Target: ${product.target}</p>
                                                    <p class="card-text">Quantity: ${product.quantity}</p>
                                                    <p class="card-text">Sold: ${product.sold}</p>

                                                    <div class="col-12 mb-3">
                                                        <img style="display:none; max-height: 200px;"
                                                            alt="avatar preview" id="avatarPreview">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <button onclick="window.location.href='/admin/product'" class="btn btn-primary"
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
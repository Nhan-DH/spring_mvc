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
                <title>Create User</title>
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
                                <h1>Product Management</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb>-item"><a href="/admin">Dashboard/</a></li>
                                    <li class="breadcrumb>-item"><a href="/admin/product">Product/</a></li>
                                    <li class="breadcrumb-item active">Delete</li>
                                </ol>
                            </div>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h3>Product Detail</h3>
                                            <h1>Information for Product ID: ${id}</h1>
                                        </div>
                                        <hr />
                                        <h1>Are you sure want to delete Product with ID : ${id}</h1>
                                        <form:form action="/admin/product/delete/${id}" method="post">
                                            <button type="submit" class="btn btn-danger"
                                                style="margin-top: 20px; width : 100px">Comfirm</button>
                                        </form:form>
                                        <button onclick="window.location.href='/admin/product'"
                                            class="btn btn-secondary"
                                            style="margin-top: 20px; width : 100px">Cancel</button>
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
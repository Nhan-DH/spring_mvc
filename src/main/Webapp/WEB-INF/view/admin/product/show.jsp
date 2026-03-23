<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Product Management - Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="/css/style.css">
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <style>
                .table-container {
                    background: #fff;
                    border-radius: 0.5rem;
                    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                    overflow: hidden;
                }
                .table-header {
                    background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                    padding: 1.5rem;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    gap: 1rem;
                }
                .table-header h3 {
                    color: white;
                    margin: 0;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                }
                .btn-create {
                    background: #fff;
                    color: #0099CC;
                    border: none;
                    font-weight: 600;
                }
                .btn-create:hover {
                    background: #f8f9fa;
                    color: #0099CC;
                }
                table th {
                    background-color: #f8f9fa;
                    font-weight: 600;
                    color: #495057;
                    border-bottom: 2px solid #dee2e6;
                    white-space: nowrap;
                }
                table th i {
                    margin-right: 0.5rem;
                    color: #0099CC;
                }
                table tbody tr {
                    transition: background-color 0.2s ease;
                }
                table tbody tr:hover {
                    background-color: #f8f9fa;
                }
                .action-buttons {
                    display: flex;
                    gap: 0.5rem;
                    flex-wrap: wrap;
                }
                .action-buttons .btn {
                    padding: 0.375rem 0.75rem;
                    font-size: 0.875rem;
                }
            </style>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="ms-5">
                            <h1><i class="fas fa-box"></i> Product Management</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Products</li>
                            </ol>
                        </div>
                        <div class="container-fluid mt-4">
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-container">
                                        <div class="table-header">
                                            <h3><i class="fas fa-list"></i> Product List</h3>
                                            <a href="/admin/product/create" class="btn btn-create"><i class="fas fa-plus"></i> Add New Product</a>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fas fa-hashtag"></i> ID</th>
                                                        <th><i class="fas fa-tag"></i> Name</th>
                                                        <th><i class="fas fa-dollar-sign"></i> Price</th>
                                                        <th><i class="fas fa-building"></i> Factory</th>
                                                        <th><i class="fas fa-cog"></i> Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${products}" var="product">
                                                        <tr>
                                                            <td><strong>${product.id}</strong></td>
                                                            <td>${product.name}</td>
                                                            <td><strong class="text-success">$${product.price}</strong></td>
                                                            <td>${product.factory}</td>
                                                            <td>
                                                                <div class="action-buttons">
                                                                    <a href="/admin/product/${product.id}" class="btn btn-sm btn-info" title="View"><i class="fas fa-eye"></i></a>
                                                                    <a href="/admin/product/update/${product.id}" class="btn btn-sm btn-warning" title="Update"><i class="fas fa-edit"></i></a>
                                                                    <a href="/admin/product/delete/${product.id}" class="btn btn-sm btn-danger" title="Delete"><i class="fas fa-trash"></i></a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
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
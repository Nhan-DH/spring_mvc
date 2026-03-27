<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>NYAN SHOP</title>
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
                            <h1><i class="fas fa-users"></i> User Management</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Users</li>
                            </ol>
                        </div>
                        <div class="container-fluid mt-4">
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-container">
                                        <div class="table-header">
                                            <h3><i class="fas fa-list"></i> User List</h3>
                                            <a href="/admin/user/create" class="btn btn-create"><i
                                                    class="fas fa-plus"></i> Add New User</a>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fas fa-hashtag"></i> ID</th>
                                                        <th><i class="fas fa-envelope"></i> Email</th>
                                                        <th><i class="fas fa-user"></i> Full Name</th>
                                                        <th><i class="fas fa-shield-alt"></i> Role</th>
                                                        <th><i class="fas fa-cog"></i> Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${users}" var="user">
                                                        <tr>
                                                            <td><strong>${user.id}</strong></td>
                                                            <td>${user.email}</td>
                                                            <td>${user.fullName}</td>
                                                            <td><span class="badge bg-primary">${user.role.name}</span>
                                                            </td>
                                                            <td>
                                                                <div class="action-buttons">
                                                                    <a href="/admin/user/${user.id}"
                                                                        class="btn btn-sm btn-info" title="View"><i
                                                                            class="fas fa-eye"></i></a>
                                                                    <a href="/admin/user/update/${user.id}"
                                                                        class="btn btn-sm btn-warning" title="Update"><i
                                                                            class="fas fa-edit"></i></a>
                                                                    <a href="/admin/user/delete/${user.id}"
                                                                        class="btn btn-sm btn-danger" title="Delete"><i
                                                                            class="fas fa-trash"></i></a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center mt-4">
                                                    <li class="page-item">
                                                        <a class="${1 == currentPage ? 'page-link disabled' : 'page-link'}"
                                                            href="/admin/user?page=${currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="1" end="${totalPages}" var="loop">
                                                        <li class="page-item">
                                                            <a class="${loop == currentPage ? 'page-link active' : 'page-link'}"
                                                                href="/admin/user?page=${loop}">
                                                                ${loop}
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <a class="${totalPages == currentPage ? 'page-link disabled' : 'page-link'}"
                                                            href="/admin/user?page=${currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                            <span class="sr-only">Next</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
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



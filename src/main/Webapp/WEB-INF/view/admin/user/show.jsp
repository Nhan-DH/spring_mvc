<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
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
                    <div class = "ms-5" >
                        <h1>User Management</h1>
                        <ol class = "breadcrumb mb-4">
                            <li class="breadcrumb>-item"><a href="/admin">Dashboard/</a></li>
                            <li class="breadcrumb-item active">User</li>
                        </ol>
                    </div>
                    <div class = "container mt-5">
                    <div class="row">
                    <div class="col-12 mx-auto">
                        <div class = "d-flex justify-content-between align-items-center mb-3">
                            <h3>Table User</h3>
                            <a href="/admin/user/create" class="btn btn-primary">Create New User</a>
                        </div>
                        <hr />
                        <table class = "table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Email</th>
                                    <th>Full Name</th>
                                    <th>Role</th>

                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${users}" var="user">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.email}</td>
                                        <td>${user.fullName}</td>
                                        <td>${user.role.name}</td>
                                        <td>
                                            <a href="/admin/user/${user.id}" class = "btn btn-info">View</a>
                                            <a href="/admin/user/update/${user.id}" class = "btn btn-warning">Update</a>
                                            <a href="/admin/user/delete/${user.id}" class = "btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>
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

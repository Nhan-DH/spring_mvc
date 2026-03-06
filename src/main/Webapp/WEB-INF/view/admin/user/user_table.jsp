<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class = "container mt-5">
        <div class="row">
           <div class="col-12 mx-auto">
             <div class = "d-flex justify-content-between align-items-center mb-3">
                <h3>All Users</h3>
                <a href="/admin/user/create" class="btn btn-primary">Create New User</a>
             </div>
             <hr />
             <table class = "table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.fullName}</td>
                            <td>${user.email}</td>
                            <td>${user.phoneNumber}</td>
                            <td>${user.address}</td>
                            <td>
                                <a href="/admin/user/${user.id}" class = "btn btn-info">View</a>
                                <a href="/admin/user/edit/${user.id}" class = "btn btn-warning">Edit</a>
                                <a href="/admin/user/delete/${user.id}" class = "btn btn-danger">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

             </table>
           </div>
    </div>
</body>
</html>
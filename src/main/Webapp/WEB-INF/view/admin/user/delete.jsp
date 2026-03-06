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
                <h3>User Detail</h3>
                <h1>Information for User ID: ${id}</h1>
             </div>
             <hr />
              <h1>Are you sure want to delete user with ID : ${id}</h1>
           <form:form action="/admin/user/delete/${id}" method="post" >
           <button type="submit" class="btn btn-danger" style = "margin-top: 20px; width : 100px">Comfirm</button>
           </form:form>
           <button onclick="window.location.href='/admin/user'" class="btn btn-secondary" style = "margin-top: 20px; width : 100px">Cancel</button>
    </div>
</body>
</html>
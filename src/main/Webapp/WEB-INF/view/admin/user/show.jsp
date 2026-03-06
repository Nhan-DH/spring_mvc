<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <title>Document</title>
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
              <div class = "card" style = " width: 18rem;">
                <div class = "card-body">
                    <h5 class = "card-title">Full Name: ${user.fullName}</h5>
                    <p class = "card-text">Email: ${user.email}</p>
                    <p class = "card-text">Phone Number: ${user.phoneNumber}</p>
                    <p class = "card-text">Address: ${user.address}</p>
                </div>
                
              </div>
           </div>
           <button onclick="window.location.href='/admin/user'" class="btn btn-primary" style = "margin-top: 20px; width : 100px">Return</button>
    </div>
</body>
</html>
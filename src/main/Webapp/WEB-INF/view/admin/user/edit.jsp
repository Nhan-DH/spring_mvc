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
    
    <form:form class = "container mt-5" method = "post" action = "/admin/user/edit/${id}"
    modelAttribute="newUser">
    <h1 class = "text-center text-primary">User edit</h1>
    <div class = "col-md-6 col-12 mx-auto">
        <div class="form-group mb-3">
    <h1>Edit Information User : ${id}</h1>
  </div>
        <div class="form-group mb-3">
    <label for="exampleInputEmail1">Email address</label>
    <form:input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"
    path = "email"/>
    
  </div>
 
  <div class="form-group mb-3">
    <label for="exampleInputPassword1">Phone Number</label>
    <form:input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter phone number" path = "phoneNumber"/>
  </div>
  <div class="form-group mb-3">
    <label for="exampleInputPassword1">Full Name :</label>
    <form:input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter full name" path = "fullName"/>
  </div>
  <div class="form-group mb-3">
    <label for="exampleInputPassword1">Address</label>
    <form:input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter address" path = "address"/>
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-warning">update</button>
    </div>
</form:form>
</body>
</html>
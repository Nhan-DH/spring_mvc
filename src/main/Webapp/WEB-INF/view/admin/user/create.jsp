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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $('#avatarFile').change(function () {
                            const file = this.files[0];
                            if (file) {
                                const reader = new FileReader();
                                reader.onload = function (e) {
                                    $('#avatarPreview').attr('src', e.target.result);
                                    $('#avatarPreview').show();
                                }
                                reader.readAsDataURL(file);
                            }
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="ms-5">
                                <h1>User Management</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb>-item"><a href="/admin">Dashboard/</a></li>
                                    <li class="breadcrumb-item active">User</li>
                                </ol>
                            </div>
                            <form:form class=" mt-5" method="post" action="/admin/user/create" modelAttribute="newUser"
                                enctype="multipart/form-data">
                                <h1 class="text-center text-primary">User Registration</h1>
                                <div class="col-md-6 col-12 mx-auto">

                                    <div class="row mb-3">

                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <c:set var="errorEmail">
                                                    <form:errors path="email" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label>Email address</label>
                                                <form:input type="email"
                                                    class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                    placeholder="Enter email" path="email" />
                                                ${errorEmail}

                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <c:set var="errorPassword">
                                                    <form:errors path="password" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label>Password</label>
                                                <form:input type="password"
                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                    placeholder="Password" path="password" />
                                                ${errorPassword}
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="exampleInputPassword1">Phone Number</label>
                                                <form:input type="text" class="form-control" id="exampleInputPassword1"
                                                    placeholder="Enter phone number" path="phoneNumber" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="exampleInputPassword1">Full Name </label>
                                                <form:input type="text" class="form-control" id="exampleInputPassword1"
                                                    placeholder="Enter full name" path="fullName" />
                                            </div>
                                        </div>
                                    </div>



                                    <div class="form-group mb-3">
                                        <label for="exampleInputPassword1">Address</label>
                                        <form:input type="text" class="form-control" id="exampleInputPassword1"
                                            placeholder="Enter address" path="address" />
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="formFile" class="form-label">Role</label>
                                            <form:select path="role.name" class="form-select">
                                                <form:option value="ADMIN">ADMIN</form:option>
                                                <form:option value="USER">USER</form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class="mb-3">
                                                <label for="avatarFile" class="form-label">Avatar</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png,.jpg, .jpeg" name="avatarFile" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="display:none; max-height:200px;" alt="avatar preview"
                                                    id="avatarPreview">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form:form>

                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>



            </body>

            </html>
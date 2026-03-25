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
                        $('#productFile').change(function () {
                            const file = this.files[0];
                            if (file) {
                                const reader = new FileReader();
                                reader.onload = function (e) {
                                    $('#productPreview').attr('src', e.target.result);
                                    $('#productPreview').show();
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
                                    <li class="breadcrumb>-item"><a href="/admin/product">Product/</a></li>
                                    <li class="breadcrumb-item active">create</li>
                                </ol>
                            </div>
                            <form:form class=" mt-5" method="post" action="/admin/product/create"
                                modelAttribute="newProduct" enctype="multipart/form-data">
                                <h1 class="text-center text-primary">Product Registration</h1>
                                <div class="col-md-6 col-12 mx-auto">
                                    <c:set var="errorName">
                                        <form:errors path="name" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorPrice">
                                        <form:errors path="price" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorDetailDecs">
                                        <form:errors path="detailDecs" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorShortDesc">
                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorQuantity">
                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                    </c:set>
                                    <div class="row mb-3">

                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Name:</label>
                                                <form:input type="text" placeholder="Enter name" path="name"
                                                    class="form-control ${not empty errorName ? 'is-invalid' : ''}" />
                                                ${errorName}
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Price:</label>
                                                <form:input type="number" placeholder="Enter price" path="price"
                                                    class="form-control ${not empty errorPrice ? 'is-invalid' : ''}" />
                                                ${errorPrice}
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="exampleInputPassword1">Detail Description :</label>
                                        <form:textarea type="text" id="exampleInputPassword1" placeholder="Enter detail"
                                            path="detailDecs"
                                            class="form-control ${not empty errorDetailDecs ? 'is-invalid' : ''}" />
                                        ${errorDetailDecs}
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="exampleInputPassword1">Short Description :</label>
                                                <form:input type="text" id="exampleInputPassword1"
                                                    placeholder="Enter short description" path="shortDesc"
                                                    class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}" />
                                                ${errorShortDesc}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Quantity: </label>
                                                <form:input type="text" id="exampleInputPassword1"
                                                    placeholder="Enter quantity" path="quantity"
                                                    class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}" />
                                                ${errorQuantity}
                                            </div>
                                        </div>
                                    </div>




                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="formFile" class="form-label">Factory</label>
                                            <form:select path="factory" class="form-select">
                                                <form:option value="Macbook">Macbook</form:option>
                                                <form:option value="Lenovo">Lenovo</form:option>
                                                <form:option value="Dell">Dell</form:option>
                                                <form:option value="Asus">Asus</form:option>
                                                <form:option value="Acer">Acer</form:option>
                                                <form:option value="LG">LG</form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class="col-md-6">
                                                <label for="formFile" class="form-label">Target</label>
                                                <form:select path="target" class="form-select">
                                                    <form:option value="GAMING">GAMING</form:option>
                                                    <form:option value="OFFICE WORK">OFFICE WORK</form:option>
                                                    <form:option value="STUDENT">STUDENT</form:option>
                                                    <form:option value="DESIGN&Editing">DESIGN & EDITING</form:option>
                                                    <form:option value="DEVELOPMENT">DEVELOPMENT</form:option>

                                                </form:select>
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <div class="mb-3">
                                                <label for="productFile" class="form-label">Image</label>
                                                <input class="form-control" type="file" id="productFile"
                                                    accept=".png,.jpg, .jpeg" name="productFile" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="display:none; max-height:200px;" alt="image preview"
                                                    id="productPreview">
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
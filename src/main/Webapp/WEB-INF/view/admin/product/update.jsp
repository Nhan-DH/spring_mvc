<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Update Product" />
                <meta name="author" content="" />
                <title>NYAN SHOP</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="/css/style.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <style>
                    .update-header {
                        background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                        color: white;
                        padding: 2rem;
                        border-radius: 0.5rem;
                        margin-bottom: 2rem;
                    }

                    .update-header h1 {
                        margin: 0;
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                        font-size: 2rem;
                    }

                    .form-container {
                        background: white;
                        border-radius: 0.5rem;
                        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                        padding: 2rem;
                    }

                    .form-section {
                        margin-bottom: 2rem;
                    }

                    .form-section-title {
                        font-size: 1.125rem;
                        font-weight: 600;
                        color: #495057;
                        margin-bottom: 1.5rem;
                        padding-bottom: 0.75rem;
                        border-bottom: 2px solid #0099CC;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .form-section-title i {
                        color: #0099CC;
                    }

                    .form-group label {
                        font-weight: 600;
                        color: #495057;
                        margin-bottom: 0.5rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .form-control,
                    .form-select,
                    textarea.form-control {
                        border: 1px solid #dee2e6;
                        border-radius: 0.375rem;
                        padding: 0.625rem 0.875rem;
                        font-size: 0.95rem;
                        transition: border-color 0.3s ease, box-shadow 0.3s ease;
                    }

                    .form-control:focus,
                    .form-select:focus,
                    textarea.form-control:focus {
                        border-color: #0099CC;
                        box-shadow: 0 0 0 0.2rem rgba(0, 153, 204, 0.25);
                    }

                    .product-preview-container {
                        text-align: center;
                        padding: 1.5rem;
                        background-color: #f8f9fa;
                        border-radius: 0.375rem;
                        margin-top: 1rem;
                    }

                    .product-img {
                        max-width: 250px;
                        max-height: 250px;
                        border-radius: 0.375rem;
                        border: 3px solid #0099CC;
                        object-fit: cover;
                        display: none;
                    }

                    .product-img.show {
                        display: block;
                    }

                    .action-buttons {
                        display: flex;
                        gap: 1rem;
                        justify-content: center;
                        margin-top: 2.5rem;
                        padding-top: 2rem;
                        border-top: 1px solid #e9ecef;
                    }

                    .btn-submit {
                        background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                        border: none;
                        color: white;
                        padding: 0.75rem 2.5rem;
                        font-weight: 600;
                        border-radius: 0.375rem;
                        transition: transform 0.2s ease, box-shadow 0.2s ease;
                    }

                    .btn-submit:hover {
                        color: white;
                        transform: translateY(-2px);
                        box-shadow: 0 0.5rem 1rem rgba(0, 153, 204, 0.4);
                    }

                    .btn-cancel {
                        background-color: #6c757d;
                        border: none;
                        color: white;
                        padding: 0.75rem 2.5rem;
                        font-weight: 600;
                        border-radius: 0.375rem;
                        transition: background-color 0.2s ease;
                        text-decoration: none;
                    }

                    .btn-cancel:hover {
                        background-color: #5a6268;
                        color: white;
                        text-decoration: none;
                    }

                    .invalid-feedback {
                        display: block;
                        color: #dc3545;
                        font-size: 0.875rem;
                        margin-top: 0.25rem;
                    }
                </style>
                <script>
                    $(document).ready(function () {
                        const file = $('#productFile');
                        const orgImage = "${newProduct.image}";
                        if (orgImage) {
                            const url = "/images/image/" + orgImage;
                            $('#productPreview').attr("src", url).addClass("show");
                        }
                        file.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $('#productPreview').attr("src", imgURL).addClass("show");
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
                            <div class="container-fluid px-4 py-4">
                                <nav aria-label="breadcrumb" class="mb-4">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/admin"><i class="fas fa-home"></i>
                                                Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/product"><i class="fas fa-box"></i>
                                                Products</a></li>
                                        <li class="breadcrumb-item active"><i class="fas fa-edit"></i> Update Product
                                        </li>
                                    </ol>
                                </nav>
                                <div class="update-header">
                                    <h1><i class="fas fa-cube"></i> Update Product Information</h1>
                                </div>
                                <div class="row">
                                    <div class="col-lg-10 mx-auto">
                                        <div class="form-container">
                                            <form:form method="post" action="/admin/product/update/${id}"
                                                modelAttribute="newProduct" enctype="multipart/form-data">
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
                                                <div class="form-section">
                                                    <div class="form-section-title"><i class="fas fa-cube"></i> Basic
                                                        Information</div>
                                                    <div class="row">
                                                        <div class="col-lg-6 mb-3">
                                                            <div class="form-group"><label for="name"><i
                                                                        class="fas fa-heading"></i> Product Name
                                                                    *</label>
                                                                <form:input type="text"
                                                                    class="form-control ${not empty errorName ? ''is-invalid'' : ''''}"
                                                                    id="name" placeholder="Enter product name"
                                                                    path="name" required="true" />${errorName}
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 mb-3">
                                                            <div class="form-group"><label for="price"><i
                                                                        class="fas fa-dollar-sign"></i> Price *</label>
                                                                <form:input type="number"
                                                                    class="form-control ${not empty errorPrice ? ''is-invalid'' : ''''}"
                                                                    id="price" placeholder="Enter price" path="price"
                                                                    required="true" step="0.01" />${errorPrice}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6 mb-3">
                                                            <div class="form-group"><label for="shortDesc"><i
                                                                        class="fas fa-quote-left"></i> Short Description
                                                                    *</label>
                                                                <form:input type="text"
                                                                    class="form-control ${not empty errorShortDesc ? ''is-invalid'' : ''''}"
                                                                    id="shortDesc" placeholder="Brief description"
                                                                    path="shortDesc" required="true" />${errorShortDesc}
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 mb-3">
                                                            <div class="form-group"><label for="quantity"><i
                                                                        class="fas fa-cubes"></i> Quantity *</label>
                                                                <form:input type="number"
                                                                    class="form-control ${not empty errorQuantity ? ''is-invalid'' : ''''}"
                                                                    id="quantity" placeholder="Enter quantity"
                                                                    path="quantity" required="true" />${errorQuantity}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 mb-3">
                                                            <div class="form-group"><label for="detailDecs"><i
                                                                        class="fas fa-align-left"></i> Detailed
                                                                    Description *</label>
                                                                <form:textarea
                                                                    class="form-control ${not empty errorDetailDecs ? ''is-invalid'' : ''''}"
                                                                    id="detailDecs"
                                                                    placeholder="Enter detailed description"
                                                                    path="detailDecs" required="true" rows="4" />
                                                                ${errorDetailDecs}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-section">
                                                    <div class="form-section-title"><i class="fas fa-sitemap"></i>
                                                        Classification</div>
                                                    <div class="row">
                                                        <div class="col-lg-6 mb-3">
                                                            <div class="form-group"><label for="factory"><i
                                                                        class="fas fa-building"></i> Factory/Brand
                                                                    *</label>
                                                                <form:select path="factory" class="form-select"
                                                                    id="factory" required="true">
                                                                    <form:option value="">-- Select Factory --
                                                                    </form:option>
                                                                    <form:option value="Macbook">Macbook</form:option>
                                                                    <form:option value="Lenovo">Lenovo</form:option>
                                                                    <form:option value="Dell">Dell</form:option>
                                                                    <form:option value="Asus">Asus</form:option>
                                                                </form:select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 mb-3">
                                                            <div class="form-group"><label for="target"><i
                                                                        class="fas fa-bullseye"></i> Target Audience
                                                                    *</label>
                                                                <form:select path="target" class="form-select"
                                                                    id="target" required="true">
                                                                    <form:option value="">-- Select Target --
                                                                    </form:option>
                                                                    <form:option value="GAMING">Gaming</form:option>
                                                                    <form:option value="BUSINESS">Business</form:option>
                                                                    <form:option value="STUDENT">Student</form:option>
                                                                </form:select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-section">
                                                    <div class="form-section-title"><i class="fas fa-image"></i> Product
                                                        Image</div>
                                                    <div class="row">
                                                        <div class="col-lg-12 mb-3">
                                                            <div class="form-group"><label for="productFile"><i
                                                                        class="fas fa-upload"></i> Upload Image</label>
                                                                <input class="form-control" type="file" id="productFile"
                                                                    accept=".png,.jpg,.jpeg" name="productFile" />
                                                                <small class="text-muted d-block mt-2">Supported: PNG,
                                                                    JPG, JPEG</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="product-preview-container"><img id="productPreview"
                                                            alt="Product preview" class="product-img" /></div>
                                                </div>
                                                <div class="action-buttons">
                                                    <button type="submit" class="btn btn-submit"><i
                                                            class="fas fa-save"></i> Update Product</button>
                                                    <a href="/admin/product" class="btn btn-cancel"><i
                                                            class="fas fa-times"></i> Cancel</a>
                                                </div>
                                            </form:form>
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



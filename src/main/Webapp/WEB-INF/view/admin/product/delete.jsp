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
    <meta name="description" content="Delete Product" />
    <meta name="author" content="" />
    <title>NYAN SHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        .delete-header { background: linear-gradient(135deg, #dc3545 0%, #bd2130 100%); color: white; padding: 2rem; border-radius: 0.5rem; margin-bottom: 2rem; }
        .delete-header h1 { margin: 0; display: flex; align-items: center; gap: 0.75rem; font-size: 2rem; }
        .delete-card { background: white; border-radius: 0.5rem; box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); border-left: 4px solid #dc3545; }
        .delete-card-body { padding: 2rem; }
        .product-preview { text-align: center; margin-bottom: 2rem; }
        .product-preview img { max-width: 200px; max-height: 200px; border-radius: 0.5rem; border: 2px solid #dee2e6; object-fit: cover; }
        .warning-section { background-color: #fff3cd; border-left: 4px solid #ffc107; padding: 1.5rem; border-radius: 0.375rem; margin-bottom: 2rem; }
        .warning-section h5 { color: #856404; margin-bottom: 0.75rem; display: flex; align-items: center; gap: 0.5rem; }
        .warning-section p { color: #856404; margin: 0; font-weight: 500; }
        .info-section { background-color: #e7f3ff; border-left: 4px solid #0099CC; padding: 1.5rem; border-radius: 0.375rem; margin-bottom: 2rem; }
        .info-section h5 { color: #004085; margin-bottom: 1rem; display: flex; align-items: center; gap: 0.5rem; }
        .info-item { display: flex; justify-content: space-between; padding: 0.75rem 0; border-bottom: 1px solid #b3d9ff; }
        .info-item:last-child { border-bottom: none; }
        .info-label { font-weight: 600; color: #004085; }
        .info-value { color: #004085; }
        .action-buttons { display: flex; gap: 1rem; justify-content: center; margin-top: 2.5rem; padding-top: 2rem; border-top: 2px solid #dee2e6; }
        .btn-delete { background-color: #dc3545; border: none; color: white; padding: 0.75rem 2.5rem; font-weight: 600; border-radius: 0.375rem; transition: transform 0.2s ease, box-shadow 0.2s ease; }
        .btn-delete:hover { color: white; background-color: #c82333; transform: translateY(-2px); box-shadow: 0 0.5rem 1rem rgba(220, 53, 69, 0.4); }
        .btn-cancel { background-color: #6c757d; border: none; color: white; padding: 0.75rem 2.5rem; font-weight: 600; border-radius: 0.375rem; transition: background-color 0.2s ease; text-decoration: none; }
        .btn-cancel:hover { background-color: #5a6268; color: white; text-decoration: none; }
    </style>
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
                            <li class="breadcrumb-item"><a href="/admin"><i class="fas fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="/admin/product"><i class="fas fa-box"></i> Products</a></li>
                            <li class="breadcrumb-item active"><i class="fas fa-trash"></i> Delete Product</li>
                        </ol>
                    </nav>

                    <div class="delete-header">
                        <h1><i class="fas fa-exclamation-triangle"></i> Delete Product</h1>
                    </div>

                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <div class="delete-card">
                                <div class="delete-card-body">
                                    <div class="product-preview">
                                        <img src="/images/image/${product.image}" alt="${product.name}" />
                                    </div>

                                    <div class="warning-section">
                                        <h5><i class="fas fa-exclamation-circle"></i> Warning: This Action Cannot Be Undone</h5>
                                        <p>Once you delete this product, all associated data will be permanently removed from the system.</p>
                                    </div>

                                    <div class="info-section">
                                        <h5><i class="fas fa-box"></i> Product Information</h5>
                                        <div class="info-item">
                                            <span class="info-label">Product ID:</span>
                                            <span class="info-value">${id}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Product Name:</span>
                                            <span class="info-value">${product.name}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Price:</span>
                                            <span class="info-value">$${product.price}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Quantity:</span>
                                            <span class="info-value">${product.quantity}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Factory:</span>
                                            <span class="info-value">${product.factory}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Target:</span>
                                            <span class="info-value">${product.target}</span>
                                        </div>
                                    </div>

                                    <div class="alert alert-danger" role="alert">
                                        <i class="fas fa-exclamation-circle"></i> <strong>Are you absolutely sure?</strong> This will permanently delete the product and cannot be reversed.
                                    </div>

                                    <form:form method="post" action="/admin/product/delete/${id}">
                                        <div class="action-buttons">
                                            <button type="submit" class="btn btn-delete">
                                                <i class="fas fa-check-circle"></i> Confirm Delete
                                            </button>
                                            <a href="/admin/product" class="btn btn-cancel">
                                                <i class="fas fa-arrow-left"></i> Cancel
                                            </a>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
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




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
                <meta name="description" content="Product Detail" />
                <meta name="author" content="" />
                <title>NYAN SHOP</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="/css/style.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    .detail-header {
                        background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                        color: white;
                        padding: 2rem;
                        border-radius: 0.5rem;
                        margin-bottom: 2rem;
                    }

                    .detail-header h1 {
                        margin: 0;
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                        font-size: 2rem;
                    }

                    .detail-header p {
                        margin: 0.5rem 0 0 0;
                        opacity: 0.9;
                    }

                    .detail-card {
                        border: none;
                        border-radius: 0.5rem;
                        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                        transition: box-shadow 0.3s ease;
                    }

                    .detail-card:hover {
                        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
                    }

                    .detail-card-header {
                        background-color: #f8f9fa;
                        border-bottom: 2px solid #dee2e6;
                        padding: 1.25rem;
                        font-weight: 600;
                        color: #495057;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .product-image-container {
                        text-align: center;
                        padding: 1.5rem;
                    }

                    .product-img {
                        max-width: 100%;
                        height: 300px;
                        object-fit: cover;
                        border-radius: 0.5rem;
                        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
                    }

                    .info-section {
                        padding: 1.5rem;
                    }

                    .info-item {
                        margin-bottom: 1.5rem;
                        padding-bottom: 1.5rem;
                        border-bottom: 1px solid #e9ecef;
                    }

                    .info-item:last-child {
                        margin-bottom: 0;
                        padding-bottom: 0;
                        border-bottom: none;
                    }

                    .info-label {
                        font-size: 0.875rem;
                        font-weight: 600;
                        color: #6c757d;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                        margin-bottom: 0.5rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .info-label i {
                        color: #198754;
                        width: 1rem;
                    }

                    .info-value {
                        font-size: 1.125rem;
                        color: #212529;
                        font-weight: 500;
                    }

                    .price-badge {
                        font-size: 1.75rem;
                        font-weight: bold;
                        color: #198754;
                    }

                    .stats-row {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 1rem;
                    }

                    .stat-item {
                        padding: 1rem;
                        background-color: #f8f9fa;
                        border-radius: 0.375rem;
                        text-align: center;
                    }

                    .stat-item-value {
                        font-size: 1.5rem;
                        font-weight: bold;
                        color: #198754;
                    }

                    .stat-item-label {
                        font-size: 0.875rem;
                        color: #6c757d;
                        margin-top: 0.5rem;
                    }

                    .action-footer {
                        padding: 1.5rem;
                        border-top: 1px solid #e9ecef;
                        display: flex;
                        gap: 0.75rem;
                        flex-wrap: wrap;
                    }

                    .btn-group-custom .btn {
                        padding: 0.5rem 1.5rem;
                        font-weight: 500;
                        border-radius: 0.375rem;
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4 py-4">
                                <!-- Breadcrumb -->
                                <nav aria-label="breadcrumb" class="mb-4">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/admin"><i class="fas fa-home"></i>
                                                Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/product"><i class="fas fa-box"></i>
                                                Products</a></li>
                                        <li class="breadcrumb-item active" aria-current="page"><i
                                                class="fas fa-info-circle"></i> Detail</li>
                                    </ol>
                                </nav>

                                <!-- Header -->
                                <div class="detail-header">
                                    <h1><i class="fas fa-box-open"></i> Product Detail</h1>
                                    <p>ID: <strong>${id}</strong></p>
                                </div>

                                <!-- Main Content -->
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="col-lg-4">
                                        <div class="detail-card mb-4">
                                            <div class="product-image-container">
                                                <img src="/images/image/${product.image}" alt="${product.name}"
                                                    class="product-img" />
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Product Details -->
                                    <div class="col-lg-8">
                                        <div class="detail-card mb-4">
                                            <div class="detail-card-header">
                                                <i class="fas fa-tag"></i> Product Information
                                            </div>
                                            <div class="info-section">
                                                <div class="info-item">
                                                    <div class="info-label"><i class="fas fa-heading"></i> Product Name
                                                    </div>
                                                    <div class="info-value">${product.name}</div>
                                                </div>
                                                <div class="info-item">
                                                    <div class="info-label"><i class="fas fa-dollar-sign"></i> Price
                                                    </div>
                                                    <div class="price-badge">$${product.price}</div>
                                                </div>
                                                <div class="info-item">
                                                    <div class="info-label"><i class="fas fa-building"></i> Factory
                                                    </div>
                                                    <div class="info-value">${product.factory}</div>
                                                </div>
                                                <div class="info-item">
                                                    <div class="info-label"><i class="fas fa-bullseye"></i> Target</div>
                                                    <div class="info-value">${product.target}</div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Description Section -->
                                        <div class="detail-card mb-4">
                                            <div class="detail-card-header">
                                                <i class="fas fa-align-left"></i> Description
                                            </div>
                                            <div class="info-section">
                                                <div class="info-item">
                                                    <div class="info-label"><i class="fas fa-stream"></i> Short
                                                        Description</div>
                                                    <div class="info-value">${product.shortDesc}</div>
                                                </div>
                                                <div class="info-item">
                                                    <div class="info-label"><i class="fas fa-file-alt"></i> Detailed
                                                        Description</div>
                                                    <div class="info-value">${product.detailDecs}</div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Inventory Section -->
                                        <div class="detail-card">
                                            <div class="detail-card-header">
                                                <i class="fas fa-warehouse"></i> Inventory
                                            </div>
                                            <div class="info-section">
                                                <div class="stats-row">
                                                    <div class="stat-item">
                                                        <div class="stat-item-label">Total Quantity</div>
                                                        <div class="stat-item-value">${product.quantity}</div>
                                                    </div>
                                                    <div class="stat-item">
                                                        <div class="stat-item-label">Sold</div>
                                                        <div class="stat-item-value">${product.sold}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="action-footer">
                                                <a href="/admin/product" class="btn btn-outline-success"
                                                    title="Go back to products list">
                                                    <i class="fas fa-arrow-left"></i> Back to List
                                                </a>

                                            </div>
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



<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Dashboard - Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="/css/style.css">
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <style>
                .dashboard-header {
                    background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                    color: white;
                    padding: 2rem;
                    border-radius: 0.5rem;
                    margin-bottom: 2rem;
                }

                .dashboard-header h1 {
                    margin: 0;
                    display: flex;
                    align-items: center;
                    gap: 1rem;
                    font-size: 2rem;
                }

                .dashboard-header p {
                    margin: 0.5rem 0 0 0;
                    opacity: 0.9;
                }

                .stat-card {
                    border: none;
                    border-radius: 0.5rem;
                    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                    transition: all 0.3s ease;
                    position: relative;
                    overflow: hidden;
                }

                .stat-card:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
                }

                .stat-card::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    height: 4px;
                    background: inherit;
                }

                .stat-card-body {
                    padding: 1.5rem;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .stat-card-icon {
                    width: 60px;
                    height: 60px;
                    border-radius: 0.5rem;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 1.5rem;
                    color: white;
                }

                .stat-card-content {
                    flex: 1;
                }

                .stat-card-label {
                    font-size: 0.875rem;
                    font-weight: 600;
                    color: #6c757d;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    margin-bottom: 0.5rem;
                }

                .stat-card-value {
                    font-size: 2rem;
                    font-weight: bold;
                    color: #212529;
                }

                .stat-card-footer {
                    font-size: 0.875rem;
                    color: #6c757d;
                    margin-top: 0.5rem;
                }

                .chart-card {
                    border: none;
                    border-radius: 0.5rem;
                    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                }

                .chart-header {
                    background-color: #f8f9fa;
                    padding: 1.25rem;
                    border-bottom: 1px solid #dee2e6;
                    font-weight: 600;
                    color: #495057;
                }

                .table-card {
                    border: none;
                    border-radius: 0.5rem;
                    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                }

                .table-card-header {
                    background: linear-gradient(135deg, #0099CC 0%, #0073A8 100%);
                    padding: 1.25rem;
                    color: white;
                    font-weight: 600;
                    border-radius: 0.5rem 0.5rem 0 0;
                }
            </style>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <div class="dashboard-header">
                                <h1><i class="fas fa-tachometer-alt"></i> Dashboard</h1>
                                <p>Welcome back! Here's an overview of your system.</p>
                            </div>
                            <div class="row">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card stat-card bg-white">
                                        <div class="stat-card-body">
                                            <div>
                                                <div class="stat-card-label">Total Users</div>
                                                <div class="stat-card-value text-primary">${countUser}</div>
                                                <div class="stat-card-footer">
                                                    <i class="fas fa-eye text-primary"></i>
                                                    <a href="/admin/user" class="ms-2 text-decoration-none">
                                                        View Detail
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="stat-card-icon" style="background: #D0E8F2;">
                                                <i class="fas fa-users text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card stat-card bg-white">
                                        <div class="stat-card-body">
                                            <div>
                                                <div class="stat-card-label">Total Products</div>
                                                <div class="stat-card-value text-success">${countProduct}</div>
                                                <div class="stat-card-footer">
                                                    <i class="fas fa-eye text-primary"></i>
                                                    <a href="/admin/product" class="ms-2 text-decoration-none">
                                                        View Detail
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="stat-card-icon" style="background: #D0E8F2;">
                                                <i class="fas fa-box text-success"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card stat-card bg-white">
                                        <div class="stat-card-body">
                                            <div>
                                                <div class="stat-card-label">Total Orders</div>
                                                <div class="stat-card-value text-info">${countOrder}</div>
                                                <div class="stat-card-footer">
                                                    <i class="fas fa-eye text-primary"></i>
                                                    <a href="/admin/order" class="ms-2 text-decoration-none">
                                                        View Detail
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="stat-card-icon" style="background: #D0E8F2;">
                                                <i class="fas fa-shopping-bag text-info"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card stat-card bg-white">
                                        <div class="stat-card-body">
                                            <div>
                                                <div class="stat-card-label">Revenue</div>
                                                <div class="stat-card-value text-warning">$25.5K</div>
                                                <div class="stat-card-footer"><i
                                                        class="fas fa-arrow-up text-success"></i> +22% from last month
                                                </div>
                                            </div>
                                            <div class="stat-card-icon" style="background: #D0E8F2;">
                                                <i class="fas fa-dollar-sign text-warning"></i>
                                            </div>
                                        </div>
                                    </div>
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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="js/chart-area-demo.js"></script>
            <script src="js/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
        </body>

        </html>
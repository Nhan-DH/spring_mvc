<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link rel="icon" type="image/svg+xml"
                    href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>NYAN SHOP</title>
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
                        margin-top: 1rem;

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
                                                    <div class="stat-card-value text-warning">
                                                        $
                                                        <fmt:formatNumber value="${currentMonthRevenue}" type="number"
                                                            maxFractionDigits="0" groupingUsed="true" />
                                                    </div>
                                                    <div class="stat-card-footer">
                                                        <i
                                                            class="fas ${isRevenueUp ? 'fa-arrow-up text-success' : 'fa-arrow-down text-danger'}"></i>
                                                        ${isRevenueUp ? '+' : '-'}
                                                        <fmt:formatNumber value="${revenueChangePercent}" type="number"
                                                            maxFractionDigits="1" />%
                                                        vs last month (${currentMonthName})
                                                    </div>
                                                </div>
                                                <div class="stat-card-icon" style="background: #D0E8F2;">
                                                    <i class="fas fa-dollar-sign text-warning"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <div class="col-12">
                                        <div class="card chart-card">
                                            <div class="chart-header">
                                                <i class="fas fa-chart-column me-2"></i> Monthly Revenue
                                                (${revenueYear})
                                            </div>
                                            <div class="card-body">
                                                <canvas id="monthlyRevenueChart" height="90"></canvas>
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
                <script>
                    (function () {
                        var monthLabels = [
                            <c:forEach var="label" items="${monthLabels}" varStatus="status">
                                "${label}"<c:if test="${!status.last}">,</c:if>
                            </c:forEach>
                        ];

                        var monthRevenue = [
                            <c:forEach var="value" items="${monthRevenue}" varStatus="status">
                                ${value}<c:if test="${!status.last}">,</c:if>
                            </c:forEach>
                        ];

                        var chartElement = document.getElementById("monthlyRevenueChart");
                        if (!chartElement) {
                            return;
                        }

                        new Chart(chartElement, {
                            type: "bar",
                            data: {
                                labels: monthLabels,
                                datasets: [{
                                    label: "Monthly Revenue",
                                    data: monthRevenue,
                                    backgroundColor: "rgba(0, 153, 204, 0.35)",
                                    borderColor: "rgba(0, 153, 204, 1)",
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    xAxes: [{
                                        gridLines: { display: false },
                                        ticks: { maxTicksLimit: 12 }
                                    }],
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true,
                                            max: 50000,
                                            stepSize: 5000,
                                            callback: function (value) {
                                                return "$" + value.toLocaleString("en-US");
                                            }
                                        }
                                    }]
                                },
                                legend: {
                                    display: true
                                }
                            }
                        });
                    })();
                </script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>
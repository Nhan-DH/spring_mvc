<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <link rel="icon" type="image/svg+xml"
                href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
            <meta charset="utf-8">
            <title>NYAN SHOP</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">

            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                rel="stylesheet">

            <!-- Icon Font Stylesheet -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <!-- Libraries Stylesheet -->
            <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
            <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


            <!-- Customized Bootstrap Stylesheet -->
            <link href="/client/css/bootstrap.min.css" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="/client/css/style.css" rel="stylesheet">
        </head>

        <body>

            <!-- Spinner Start -->
            <div id="spinner"
                class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                <div class="spinner-grow text-primary" role="status"></div>
            </div>
            <!-- Spinner End -->


            <!-- Navbar start -->
            <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
            <!-- Navbar End -->

            <style>
                .account-container {
                    min-height: calc(100vh - 200px);
                    padding: 40px 0;
                }

                .profile-card {
                    background: white;
                    border-radius: 16px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
                    overflow: hidden;
                    transition: all 0.3s ease;
                }

                .profile-card:hover {
                    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
                }

                .profile-header {
                    background: linear-gradient(135deg, rgba(0, 102, 255, 0.1), rgba(0, 82, 204, 0.05));
                    padding: 60px 30px 40px 30px;
                    text-align: center;
                    border-bottom: 2px solid rgba(0, 102, 255, 0.1);
                }

                .profile-avatar {
                    width: 120px;
                    height: 120px;
                    border-radius: 50%;
                    border: 4px solid white;
                    margin: 0 auto 20px;
                    box-shadow: 0 8px 24px rgba(0, 102, 255, 0.25);
                    overflow: hidden;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .profile-avatar img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .profile-name {
                    font-size: 28px;
                    font-weight: 700;
                    color: #1a202c;
                    margin-bottom: 8px;
                }

                .profile-email {
                    color: #718096;
                    font-size: 15px;
                    margin-bottom: 0;
                }

                .profile-content {
                    padding: 30px;
                }

                .info-section {
                    margin-bottom: 30px;
                }

                .info-section:last-child {
                    margin-bottom: 0;
                }

                .section-title {
                    font-size: 18px;
                    font-weight: 600;
                    color: #1a202c;
                    margin-bottom: 20px;
                    padding-bottom: 12px;
                    border-bottom: 2px solid rgba(0, 102, 255, 0.1);
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .section-title i {
                    color: #0066ff;
                    font-size: 20px;
                }

                .info-row {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 20px;
                    margin-bottom: 16px;
                }

                .info-row.full {
                    grid-template-columns: 1fr;
                }

                .info-item {
                    background: linear-gradient(135deg, rgba(0, 102, 255, 0.05), rgba(0, 82, 204, 0.02));
                    padding: 16px;
                    border-radius: 10px;
                    border-left: 3px solid #0066ff;
                }

                .info-label {
                    font-size: 12px;
                    font-weight: 600;
                    color: #718096;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    margin-bottom: 6px;
                }

                .info-value {
                    font-size: 15px;
                    font-weight: 500;
                    color: #1a202c;
                    word-break: break-all;
                }

                .action-buttons {
                    display: flex;
                    gap: 12px;
                    margin-top: 30px;
                    padding-top: 20px;
                    border-top: 1px solid rgba(0, 102, 255, 0.1);
                }

                .btn-edit,
                .btn-change-password {
                    flex: 1;
                    padding: 12px 20px;
                    border-radius: 8px;
                    font-weight: 600;
                    font-size: 14px;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    gap: 8px;
                    border: none;
                }

                .btn-edit {
                    background: linear-gradient(135deg, #0066ff, #0052cc);
                    color: white;
                }

                .btn-edit:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 6px 20px rgba(0, 102, 255, 0.4);
                }

                .btn-change-password {
                    background: white;
                    color: #0066ff;
                    border: 2px solid #0066ff;
                }

                .btn-change-password:hover {
                    background: rgba(0, 102, 255, 0.1);
                    transform: translateY(-2px);
                }

                .status-badge {
                    display: inline-block;
                    padding: 4px 12px;
                    border-radius: 20px;
                    font-size: 12px;
                    font-weight: 600;
                    background: linear-gradient(135deg, rgba(34, 197, 94, 0.1), rgba(22, 163, 74, 0.05));
                    color: #16a34a;
                }

                @media (max-width: 768px) {
                    .info-row {
                        grid-template-columns: 1fr;
                    }

                    .profile-name {
                        font-size: 24px;
                    }

                    .action-buttons {
                        flex-direction: column;
                    }
                }
            </style>

            <!-- Account Section Start -->
            <div class="account-container">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="profile-card">
                                <!-- Profile Header -->
                                <div class="profile-header">
                                    <div class="profile-avatar">
                                        <img src="/images/avatar/${user.avatar}" alt="User Avatar">
                                    </div>
                                    <h1 class="profile-name">${user.fullName}</h1>
                                    <p class="profile-email">${user.email}</p>
                                    <span class="status-badge">
                                        <i class="fas fa-check-circle"></i> Active Account
                                    </span>
                                </div>

                                <!-- Profile Content -->
                                <div class="profile-content">
                                    <!-- Personal Information -->
                                    <div class="info-section">
                                        <div class="section-title">
                                            <i class="fas fa-user"></i>
                                            Personal Information
                                        </div>
                                        <div class="info-row">
                                            <div class="info-item">
                                                <div class="info-label">Full Name</div>
                                                <div class="info-value">${user.fullName}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Email Address</div>
                                                <div class="info-value">${user.email}</div>
                                            </div>
                                        </div>
                                        <div class="info-row full">
                                            <div class="info-item">
                                                <div class="info-label">Phone Number</div>
                                                <div class="info-value">${user.phoneNumber ne null ?
                                                    user.phoneNumber : 'Not provided'}</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Account Type -->
                                    <div class="info-section">
                                        <div class="info-row full">
                                            <div class="info-item">
                                                <div class="info-label">Account Type</div>
                                                <div class="info-value">Customer</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Action Buttons -->
                                    <div class="action-buttons">
                                        <a href="/client/account/edit-info" class="btn-edit">
                                            <i class="fas fa-edit"></i>
                                            Thay đổi thông tin
                                        </a>
                                        <a href="/client/account/change-password" class="btn-change-password">
                                            <i class="fas fa-lock"></i>
                                            Change Password
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Additional Info Cards -->
                            <div class="row mt-5">
                                <div class="col-md-12 mb-4">
                                    <div class="profile-card text-center p-4">
                                        <i class="fas fa-shopping-bag"
                                            style="font-size: 32px; color: #0066ff; margin-bottom: 12px;"></i>
                                        <h5 style="color: #1a202c; font-weight: 600; margin-bottom: 8px;">My Orders</h5>
                                        <p style="color: #718096; margin-bottom: 12px; font-size: 14px;">View your
                                            purchase history</p>
                                        <a href="/client/my-orders" class="btn-edit" style="display: inline-flex;">
                                            <i class="fas fa-arrow-right"></i> View Orders
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Account Section End -->








            <!-- Footer Start -->
            <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                    class="fa fa-arrow-up"></i></a>


            <!-- JavaScript Libraries -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="/client/lib/easing/easing.min.js"></script>
            <script src="/client/lib/waypoints/waypoints.min.js"></script>
            <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
            <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

            <!-- Template Javascript -->
            <script src="/client/js/main.js"></script>

            <script>
                // Hide spinner when page loads
                document.addEventListener('DOMContentLoaded', function () {
                    const spinner = document.getElementById('spinner');
                    if (spinner) {
                        spinner.classList.remove('show');
                    }
                });
            </script>
        </body>

        </html>
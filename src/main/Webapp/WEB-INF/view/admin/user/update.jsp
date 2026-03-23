<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Update User" />
    <meta name="author" content="" />
    <title>Update User - Admin</title>
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
        .form-control, .form-select {
            border: 1px solid #dee2e6;
            border-radius: 0.375rem;
            padding: 0.625rem 0.875rem;
            font-size: 0.95rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            border-color: #0099CC;
            box-shadow: 0 0 0 0.2rem rgba(0, 153, 204, 0.25);
        }
        .avatar-preview-container {
            text-align: center;
            padding: 1.5rem;
            background-color: #f8f9fa;
            border-radius: 0.375rem;
            margin-top: 1rem;
        }
        .avatar-img {
            max-width: 200px;
            max-height: 200px;
            border-radius: 0.375rem;
            border: 3px solid #0099CC;
            object-fit: cover;
            display: none;
        }
        .avatar-img.show {
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
    </style>
    <script>
        $(document).ready(function () {
            const file = $('#avatarFile');
            const orgImage = "${newUser.avatar}";
            if (orgImage) {
                const url = "/images/avatar/" + orgImage;
                $("#avatarPreview").attr("src", url);
                $("#avatarPreview").addClass("show");
            }
            file.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").addClass("show");
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
                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb" class="mb-4">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/admin"><i class="fas fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="/admin/user"><i class="fas fa-users"></i> Users</a></li>
                            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-edit"></i> Update User</li>
                        </ol>
                    </nav>

                    <!-- Header -->
                    <div class="update-header">
                        <h1><i class="fas fa-user-edit"></i> Update User Information</h1>
                    </div>

                    <!-- Form Container -->
                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <div class="form-container">
                                <form:form method="post" action="/admin/user/update/${id}" modelAttribute="newUser" enctype="multipart/form-data">
                                    
                                    <!-- Contact Information Section -->
                                    <div class="form-section">
                                        <div class="form-section-title">
                                            <i class="fas fa-address-card"></i> Contact Information
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 mb-3">
                                                <div class="form-group">
                                                    <label for="email"><i class="fas fa-envelope"></i> Email Address *</label>
                                                    <form:input type="email" class="form-control" id="email" placeholder="Enter email address" path="email" required="true" />
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <div class="form-group">
                                                    <label for="phoneNumber"><i class="fas fa-phone"></i> Phone Number *</label>
                                                    <form:input type="text" class="form-control" id="phoneNumber" placeholder="Enter phone number" path="phoneNumber" required="true" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 mb-3">
                                                <div class="form-group">
                                                    <label for="fullName"><i class="fas fa-user"></i> Full Name *</label>
                                                    <form:input type="text" class="form-control" id="fullName" placeholder="Enter full name" path="fullName" required="true" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 mb-3">
                                                <div class="form-group">
                                                    <label for="address"><i class="fas fa-map-marker-alt"></i> Address *</label>
                                                    <form:input type="text" class="form-control" id="address" placeholder="Enter address" path="address" required="true" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Account & Profile Section -->
                                    <div class="form-section">
                                        <div class="form-section-title">
                                            <i class="fas fa-cog"></i> Account & Profile
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 mb-3">
                                                <div class="form-group">
                                                    <label for="role"><i class="fas fa-shield-alt"></i> Role *</label>
                                                    <form:select path="role.name" class="form-select" id="role" required="true">
                                                        <form:option value="USER">User</form:option>
                                                        <form:option value="ADMIN">Admin</form:option>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <div class="form-group">
                                                    <label for="avatarFile"><i class="fas fa-image"></i> Avatar</label>
                                                    <input class="form-control" type="file" id="avatarFile" accept=".png,.jpg,.jpeg" name="avatarFile" />
                                                    <small class="text-muted d-block mt-2">Supported formats: PNG, JPG, JPEG</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="avatar-preview-container">
                                            <img id="avatarPreview" alt="Avatar preview" class="avatar-img" />
                                        </div>
                                    </div>

                                    <!-- Action Buttons -->
                                    <div class="action-buttons">
                                        <button type="submit" class="btn btn-submit">
                                            <i class="fas fa-save"></i> Update User
                                        </button>
                                        <a href="/admin/user" class="btn btn-cancel">
                                            <i class="fas fa-times"></i> Cancel
                                        </a>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>
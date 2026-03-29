<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <title>Edit Profile - NYAN SHOP</title>

                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />

                <div class="container py-5 mt-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-primary text-white py-3">
                                    <h4 class="mb-0"><i class="fas fa-user-edit me-2"></i>Chinh sua thong tin ca nhan
                                    </h4>
                                </div>
                                <div class="card-body p-4">
                                    <form:form method="post" action="/client/account/update-info"
                                        modelAttribute="newUser">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Email</label>
                                            <form:input path="email" class="form-control" disabled="true" />
                                            <small class="text-muted">Email khong the thay doi</small>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Ho va ten</label>
                                            <form:input path="fullName" class="form-control" required="true" />
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold">So dien thoai</label>
                                            <form:input path="phoneNumber" class="form-control" />
                                        </div>

                                        <div class="mb-4">
                                            <label class="form-label fw-bold">Dia chi</label>
                                            <form:input path="address" class="form-control" />
                                        </div>

                                        <div class="d-flex gap-2">
                                            <button type="submit" class="btn btn-primary px-4">
                                                <i class="fas fa-save me-1"></i>Luu thay doi
                                            </button>
                                            <a href="/client/account" class="btn btn-outline-secondary px-4">Huy</a>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>
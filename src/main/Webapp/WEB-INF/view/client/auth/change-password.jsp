<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Change Password - NYAN SHOP</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="/client/css/style.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="/WEB-INF/view/client/layout/header.jsp" />

	<div class="container py-5 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="card border-0 shadow-sm">
					<div class="card-header bg-warning py-3">
						<h4 class="mb-0"><i class="fas fa-lock me-2"></i>Thay doi mat khau</h4>
					</div>
					<div class="card-body p-4">
						<c:if test="${param.error == 'invalidPassword'}">
							<div class="alert alert-danger">Mat khau hien tai khong dung.</div>
						</c:if>
						<c:if test="${param.error == 'passwordMismatch'}">
							<div class="alert alert-danger">Xac nhan mat khau khong khop.</div>
						</c:if>
						<c:if test="${param.error == 'passwordTooShort'}">
							<div class="alert alert-danger">Mat khau moi phai tu 6 ky tu tro len.</div>
						</c:if>

						<form:form method="post" action="/client/account/update-password">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

							<div class="mb-3">
								<label class="form-label fw-bold">Mat khau hien tai</label>
								<input type="password" class="form-control" name="currentPassword" required />
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Mat khau moi</label>
								<input type="password" class="form-control" name="newPassword" required />
							</div>

							<div class="mb-4">
								<label class="form-label fw-bold">Xac nhan mat khau moi</label>
								<input type="password" class="form-control" name="confirmPassword" required />
							</div>

							<div class="d-flex gap-2">
								<button type="submit" class="btn btn-warning px-4">Cap nhat</button>
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

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Denied</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="text-center">

            <!-- Icon -->
            <div class="mb-4">
                <i class="fas fa-exclamation-triangle text-danger" style="font-size: 80px;"></i>
            </div>

            <!-- Alert -->
            <div class="alert alert-danger shadow-lg">
                <h4 class="alert-heading">Access Denied</h4>
                <p>You do not have permission to access this page.</p>
            </div>

            <!-- Buttons -->
            <div class="mt-3">
                <a href="/" class="btn btn-primary">
                    Back to Home
                </a>

                <button onclick="history.back()" class="btn btn-secondary ms-2">
                    Go Back
                </button>
            </div>

        </div>
    </div>

    <!-- Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

</body>

</html>
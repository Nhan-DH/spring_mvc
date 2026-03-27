<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
        <meta charset="utf-8">
        <title>NYAN SHOP</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <link href="/client/css/bootstrap.min.css" rel="stylesheet">
        <link href="/client/css/style.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />

        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="bg-light rounded p-5 text-center">
                            <i class="fa fa-check-circle text-success mb-4" style="font-size: 80px;"></i>
                            <h1 class="display-6 mb-3">Order Placed Successfully!</h1>
                            <p class="mb-4">
                                Thank you for your order. Your order is being processed.
                            </p>

                            <div class="d-flex gap-3 justify-content-center">
                                <a href="/" class="btn border-secondary rounded-pill px-4 py-3 text-primary">
                                    Back to Home
                                </a>
                                <a href="/cart" class="btn border-secondary rounded-pill px-4 py-3 text-primary">
                                    Back to Cart
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />

        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/client/js/main.js"></script>
    </body>

    </html>



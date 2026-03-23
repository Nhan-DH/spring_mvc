<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Order Success</title>
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
                            <h1 class="display-6 mb-3">Đặt hàng thành công!</h1>
                            <p class="mb-4">
                                Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đang được xử lý.
                            </p>

                            <div class="d-flex gap-3 justify-content-center">
                                <a href="/" class="btn border-secondary rounded-pill px-4 py-3 text-primary">
                                    Về trang chủ
                                </a>
                                <a href="/cart" class="btn border-secondary rounded-pill px-4 py-3 text-primary">
                                    Quay lại giỏ hàng
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
    </body>

    </html>
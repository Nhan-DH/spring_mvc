<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
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


            <!-- Modal Search Start -->
            <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-fullscreen">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex align-items-center">
                            <div class="input-group w-75 mx-auto d-flex">
                                <input type="search" class="form-control p-3" placeholder="keywords"
                                    aria-describedby="search-icon-1">
                                <span id="search-icon-1" class="input-group-text p-3"><i
                                        class="fa fa-search"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Search End -->

            <!-- Contact Start -->
            <div class="container-fluid contact py-5">
                <div class="container py-5">
                    <div class="p-5 bg-light rounded">
                        <div class="row g-4">
                            <div class="col-12">
                                <div class="text-center mx-auto" style="max-width: 700px;">
                                    <h1 class="text-primary">Contact NyanShop</h1>
                                    <p class="mb-4">We'd love to hear from you! Whether you have questions about our
                                        laptops, need technical support, or want to share feedback, please don't
                                        hesitate to reach out. Our team at NyanShop is here to help!</p>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="h-100 rounded">
                                    <iframe class="rounded w-100" style="height: 400px;"
                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.906948519925!2d105.84075!3d21.0048!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab13c5fbce09%3A0x29fcacfc2bf0a77a!2sBachKhoa%20Hanoi%20University%20of%20Science%20and%20Technology!5e0!3m2!1sen!2svn!4v1703000000000"
                                        loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <form action="" class="">
                                    <input type="text" class="w-100 form-control border-0 py-3 mb-4"
                                        placeholder="Your Name">
                                    <input type="email" class="w-100 form-control border-0 py-3 mb-4"
                                        placeholder="Enter Your Email">
                                    <textarea class="w-100 form-control border-0 mb-4" rows="5" cols="10"
                                        placeholder="Your Message"></textarea>
                                    <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary "
                                        type="submit">Submit</button>
                                </form>
                            </div>
                            <div class="col-lg-5">
                                <div class="d-flex p-4 rounded mb-4 bg-white">
                                    <i class="fas fa-map-marker-alt fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Address</h4>
                                        <p class="mb-2">Hanoi University of Science and Technology, Vietnam</p>
                                    </div>
                                </div>
                                <div class="d-flex p-4 rounded mb-4 bg-white">
                                    <i class="fas fa-envelope fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Email</h4>
                                        <p class="mb-2">hongnhan474747@gmail.com</p>
                                    </div>
                                </div>
                                <div class="d-flex p-4 rounded bg-white">
                                    <i class="fa fa-phone-alt fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Phone</h4>
                                        <p class="mb-2">(+84) 979 886 834</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Contact End -->






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
        </body>

        </html>



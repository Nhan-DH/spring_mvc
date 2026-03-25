<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>Home</title>
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

            <!-- Pagination Disabled Fix -->
            <style>
                .page-link.disabled {
                    pointer-events: none !important;
                    cursor: not-allowed !important;
                    opacity: 0.5;
                    background-color: #e9ecef !important;
                    color: #6c757d !important;
                }

                .page-link.active {
                    background-color: #0d6efd;
                    color: white;
                    border-color: #0d6efd;
                }
            </style>
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
            <!-- Laptop Collection Start-->
            <div class="container-fluid fruite py-5">
                <div class="container py-5">
                    <h1 class="mb-4">Laptop Collection</h1>
                    <div class="row g-4">
                        <div class="col-lg-4">
                            <div class="p-4 bg-light rounded">
                                <h4 class="mb-4"><strong>Filters</strong></h4>

                                <!-- Brands Filter -->
                                <div class="mb-4">
                                    <h5 class="mb-3"><i class="fas fa-laptop me-2" style="color: #0066ff;"></i>Brands
                                    </h5>
                                    <div class="row g-2">
                                        <div class="col-4">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="brand-macbook"
                                                    name="brand" value="Macbook">
                                                <label class="form-check-label" for="brand-macbook">Macbook</label>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="brand-lenovo"
                                                    name="brand" value="Lenovo">
                                                <label class="form-check-label" for="brand-lenovo">Lenovo</label>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="brand-dell"
                                                    name="brand" value="Dell">
                                                <label class="form-check-label" for="brand-dell">Dell</label>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="brand-asus"
                                                    name="brand" value="Asus">
                                                <label class="form-check-label" for="brand-asus">Asus</label>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="brand-acer"
                                                    name="brand" value="Acer">
                                                <label class="form-check-label" for="brand-acer">Acer</label>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="brand-lg"
                                                    name="brand" value="LG">
                                                <label class="form-check-label" for="brand-lg">LG</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr>

                                <!-- Purpose Filter -->
                                <div class="mb-4">
                                    <h5 class="mb-3"><i class="fas fa-bullseye me-2" style="color: #0066ff;"></i>Purpose
                                    </h5>
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="target-gaming"
                                                    name="target" value="GAMING">
                                                <label class="form-check-label" for="target-gaming">Gaming</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="target-office"
                                                    name="target" value="OFFICE WORK">
                                                <label class="form-check-label" for="target-office">Office</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="target-student"
                                                    name="target" value="STUDENT">
                                                <label class="form-check-label" for="target-student">Student</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="target-design"
                                                    name="target" value="DESIGN&Editing">
                                                <label class="form-check-label" for="target-design">Design</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="target-dev"
                                                    name="target" value="DEVELOPMENT">
                                                <label class="form-check-label" for="target-dev">Development</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr>

                                <!-- Price Filter -->
                                <div class="mb-4">
                                    <h5 class="mb-3"><i class="fas fa-dollar-sign me-2"
                                            style="color: #0066ff;"></i>Price Range</h5>
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="price-1"
                                                    name="price" value="0-500">
                                                <label class="form-check-label" for="price-1">$0 - $500</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="price-2"
                                                    name="price" value="500-1000">
                                                <label class="form-check-label" for="price-2">$500 - $1K</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="price-3"
                                                    name="price" value="1000-1500">
                                                <label class="form-check-label" for="price-3">$1K - $1.5K</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="price-4"
                                                    name="price" value="1500-3000">
                                                <label class="form-check-label" for="price-4">$1.5K - $3K</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr>

                                <!-- Sort Filter -->
                                <div class="mb-4">
                                    <h5 class="mb-3"><i class="fas fa-sort-amount-down me-2"
                                            style="color: #0066ff;"></i>Sort by Price</h5>
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="radio" class="form-check-input" id="sort-asc" name="sort"
                                                    value="asc">
                                                <label class="form-check-label" for="sort-asc">Low to High</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="radio" class="form-check-input" id="sort-desc" name="sort"
                                                    value="desc">
                                                <label class="form-check-label" for="sort-desc">High to Low</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr>

                                <!-- Filter Button -->
                                <button type="button" class="btn btn-primary w-100"
                                    style="background: linear-gradient(135deg, #0066ff 0%, #0052cc 100%); border: none; padding: 12px; font-weight: 600; border-radius: 8px;">
                                    <i class="fas fa-filter me-2"></i>Filter Products
                                </button>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="row g-4 justify-content-center">
                                <jsp:include page="/WEB-INF/view/client/layout/item-laptop.jsp" />

                                <div class="col-12">
                                    <div class="pagination d-flex justify-content-center mt-5">
                                        <a class="${1 == currentPage ? 'page-link disabled' : 'page-link'}"
                                            href="/client/products?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <c:forEach begin="1" end="${totalPages}" var="loop">
                                            <li class="page-item">
                                                <a class="${loop == currentPage ? 'page-link active' : 'page-link'}"
                                                    href="/client/products?page=${loop}">
                                                    ${loop}
                                                </a>
                                            </li>
                                        </c:forEach>
                                        <a class="${totalPages == currentPage ? 'page-link disabled' : 'page-link'}"
                                            href="/client/products?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </div>
            <!-- Laptop Collection End-->

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
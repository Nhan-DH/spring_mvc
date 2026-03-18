<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <style>
            .product-card {
                border-radius: 16px;
                overflow: hidden;
                background: #fff;
                transition: all 0.25s ease;
                height: 100%;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            }

            .product-card:hover {
                transform: translateY(-6px);
                box-shadow: 0 10px 24px rgba(0, 0, 0, 0.14);
            }

            .product-img-wrapper {
                height: 220px;
                overflow: hidden;
                background: #f8f9fa;
            }

            .product-img-wrapper img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

            .product-card:hover .product-img-wrapper img {
                transform: scale(1.05);
            }

            .product-badge {
                top: 12px;
                left: 12px;
                font-size: 13px;
                font-weight: 600;
                border-radius: 999px;
                z-index: 2;
            }

            .product-body {
                padding: 18px;
                display: flex;
                flex-direction: column;
                height: calc(100% - 220px);
            }

            .product-title {
                font-size: 18px;
                font-weight: 700;
                color: #212529;
                text-decoration: none;
                line-height: 1.4;
                min-height: 50px;

                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .product-title:hover {
                color: #0d6efd;
            }

            .product-desc {
                color: #6c757d;
                font-size: 14px;
                line-height: 1.5;
                min-height: 44px;
                margin: 10px 0 14px;

                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .product-price {
                font-size: 22px;
                font-weight: 700;
                color: #dc3545;
                margin-bottom: 14px;
            }

            .add-cart-btn {
                border-radius: 999px;
                font-weight: 600;
                transition: all 0.2s ease;
            }

            .add-cart-btn:hover {
                background-color: #0d6efd;
                color: #fff !important;
                border-color: #0d6efd !important;
            }

            .add-cart-btn:hover i {
                color: #fff !important;
            }
        </style>

        <div id="tab-1" class="tab-pane fade show p-0 active">
            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="row g-4">
                        <c:forEach var="product" items="${products}">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <div class="product-card position-relative">

                                    <div class="position-absolute bg-secondary text-white px-3 py-1 product-badge">
                                        ${product.factory}
                                    </div>

                                    <div class="product-img-wrapper">
                                        <a href="/client/product/${product.id}">
                                            <img src="/images/image/${product.image}" alt="${product.name}"
                                                class="img-fluid">
                                        </a>
                                    </div>

                                    <div class="product-body">
                                        <a href="/client/product/${product.id}" class="product-title">
                                            ${product.name}
                                        </a>

                                        <p class="product-desc">
                                            ${product.shortDesc}
                                        </p>

                                        <div class="product-price">
                                            $${product.price}
                                        </div>

                                        <form action="/add-product-to-cart/${product.id}" method="post" class="mt-auto">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button type="submit"
                                                class="btn border border-secondary text-primary w-100 add-cart-btn">
                                                <i class="fa fa-shopping-bag me-2 text-primary"></i>
                                                Add to cart
                                            </button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div id="tab-1" class="tab-pane fade show p-0 active">
            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="row g-4">
                        <c:forEach var="product" items="${products}">
                            <div class=" col-md-6 col-lg-4 col-xl-3">
                                <div class="rounded position-relative fruite-item">

                                    <div class="fruite-img">
                                        <img src="/images/image/${product.image}" class="img-fluid w-100 rounded-top">
                                    </div>

                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; left: 10px;">
                                        ${product.factory}
                                    </div>

                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                        <a href="/client/product/${product.id}">
                                            <h4>${product.name}</h4>
                                        </a>


                                        <p>${product.shortDesc}</p>

                                        <div class="d-flex justify-content-between flex-lg-wrap">

                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                ${product.price}
                                            </p>

                                            <a href="/product/${product.id}"
                                                class="btn border border-secondary rounded-pill px-3 text-primary">
                                                <i class="fa fa-shopping-bag me-2 text-primary"></i>
                                                Add to cart
                                            </a>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        </div>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8]><html class="ie ie8"><![endif]-->
<!--[if IE 9]><html class="ie ie9"><![endif]-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <link href="apple-touch-icon.png" rel="apple-touch-icon">
        <link href="favicon.png" rel="icon">
        <meta name="author" content="Nghia Minh Luong">
        <meta name="keywords" content="Default Description">
        <meta name="description" content="Default keyword">
        <title>Checkout</title>
        <!-- Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ps-icon/style.css">
        <!-- CSS Library-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="plugins/owl-carousel/assets/owl.carousel.css">
        <link rel="stylesheet" href="plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
        <link rel="stylesheet" href="plugins/slick/slick/slick.css">
        <link rel="stylesheet" href="plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
        <link rel="stylesheet" href="plugins/Magnific-Popup/dist/magnific-popup.css">
        <link rel="stylesheet" href="plugins/jquery-ui/jquery-ui.min.css">
        <link rel="stylesheet" href="plugins/revolution/css/settings.css">
        <link rel="stylesheet" href="plugins/revolution/css/layers.css">
        <link rel="stylesheet" href="plugins/revolution/css/navigation.css">
        <!-- Custom-->
        <link rel="stylesheet" href="css/style.css">
        <!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
        <!--WARNING: Respond.js doesn't work if you view the page via file://-->
        <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <!--[if IE 7]><body class="ie7 lt-ie8 lt-ie9 lt-ie10"><![endif]-->
    <!--[if IE 8]><body class="ie8 lt-ie9 lt-ie10"><![endif]-->
    <!--[if IE 9]><body class="ie9 lt-ie10"><![endif]-->
    <body class="ps-loading">
        <div class="header--sidebar"></div>

        <%@include file="/header.jsp" %>

        <div class="header-services">
            <div class="ps-services owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="false" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on">
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
            </div>
        </div>
        <main class="ps-main">
            <div class="ps-checkout pt-80 pb-80">
                <div class="ps-container">
                    <form class="ps-checkout__form" action="./user/updateinfo" method="post">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                <div class="ps-checkout__billing">
                                    <h3>Billing Detail</h3>

                                    <p class="text-danger">${param.errorMess}</p>


                                    <c:set var="info" value="${requestScope.userinfo}" />
                                    <div class="form-group form-group--inline">
                                        <label>Name<span>*</span>
                                        </label>

                                        <input name="name" class="form-control" type="text" value="${info.name}">
                                    </div>

                                    <div class="form-group form-group--inline">
                                        <label>Sex<span>*</span>
                                        </label>
                                        <input class="form-control" type="text" readonly value="${info.sex}">
                                    </div>
                                    <div class="form-group form-group--inline">
                                        <label>Email Address<span>*</span>
                                        </label>
                                        <input name="email" class="form-control" type="email" value="${info.email}">
                                    </div>

                                    <div class="form-group form-group--inline">
                                        <label>Phone<span>*</span>
                                        </label>
                                        <input name="phone" class="form-control" type="text" value="${info.phone}">
                                    </div>
                                    <div class="form-group form-group--inline">
                                        <label>Address<span>*</span>
                                        </label>
                                        <input name="address" class="form-control" type="text" value="${info.address}">
                                    </div>

                                    <button class="ps-btn ps-btn--fullwidth" href="">Update info<i class="ps-icon-next"></i></button>
                                    </form>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                                <div class="ps-checkout__order">
                                    <header>
                                        <h3>Your Order</h3>

                                    </header>
                                    <div class="content">
                                        <table class="table ps-checkout__products">     
                                            <p class="text-danger">${errorCash}</p>        
                                            <thead>
                                                <tr>
                                                    <th class="text-uppercase">Product</th>
                                                    <th class="text-uppercase">Total</th>

                                                </tr>
                                            </thead>


                                            <tbody>
                                                <c:set var="total" value="${0}"/>     
                                                <c:forEach items="${productmap}" var="productmap">  
                                                    <tr>
                                                        <td>${productmap.value.name} x${productmap.key.quantity}</td>
                                                        <td>${productmap.key.quantity*productmap.value.price}</td>                             
                                                    </tr>
                                                    <c:set var="total" value="${total + productmap.key.quantity*productmap.value.price}" />
                                                </c:forEach> 
                                                <tr>
                                                    <td>Order Total</td>
                                                    <td>${total}</td>
                                                </tr>
                                            </tbody>

                                        </table>


                                    </div>


                                    <footer>
                                        <h3>Ship info</h3>  
                                        <p>&emsp;&emsp;&emsp;Name: ${info.name}</p>
                                        <p>&emsp;&emsp;&emsp;Address: ${info.address}</p>
                                        <p>&emsp;&emsp;&emsp;Phone: ${info.phone}</p>
                                        <h3>Payment Method</h3>
                                        <div class="form-group cheque">
                                            <div class="ps-radio">
                                                <input class="form-control" type="radio" id="rdo01" checked>
                                                <label for="rdo01">Cash (You have ${info1.cash})</label>
                                                <p>Send to address.</p>
                                            </div>

                                        </div>

                                        <c:choose>
                                            <c:when test = "${info1.cash < totalCart}">
                                                <div class="form-group paypal">

                                                    <form class="ps-checkout__form" action="./home" method="get">  

                                                        <button class="ps-btn ps-btn--fullwidth" href="">Deposit money<i class="ps-icon-next"></i></button>

                                                    </form>

                                                </div>
                                            </c:when>

                                            <c:when test = "${info1.cash >= totalCart}">
                                                <div class="form-group paypal">

                                                    <form class="ps-checkout__form" action="./addtoorder" method="get">  

                                                        <button class="ps-btn ps-btn--fullwidth" href="">Place Order<i class="ps-icon-next"></i></button>

                                                    </form>

                                                </div>
                                            </c:when>

                                            <c:otherwise>
                                                No comment sir...
                                            </c:otherwise>
                                        </c:choose>




                                    </footer>
                                </div>
                                <div class="ps-shipping">
                                    <h3>FREE SHIPPING</h3>
                                    <p>YOUR ORDER QUALIFIES FOR FREE SHIPPING.<br> <a href="#"> Singup </a> for free shipping on every order, every time.</p>
                                </div>
                            </div>
                        </div>

                </div>
            </div>
            <div class="ps-subscribe">
                <div class="ps-container">
                    <div class="row">
                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 ">
                            <h3><i class="fa fa-envelope"></i>Sign up to Newsletter</h3>
                        </div>
                        <div class="col-lg-5 col-md-7 col-sm-12 col-xs-12 ">
                            <form class="ps-subscribe__form" action="do_action" method="post">
                                <input class="form-control" type="text" placeholder="">
                                <button>Sign up now</button>
                            </form>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12 ">
                            <p>...and receive  <span>$20</span>  coupon for first shopping.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ps-footer bg--cover" data-background="images/background/parallax.jpg">
                <div class="ps-footer__content">
                    <div class="ps-container">
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                <aside class="ps-widget--footer ps-widget--info">
                                    <header><a class="ps-logo" href="index.html"><img src="images/logo-white.png" alt=""></a>
                                        <h3 class="ps-widget__title">Address Office 1</h3>
                                    </header>
                                    <footer>
                                        <p><strong>460 West 34th Street, 15th floor, New York</strong></p>
                                        <p>Email: <a href='mailto:support@store.com'>support@store.com</a></p>
                                        <p>Phone: +323 32434 5334</p>
                                        <p>Fax: ++323 32434 5333</p>
                                    </footer>
                                </aside>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                <aside class="ps-widget--footer ps-widget--info second">
                                    <header>
                                        <h3 class="ps-widget__title">Address Office 2</h3>
                                    </header>
                                    <footer>
                                        <p><strong>PO Box 16122 Collins  Victoria 3000 Australia</strong></p>
                                        <p>Email: <a href='mailto:support@store.com'>support@store.com</a></p>
                                        <p>Phone: +323 32434 5334</p>
                                        <p>Fax: ++323 32434 5333</p>
                                    </footer>
                                </aside>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 ">
                                <aside class="ps-widget--footer ps-widget--link">
                                    <header>
                                        <h3 class="ps-widget__title">Find Our store</h3>
                                    </header>
                                    <footer>
                                        <ul class="ps-list--link">
                                            <li><a href="#">Coupon Code</a></li>
                                            <li><a href="#">SignUp For Email</a></li>
                                            <li><a href="#">Site Feedback</a></li>
                                            <li><a href="#">Careers</a></li>
                                        </ul>
                                    </footer>
                                </aside>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 ">
                                <aside class="ps-widget--footer ps-widget--link">
                                    <header>
                                        <h3 class="ps-widget__title">Get Help</h3>
                                    </header>
                                    <footer>
                                        <ul class="ps-list--line">
                                            <li><a href="#">Order Status</a></li>
                                            <li><a href="#">Shipping and Delivery</a></li>
                                            <li><a href="#">Returns</a></li>
                                            <li><a href="#">Payment Options</a></li>
                                            <li><a href="#">Contact Us</a></li>
                                        </ul>
                                    </footer>
                                </aside>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 ">
                                <aside class="ps-widget--footer ps-widget--link">
                                    <header>
                                        <h3 class="ps-widget__title">Products</h3>
                                    </header>
                                    <footer>
                                        <ul class="ps-list--line">
                                            <li><a href="#">Shoes</a></li>
                                            <li><a href="#">Clothing</a></li>
                                            <li><a href="#">Accessries</a></li>
                                            <li><a href="#">Football Boots</a></li>
                                        </ul>
                                    </footer>
                                </aside>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ps-footer__copyright">
                    <div class="ps-container">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                <p>&copy; <a href="#">SKYTHEMES</a>, Inc. All rights Resevered. Design by <a href="#"> Alena Studio</a></p>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                <ul class="ps-social">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- JS Library-->
        <script type="text/javascript" src="plugins/jquery/dist/jquery.min.js"></script>
        <script type="text/javascript" src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
        <script type="text/javascript" src="plugins/owl-carousel/owl.carousel.min.js"></script>
        <script type="text/javascript" src="plugins/gmap3.min.js"></script>
        <script type="text/javascript" src="plugins/imagesloaded.pkgd.js"></script>
        <script type="text/javascript" src="plugins/isotope.pkgd.min.js"></script>
        <script type="text/javascript" src="plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="plugins/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="plugins/slick/slick/slick.min.js"></script>
        <script type="text/javascript" src="plugins/elevatezoom/jquery.elevatezoom.js"></script>
        <script type="text/javascript" src="plugins/Magnific-Popup/dist/jquery.magnific-popup.min.js"></script>
        <script type="text/javascript" src="plugins/jquery-ui/jquery-ui.min.js"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script><script type="text/javascript" src="plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <!-- Custom scripts-->
        <script type="text/javascript" src="js/main.js"></script>
    </body>
</html>
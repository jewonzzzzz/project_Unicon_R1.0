<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<body>

    <!-- PAGE LOADING
    ================================================== -->
    <div id="preloader"></div>

    <!-- MAIN WRAPPER
    ================================================== -->
    <div class="main-wrapper">

        <!-- HEADER
        ================================================== -->
        <header class="header-style5">
            <div id="top-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="top-bar-info">
                                <ul class="ps-0">
                                    <li><i class="fas fa-mobile-alt"></i>(+123) 456 7890</li>
                                    <li><i class="fas fa-envelope"></i>addyour@emailhere</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 d-none d-md-block">
                            <ul class="top-social-icon ps-0">
                                <li><a href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#!"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#!"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#!"><i class="fab fa-linkedin-in"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="navbar-default">

                <!-- start top search -->
                <div class="top-search bg-extra-dark-gray">
                    <div class="container">
                        <form class="search-form" action="search.html" method="GET" accept-charset="utf-8">
                            <div class="input-group">
                                <span class="input-group-addon cursor-pointer">
                                    <button class="search-form_submit fas fa-search text-white" type="submit"></button>
                                </span>
                                <input type="text" class="search-form_input form-control" name="s" autocomplete="off" placeholder="Type & hit enter...">
                                <span class="input-group-addon close-search"><i class="fas fa-times display-28 mt-1"></i></span>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- end top search -->
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="menu_area alt-font">
                                <nav class="navbar navbar-expand-lg navbar-light p-0">

                                    <div class="navbar-header navbar-header-custom">
                                        <!-- start logo -->
                                        <a href="index.html" class="navbar-brand logodefault"><img id="logo" src="${pageContext.request.contextPath }/resources/new_assets/img/logos/logo.png" alt="logo"></a>
                                        <!-- end logo -->
                                    </div>

                                    <div class="navbar-toggler"></div>

                                    <!-- menu area -->
                                    <ul class="navbar-nav ms-auto" id="nav" style="display: none;">
                                        <li><a href="#!">Home</a>
                                            <ul>
                                                <li><a href="#!">Default Homes</a>
                                                    <ul>
                                                        <li><a href="home-1.html">Home 01</a></li>
                                                        <li><a href="home-2.html">Home 02</a></li>
                                                        <li><a href="home-3.html">Home 03</a></li>
                                                        <li><a href="home-4.html">Home 04</a></li>
                                                        <li><a href="home-5.html">Home 05</a></li>
                                                        <li><a href="home-6.html">Home 06</a></li>
                                                        <li><a href="home-7.html">Home 07</a></li>
                                                        <li><a href="home-8.html">Home 08</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Creative Homes</a>
                                                    <ul>
                                                        <li><a href="home-9.html">Home 09</a></li>
                                                        <li><a href="home-10.html">Home 10</a></li>
                                                        <li><a href="home-11.html">Home 11</a></li>
                                                        <li><a href="home-12.html">Home 12</a></li>
                                                        <li><a href="home-13.html">Home 13</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Classic Homes</a>
                                                    <ul>
                                                        <li><a href="home-startup.html">Home 14 - Startup</a></li>
                                                        <li><a href="home-marketing-agency.html">Home 15 - Marketing</a></li>
                                                        <li><a href="home-business.html">Home 16 - Business</a></li>
                                                        <li><a href="home-finance.html">Home 17 - Finance</a></li>
                                                        <li><a href="home-corporate.html">Home 18 - Corporate</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">One Page Demos</a>
                                                    <ul>
                                                        <li><a href="one-page/agency/index.html" target="_blank">Agency</a></li>
                                                        <li><a href="one-page/business/index.html" target="_blank">Business</a></li>
                                                        <li><a href="one-page/consulting/index.html" target="_blank">Consulting</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="home-14.html">Home Shop</a></li>
                                                <li><a href="admin-template/index.html" target="_blank">Admin Dashboard</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#!">Pages</a>
                                            <ul>
                                                <li><a href="#!">About Us</a>
                                                    <ul>
                                                        <li><a href="about.html">About Us 01</a></li>
                                                        <li><a href="about-2.html">About Us 02</a></li>
                                                        <li><a href="about-3.html">About Us 03</a></li>
                                                        <li><a href="about-me.html">About Me</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Our Team</a>
                                                    <ul>
                                                        <li><a href="team.html">Our Team 01</a></li>
                                                        <li><a href="team-2.html">Our Team 02</a></li>
                                                        <li><a href="team-3.html">Our Team 03</a></li>
                                                        <li><a href="team-4.html">Our Team 04</a></li>
                                                        <li><a href="team-5.html">Our Team 05</a></li>
                                                        <li><a href="team-6.html">Our Team 06</a></li>
                                                        <li><a href="team-7.html">Our Team 07</a></li>
                                                        <li><a href="team-8.html">Our Team 08</a></li>
                                                        <li><a href="team-single.html">Team Single</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Services</a>
                                                    <ul>
                                                        <li><a href="services.html">Services 01</a></li>
                                                        <li><a href="services-2.html">Services 02</a></li>
                                                        <li><a href="services-3.html">Services 03</a></li>
                                                        <li><a href="services-4.html">Services 04</a></li>
                                                        <li><a href="cases.html">Cases</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Service Detail</a>
                                                    <ul>
                                                        <li><a href="financial-planning.html">Financial Planning</a></li>
                                                        <li><a href="personal-insurance.html">Personal Insurance</a></li>
                                                        <li><a href="business-analysis.html">Business Analysis</a></li>
                                                        <li><a href="market-research.html">Market Research</a></li>
                                                        <li><a href="online-consulting.html">Online Consulting</a></li>
                                                        <li><a href="investment-planning.html">Investment Planning</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Contact Us</a>
                                                    <ul>
                                                        <li><a href="contact.html">Contact Us 01</a></li>
                                                        <li><a href="contact-2.html">Contact Us 02</a></li>
                                                        <li><a href="contact-3.html">Contact Us 03</a></li>
                                                        <li><a href="contact-4.html">Contact Us 04</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">FAQ</a>
                                                    <ul>
                                                        <li><a href="faq.html">FAQ 01</a></li>
                                                        <li><a href="faq-2.html">FAQ 02</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Additional Pages</a>
                                                    <ul>
                                                        <li><a href="career.html">Career</a></li>
                                                        <li><a href="login.html">Login</a></li>
                                                        <li><a href="registration.html">Registration</a></li>
                                                        <li><a href="forgot-password.html">Forgot Password</a></li>
                                                        <li><a href="404.html">Error 404</a></li>
                                                        <li><a href="maintenance.html">Maintenance</a></li>
                                                        <li><a href="comingsoon.html">Comingsoon</a></li>
                                                    </ul>
                                                </li>

                                            </ul>
                                        </li>
                                        <li><a href="#!">Features</a>
                                            <ul>
                                                <li><a href="#!">Headers</a>
                                                    <ul>
                                                        <li><a href="header-1.html">Header Style 1</a></li>
                                                        <li><a href="header-2.html">Header Style 2</a></li>
                                                        <li><a href="header-3.html">Header Style 3</a></li>
                                                        <li><a href="header-4.html">Header Style 4</a></li>
                                                        <li><a href="header-5.html">Header Style 5</a></li>
                                                        <li><a href="header-6.html">Header Style 6</a></li>
                                                        <li><a href="header-7.html">Header Style 7</a></li>
                                                        <li><a href="header-8.html">Header Style 8</a></li>
                                                        <li><a href="header-9.html">Header Style 9</a></li>
                                                        <li><a href="header-10.html">Header Style 10</a></li>
                                                        <li><a href="header-11.html">Header Style 11</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Classic Footers</a>
                                                    <ul>
                                                        <li><a href="footer-1.html">Footer Style 1</a></li>
                                                        <li><a href="footer-2.html">Footer Style 2</a></li>
                                                        <li><a href="footer-3.html">Footer Style 3</a></li>
                                                        <li><a href="footer-4.html">Footer Style 4</a></li>
                                                        <li><a href="footer-5.html">Footer Style 5</a></li>
                                                        <li><a href="footer-6.html">Footer Style 6</a></li>
                                                        <li><a href="footer-7.html">Footer Style 7</a></li>
                                                        <li><a href="footer-8.html">Footer Style 8</a></li>
                                                        <li><a href="footer-9.html">Footer Style 9</a></li>
                                                        <li><a href="footer-10.html">Footer Style 10</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Creative Footers</a>
                                                    <ul>
                                                        <li><a href="footer-11.html">Footer Style 11</a></li>
                                                        <li><a href="footer-12.html">Footer Style 12</a></li>
                                                        <li><a href="footer-13.html">Footer Style 13</a></li>
                                                        <li><a href="footer-14.html">Footer Style 14</a></li>
                                                        <li><a href="footer-15.html">Footer Style 15</a></li>
                                                        <li><a href="footer-16.html">Footer Style 16</a></li>
                                                        <li><a href="footer-17.html">Footer Style 17</a></li>
                                                        <li><a href="footer-18.html">Footer Style 18</a></li>
                                                        <li><a href="footer-19.html">Footer Style 19</a></li>
                                                        <li><a href="footer-20.html">Footer Style 20</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Page titles</a>
                                                    <ul>
                                                        <li><a href="page-title-1.html">Page Title 1</a></li>
                                                        <li><a href="page-title-2.html">Page Title 2</a></li>
                                                        <li><a href="page-title-3.html">Page Title 3</a></li>
                                                        <li><a href="page-title-4.html">Page Title 4</a></li>
                                                        <li><a href="page-title-5.html">Page Title 5</a></li>
                                                        <li><a href="page-title-6.html">Page Title 6</a></li>
                                                        <li><a href="page-title-7.html">Page Title 7</a></li>
                                                        <li><a href="page-title-8.html">Page Title 8</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Revolution Sliders</a>
                                                    <ul>
                                                        <li><a href="rs-slider1.html">Revolution Slider 1</a></li>
                                                        <li><a href="rs-slider2.html">Revolution Slider 2</a></li>
                                                        <li><a href="rs-slider3.html">Revolution Slider 3</a></li>
                                                        <li><a href="rs-slider4.html">Revolution Slider 4</a></li>
                                                        <li><a href="rs-slider5.html">Revolution Slider 5</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Owl Sliders</a>
                                                    <ul>
                                                        <li><a href="owl-slider1.html">Owl Slider 1</a></li>
                                                        <li><a href="owl-slider2.html">Owl Slider 2</a></li>
                                                        <li><a href="owl-slider3.html">Owl Slider 3</a></li>
                                                        <li><a href="owl-slider4.html">Owl Slider 4</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Creative Banners</a>
                                                    <ul>
                                                        <li><a href="creative-banner.html">Creative Banner 1</a></li>
                                                        <li><a href="creative-banner-2.html">Creative Banner 2</a></li>
                                                        <li><a href="creative-banner-3.html">Creative Banner 3</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Shape Banners</a>
                                                    <ul>
                                                        <li><a href="shape-banner.html">Shape Banner 1</a></li>
                                                        <li><a href="shape-banner-2.html">Shape Banner 2</a></li>
                                                        <li><a href="shape-banner-3.html">Shape Banner 3</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Parallax Banners</a>
                                                    <ul>
                                                        <li><a href="parallax-banner.html">Parallax Banner 1</a></li>
                                                        <li><a href="parallax-banner-2.html">Parallax Banner 2</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="video-banner.html">Video Banner</a></li>
                                                <li><a href="loading-bar-banner.html">Loading Bar Banner</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#!">Portfolio</a>
                                            <ul>
                                                <li><a href="#!">Portfolio Full Width</a>
                                                    <ul>
                                                        <li><a href="portfolio-four-columns.html">Portfolio 4 Columns</a></li>
                                                        <li><a href="portfolio-three-columns.html">Portfolio 3 Columns</a></li>
                                                        <li><a href="portfolio-two-columns.html">Portfolio 2 Columns</a></li>
                                                        <li><a href="portfolio-with-icon-four-columns.html">Icon With 4 Columns</a></li>
                                                        <li><a href="portfolio-with-icon-three-columns.html">Icon With 3 Columns</a></li>
                                                        <li><a href="portfolio-with-icon-two-columns.html">Icon With 2 Columns</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Portfolio Boxed</a>
                                                    <ul>
                                                        <li><a href="portfolio-boxed-four-columns.html">Portfolio 4 Columns</a></li>
                                                        <li><a href="portfolio-boxed-three-columns.html">Portfolio 3 Columns</a></li>
                                                        <li><a href="portfolio-boxed-two-columns.html">Portfolio 2 Columns</a></li>
                                                        <li><a href="portfolio-boxed-with-icon-four-columns.html">Icon With 4 Columns</a></li>
                                                        <li><a href="portfolio-boxed-with-icon-three-columns.html">Icon With 3 Columns</a></li>
                                                        <li><a href="portfolio-boxed-with-icon-two-columns.html">Icon With 2 Columns</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Portfolio Classic</a>
                                                    <ul>
                                                        <li><a href="portfolio1.html">Portfolio 1</a></li>
                                                        <li><a href="portfolio2.html">Portfolio 2</a></li>
                                                        <li><a href="portfolio3.html">Portfolio 3</a></li>
                                                        <li><a href="portfolio4.html">Portfolio 4</a></li>
                                                        <li><a href="portfolio5.html">Portfolio 5</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Portfolio Masonry</a>
                                                    <ul>
                                                        <li><a href="projects-masonry-style-1.html">Masonry Style 01</a></li>
                                                        <li><a href="projects-masonry-style-2.html">Masonry Style 02</a></li>
                                                        <li><a href="projects-masonry-style-3.html">Masonry Style 03</a></li>
                                                        <li><a href="projects-masonry-style-4.html">Masonry Style 04</a></li>
                                                        <li><a href="image-gallery-style1.html">Gallery Style 01</a></li>
                                                        <li><a href="image-gallery-style2.html">Gallery Style 02</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Single Project</a>
                                                    <ul>
                                                        <li><a href="project-detail.html">Projects Detail 01</a></li>
                                                        <li><a href="project-detail-2.html">Projects Detail 02</a></li>
                                                        <li><a href="project-detail-3.html">Projects Detail 03</a></li>
                                                        <li><a href="project-detail-4.html">Projects Detail 04</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="#!">Blog</a>
                                            <ul>
                                                <li><a href="blog-grid.html">Blog Grid</a></li>
                                                <li><a href="blog-grid-classic.html">Blog Grid Classic</a></li>
                                                <li><a href="blog-grid-sidebar.html">Blog Grid Sidebar</a></li>
                                                <li><a href="blog-list.html">Blog List</a></li>
                                                <li><a href="blog-list-sidebar.html">Blog List Right Sidebar</a></li>
                                                <li><a href="blog-left-sidebar.html">Blog List Left Sidebar</a></li>
                                                <li><a href="blog-full-width.html">Blog Full Width</a></li>
                                                <li><a href="blog-post.html">Blog Post</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#!">Shop</a>
                                            <ul>
                                                <li><a href="shop-product-grid.html">Product Grid</a></li>
                                                <li><a href="shop-product-list.html">Product List</a></li>
                                                <li><a href="shop-product-full-three-coulmn.html">Product Three Coulmns</a></li>
                                                <li><a href="shop-product-full-four-coulmn.html">Product Four Coulmns</a></li>
                                                <li><a href="shop-product-detail.html">Product Detail</a></li>
                                                <li><a href="shop-cart.html">Shop Cart</a></li>
                                                <li><a href="shop-checkout.html">Shop Checkout</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#!">Elements</a>
                                            <ul class="row megamenu">
                                                <li class="col-lg-3">
                                                    <span class="mb-lg-2 d-block py-2 px-4 p-lg-0 small text-uppercase sub-title">Elements 01</span>
                                                    <ul>
                                                        <li><a href="accordions.html"><i class="fas fa-sliders-h me-2"></i>Accordions</a></li>
                                                        <li><a href="action-boxes.html"><i class="far fa-square me-2"></i>Action Boxes</a></li>
                                                        <li><a href="alerts.html"><i class="fas fa-bell me-2"></i>Alerts</a></li>
                                                        <li><a href="audio-video.html"><i class="fas fa-volume-up me-2"></i>Audio Video</a></li>
                                                        <li><a href="blockquote.html"><i class="fas fa-vector-square me-2"></i>Blockquote</a></li>
                                                        <li><a href="blog-content.html"><i class="fas fa-edit me-2"></i>Blog Content</a></li>
                                                        <li><a href="bootstrap-grid.html"><i class="fas fa-th me-2"></i>Bootstrap Grid</a></li>
                                                        <li><a href="buttons.html"><i class="fas fa-link me-2"></i>Buttons</a></li>
                                                        <li><a href="count-down.html"><i class="fas fa-flag me-2"></i>Count Down</a></li>
                                                        <li><a href="charts.html"><i class="fas fa-chart-pie me-2"></i>Charts</a></li>
                                                    </ul>
                                                </li>
                                                <li class="col-lg-3">
                                                    <span class="mb-lg-2 d-block py-2 px-4 p-lg-0 small text-uppercase sub-title">Elements 02</span>
                                                    <ul>
                                                        <li><a href="countups.html"><i class="fas fa-compress me-2"></i>Countups</a></li>
                                                        <li><a href="dropcaps.html"><i class="fas fa-highlighter me-2"></i>Dropcaps</a></li>
                                                        <li><a href="dropdowns.html"><i class="far fa-caret-square-down me-2"></i>Dropdowns</a></li>
                                                        <li><a href="feature-boxes.html"><i class="fas fa-square-full me-2"></i>Feature Boxes</a></li>
                                                        <li><a href="feature-boxes-fancy.html"><i class="fas fa-pen-square me-2"></i>Feature Boxes Fancy</a></li>
                                                        <li><a href="forms.html"><i class="fab fa-wpforms me-2"></i>Forms</a></li>
                                                        <li><a href="google-map.html"><i class="fas fa-map-marker-alt me-2"></i>Google Map</a></li>
                                                        <li><a href="html5-video.html"><i class="fas fa-video me-2"></i>HTML5 Video</a></li>
                                                        <li><a href="icon-types.html"><i class="fab fa-envira me-2"></i>Icon Types</a></li>
                                                        <li><a href="image-slider.html"><i class="far fa-images me-2"></i>Image Slider</a></li>
                                                    </ul>
                                                </li>
                                                <li class="col-lg-3">
                                                    <span class="mb-lg-2 d-block py-2 px-4 p-lg-0 small text-uppercase sub-title">Elements 03</span>
                                                    <ul>
                                                        <li><a href="lightbox.html"><i class="far fa-sun me-2"></i>Lightbox</a></li>
                                                        <li><a href="liststyles.html"><i class="fas fa-list-ul me-2"></i>List Styles</a></li>
                                                        <li><a href="media-object.html"><i class="fas fa-photo-video me-2"></i>Media Object</a></li>
                                                        <li><a href="pagetitles.html"><i class="fas fa-file-alt me-2"></i>Page titles</a></li>
                                                        <li><a href="partners.html"><i class="fas fa-handshake me-2"></i>Partners</a></li>
                                                        <li><a href="pricing-lists.html"><i class="fas fa-clipboard-list me-2"></i>Pricing Lists</a></li>
                                                        <li><a href="process.html"><i class="fas fa-expand me-2"></i>Process</a></li>
                                                        <li><a href="progress-bars.html"><i class="fas fa-tasks me-2"></i>Progress Bars</a></li>
                                                        <li><a href="project-elements.html"><i class="fas fa-project-diagram me-2"></i>Project Elements</a></li>
                                                        <li><a href="responsive-videos.html"><i class="fas fa-video me-2"></i>Responsive Popup Videos</a></li>
                                                    </ul>
                                                </li>
                                                <li class="col-lg-3">
                                                    <span class="mb-lg-2 d-block py-2 px-4 p-lg-0 small text-uppercase sub-title">Elements 04</span>
                                                    <ul>
                                                        <li><a href="social-icons.html"><i class="fas fa-share-square me-2"></i>Social Icons</a></li>
                                                        <li><a href="subscribe.html"><i class="fas fa-newspaper me-2"></i>Subscribe</a></li>
                                                        <li><a href="table.html"><i class="fas fa-server me-2"></i>Table</a></li>
                                                        <li><a href="tabs.html"><i class="fas fa-sliders-h me-2"></i>Tabs</a></li>
                                                        <li><a href="testmonials.html"><i class="fas fa-quote-left me-2"></i>Testmonials</a></li>
                                                        <li><a href="testmonials-2.html"><i class="fas fa-quote-right me-2"></i>Testmonials 2</a></li>
                                                        <li><a href="timeline.html"><i class="fas fa-clock me-2"></i>Timeline</a></li>
                                                        <li><a href="typography.html"><i class="fas fa-text-height me-2"></i>Typography</a></li>
                                                        <li><a href="vimeo-video.html"><i class="fab fa-vimeo me-2"></i>Vimeo Video</a></li>
                                                        <li><a href="youtube-video.html"><i class="fab fa-youtube me-2"></i>Youtube Video</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <!-- end menu area -->

                                    <!-- start attribute navigation -->
                                    <div class="attr-nav me-lg-0">
                                        <ul>
                                            <li class="dropdown me-3 me-lg-0">
                                                <a href="#" class="dropdown-toggle"  id="dropdownMenuLink" data-bs-toggle="dropdown">
                                                    <i class="fas fa-shopping-cart"></i>
                                                    <span class="badge bg-primary">3</span>
                                                </a>
                                                <ul class="dropdown-menu cart-list">
                                                    <li>
                                                        <a href="#!" class="photo"><img src="${pageContext.request.contextPath }/resources/new_assets/img/shop/cart-thumb01.jpg" class="cart-thumb" alt="..."></a>
                                                        <h6><a href="#!">Sneakers Shoe </a></h6>
                                                        <p>2x - <span class="price">$99.99</span></p>
                                                    </li>
                                                    <li>
                                                        <a href="#!" class="photo"><img src="${pageContext.request.contextPath }/resources/new_assets/img/shop/cart-thumb02.jpg" class="cart-thumb" alt="..."></a>
                                                        <h6><a href="#!">Digital Watch</a></h6>
                                                        <p>1x - <span class="price">$33.33</span></p>
                                                    </li>
                                                    <li>
                                                        <a href="#!" class="photo"><img src="${pageContext.request.contextPath }/resources/new_assets/img/shop/cart-thumb03.jpg" class="cart-thumb" alt="..."></a>
                                                        <h6><a href="#!">Headphones</a></h6>
                                                        <p>2x - <span class="price">$99.99</span></p>
                                                    </li>
                                                    <li class="total bg-primary">
                                                        <span class="pull-left"><strong>Total</strong>: $233.31</span>
                                                        <a href="#!" class="butn small btn-cart white"><span>View Cart</span></a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="search"><a href="#!"><i class="fas fa-search"></i></a></li>
                                        </ul>
                                    </div>
                                    <!-- end attribute navigation -->

                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </header>
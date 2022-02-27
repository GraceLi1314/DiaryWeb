<%@ page contentType="text/html;charset=GB18030" language="java" isELIgnored="false" %>  
<%@ page import="java.util.List" %>
<%
	String base = request.getContextPath()+"/";
	String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+base;  
%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <base href="<%=url%>">
    <meta name="keywords" content="My Diaries">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Home</title>
    
    <link rel="stylesheet" href="admin/menu/fonts/icomoon/style.css">

    <link rel="stylesheet" href="admin/menu/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="admin/menu/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="admin/menu/css/style.css">
    <link rel="stylesheet" href="${pageContex.request.contextPath }/myself/admin/site/nicepage.css" media="screen">
<link rel="stylesheet" href="${pageContex.request.contextPath }/myself/admin/site/Home.css" media="screen">
    <script class="u-script" type="text/javascript" src="${pageContex.request.contextPath }/myself/admin/site/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="${pageContex.request.contextPath }/myself/admin/site/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.2.6, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
            <script src="${pageContext.request.contextPath}/admin/menu/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/main.js"></script>
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "admin/site/images/default-logo.png"
}</script> 
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
  </head>
  <body data-home-page="Home.html" data-home-page-title="Home" class="u-body">
		    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>



      <header class="site-navbar site-navbar-target py-4" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="col-3">
              <div class="site-logo">
                <a href="admin/index.jsp" class="font-weight-bold text-black">${picDesc }</a>
              </div>
            </div>

            <div class="col-9  text-right">
              

              <span class="d-inline-block d-lg-block"><a href="#" class="text-black site-menu-toggle js-menu-toggle py-5"><span class="icon-menu h3 text-black"></span></a></span>

              

              <nav class="site-navigation text-right ml-auto d-none d-lg-none" role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto ">
                  <li class="active"><a href="index.html" class="nav-link">Home</a></li>
                  <li><a href="about.html" class="nav-link">About</a></li>
                  <li><a href="services.html" class="nav-link">Services</a></li>
                  <li><a href="blog.html" class="nav-link">Blog</a></li>
                  <li><a href="${pageContext.request.contextPath }/admin/logout.do" class="nav-link">Logout</a></li>
                </ul>
              </nav>
            </div>

            
          </div>
        </div>
      </header>
      <br><br><br>
    <section class="u-align-center u-clearfix u-white u-section-1" id="carousel_afd8">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h1 class="u-custom-font u-heading-font u-text u-text-default-lg u-text-default-md u-text-default-sm u-text-default-xl u-text-palette-4-dark-1 u-text-1" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">My Diaries</h1>
        <p class="u-text u-text-2">Have fun but be very responsible when needed</p>
        <div class="u-clearfix u-gutter-16 u-layout-custom-sm u-layout-custom-xs u-layout-wrap u-layout-wrap-1">
          <div class="u-gutter-0 u-layout">
            <div class="u-layout-row">
              <div class="u-align-center u-container-style u-layout-cell u-left-cell u-palette-1-light-2 u-radius-20 u-shape-round u-size-15 u-layout-cell-1" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">
             	<%
             		List<String> messageList = (List<String>) request.getAttribute("messages");
             		List<String> categoryList = (List<String>) request.getAttribute("categories");
             		for(int i = 0; i < messageList.size(); i++){
             	%>
 				<div class="u-align-center u-container-style u-gradient u-layout-cell u-size-15 u-layout-cell-3">
                	<div class="u-container-layout u-container-layout-3">
                	  <div class="u-border-2 u-border-white u-line u-line-horizontal u-line-3"></div>
                  	<p class="u-text u-text-palette-1-dark-2 u-text-5">
                  	<%=messageList.get(i) %>
                  </p>
                  <a class="u-active-palette-1-light-3 u-btn u-btn-round u-button-style u-hover-palette-1-light-3 u-radius-50 u-text-palette-2-base u-white u-btn-3">
                  		<%=categoryList.get(i) %> 

                  </a>
                </div>
              </div>
              <%
              }
              %>
              </div>
              </div>
              </div>
              </div>
              </div>
    </section>
  </body>
</html>
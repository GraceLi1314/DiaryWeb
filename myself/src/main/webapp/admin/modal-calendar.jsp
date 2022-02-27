 <%@ page contentType="text/html;charset=GB18030" language="java" isELIgnored="false" %>  
 <%
	String base = request.getContextPath()+"/";
	String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+base;  
%>
 <!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <base href="<%=url%>">
  <title>Calendar</title>
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="./admin/calendar/dist/style01.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">
    
		    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="admin/menu/fonts/icomoon/style.css">

    <link rel="stylesheet" href="admin/menu/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="admin/menu/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="admin/menu/css/style.css">
</head> 
<body>
		<!--    <div class="site-mobile-menu site-navbar-target">
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
                <a href="index.html" class="font-weight-bold text-black">Brand</a>
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
        </header>-->
<!-- partial:index.partial.html -->
<div id="calendar"></div>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<!-- partial -->

        <script src="${pageContext.request.contextPath}/admin/menu/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/main.js"></script>
  <script  src="./admin/calendar/dist/script.js"></script>

</body>
</html>
 
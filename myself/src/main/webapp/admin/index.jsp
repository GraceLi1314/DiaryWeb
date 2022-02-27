<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.jing.myself.vo.ResultInfo" %>
<%
	String base = request.getContextPath()+"/";
	String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+base;   
%> 
<%@ page contentType="text/html;charset=GB18030" language="java" isELIgnored="false" %>  
<%@ include file = "modal-addPic.jsp" %> 
<%@ include file = "modal-text.jsp" %> 
<!doctype html>
<html lang="en">
  <head> 
  	<title>Hello Myself</title> 
  	 <base href="<%=url%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="admin/carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="admin/carousel/css/owl.theme.default.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
		<link rel="stylesheet" href="admin/carousel/css/style.css">
		    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="admin/menu/fonts/icomoon/style.css">

    <link rel="stylesheet" href="admin/menu/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="admin/menu/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="admin/menu/css/style.css">
  </head>
  <script type = "text/javascript">

</script>
  <body>
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
                <a href="admin/index.jsp" class="font-weight-bold text-black">Brand</a>
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
		<section class="ftco-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2 class="heading-section mb-5 pb-md-4">Hello ${admin.nickname}...</h2>
					</div>

					<div class="col-md-12">
						<div class="featured-carousel owl-carousel">
							<div class="item">
								<div class="work"> 
									<div class="img d-flex align-items-center justify-content-center rounded" style="background-image: url(admin/upload/${picture.pic1});">
										<button onclick="changePicture(1)" class="icon d-flex align-items-center justify-content-center">
											<span class="ion-ios-search"></span>
											<span id = "msg1"></span>
										</button>
									</div>
									<div class="text pt-3 w-100 text-center">
										<h3><a href = "user/getMessages.do?picNum=1&desc=Thoughts">Thoughts</a></h3>
										<span><a onclick = "Write(1)">Love Yourself...</a></span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-center justify-content-center rounded" style="background-image: url(admin/upload/${picture.pic2});">
											<button onclick="changePicture(2)" class="icon d-flex align-items-center justify-content-center">
											<span class="ion-ios-search"></span>
											<span id = "msg2"></span>
										</button>
									</div>
									<div class="text pt-3 w-100 text-center">
										<h3><a href="user/getMessages.do?picNum=2&desc=Speak">Speak</a></h3>
										<span><a onclick = "Write(2)">Speak Yourself...</a></span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-center justify-content-center rounded" style="background-image: url(admin/upload/${picture.pic3});">
											<button onclick="changePicture(3)" class="icon d-flex align-items-center justify-content-center">
											<span class="ion-ios-search"></span>
											<span id = "msg3"></span>
										</button>
									</div>
									<div class="text pt-3 w-100 text-center">
										<h3><a href="user/getMessages.do?picNum=3&desc=Eat">Eat</a></h3>
										<span><a onclick = "Write(3)">I Love Eating...</a></span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-center justify-content-center rounded" style="background-image: url(admin/upload/${picture.pic4});">
											<button onclick="changePicture(4)" class="icon d-flex align-items-center justify-content-center">
											<span class="ion-ios-search"></span>
											<span id = "msg4"></span>
										</button>
									</div>
									<div class="text pt-3 w-100 text-center">
										<h3><a href="user/getMessages.do?picNum=4&desc=Exercise">Exercise</a></h3>
										<span><a onclick = "Write(4)">I Love Exercise...</a></span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-center justify-content-center rounded" style="background-image: url(admin/upload/${picture.pic5});">
											<button onclick="changePicture(5)" class="icon d-flex align-items-center justify-content-center">
											<span class="ion-ios-search"></span>
											<span id = "msg5"></span>
										</button>
									</div>
									<div class="text pt-3 w-100 text-center">
										<h3><a href="user/getMessages.do?picNum=5&desc=Help/Make">Helping/Making</a></h3>
										<span><a onclick = "Write(5)">Write Something...</a></span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="work">
									<div class="img d-flex align-items-center justify-content-center rounded" style="background-image: url(admin/upload/${picture.pic6})">
											<button onclick="changePicture(6)" class="icon d-flex align-items-center justify-content-center">
											<span class="ion-ios-search"></span>
											<span id = "msg6"></span>
										</button>
									</div>
									<div class="text pt-3 w-100 text-center">
										<h3><a href="user/getMessages.do?picNum=6&desc=Heart">Heart</a></h3>
										<span><a onclick = "Write(6)">Enjoy Your Life...</a></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div> 
		</section>

    <script src="${pageContext.request.contextPath}/admin/carousel/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/carousel/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/admin/carousel/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/carousel/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/carousel/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/admin/menu/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/admin/menu/js/main.js"></script>
    <script type = "text/javascript">
    	function changePicture(num){    
    		$("#AddPicModal").modal("show"); 
    		$("#AddPicModal [name=picNum]").val(num+"");
    	} 
    	function Write(num){
    		$("#ModalText").modal("show");
    		$("#ModalText [name=num").val(num+"");
    	}
    </script>
  </body>
</html>
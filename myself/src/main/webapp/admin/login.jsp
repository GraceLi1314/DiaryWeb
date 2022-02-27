<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=GB18030" language="java" isELIgnored="false" %>  
<!DOCTYPE html>
<html lang="en">
<head>
	<title>SPEAK YOURSELF LOVE YOURSELF BE YOURSELF</title>
	<meta charset="UTF-8">
	<title>Me</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="statics/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="statics/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="statics/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="statics/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="statics/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="statics/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="statics/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="statics/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="statics/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="statics/css/util.css">
	<link href="statics/css/login.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="statics/css/main.css">
	    <link href="statics/css/login.css" rel="stylesheet" type="text/css" />
    <script src="statics/js/jquery-1.11.3.js" type=text/javascript></script>
    <script src="statics/js/config.js" type=text/javascript></script>
    <script src="statics/js/util.js" type="text/javascript"></script>
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action = "${pageContext.request.contextPath }/admin/login.do" method = "post" class="login100-form validate-form">
					<span class="login100-form-title p-b-34">
						Account Login
					</span>
					
					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type nick name">
						<input id="nickname" class="input100" type="text" name="nickname" value = "${resultInfo.result.nickname }" placeholder="Nickname">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Sign in
						</button> 
						 					<span style="color:red; font-size: 16px" id="msg2">${resultInfo.message }</span>
					</div>

					<div class="w-full text-center p-t-27 p-b-239">
						<span class="txt1">
							Forgot
						</span>

						<a href="#" class="txt2">
							User name / password?
						</a>
					</div>

					<div class="w-full text-center">
						<a href="${pageContext.request.contextPath }/admin/signup.jsp" class="txt3">
							Sign Up
						</a>
					</div>
				</form> 
                </form>
                <div class="login100-more" style="background-image: url('statics/images/pic1.jpg');"></div>
            </div>
        </div>
    </div>
	
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="statics/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="statics/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="statics/vendor/bootstrap/js/popper.js"></script>
	<script src="statics/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--==============================================================================================-->
	<script src="statics/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="statics/vendor/daterangepicker/moment.min.js"></script> 
	<script src="statics/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="statics/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="statics/js/main.js"></script>

</body>
</html>
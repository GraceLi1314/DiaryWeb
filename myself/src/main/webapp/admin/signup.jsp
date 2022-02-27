<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=GB18030" language="java" isELIgnored="false" %>  
<!doctype html> 
<html lang="en">
  <head> 
  	<title>Sign Up</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="signup/css/style.css"> 
	<script src="signup/js/util.js"></script> 
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	</head>
	<body class="img" style="background-image: url(signup/images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Sign Up</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="login-wrap">
		      	<h3 class="text-center mb-4">Create Your Account</h3>
			<form action="${pageContext.request.contextPath }/admin/register.do" method = "post" class="signup-form">
		      		<div class="form-group mb-3">
		      			<input type = "hidden" name = "actionName" value = "signup"> 
		      			<label class="label" for="name">Full Name</label>
		      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      			<span style="color:mediumaquamarine; font-size: 16px" id="msg2"></span>
		      			<input type="text" id = "fullname" name = "fullname" value = "${resultInfo.result.fullname }" class="form-control" placeholder="John Doe">
		      			<span class="icon fa fa-user-o"></span>
		      		</div>
		      		<div class="form-group mb-3">
		      			<label class="label" for="nickname">Nickname</label>
		      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      			<span style="color:lightyellow; font-size: 16px" id="msg"></span>
		      			<input type="text" id = "nickname" name = "nickname" value = "${resultInfo.result.nickname }" class="form-control" placeholder="johndoe">
		      			<span class="icon fa fa-smile-o"></span>
		      		</div>
	            <div class="form-group mb-3">
	            	<label class="label" for="password">Password</label>
	            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            	<span style="color:lightcyan; font-size: 16px" id="msg3"></span>
	              <input id="password" type="password" name = "password" value = "${resultInfo.result.password }" class="form-control" placeholder="Password">
	              <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	              <span class="icon fa fa-lock"></span>
	            </div>
	            <div class="form-group mb-3">
	            	<label class="label" for="password">Confirm Password</label> 
	            	<span style="color:lavenderblush; font-size: 16px" id="msg4"></span>
	              <input id="password-confirm" type="password" name = "password-confirm" class="form-control" placeholder="Password">
	              <span toggle="#password-confirm" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	              <span class="icon fa fa-lock"></span>
	            </div>
	            <div class="form-group">
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	            	<span style = "color:yellow; font-size:"16px" id="msg5">${resultInfo.message }</span> 
	            	<button type="submit" id = "btn" class="form-control btn btn-primary submit px-3">Sign Up</button>
	            </div>
	          </form>
	          <p>I'm already a member! <a data-toggle="tab" href="${pageContext.request.contextPath }/admin/login.jsp">Sign In</a></p>
	        </div>
				</div>
			</div>
		</div>
	</section>

	<script src="signup/js/jquery.min.js"></script>
	<script src = "signup/js/jquery-1.11.3.js"></script>
  <script src="signup/js/popper.js"></script>
  <script src="signup/js/bootstrap.min.js"></script>
  <script src="signup/js/main.js"></script>
	<script type="text/javascript"> 
		$("#nickname").blur(function(){
			var nickName = $("#nickname").val();
			if (isEmpty(nickName)){
				$("#msg").html("昵称不能为空");
				$("#btn").prop("disabled", true);
			}
		}).focus(function(){
			$("#msg").html(""); 
		})
		
		$("#fullname").blur(function(){
			var fullName = $("#fullname").val();
			if (isEmpty(fullName)){
				$("#msg2").html("姓名不能为空");
				$("#btn").prop("disabled", true);
			}
		}).focus(function(){
			$("#msg2").html(""); 
		}) 
		
		$("#password").blur(function(){
			var password = $("#password").val();
			if (isEmpty(password)){
				$("#msg3").html("密码不能为空");
				$("#btn").prop("disabled", true);
			}
		}).focus(function(){
			$("#msg3").html(""); 
		}) 
		
		$("#password-confirm").blur(function(){
			var password = $("#password").val();
			var confirmpwd = $("#password-confirm").val();
			if (password != confirmpwd){
				$("#msg4").html("确认密码不符");
				$("#btn").prop("disabled", true);
			}  
		}).focus(function(){
			$("#msg4").html("");
			$("#password-confirm").val("");
			$("#btn").prop("disabled", false);
		})
		
	</script>
	</body>
</html>


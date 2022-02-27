<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %> 
<%
	String base = request.getContextPath()+"/";
	String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+base;  
%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
	<base href="<%=url%>">
  <title>Diaries</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
  	<style>
	.c-formContainer {
		    font-size: 10px;  
		    font-family: Roboto, sans-serif;
		    background-color: $salmon;
		    
		    margin: 0;
		    display: grid;
		    height: 100vh;
			place-items: center;
	    	position: relative;
	    	font-weight: 700;
    }
    .c-form {
    left: 50%;
    transform: translateX(-50%);
    padding: 0.625em;
    box-sizing: border-box;
    box-shadow: 0 0.125em 0.3125em rgba($black, 0.3);    

    // position form inputs
    display: flex;
    justify-content: center;
}
    .c-form__buttonLabel {
    	font-size: 1.75em;
    	opacity: 0;
    	visibility: hidden;
    	transform: scale(0.7);
    	transition: 0s;
    	color: $cornflower-lilac;
   		height: 100%;
   		width: auto;
	}
    .c-form__input,
.c-form__button {
    font: inherit;
    border: 0;
    outline: 0;
    border-radius: 5em;
    box-sizing: border-box;
}
    
	</style>
</head>
<body>
<!-- partial:index.partial.html -->
<input class="c-checkbox" type="checkbox" id="checkbox">
<div > 
    <input type="text">
    <label for="checkbox">
      <button type="button">Send</button>   
</div>
<!-- partial -->
  <script  src="${pageContext.request.contextPath }/admin/message/dist/script.js"></script>

</body>
</html>

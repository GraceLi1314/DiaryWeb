<%@ page contentType="text/html;charset=GB18030" language="java" isELIgnored="false" %>  
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/modal/fonts/icomoon/style.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/modal/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/modal/css/style.css"> 
  </head>
      <style>  
			  
    	.file-box{
		display: inline-block;
		position: relative;
		padding: 3px 3px;
		overflow: hidden; 
		font-size:10.5px;
		height: 50px;
    	width: 180px;
		color: DarkGreen;
                background-color: LightCyan; 
	}
	.file-btn{
		position: absolute;
		width: 100%;
		height: 100%;
		top: 0;
    	left: 0;
    	outline: none;
    		background-color: transparent;
    		filter:alpha(opacity=0);
		-moz-opacity:0;
		-khtml-opacity: 0;
		opacity: 0; 
} 
	.button {
  background-color: Gainsboro;
  border: none;
  color: DimGray;
  padding: 7px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
} 
	</style>	
  <body>
     

    <!-- Modal -->
    <div class="modal fade" id="AddPicModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-0">
          <div class="modal-body bg-4">

            
   			<div class="d-flex main-content">
              <div class="bg-image promo-img mr-3" id = "image" style="background-image: url('carousel/images/wallpaper.jpg');"> 
              </div>
              <div> 
                <div class="coupon"> 
             		Update Photo
                </div>
                <form action = "${pageContext.request.contextPath }/user/addPicture.do" method = "post" enctype="multipart/form-data"> 
                	<input type = "hidden" name = "picNum" id = "picNum"> 
                  		<div class ="file-box"> 	
                  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "file" id = "picture" name = "picture" onchange = 'openFile(event)'>
                  		</div>  
                  		<p>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class = "button" type="submit" id = "update" onclick = "return checkInput()">Update</button>
                		</p>
                </form>
                <p class="text-center">  
                <a href="#" class="cancel" data-dismiss="modal">Sorry, I don't want this.</a>
                </p>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>

    
    <script src="${pageContext.request.contextPath}/admin/modal/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/modal/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/modal/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/modal/js/main.js"></script>
    
  </body>
  
  	<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script type = "text/javascript"> 
   
  var openFile = function(event) {
	    var input = event.target;

	    var reader = new FileReader();
	    reader.onload = function(){
	      var dataURL = reader.result; 
	      var output = document.getElementById('image');
	      output.style.backgroundImage = "url('"+dataURL+"')";
	    };
	    reader.readAsDataURL(input.files[0]);
	  }; 
	  var checkInput= function(){
		  if( document.getElementById("picture").files.length == 0 ){
			    alert("no images selected");
			    return false;
		} else{ 
			return true;
		}
	  }
  </script>
</html>
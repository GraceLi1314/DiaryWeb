<%@ page contentType="text/html;charset=GB18030" language="java" isELIgnored="false" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet"> 
<link href="${pageContext.request.contextPath}/admin/text/css/coreui.min.css" rel="stylesheet"> 
    <title>Write Something...</title>
    <style>
    	.modalSize{
    		height:
    	}
    	.textControl{
    		width:30px;
    	}
    	.button{
    		cursor: pointer;
    		background-color: rgb(110, 156, 205);
    		color: black;
    	}
    </style>
  </head>
  <body>
    <!-- Modal -->
    <div class="modal fade" id="ModalText" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-0" id = "modalSize">
          <div class="modal-body " style="background-image: url('${pageContext.request.contextPath}/admin/menu/images/light-purple.png');">
  
                <form id = "textForm" action = "${pageContext.request.contextPath }/user/saveText.do"> 
                
                 <div class="input-group" id = "textControl"> 
					  <textarea class="form-control" name = "diary" aria-label="With textarea" onchange = "checkTask()" placeholder = "My Life Today..."></textarea>
				</div>
				<input type = "hidden" name = "num">
				<br>  
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input type = "date" id = "date" name = "date"> &nbsp;
                  <span id = "category"></span>
                  <span id = "textDiary"></span>
                 &nbsp; 
                 <input id = "buttonText" class = "button" type = "submit" value = "That's It !" onclick = "return Submit()" class="btn btn-primary">
                </form>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; 
                <span class="mb-0 cancel"><a href="${pageContext.request.contextPath }/admin/index.jsp" data-dismiss="modal">Nothing To Write...</a></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
 <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@4.1.0/dist/js/coreui.bundle.min.js"></script>
     	<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type = "text/javascript">
  	var checkTask = function(){ 
  		var num = document.getElementsByName("num")[0].value;  
  		if (num == 1){
  			$("#category").html("<select id = 'task' name = 'task'><option value = 'investment'>investment</option><option value = 'joy'>joy</option><option value = 'myself'>myself</option><option value = 'goals'>goals</option><option value = 'people'>peopl</option></select>");
  		} else if (num == 2){
  			$("#category").html("<select id = 'task' name = 'task'><option value = 'joy'>joy</option><option value = 'myself'>myself</option><option value = 'Others'>Others</option><option value = 'language'>language</option></select>");
  		} else if (num == 3){
  			$("#category").html("<select id = 'task' name = 'task'><option value = 'food'>food</option><option value = 'cook'>cook</option></select>");
  		} else if (num == 4){
  			$("#category").html("<select id = 'task' name = 'task'><option value = 'exercise'>exercise</option></select>");
  		} else if (num == 5){
  			$("#category").html("<select id = 'task' name = 'task'><option value = 'help'>help</option><option value = 'do'>do</option></select>");
  		} else if (num == 6){
  			$("#category").html("<select id = 'task' name = 'task'><option value = 'like'>like</option><option value = 'dislike'>dislike</option></select>"); 			
  		}
  	}; 
  	var Submit = function(){  
  		var text = document.getElementById('diary').value.trim();
  		if (text == "" || text == ''){
  			document.getElementById('buttonText').disabled = true;
  			return false;
  		}
  		$("#textDiary").html("<input type = 'hidden' id = 'diary' value = '"+text+"'");
  		return true;
  	};  
</script> 
  </body>
</html>
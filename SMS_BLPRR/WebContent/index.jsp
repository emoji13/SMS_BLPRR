<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
</head>
<jsp:include page="pages/loginHeader.jsp"></jsp:include>
<body  style=" padding-top: 60px;">
	<div id="test" align="center" class="container" style="width: 400px; " ></div>
	<br>
	<div align="center" class="container" style="width: 400px; " >
	<form >
		<h2 class="text-center">Sign In</h2> <br>
		<div class="form-group has-error">
			
			<input type="text" id="txtUsername" name="username" class="form-control" placeholder="Username" required="required"/>
		</div>
		
		<div class="form-group">	
			<input type="password" id="txtPassword" name="password" class="form-control" placeholder="Password" required="required"/>
		</div>
		
		<div class="form-group">
			<button type="button" id="btnLogin" name="login" class="btn btn-primary btn-lg btn-block">Login To Your Account</button>
		</div>
		
			<!-- hidden -->
			<input type="hidden" id="idTag" value="N"/>
			<br>
	</form>
	<br>	
	</div>

</body>
<jsp:include page="pages/footer.jsp"></jsp:include>
<script>
$("btnLogin").observe("click", function(){
	updateRecord();
});
	function updateRecord(){		
		new Ajax.Request(contextPath + "/login", {
			method: "POST",
			parameters: {
				action: "updateRecord",
				username: $F("txtUsername"),
				password: $F("txtPassword"),
				activeTag: $F("idTag")
			},
			onComplete: function(response){
				if(response.getHeader("status") == "success"){
					window.location.assign(contextPath + "/home")
				}else{
					$("txtPassword").value = "";
					
					$("txtUsername").value = "";
					$("test").update(response.responseText);
				}
			}
		});
	}

</script>
</html>
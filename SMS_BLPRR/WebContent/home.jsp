<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Supplies Management System - Home</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
<style>
body { padding-top:150px;}
.panel-body .btn:not(.btn-block) { width:250px;margin-bottom:10px; }
</style>
</head>
<jsp:include page="pages/header.jsp"></jsp:include>
<body>
	<div class="col-md-3"></div>
	<div class="col-md-5">
	<div class="container" style="margin-left: 40px;">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-home"></span> Welcome, ${user}!</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6 col-md-6">
                          <a href="user" class="btn btn-danger btn-lg" role="button"><span class="glyphicon glyphicon-user"></span> <br/>Users</a>
                          <a href="supplylistings" class="btn btn-warning btn-lg" role="button"><span class="glyphicon glyphicon-tasks"></span> <br/>Supplies</a>
                           </div>
                        <div class="col-xs-6 col-md-6">
                          <a href="issueSupplies" class="btn btn-success btn-lg" role="button"><span class="glyphicon glyphicon-list-alt"></span> <br/>Issue Supplies</a>
                          <a href="supplystock" class="btn btn-info btn-lg" role="button"><span class="glyphicon glyphicon-folder-close"></span> <br/>Add Stocks</a>
                          </div>
                    </div>
                   </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    <div class="col-md-4"></div>
</body>
<jsp:include page="pages/footer.jsp"></jsp:include>
</html>
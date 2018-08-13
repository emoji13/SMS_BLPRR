<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplies Management System - Supplies Issuance - Issue Supplies</title>
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/> 
<link href="css/issueSupplyStyle.css" type="text/css" rel="stylesheet"/> 

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<input type="text" class="hidden" id="txtIssueId"/>
	<div class="col-md-2"></div>
	<div style="margin-top:50px;" class="jumbotron col-md-8">
		<div class="col-md-2"></div>
		<div class="col-md-7">
			<div class="panel panel-primary">
				<div class="panel-heading col-md-12">
					<h2 id="title" class="panel-title">Issue Request Info</h2>
				</div>
				<div class="panel-body">
					<div>
						<div class = "col-md-4 ">
							<label style="margin-top:5%;">Item Name:</label>
						</div>
						<div class="col-md-2"></div>
						<div class = "col-md-6">
							<select id="selSupply" class="form-control" style="cursor:default;">
							<c:forEach items="${supList}" var="supply">
								<c:if test="${supply.obsoleteTag != 'Y'}">
								<option value="${supply.supplyID}">${supply.itemName}</option>
								</c:if>
							</c:forEach>
							</select>
						</div>
					</div>
					<div>
						<div class = "col-md-4 ">
							<label style="margin-top:5%;">Quantity:</label>
						</div>
						<div class="col-md-2"></div>
						<div class = "col-md-6">
							<input type="text" class="form-control input-group" id="txtQuantity"/>
						</div>
					</div>
					<div>
						<div class = "col-md-4 ">
							<label style="margin-top:5%;">Requested by:</label>
						</div>
						<div class="col-md-2"></div>
						<div class = "col-md-6">
							<input type="text" class="form-control input-group" id="txtRequestor"/>
						</div>
					</div>
					<div>
						<div class = "col-md-4 ">
							<label style="margin-top:5%;">Department:</label>
						</div>
						<div class="col-md-2"></div>
						<div class = "col-md-6">
							<select id="selDept" class="form-control">
							<c:forEach items="${departments }" var="dept">
								<option value="${dept.deptId}">${dept.deptName}</option>
							</c:forEach>
							</select>
						</div>
					</div>
					<div>
						<div class = "col-md-4">
							<label style="margin-top:5%;">Issue Date:</label>
						</div>
						<div class="col-md-2"></div>
						<div class = "col-md-6">
							<input type="date" name="bday" id="txtIssueDate" class="form-control input-group" placeholer="YYYY-MM-DD">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class ="col-md-3">
			<div style="margin-top:80%;">
				<div class = "col-md-12" ><button type="button" style="width:100%;" class="btn btn-primary" id="btnIssueRequest">Issue Request</button></div>
		      	<div class = "col-md-12" ><button type="button" style="width:100%; margin-bottom:20px;" class="btn btn-primary hidden" id="btnSave" >Save</button></div>
		      	<div class = "col-md-12" ><button type="button" style="width:100%;" class="btn btn-primary hidden" id="btnCancel">Cancel</button></div>
			</div>
		</div>
		
		<div>
			<div id="error" class="alert alert-danger hidden col-md-12" role="alert" style="text-align:center;"></div>
		</div>
		<div style="height:50px;"></div>
		<div id="list">
			<div class = "col-md-12">
				<div class="panel panel-info">
			      <div class="panel-heading">
			      	<div class="col-md-3" style="margin-top:1%;"><h3 class="panel-title" >Issue Request List</h3></div>
			        <div class="input-group col-md-9">
				      <input id="txtSearch" type="text" class="form-control" placeholder="Search for Issue ID or Item Name">
				      <span class="input-group-btn">
				        <button class="btn btn-primary" type="button" id="btnSearch">Go!</button>
				      </span>
				    </div>
			      </div>
			      <div id="issueList" class="panel-body"></div>
			    </div>
			</div>
		</div>
	
	</div>
	<div class="col-md-2"></div>
	<div id="myModal" class="modal">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="modal-content">
			    <div class="modal-header">
			      <h3>Issue Request</h3>
			    </div>
			    <div class="modal-body">
			      <p id="modalBody1"></p>
			      <p id="modalBody2"></p>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn-primary" id="btnOk">OK</button>
			    </div>
		  </div>
		</div>
	    <div class="col-md-3"></div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="js/prototype.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script src="js/issueSupplies.js"></script>
<script>
$("suppliesHeader").addClassName("active");
loadIssueList();
</script>
</html>
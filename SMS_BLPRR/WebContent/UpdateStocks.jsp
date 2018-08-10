<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Supplies System Management - Supplies Stocks - Update Stocks</title>
<script src="js/prototype.js"></script>
</head>
<body>

<div id="addStocks" style="padding-top: 50px;">
	<div class="col-md-1">
	</div>
	<div class="col-md-9">
		<div class = "panel panel-primary">
				<div class= "panel-heading"> Add Stocks </div>
				<div class = "panel-body">
					<h2 style="text-align: center;"> Stocks </h2>
						<div class="col-md-4"></div>
						<div class="col-md-4 container">
						<label>Item Name</label>
						<select id="supplyName" class="form-control" required>
							<option value="1">Sample 1</option>
							<option value="2">Sample 2</option>
						</select>
						<label>Quantity</label>
						<input type="text" id="quantity" class="form-control" required>
						<label>Reference No.</label>
						<input type="text" id="referenceNumber" class="form-control">
						<label>Date Added</label>
						<input type="text" id="dateAdded" class="form-control" required>
						<label></label>
						<label>Purchase Date</label>
						<input type="text" id="purchaseDate" class="form-control" required>
						<input type="hidden" id="lastUpdateBy" value="SESSIONUSER">
						<input type="hidden" id="lastUpdate" value="SYSDATE">
						<br>
						<div class = "text-center">
						<input type="button" class="btn btn-primary" id="btnAddStocks" value="Add Stocks" title="Add stocks to supplies">
						<input type="button" class="btn btn-success" id="btnSave" value="Save" disabled style="cursor:default" title="Update stocks to supplies">
						<input type="button" class="btn btn-danger" id="btnCancel" value="Cancel" disabled style="cursor:default" title="Cancel stocks">
						</div>
						</div>
						<div class="col-md-4"></div>
				</div>
			</div>
			
		</div>
	<div class="col-md-1"></div>
</div>
</body>
<script src="js/bootstrap.js"></script>
</html>
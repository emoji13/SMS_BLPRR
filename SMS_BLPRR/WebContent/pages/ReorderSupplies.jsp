<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Supplies System Management - Supplies Stocks - Reorder
	Supplies</title>
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
<style>
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%; 
	height: 100%; 
	overflow: auto; 
	background-color: rgb(0, 0, 0); 
	background-color: rgba(0, 0, 0, 0.4);
}


.modal-content {
	background-color: #fefefe;
	margin: 15% auto; 
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: gray;
	float: right;
	font-size: 50px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="suppliesStocksAll">
		<!-- for supplies stock page -->
		<div id="suppliesStocks" style="padding-top: 60px;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-primary" style="box-shadow: 5px 5px lightblue">
					<div class="panel-heading">Reorder Supplies</div>
					<div class="panel-body">
						<div id="addStocks">
							<h2 style="text-align: center;">Stocks</h2>
							<div class="col-md-4"></div>
							<div class="col-md-4 container">
								<c:forEach var="names" items="${supplyAllNamesList}">
										<input type="hidden" id="quantityID<c:out value="${names.supplyID}"></c:out>" value="<c:out value="${names.actualCount}"></c:out>">
								</c:forEach>
								<label>Item Name</label> 
								<input type="text" id="supplyName" class="form-control" disabled="disabled" style="cursor: default"> 
								<label>Quantity</label><input type="text" id="quantity" class="form-control" disabled="disabled" style="cursor: default">
								<label>Reference No.</label>
								<input type="text" id="referenceNumber" class="form-control" disabled="disabled" style="cursor: default"> 
								<label>Date Added</label>
								<input type="text" id="dateAdded" placeholder="dd/mm/yyyy" disabled style="cursor: default;" class="form-control" required> 
								<label>Purchase Date</label> 
								<input type="text" id="purchaseDate" class="form-control" disabled="disabled" style="cursor: default" required placeholder="dd/mm/yyyy">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<input type="hidden" id="addLastUpdated" value="<fmt:formatDate value="${now}" pattern="dd/MM/yyyy"/>">
								<input type="hidden" id="updateLastUpdate" value="<fmt:formatDate value="${now}" pattern="dd/MM/yyyy"/>">
								<br>
							</div>
							<div class="col-md-4"></div>
						</div>
						<div class="col-md-12">
							<hr>
							<div class="col-md-4">
								<label>Search</label> <span
									class="glyphicon glyphicon glyphicon-search" aria-hidden="true"></span>
								<div class="input-group">
									<input type="text" id="search" class="form-control" placeholder="Search for Stock ID or Item Name only...">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" id="btnSearch">Search!</button>
									</span>
								</div>
								<!-- /input-group -->
							</div>
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<input type="button" class="btn btn-primary" id="btnAddStocks" value="Add Stock" title="Add stocks to supplies" style="float: right; margin-top: 30px;">
							</div>
						</div>
						<div class="col-md-12">
							<br>
							<div class="table-responsive">
								<table class="table table-bordered" id="stockSuppliesTable">
									<tr>
										<th>Stock ID <span
											class="glyphicon glyphicon glyphicon-question-sign"
											aria-hidden="true"
											title="click the Stock ID to edit its info."></span></th>
										<th>Item Name</th>
										<th>Qty</th>
										<th>Reference No.</th>
										<th>Date Added</th>
										<th>Purchase Date</th>
										<th>Last Updated By</th>
										<th>Last Update</th>
									</tr>
									<c:forEach var="stock" items="${supplyStockList}">
										<tr id="<c:out value="${stock.stockID}"></c:out>">
											<td style="color: blue; cursor: pointer;" title="Edit Stock"
												id="id<c:out value="${stock.stockID}"></c:out>"><c:out
													value="${stock.stockID}"></c:out></td>
											<td id="<c:out value="${stock.supplyID}"></c:out>"><c:out
													value="${stock.supplyName}"></c:out></td>
											<td><c:out value="${stock.quantity}"></c:out></td>
											<td><c:out value="${stock.referenceNumber}"></c:out></td>
											<td><c:out value="${stock.dateAdded}"></c:out></td>
											<td><c:out value="${stock.purchaseDate}"></c:out></td>
											<td><c:out value="${stock.lastUser}"></c:out></td>
											<td><c:out value="${stock.lastUpdate}"></c:out></td>
										</tr>
									</c:forEach>

								</table>
							</div>
							<div class="alert alert-danger" role="alert" id="alertError">
								<strong id="alertMessage"></strong>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<!-- for add div -->
		<div id="addSupplyStock" style="padding-top:60px;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-primary">
					<div class="panel-heading">Reorder Supplies</div>
					<div class="panel-body">
						<div class="alert alert-danger" role="alert" id="alertErrorAdd">
							<strong id="alertMessageAdd"></strong>
						</div>
						<div class="col-md-12">
							<br>
							<div id="updateStocks">
								<h2 style="text-align: center;">Add Stock</h2>
								<div class="col-md-4"></div>
								<div class="col-md-4 container">
									<label>Item Name</label>
									<span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true" style="color: red"></span> 
									<select id="addSupplyName" class="form-control" required>
									<c:forEach var="names" items="${supplyNamesList}">
									 <option id="addName<c:out value="${names.supplyID}"></c:out>" value="<c:out value="${names.supplyID}"></c:out>"><c:out value="${names.itemName}"></c:out></option>
									</c:forEach>
									</select>
									 <label>Quantity</label>
									 <small><span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true" style="color: red"></span></small>
									 <input type="text" maxlength="10" id="addQuantity" class="form-control" required>
									 <label>Reference No.</label>
								     <input type="text" id="addReferenceNumber" maxlength="20" value="" class="form-control">
									 <label>Date Added</label>
									 <small><span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true" style="color: red"></span></small>
									 <c:set var="addStockNow" value="<%=new java.util.Date()%>" />
									 <input type="text" id="addDateAdded" disabled style="cursor: default;"  class="form-control" required value="<fmt:formatDate value="${addStockNow}" pattern="dd/MM/yyyy"/>">
									 <label>Purchase Date</label>
									 <small><span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true" style="color: red"></span></small>
									 <input type="text" id="addPurchaseDate" class="form-control" required placeholder="dd/mm/yyyy" maxlength="10"> 
									 <input type="hidden" id="addLastUpdateBy" value="SESSIONUSER"> 	
									<br>
									<div class="text-center">
										<input type="button" class="btn btn-success" id="btnAddSave" value="Save" style="cursor: default" title="Add stock">
										<input type="button" class="btn btn-danger" id="btnAddCancel" value="Cancel" style="cursor: default" title="Cancel stock">
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<!-- for update div -->
		<div id="updateSupplyStock" style="padding-top:60px;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-primary">
					<div class="panel-heading">Reorder Supplies</div>
					<div class="panel-body">
						<div class="alert alert-danger" role="alert" id="alertErrorUpdate">
							<strong id="alertMessageUpdate"></strong>
						</div>
						<div class="col-md-12">
							<br>
							<div id="updateStocks">
								<h2 style="text-align: center;">Update Stock Info.</h2>
								<div class="col-md-4"></div>
								<div class="col-md-4 container">
									<input type="hidden" id="updateStockID">
									<input type="hidden" id="updateActualCount"> 
									<input type="hidden" id="updateQuantityBefore">
									<label>Item Name</label>
									<span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true" style="color: red"></span> 
									<select id="updateSupplyName" class="form-control" required disabled style="cursor: default;">
									<c:forEach var="names" items="${supplyAllNamesList}">
									 <option id="updateName<c:out value="${names.supplyID}"></c:out>" value="<c:out value="${names.supplyID}"></c:out>"><c:out value="${names.itemName}"></c:out></option>
									</c:forEach>
									</select>
									<label>Quantity</label>
									<small><span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true" style="color: red"></span></small> 
									<input type="text" id="updateQuantity" disabled maxlength="10" class="form-control" required style="cursor: default;">
									<label>Reference No.</label>
									<input type="text" id="updateReferenceNumber" class="form-control" maxlength="10">
									<label>Date Added</label>
									<small><span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true" style="color: red"></span></small> 
									<input type="text" id="updateDateAdded" disabled style="cursor: default;" class="form-control" required>
									<label>Purchase Date</label>
									<small><span class="glyphicon glyphicon glyphicon-asterisk" aria-hidden="true" style="color: red"></span></small> 
									<input type="text" id="updatePurchaseDate" maxlength="10" class="form-control" required placeholder="dd/mm/yyyy">
									 <input type="hidden" id="updateLastUpdateBy" value="SESSIONUSER">
									<br>
									<div class="text-center">
										<input type="button" class="btn btn-success" id="btnUpdateSave" value="Save" style="cursor: default" title="Update stocks to supplies"> 
										<input type="button" class="btn btn-danger" id="btnUpdateCancel" value="Cancel" style="cursor: default" title="Cancel stocks">
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<!-- Modal -->
	<div id="modalSuccess" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<h4 id="modalMessage"></h4>
		</div>
	</div>
    <jsp:include page="footer.jsp"/>
</body>
<script src="js/bootstrap.js"></script>
<script>
	$("alertError").hide();
	$("alertErrorAdd").hide();
	$("alertErrorUpdate").hide();
	$("updateSupplyStock").hide();
	$("addSupplyStock").hide();
	clearFields();
	var modal = document.getElementById('modalSuccess');
	var span = document.getElementsByClassName("close")[0];
	var tableRows = document.getElementById('stockSuppliesTable').rows.length;
	var rec = [];
	var addObj = {};
	var recUpdate = [];
	var updtObj = {};
	
	//for header active
	$("stocksHeader").addClassName("active");

	// for add stocks
	$("btnAddStocks").observe("click",function() {
			$("suppliesStocks").hide();
			$("addSupplyStock").show();
			$("updateSupplyStock").hide();

	});
	// for save
	$("btnAddSave").observe("click",function() {

		    var supplyNameID = $F("addSupplyName");
			var quantity = $F("addQuantity");
			var referenceNumber = $F("addReferenceNumber");
			var dateAdded = $F("addDateAdded");
			var purchaseDate = $F("addPurchaseDate");
			var lastUpdateBy = $F("addLastUpdateBy");
			var lastUpdate = $F("addLastUpdated");		
						
			if (!(/^\d+$/.test(quantity))) {
				$("alertMessageAdd").innerHTML = "Please enter a valid quantity.";
				$("alertErrorAdd").show();
			} else if (supplyNameID == null) {
				$("alertMessageAdd").innerHTML = "Please choose an item.";
				$("alertErrorAdd").show();
			} else if (quantity < 1) {
				$("alertMessageAdd").innerHTML = "Zero or Negative numbers are not allowed";
				$("alertErrorAdd").show();
			} else if (quantity.length == 0) {
				$("alertMessageAdd").innerHTML = "Please enter a quantity. Quantity is a required field";
				$("alertErrorAdd").show();
			} else if (dateAdded.length == 0) {
				$("alertMessageAdd").innerHTML = "Please enter date added. Date Added is a required field";
				$("alertErrorAdd").show();
			} else if (!(/^\d+$/.test(referenceNumber))) {
				$("alertMessageAdd").innerHTML = "Please enter a valid reference number.";
				$("alertErrorAdd").show();
			} else if (purchaseDate.length == 0) {
				$("alertMessageAdd").innerHTML = "Please enter the purchase date. Purchase Date is a required field";
				$("alertErrorAdd").show();
			} else if (!(/^(0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[012])[\/]\d{4}$/.test(purchaseDate))) {
				$("alertMessageAdd").innerHTML = "Please follow the date format or enter a valid date.";
				$("alertErrorAdd").show();
			} else {
				var supplyName = $("addName" + supplyNameID).innerHTML;
				addObj.supplyID = supplyNameID;
				addObj.quantity = quantity;
				addObj.referenceNumber = referenceNumber;
				addObj.dateAdded = dateAdded;
				addObj.purchaseDate = purchaseDate;
				addObj.lastUpdateBy = lastUpdateBy;
				addObj.lastUpdate = lastUpdate;

				rec.push(addObj);

				new Ajax.Request(contextPath + "/saveSupplyStock",{
							method : "POST",
							parameters : {
							action : "insertSupplyStock",
							supplyID : addObj.supplyID,
							quantity : addObj.quantity,
							referenceNumber : addObj.referenceNumber,
							dateAdded : addObj.dateAdded,
							purchaseDate : addObj.purchaseDate,
							lastUpdateBy : addObj.lastUpdateBy,
							lastUpdate : addObj.lastUpdate
							},
							onComplete : function(response) {
								modal.style.display = "block";
								$("modalMessage").innerHTML = "Stock Added!";
								span.onclick = function() {
								window.location.reload();
									}
								}
							});
						}
					});

	// for save update
	$("btnUpdateSave").observe("click",function() {
			var stockID = $F("updateStockID");
			var supplyNameID = $F("updateSupplyName");
			var supplyName = $("updateName" + supplyNameID).innerHTML
			var actualCount = parseInt($F("updateActualCount"));
			var quantityBefore = parseInt($F("updateQuantityBefore"));
			var quantity = parseInt($F("updateQuantity"));
			var referenceNumber = $F("updateReferenceNumber");
			var dateAdded = $F("updateDateAdded");
			var purchaseDate = $F("updatePurchaseDate");
			var lastUpdateBy = $F("updateLastUpdateBy");
			var lastUpdate = $F("updateLastUpdate");
			var newQuantity = 0;
			var updateQuantity = 0;
						
				if (quantity > quantityBefore) {
					newQuantity = quantity - quantityBefore;
					updateQuantity = actualCount + newQuantity;
				} else if (quantity < quantityBefore) {
					newQuantity = quantityBefore - quantity;
					updateQuantity = actualCount - newQuantity;
				} else if (quantity == quantityBefore) {
					newQuantity = quantityBefore;
					updateQuantity = actualCount;
				}
				if (updateQuantity < 0) {
					$("alertMessageUpdate").innerHTML = "Actual count of the supply is insufficient.";
					$("alertErrorUpdate").show();
				} else if (!(/^\d+$/.test(quantity))) {
					$("alertMessageUpdate").innerHTML = "Please enter a valid quantity.";
					$("alertErrorUpdate").show();
				} else if (quantity < 1) {
					$("alertMessageAdd").innerHTML = "Zero or Negative numbers are not allowed";
					$("alertErrorAdd").show();
				} else if (quantity.length == 0) {
					$("alertMessageUpdate").innerHTML = "Please enter a quantity. Quantity is a required field";
					$("alertErrorUpdate").show();
				} else if (dateAdded.length == 0) {
					$("alertMessageUpdate").innerHTML = "Please enter date added. Date Added is a required field";
					$("alertErrorUpdate").show();
				} else if (!(/^\d+$/.test(referenceNumber))) {
					$("alertMessageUpdate").innerHTML = "Please enter a valid reference number.";
					$("alertErrorUpdate").show();
				} else if (purchaseDate.length == 0) {
					$("alertMessageUpdate").innerHTML = "Please enter the purchase date. Purchase Date is a required field";
					$("alertErrorUpdate").show();
				} else if (!(/^(0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[012])[\/]\d{4}$/.test(purchaseDate))) {
					$("alertMessageUpdate").innerHTML = "Please follow the date format or enter a valid date.";
					$("alertErrorUpdate").show();
				} else {
					updtObj.stockID = stockID;
					updtObj.supplyID = supplyNameID;
					updtObj.quantity = quantity;
					updtObj.updateQuantity = updateQuantity
					updtObj.referenceNumber = referenceNumber;
					updtObj.dateAdded = dateAdded;
					updtObj.purchaseDate = purchaseDate;
					updtObj.lastUpdateBy = lastUpdateBy;
					updtObj.lastUpdate = lastUpdate;

					recUpdate.push(updtObj);

					new Ajax.Request(contextPath + "/updateSupplyStock",{
								method : "POST",
								parameters : {
								action : "updateSupplyStock",
								stockID : updtObj.stockID,
								supplyID : updtObj.supplyID,
								quantity : updtObj.quantity,
								updateQuantity : updtObj.updateQuantity,
								referenceNumber : updtObj.referenceNumber,
								dateAdded : updtObj.dateAdded,
								purchaseDate : updtObj.purchaseDate,
								lastUpdateBy : updtObj.lastUpdateBy,
								lastUpdate : updtObj.lastUpdate},
								onComplete : function(response) {
									modal.style.display = "block";
									$("modalMessage").innerHTML = "Stock Updated!";
									span.onclick = function() {
										window.location.reload();
											}
										}
									});
						}
					});

	// for looping of update
	for (var i = 1; i < tableRows; i++) {
		var id = $("stockSuppliesTable").down("tr", i).readAttribute("id");
		updateStockGetter(id);
		
		$(id).observe("click", function() {
			var itemName = ($(this.id).down("td", 1).innerHTML);
			var quantity = ($(this.id).down("td", 2).innerHTML);
			var referenceNumber = ($(this.id).down("td", 3).innerHTML);
			var dateAdded = ($(this.id).down("td", 4).innerHTML);
			var purchaseDate = ($(this.id).down("td", 5).innerHTML);
			
			$("supplyName").value = itemName;
			$("quantity").value = quantity;
			$("referenceNumber").value = referenceNumber;
			$("dateAdded").value = dateAdded;
			$("purchaseDate").value = purchaseDate;
			window.scrollTo(0, 0);
			   
		});
	}
	
	function clearFields(){

		$("supplyName").value = "";
		$("dateAdded").value = "";
		$("quantity").value = "";
		$("referenceNumber").value = "";
		$("purchaseDate").value = "";
		$("addSupplyName").value = 1;
		$("addQuantity").value = "";
		$("addReferenceNumber").value = "";
		$("addPurchaseDate").value = "";
		
		
	}

	function updateStockGetter(id) {
		$("id" + id).observe("click", function() {
			var stockId = ($(id).down("td", 0).innerHTML);
			var itemID = ($(id).down("td", 1).readAttribute("id"));
			var actualCount = $("quantityID" + itemID).value;
			var itemName = ($(id).down("td", 1).innerHTML);
			var quantity = ($(id).down("td", 2).innerHTML);
			var referenceNumber = ($(id).down("td", 3).innerHTML);
			var dateAdded = ($(id).down("td", 4).innerHTML);
			var purchaseDate = ($(id).down("td", 5).innerHTML);
			var lastUpdatedBy = ($(id).down("td", 6).innerHTML);
			var lastUpdated = ($(id).down("td", 7).innerHTML);

			$("suppliesStocks").hide();
			$("addSupplyStock").hide();
			$("updateSupplyStock").show();

			$("updateStockID").value = stockId;
			$("updateSupplyName").value = itemID;
			$("updateQuantityBefore").value = quantity;
			$("updateQuantity").value = quantity;
			$("updateActualCount").value = actualCount;
			$("updateReferenceNumber").value = referenceNumber;
			$("updateDateAdded").value = dateAdded;
			$("updatePurchaseDate").value = purchaseDate;
			$("updateLastUpdateBy").value = lastUpdatedBy;
			$("updateLastUpdate").value = lastUpdated;

		});
	}

	//for cancel edit

	$("btnUpdateCancel").observe("click", function() {
		cancel();
	});

	//for cancel add

	$("btnAddCancel").observe("click", function() {
		cancel();
	});

	function cancel() {
		$("suppliesStocks").show();
		$("updateSupplyStock").hide();
		$("addSupplyStock").hide();
		$("alertError").hide();
		$("alertErrorAdd").hide();
		$("alertErrorUpdate").hide();

	}

	//no result
	if ('${supplyStockList}' == "[]") {
		var column = "<tr id='noSearchResult'> <td colspan = '8' style='text-align: center'> No Result Found </td> </tr>";
		$("stockSuppliesTable").insert({
			bottom : column
		});
	}

	//for search
	$("btnSearch").observe("click", function() {
		new Ajax.Request(contextPath + "/searchsupplystock", {
			method : "POST",
			parameters : {
				action : "searchSupplyStock",
				search : $F("search"),
			},
			onComplete : function(response) {
				$("suppliesStocksAll").update(response.responseText);

			}
		});

	});
</script>
</html>
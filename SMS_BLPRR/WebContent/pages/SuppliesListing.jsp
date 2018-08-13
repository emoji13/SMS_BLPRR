<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplies Management System - Supplies Listing</title>
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
<!-- <script src="js/bootstrap.min.js"></script> -->
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br>
<div id="mainContents">
<div id="divOutsideSupplyTable">

<div class="col-md-1"></div>
<div class="col-md-10" style="padding-top:50px;">
	<div class="panel panel-primary">
  		<div class="panel-heading">
    	<h3 class="panel-title"><strong>Supply Viewer</strong></h3>
  		</div>
  	<div class="panel-body">
		<div class="col-md-6">

			<div class="col-md-4">
				Supply Type
			</div>
				<div class="col-md-8">
				<select class="form-control" id="selSupplyTypeID" disabled="disabled" style="width:300px; display:block;">
					<option value="None"></option>
						<c:forEach var="supType" items="${supTypesList}">
							<option value="${supType.supplyTypeID}">${supType.typeName}</option>
						</c:forEach>
				</select>
				</div>	
		</div>
		<div class="col-md-6">
			<div class="col-md-4">
				Entered Date
			</div>
			<div class="col-md-8">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtDateAdded" class="form-control" aria-describedby="basic-addon1" disabled="disabled" size="52px">
				</div>
			</div>
		</div>
		<div class="col-md-12"> </div>
		<div class="col-md-6">
			<div class="col-md-4">
				Item Name
			</div>
			<div class="col-md-8">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtItemName" class="form-control" aria-describedby="basic-addon1" disabled="disabled" size="52px">
				</div>
			</div>

		</div>
		<div class="col-md-6">
			<div class="col-md-4">
				Reorder Level
			</div>
			<div class="col-md-8">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtReorderLevel" class="form-control" aria-describedby="basic-addon1" disabled="disabled" size="20px">
				</div>
			</div>
		</div>
		<div class="col-md-12"> </div>
		<div class="col-md-6">
			<div class="col-md-4">
				Item Unit
			</div>
			<div class="col-md-8">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtItemUnit" class="form-control" aria-describedby="basic-addon1" disabled="disabled" size="52px">
				</div>
			</div>

		</div>
		<div class="col-md-6">
			<div class="col-md-4">
				Actual Count
			</div>
			<div class="col-md-8">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtActualCount" class="form-control" aria-describedby="basic-addon1" disabled="disabled" size="20px">
				</div>
			</div>
		</div>
		<div class="col-md-12"> </div>
		<div class="col-md-6">
			<div class="col-md-4">
			Obsolete Tag
   			 </div>
			
			<div class="col-md-4">
			<div class="input-group">
      			<span class="input-group-addon">
       			 <input type="radio" id="isObsolete" value="Y" aria-label="..." name="obsolete" disabled="disabled">
      			</span>
     			 <input type="text" class="form-control" placeholder="YES" disabled="disabled">
   			 </div>
   			 </div>
   			 <div class="col-md-4">
			<div class="input-group">
      			<span class="input-group-addon">
       			 <input type="radio" id="isNotObsolete" value="N" aria-label="..." name="obsolete" disabled="disabled">
      			</span>
     			 <input type="text" class="form-control" placeholder="NO" disabled="disabled">
   			 </div>
   			 </div>	

		</div>
		<div class="col-md-6">
			<div class="col-md-4">
				Location
			</div>
			<div class="col-md-8">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtLocation" class="form-control" aria-describedby="basic-addon1" disabled="disabled" size="52px">
				</div>
			</div>
		</div>
		<div class="col-md-12"> </div>
		<div class="col-md-6">
			<div class="col-md-4">
				Remarks
			</div>
			<div class="col-md-8 col-sm-2">
				<textarea id="txtRemarks" class="form-control inputstl" rows="2" disabled="disabled"></textarea>
			</div>

		</div>
		<div class="col-md-6" style="display:none">
			<div class="col-md-5">
				Supply ID
			</div>
			<div class="col-md-7">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtSupplyID" class="form-control" aria-describedby="basic-addon1" disabled="disabled" size="35px">
				</div>
			</div>
		</div>
	</div>

	</div>
</div>
<div class="col-md-1"></div>


<div class="col-md-4"></div>
<div class="col-md-8">
<input type="button" class="btn btn-default buttonInput" id="btnAdd" name="btnAdd" value="Add New"> 
<input type="button" class="btn btn-default buttonInput" id="btnCancel" value="Cancel"> 
<br><br>
</div>
<div class="col-md-12"></div>

<div class="col-md-4"></div>
<div class="col-md-4">
	<div class="input-group input-group-sm">
  		<input type="text" id="txtSearch" class="form-control" placeholder="Search for Supply ID"aria-describedby="basic-addon1" size="35px">
	</div>
</div>
<div class="col-md-4"></div>
</div>
<div id="divSuppliesList">
<div class="col-md-1"></div>
<div class="col-md-12">
<table id="supplieslist" class="table table-hover table-condensed" style="text-align: center">
	<thead>
	<tr class="suppliesListHeaders">
		<td width="40px"><h5>Supply ID</h5></td>
		<td width="120px"><h5>Supply Type</h5></td>
		<td width="120px" style="display:none"><h5>Supply Type ID</h5></td>
		<td width="120px"><h5>Item Name</h5></td>
		<td width="120px"><h5>Item Unit</h5></td>
		<td width="120px"><h5>Obsolete Tag</h5></td>
		<td width="120px"><h5>Location</h5></td>
		<td width="120px"><h5>Reorder Level</h5></td>
		<td width="120px"><h5>Actual Count</h5></td>
		<td width="120px"><h5>Remarks</h5></td>
		<td width="120px"><h5>Entry Date</h5></td>
		<td width="120px"><h5>Last Updated</h5></td>
		<td width="120px"><h5>Last Update</h5></td>
	</tr>
	</thead>
	<tbody id="suppliesListContents">
	<c:forEach var="sup" items="${supList}">
		<tr class="tablerow unselected"> 
			<td class="supID"><a href="#" id="supID" onclick="UpdateThisSupply();return false;">${sup.supplyID}</a></td>
			<td class="notSupID"><c:out value="${sup.typeName}"></c:out></td>
			<td class="notSupID" style="display:none"><c:out value="${sup.supplyTypeID}"></c:out></td>
			<td class="notSupID"><c:out value="${sup.itemName}"></c:out></td>
			<td class="notSupID"><c:out value="${sup.itemUnit}"></c:out></td>
			<td class="notSupID"><c:out value="${sup.obsoleteTag}"></c:out></td>
			<td class="notSupID"><c:out value="${sup.location}"></c:out></td>
			<td class="notSupID"><c:out value="${sup.reorderLevel}"></c:out></td>
			<td class="notSupID"><c:out value="${sup.actualCount}"></c:out></td>
			<td class="notSupID"><c:out value="${sup.remarks}"></c:out></td>
			<td class="notSupID"><fmt:formatDate type="date" value="${sup.dateAdded}" /></td>
			<td class="notSupID"><c:out value="${sup.lastUser}"></c:out></td>
			<td class="notSupID"><fmt:formatDate type="date" value="${sup.lastUpdate}" /></td>
		
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>

<div class="col-md-1"></div>
</div>
</div>

<div id="myModalNumericWarning" class="modal">
 
  <div class="modal-content">
    <div class="modal-header-warning">
    <span id="myModalNumericWarningClose" class="closeModal">&times;</span>
    <h2>Warning!</h2>
 	</div>
 	<div class="modal-body">
    <p>Please refrain from typing non-numeric characters</p>
  </div>
  </div>
  
</div>
<br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>

<script>


$("maintenanceHeaders").writeAttribute("style", "background-color: black; color: white");
var id = 0;
var currentRow = -1;
var rec = [];
var addObj = {};

window.addEventListener ? 
		window.addEventListener("load",initializeVals(),false) : 
		window.attachEvent && window.attachEvent("onload",initializeVals());
		
function initializeVals() {
	
	$('isObsolete').checked = false;
	$('isNotObsolete').checked = false;
	$('selSupplyTypeID').selectedIndex = -1;
	$("txtItemName").value = "";
	$("txtItemUnit").value = "";
	$("txtLocation").value = "";
	$("txtReorderLevel").value = "";
	$("txtActualCount").value = "";
	$("txtRemarks").value = "";
	$("txtDateAdded").value = "";
	$("txtSearch").value = "";
}


$("btnAdd").observe("click", function(){
	clearFields();
	goToSupplyMaintenanceAdd();
});

$("btnCancel").observe("click", function(){
	clearFields();
	window.location = contextPath + "/home";
});

$("txtSearch").observe("keyup", function(){
	if(isNaN($F("txtSearch"))){
		$("txtSearch").clear();
		$("myModalNumericWarning").style.display = "block";
		searchRecord();
	}
	else {
		searchRecord();
	}
	
});
$("myModalNumericWarningClose").observe("click", function() {
	$("myModalNumericWarning").style.display = "none"; 
});

window.onclick = function(event) {
    if (event.target == $("myModalNumericWarning")) {
    	$("myModalNumericWarning").style.display = "none";

    }
    
} 

$("divOutsideSupplyTable").observe("click", function(){
	$$(".selected").each(function(e) {
		e.addClassName("unselected");
		e.removeClassName("selected");
	 });
	$("txtSupplyID").value = "";
	$("txtItemName").value = "";
	$("txtItemUnit").value = "";
	$("txtLocation").value = "";
	$("txtReorderLevel").value = "";
	$("txtActualCount").value = "";
	$("txtRemarks").value = "";
	$("txtDateAdded").value = "";
	$('isObsolete').checked = false;
	$('isNotObsolete').checked = false;
	$("selSupplyTypeID").selectedIndex = -1;
});

function UpdateThisSupply() {
	clearFields();
	var supplyIDWithoutTags;
	$$(".tablerow").each(function(r){
		r.observe("click", function(){
			supplyIDWithoutTags = r.cells[0].innerHTML;
			supplyIDWithoutTags = supplyIDWithoutTags.replace(/<(?:.|\n)*?>/gm, '');
			new Ajax.Request(contextPath + "/supplymaintenance", {
				method: "GET",
				parameters: {
						page: "pages/SupplyMaintenance.jsp",
						buttonVal: "Update",
						supplyID: supplyIDWithoutTags,
						supplyTypeName: r.cells[1].innerHTML,
						supplyTypeID: r.cells[2].innerHTML,
						itemName: r.cells[3].innerHTML,
						itemUnit: r.cells[4].innerHTML,
						obsolete: r.cells[5].innerHTML,
						location: r.cells[6].innerHTML,
						reorderLevel: r.cells[7].innerHTML,
						actualCount: r.cells[8].innerHTML,
						remarks: r.cells[9].innerHTML
						
				},
				onComplete: function(response) {
					$("mainContents").update(response.responseText);
				}
			});
		
		
		});
	});
}


function clearFields() {
	$("txtSupplyID").value = "";
	$("txtItemName").value = "";
	$("txtItemUnit").value = "";
	$("txtLocation").value = "";
	$("txtReorderLevel").value = "";
	$("txtRemarks").value = "";
}


function searchRecord() {
	var searchID = "";
	if ($F("txtSearch") == null || $F("txtSearch") == "") {
		searchID = "";
	} else {
		searchID = $F("txtSearch");
	}
	new Ajax.Request(contextPath + "/searchsupplies", {
		method : "POST",
		parameters : {
			action : "searchRecord",
			searchKey : searchID
		},
		onComplete : function(response) {
			$("divSuppliesList").update(response.responseText);
		}
	});

}

function goToSupplyMaintenanceAdd() {
	new Ajax.Request(contextPath + "/supplymaintenance", {
		method : "GET",
		parameters : {
			page : "pages/SupplyMaintenance.jsp",
			buttonVal : "Add",
			itemName : "",
			itemUnit : "",
			location : "",
			reorderLevel : "",
			actualCount : "",
			remarks : ""

		},
		onComplete : function(response) {
			$("mainContents").update(response.responseText);
		}
	});
}

 $("supplieslist").observe("mouseover", function() {
	$$(".tablerow").each(function(r) {
		r.observe("click", function() {
			$$(".selected").each(function(e) {
				e.addClassName("unselected");
				e.removeClassName("selected");
			 });
				r.removeClassName("unselected");
				r.addClassName("selected");
				var supplyIDWithoutTags;
				supplyIDWithoutTags = r.cells[0].innerHTML;
				supplyIDWithoutTags = supplyIDWithoutTags.replace(/<(?:.|\n)*?>/gm, '');
				$("txtSupplyID").value = supplyIDWithoutTags;
				$('selSupplyTypeID').value = r.cells[2].innerHTML;
				$("txtItemName").value = r.cells[3].innerHTML;
				$("txtItemUnit").value = r.cells[4].innerHTML;
				$("txtLocation").value = r.cells[6].innerHTML;
				$("txtReorderLevel").value = r.cells[7].innerHTML;
				$("txtActualCount").value = r.cells[8].innerHTML;
				$("txtDateAdded").value = r.cells[10].innerHTML;
				$("txtRemarks").value = r.cells[9].innerHTML;
				var obsolete = r.cells[5].innerHTML;
				if (obsolete == 'Y') {
					$('isObsolete').checked = true;
				} else {
					$('isNotObsolete').checked = true;
				}	
				

		});
		
		
	});
}); 
</script>

</html>
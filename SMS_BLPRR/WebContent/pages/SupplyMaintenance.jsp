<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supply Maintenance</title>
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
 <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div id="mainContents">
<br><br>
<div class="col-md-1"></div>
<div class="col-md-10">
	<div class="panel panel-primary">
  		<div class="panel-heading">
    	<h3 class="panel-title"><strong>${buttonVal} Supply</strong></h3>
  		</div>
  	<div class="panel-body">
  		<div id="supplyIDRow" class="col-md-6">
			<div class="col-md-4">
				Supply ID
			</div>
			<div class="col-md-8">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtSupplyID" class="form-control" value="${supplyID}" aria-describedby="basic-addon1" size="35px">
				</div>
			</div>
		</div>
		<div class="col-md-6">
			
		</div>
		<div class="col-md-12"> </div>
		<div class="col-md-6">

			<div class="col-md-4">
				Supply Type
			</div>
				<div class="col-md-8">
				<select class="form-control" id="selSupplyTypeID" style="width:200px; display:block;">
						<c:forEach var="supType" items="${supTypesList}">
							<option value="${supType.supplyTypeID}">${supType.typeName}</option>
						</c:forEach>
				</select>
				</div>	
		</div>
		<div class="col-md-6">
			
		</div>
		<div class="col-md-12"> </div>
		<div class="col-md-6">
			<div class="col-md-4">
				Item Name
			</div>
			<div class="col-md-8">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtItemName" class="form-control" value="${itemName}" aria-describedby="basic-addon1" size="35px">
				</div>
			</div>

		</div>
		<div class="col-md-6">
			<div class="col-md-5">
				Reorder Level
			</div>
			<div class="col-md-7">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtReorderLevel" value="${reorderLevel}" class="form-control" aria-describedby="basic-addon1" size="35px">
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
  					<input type="text" id="txtItemUnit" class="form-control" value="${itemUnit}" aria-describedby="basic-addon1" size="35px">
				</div>
			</div>

		</div>
		<div class="col-md-6">
			<div class="col-md-5">
				Actual Count
			</div>
			<div class="col-md-7">
				<div class="input-group input-group-sm">
  					<input type="text" id="txtActualCount" class="form-control" value="${actualCount}" aria-describedby="basic-addon1" size="35px">
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
       			 <input type="radio" id="isObsolete" value="Y" aria-label="..." name="pangalanzzz">
      			</span>
     			 <input type="text" class="form-control" placeholder="YES" disabled="disabled">
   			 </div>
   			 </div>
   			 <div class="col-md-4">
			<div class="input-group">
      			<span class="input-group-addon">
       			 <input type="radio" id="isNotObsolete" value="N" aria-label="..." name="pangalanzzz">
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
  					<input type="text" id="txtLocation" class="form-control" value="${location}" aria-describedby="basic-addon1" size="35px">
				</div>
			</div>
		</div>
		<div class="col-md-12"> </div>
		<div class="col-md-6">
			<div class="col-md-4">
				Remarks
			</div>
			<div class="col-md-8 col-sm-2">
				<textarea id="txtRemarks" class="form-control inputstl" rows="2">${remarks}</textarea>
			</div>

		</div>
		<div class="col-md-6">
			
		</div>
		<div class="col-md-12"> </div>
		<div class="col-md-4">
			<input type="text" id="txtHideObsolete" value="${obsolete}" style="display:none">
		</div>
		<div class="col-md-4">
			<input type="text" id="txtHideSupTypeName" value="${supplyTypeName}" style="display:none">
		</div>
		<div class="col-md-4">
			<input type="text" id="txtHideSupTypeID" value="${supplyTypeID}" style="display:none">
		</div>
	</div>

	</div>
</div>
<div class="col-md-1"></div>
<br>
<%-- <table align="center" class="inputTable">

	<tr id="supplyIDRow">
		<td class="tdLabel"><label>Supply ID</label></td>
		<td width="10px"></td>
		<td width="220px"><input type="text" id="txtSupplyID" value="${supplyID}" size="30px"></td>
		<td width="100px"></td>
	</tr>
	<tr>
		<td class="tdLabel"><label>Supply Type Name</label></td>
		<td width="10px"></td>
		<td width="220px"><select id="selSupplyTypeID" style="width:200px; display:block;">
			<c:forEach var="supType" items="${supTypesList}">
				<option value="${supType.supplyTypeID}">${supType.typeName}</option>		
			</c:forEach>
			</select>
		</td>
		<td width="100px"></td>
		<td class="tdLabel"><label>Reorder Level</label></td>
		<td width="10px"></td>
		<td><input type="text" id="txtReorderLevel" value="${reorderLevel}" size="30px"></td>
	</tr>
	<tr>
		<td class="tdLabel"><label>Item Name</label></td>
		<td width="10px"></td>
		<td><input type="text" id="txtItemName" value="${itemName}" size="30px"></td>
		<td width="100px"></td>
		<td class="tdLabel"><label>Actual Count</label></td>
		<td width="10px"></td>
		<td><input type="text" id="txtActualCount" value="${actualCount}" size="30px"></td>
	</tr>
	<tr>
		<td class="tdLabel"><label>Item Unit</label></td>
		<td width="10px"></td>
		<td><input type="text" id="txtItemUnit" value="${itemUnit}" size="30px"></td>
		<td width="100px"></td>
		<td class="tdLabel"><label>Remarks</label></td>
		<td width="10px"></td>
		<td rowspan="3"><textarea rows="2" cols="27" id="txtRemarks">${remarks}</textarea></td>
	</tr>
	<tr>
		<td class="tdLabel"><label>Obsolete Tag</label></td>
		<td width="10px"></td>
		<td><input type="radio" name="obsolete" id="isObsolete" value="Y"> YES
		<input type="radio" name="obsolete" id="isNotObsolete" value="N"> NO
	</tr>
	<tr>
		<td class="tdLabel"><label>Location</label></td>
		<td width="10px"></td>
		<td><input type="text" id="txtLocation" value="${location}" size="30px"></td>
	</tr>
	
	<tr>
<!-- 		<td><input type="button" id="btnExecute" name="btnAdd" value="${buttonVal}"></td> --%>
<!-- 		<td><input type="button" id="btnCancel" value="Cancel"></td> -->
<%-- 	</tr>
	<tr>
		<td><input type="text" id="txtHideObsolete" value="${obsolete}" style="display:none"></td>
		<td><input type="text" id="txtHideSupTypeName" value="${supplyTypeName}" style="display:none"></td>
		<td><input type="text" id="txtHideSupTypeID" value="${supplyTypeID}" style="display:none"></td>
	</tr>
</table>  --%>
<br>
<div style="margin: auto; width: 20%;
    padding: 10px;"> 
    <input type="button" id="btnExecute" class="btn btn-default" name="btnAdd" value="${buttonVal}">
	<input type="button" id="btnCancel" class="btn btn-default" value="Cancel">
</div>
</div>

<!-- M O D A L S -->

<div id="myModalUpdateSuccess" class="modal">
  <div class="modal-content">
    <div class="modal-header-success">
    <span id="myModalUpdateSuccessClose" class="closeModal">&times;</span>
    <h2>Success!</h2>
 	</div>
 	<div class="modal-body">
    <p>Supply ID: ${supplyID} was successfully updated!</p>
  </div>
  </div>

</div>
<div id="myModalAddSuccess" class="modal">
 
  <div class="modal-content">
    <div class="modal-header-success">
    <span id="myModalAddSuccessClose" class="closeModal">&times;</span>
    <h2>Success!</h2>
 	</div>
 	<div class="modal-body">
    <p>New supply was successfully added!</p>
  </div>
  </div>
  
</div>

<div id="myModalNullWarning" class="modal">
 
  <div class="modal-content">
    <div class="modal-header-warning">
    <span id="myModalNullWarningClose" class="closeModal">&times;</span>
    <h2>Warning!</h2>
 	</div>
 	<div class="modal-body">
    <p>Please input a value to required field/s</p>
  </div>
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

</body>

<script>

	var id = 0;
	var currentRow = -1;
	var rec = [];
	var addObj = {};
	
	window.addEventListener ? 
			window.addEventListener("load",initializeVals(),false) : 
			window.attachEvent && window.attachEvent("onload",initializeVals());
			
	function initializeVals() {
		if ($F('txtHideObsolete') == 'Y') {
			$('isObsolete').checked = true;
		}
		else {
			$('isNotObsolete').checked = true;
		}
		
		if ($F('btnExecute') == 'Add') {
			$('supplyIDRow').setAttribute("hidden", true);
			
		}
		else {
			$('txtSupplyID').setAttribute("disabled", false);
			$('txtActualCount').setAttribute("disabled", false);
			$('selSupplyTypeID').setAttribute("disabled", false);
		}
		
		$('selSupplyTypeID').value = $F('txtHideSupTypeID');
	}

	$("btnExecute").observe("click", function() {
		
		if($F("btnExecute")=="Add") {
			addRecord();
		}
		else if ($F("btnExecute")=="Update") {
			updateRecord();
		}
	});
	
	$("myModalUpdateSuccessClose").observe("click", function() {
		$("myModalUpdateSuccess").style.display = "none"; 
		window.location.reload();
		clearFields();
		goToSuppliesListing();

	});
	$("myModalAddSuccessClose").observe("click", function() {
		$("myModalAddSuccess").style.display = "none"; 
		window.location.reload();
		clearFields();
		goToSuppliesListing();

	});
	$("myModalNullWarningClose").observe("click", function() {
		$("myModalNullWarning").style.display = "none"; 
	});
	$("myModalNumericWarningClose").observe("click", function() {
		$("myModalNumericWarning").style.display = "none"; 
	});
	window.onclick = function(event) {
	    if (event.target == $("myModalUpdateSuccess")) {
	    	$("myModalUpdateSuccess").style.display = "none";
	    	window.location.reload();
			clearFields();
			goToSuppliesListing();
	    	
	    }
	    else if (event.target == $("myModalAddSuccess")) {
	    	$("myModalAddSuccess").style.display = "none";
	    	window.location.reload();
			clearFields();
			goToSuppliesListing();
	    }
	    else if (event.target == $("myModalNullWarning")) {
	    	$("myModalNullWarning").style.display = "none";

	    }
	    else if (event.target == $("myModalNumericWarning")) {
	    	$("myModalNumericWarning").style.display = "none";

	    }
	    
	} 
	
	$("btnCancel").observe("click", function() {
		goToSuppliesListing();
	});
	
	$("txtReorderLevel").observe("keyup", function() {
		if(isNaN($F("txtReorderLevel"))){
			$("txtReorderLevel").clear();
			$("myModalNumericWarning").style.display="block";

		}
	});
	
	$("txtActualCount").observe("keyup", function() {
		if(isNaN($F("txtActualCount"))){
			$("txtActualCount").clear();
			$("myModalNumericWarning").style.display="block";
		}
	});


	function addRecord(){
		
		var isNull=false;
		var obsolete;
		var supplyTypeId = 0;
		$w("selSupplyTypeID txtItemName txtItemUnit txtReorderLevel txtActualCount").each(function(c){
			if ($F(c) == null || $F(c) == ""){
				isNull = true;
			}
		})
		
		if ($F("txtLocation") == null || $F("txtLocation") == ""){
			$F("txtLocation") == "";
		}
		
		if ($F("txtRemarks") == null || $F("txtRemarks") == ""){
			$F("txtRemarks") == "";
		}
		
		if(isNull){
			$("myModalNullWarning").style.display="block";
			return false;
		}
		if ($('isObsolete').checked) {
			  obsolete = $F('isObsolete');
		}
		else if ($('isNotObsolete').checked) {
			  obsolete = $F('isNotObsolete');
		}
		var e = $("selSupplyTypeID");
		var strTypeID = e.options[e.selectedIndex].value;
		addObj.supplyTypeID = strTypeID;
		addObj.itemName = $F("txtItemName");
		addObj.itemUnit = $F("txtItemUnit");
		addObj.obsoleteTag = obsolete;
		addObj.location = $F("txtLocation");
		addObj.reorderLevel = $F("txtReorderLevel");
		addObj.actualCount = $F("txtActualCount");
		addObj.remarks = $F("txtRemarks");
		clearFields();
		saveRecord();
	}
	
	function updateRecord(){
		var obsolete;
		var isNull = false;
		$w("txtItemName txtItemUnit txtReorderLevel").each(function(c) {
			if ($F(c) == null || $F(c) == "") {
				isNull = true;
			}
		})
		
		if ($F("txtLocation") == null || $F("txtLocation") == ""){
			$F("txtLocation") == "";
		}
		
		if ($F("txtRemarks") == null || $F("txtRemarks") == ""){
			$F("txtRemarks") == "";
		}

		if ($('isObsolete').checked) {
			  obsolete = $F('isObsolete');
		}
		else if ($('isNotObsolete').checked) {
			  obsolete = $F('isNotObsolete');
		}
		var e = $("selSupplyTypeID");
		var strTypeID = e.options[e.selectedIndex].value;
		var strTypeName = e.options[e.selectedIndex].text;
		if(isNull){
			$("myModalNullWarning").style.display="block";
		} else {
			new Ajax.Request(contextPath + "/updatesupplies", {
				method: "POST",
				parameters: {
					action: "updateRecord",
					supplyID: $F("txtSupplyID"),
					itemName: $F("txtItemName"),
					itemUnit: $F("txtItemUnit"),
					obsoleteTag: obsolete,
					location: $F("txtLocation"),
					reorderLevel: $F("txtReorderLevel"),
					remarks: $F("txtRemarks"),
				},
				onComplete: function(response){
					$("myModalUpdateSuccess").style.display = "block";
					
 					
				}
			});
		}
		
	}

	function clearFields() {
		$("txtItemName").value = "";
		$("txtItemUnit").value = "";
		$("txtLocation").value = "";
		$("txtReorderLevel").value = "";
		$("txtActualCount").value = "";
		$("txtRemarks").value = "";
	}

	function saveRecord() {
		new Ajax.Request(contextPath + "/addsupplies", {
			method : "POST",
			parameters : {
				action : "insertRecord",
				supplyTypeID : addObj.supplyTypeID,
				itemName : addObj.itemName,
				itemUnit : addObj.itemUnit,
				obsoleteTag : addObj.obsoleteTag,
				location : addObj.location,
				reorderLevel : addObj.reorderLevel,
				actualCount : addObj.actualCount,
				remarks : addObj.remarks,
				lastUser : 'ako hihi',
			},
			onComplete : function(response) {
				$("myModalAddSuccess").style.display = "block";
				
			}
		});
	}

	function goToSuppliesListing() {
		new Ajax.Request(contextPath + "/supplylistings", {
			method : "GET",
			parameters : {
				page : "pages/SuppliesListing.jsp",
				supplyID: "",
				itemName : "",
				itemUnit : "",
				location : "",
				reorderLevel : "",
				actualCount : "",
				remarks : "",
				dateAdded: ""
			},
			onComplete: function(response) {
				
				$("mainContents").update(response.responseText);
			}
		});
	}
</script>
</html>
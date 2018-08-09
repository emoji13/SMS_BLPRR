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
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
</head>
<body>
<div id="mainContents">
<table>

	<tr id="supplyIDRow">
		<td><label>Supply ID</label></td>
		<td><input type="text" id="txtSupplyID" value="${supplyID}"></td>
	</tr>
	<tr>
		<td><label>Supply Type Name</label></td>
		<td><select id="selSupplyTypeID">
			<c:forEach var="supType" items="${supTypesList}">
				<option value="${supType.supplyTypeID}">${supType.typeName}</option>		
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td><label>Item Name</label></td>
		<td><input type="text" id="txtItemName" value="${itemName}"></td>
	</tr>
	<tr>
		<td><label>Item Unit</label></td>
		<td><input type="text" id="txtItemUnit" value="${itemUnit}"></td>
	</tr>
	<tr>
		<td><label>Obsolete Tag</label></td>
		<td><input type="radio" name="obsolete" id="isObsolete" value="Y"> YES
		<input type="radio" name="obsolete" id="isNotObsolete" value="N"> NO
	</tr>
	<tr>
		<td><label>Location</label></td>
		<td><input type="text" id="txtLocation" value="${location}"></td>
	</tr>
	<tr>
		<td><label>Reorder Level</label></td>
		<td><input type="text" id="txtReorderLevel" value="${reorderLevel}"></td>
	</tr>
	<tr>
		<td><label>Actual Count</label></td>
		<td><input type="text" id="txtActualCount" value="${actualCount}"></td>
	</tr>
	<tr>
		<td><label>Remarks</label></td>
		<td><input type="text" id="txtRemarks" value="${remarks}"></td>
	</tr>
	<tr>
		<td><input type="button" id="btnExecute" name="btnAdd" value="${buttonVal}"></td>
		<td><input type="button" id="btnCancel" value="Cancel"></td>
	</tr>
	<tr>
		<td><input type="text" id="txtHideObsolete" value="${obsolete}" style="display:none"></td>
		<td><input type="text" id="txtHideSupTypeName" value="${supplyTypeName}" style="display:none"></td>
		<td><input type="text" id="txtHideSupTypeID" value="${supplyTypeID}" style="display:none"></td>
	</tr>
</table>
</div>
</body>

<script>

	var id = 0;
	var currentRow = -1;
	var rec = [];
	var addObj = {};
	
	window.addEventListener ? 
			window.addEventListener("load",wat(),false) : 
			window.attachEvent && window.attachEvent("onload",wat());
			
	function wat() {
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
			$('selSupplyTypeID').setAttribute("disabled", false);
		}
		
		
// 		$('selSupplyTypeID').options[$('selSupplyTypeID').selectedIndex].text = $F('txtHideSupType');
		$('selSupplyTypeID').value = $F('txtHideSupTypeID');
	}

	$("btnExecute").observe("click", function() {
		
		if($F("btnExecute")=="Add") {
			addRecord();
			
		}
		else if ($F("btnExecute")=="Update") {
			updateRecord();
		}
		else {
			alert('idk');
		}
	});
	
	$("btnCancel").observe("click", function() {
		goToSuppliesListing();
	});


	function addRecord(){
		
		var isNull=false;
		var obsolete;
		var supplyTypeId = 0;
		$w("selSupplyTypeID txtItemName txtItemUnit txtLocation txtReorderLevel txtActualCount txtRemarks").each(function(c){
			if ($F(c) == null || $F(c) == ""){
				isNull = true;
			}
		})
		
		if(isNull){
			alert("Fields cannot be null");
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
		alert('Wew');
		addObj.supplyTypeID = strTypeID;
		addObj.itemName = $F("txtItemName");
		addObj.itemUnit = $F("txtItemUnit");
		addObj.obsoleteTag = obsolete;
		addObj.location = $F("txtLocation");
		addObj.reorderLevel = $F("txtReorderLevel");
		addObj.actualCount = $F("txtActualCount");
		addObj.remarks = $F("txtRemarks");
		alert(strTypeID);
		clearFields();
		saveRecord();
	}
	
	function updateRecord(){
		var obsolete;
		var notExists = true;
		if(($F("txtItemName") == null || $F("txtItemName") == "") &&
			($F("txtItemUnit") == null || $F("txtItemUnit") == "")) {
			
			alert("Please enter a value to null fields");
		}
		else {
			notExists = false;
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
		alert(strTypeName+'qq');
		if(notExists){
			alert("The record you are trying to update is not existing on the table!");
		} else {
			alert('Wat');
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
					alert("Record Updated!");
					window.location.reload();
				}
			});
			goToSuppliesListing();
		}
		
	}

	function clearFields() {
		$("txtItemName").value = "";
		$("txtItemUnit").value = "";
		$("txtLocation").value = "";
		$("txtReorderLevel").value = "";
		$("txtActualCount").value = "";
		$("txtRemarks").value = "";
		alert('Hi');
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
				alert("Record Added!");
				window.location.reload();
			}
		});
		goToSuppliesListing();
	}

	function goToSuppliesListing() {
		new Ajax.Request(contextPath + "/supplylistings", {
			method : "GET",
			parameters : {
				page : "pages/SuppliesListing.jsp",
			},
			onComplete: function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	}
</script>
</html>
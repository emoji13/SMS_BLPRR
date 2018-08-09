<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplies Listings</title>
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
</head>
<body>
<div id="mainContents">
<table>
	<tr>
		<td><label>Supply ID</label></td>
		<td><input type="text" id="txtSupplyID" disabled="disabled"></td>
	</tr>
	<tr>
		<td><label>Supply Type</label></td>
<!-- 		<td><input type="text" id="txtSupplyTypeID" disabled="disabled"></td> -->
		<td><select id="selSupplyTypeID" disabled="disabled">
			<option value="None"></option>
			<c:forEach var="supType" items="${supTypesList}">
				<option value="${supType.supplyTypeID}">${supType.typeName}</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td><label>Item Name</label></td>
		<td><input type="text" id="txtItemName"></td>
	</tr>
	<tr>
		<td><label>Item Unit</label></td>
		<td><input type="text" id="txtItemUnit"></td>
	</tr>
	<tr>
		<td><label>Obsolete Tag</label></td>
		<td><input type="radio" name="obsolete" id="isObsolete" value="Y" checked="checked"> YES
		<input type="radio" name="obsolete" id="isNotObsolete" value="N"> NO
	</tr>
	<tr>
		<td><label>Location</label></td>
		<td><input type="text" id="txtLocation"></td>
	</tr>
	<tr>
		<td><label>Entered Date</label></td>
		<td><input type="text" id="txtDateAdded"></td>
	</tr>
	<tr>
		<td><label>Reorder Level</label></td>
		<td><input type="text" id="txtReorderLevel"></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td><label>Actual Count</label></td> -->
<!-- 		<td><input type="text" id="txtActualCount"></td> -->
<!-- 	</tr> -->
	<tr>
		<td><label>Remarks</label></td>
		<td><input type="text" id="txtRemarks"></td>
	</tr>
<!-- 	  TO BE DELETED -->
<!-- 	<tr> -->
<!-- 		<td><label>Entry Date</label></td> -->
<!-- 		<td><input type="text" id="txtDateAdded"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td><label>Last Updated</label></td> -->
<!-- 		<td><input type="text" id="txtLastUser"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td><label>Last Update</label></td> -->
<!-- 		<td><input type="text" id="txtLastUpdate"></td> -->
<!-- 	</tr> -->
<!-- 	TO BE DELETED -->
	
	<tr>
		<td><input type="button" id="btnAdd" name="btnAdd" value="Add New"></td>
		<td><input type="button" id="btnUpdate" value="Update"></td>
		<td><input type="button" id="btnCancel" value="Cancel"></td>
	</tr>

</table>
<br><br>

<input type="text" id="txtSearch"><input type="button" value="Search">

<div id="divTest">
<table id="supplieslist" border=1>
	<tr>
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
	<c:forEach var="sup" items="${supList}">
		<tr class="unselected"> 
			<td class="supIDData"><a id="supID" onclick="MyFunction();return false;">${sup.supplyID}</a></td>
			<td class="notSupIDData"><c:out value="${sup.typeName}"></c:out></td>
			<td style="display:none"><c:out value="${sup.supplyTypeID}"></c:out></td>
			<td class="notSupIDData"><c:out value="${sup.itemName}"></c:out></td>
			<td class="notSupIDData"><c:out value="${sup.itemUnit}"></c:out></td>
			<td class="notSupIDData"><c:out value="${sup.obsoleteTag}"></c:out></td>
			<td class="notSupIDData"><c:out value="${sup.location}"></c:out></td>
			<td class="notSupIDData"><c:out value="${sup.reorderLevel}"></c:out></td>
			<td class="notSupIDData"><c:out value="${sup.actualCount}"></c:out></td>
			<td class="notSupIDData"><c:out value="${sup.remarks}"></c:out></td>
			<td class="notSupIDData"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${sup.dateAdded}" /></td>
			<td class="notSupIDData"><c:out value="${sup.lastUser}"></c:out></td>
			<td class="notSupIDData"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${sup.lastUpdate}" /></td>
		
		</tr>
	</c:forEach>
</table>


<%-- <c:forEach var="sup" items="${supSearchList}"> --%>
<%-- 	<p><c:out value="${sup.supplyID}"></c:out></p> --%>
<%-- </c:forEach> --%>

</div>
</div>
</body>

<script>

	
	var id = 0;
	var currentRow = -1;
	var rec = [];
	var addObj = {};
	
	$("btnAdd").observe("click", function(){
		goToSupplyMaintenanceAdd();
// 		addRecord();
	});
	$("btnUpdate").observe("click", function(){
		updateRecord();
		clearFields();
	});
	$("txtSearch").observe("keyup", function(){
		searchRecord();
	});

	function MyFunction() {
		alert('hi');
	}

	
	function addRecord(){
		
		var isNull=false;
		var obsolete;
		var supplyTypeId = 0;
		$w("txtItemName txtItemUnit txtLocation txtReorderLevel txtActualCount txtRemarks").each(function(c){
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
		var strTypeName = e.options[e.selectedIndex].text;
		
		addObj.supplyTypeID = strTypeID;
		addObj.itemName = $F("txtItemName");
		addObj.itemUnit = $F("txtItemUnit");
		addObj.obsoleteTag = obsolete;
		addObj.location = $F("txtLocation");
		addObj.reorderLevel = $F("txtReorderLevel");
		addObj.actualCount = $F("txtActualCount");
		addObj.remarks = $F("txtRemarks");
		addObj.dateAdded = $F("txtDateAdded");
		addObj.lastUser = $F("txtLastUser");
		addObj.lastUpdate = $F("txtLastUpdate");
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
		alert(strTypeName);
		if(notExists){
			alert("The record you are trying to update is not existing on the table!");
		} else {
			new Ajax.Request(contextPath + "/updatesupplies", {
				method: "POST",
				parameters: {
					action: "updateRecord",
					supplyID: $F("txtSupplyID"),
					supplyTypeName: strTypeName,
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
		}
		
	}
	
	function addContent(obj){
		var content = '<input type="hidden" id="id" value="'+ id +'">' +
		'<label style="width: 100px;font-size: 12px; text-align: center; float:left;" title="' + obj.empNo + '">' + obj.empNo + '</label>' +
		'<label style="width: 100px;font-size: 12px; text-align: center; float:left;" title="' + obj.empName + '">' + obj.empName + '</label>' +
		'<label style="width: 100px;font-size: 12px; text-align: center; float:left;" title="' + obj.grade + '">' + obj.job + '</label>';
			
		return content;
	}
	
	function clearFields(){
		alert('haha');
		$("txtSupplyID").value = "";
		$("txtSupplyTypeID").value = "";
		$("txtItemName").value = "";
		$("txtItemUnit").value = "";
		$("txtLocation").value = "";
		$("txtReorderLevel").value = "";
		$("txtRemarks").value = "";
		alert('hihi');
	}
	

	function saveRecord(){
		new Ajax.Request(contextPath + "/addsupplies", {
			method: "POST",
			parameters: {
					action: "insertRecord",
					supplyID: addObj.supplyID,
					supplyTypeID: addObj.supplyTypeID,
					itemName: addObj.itemName,
					itemUnit: addObj.itemUnit,
					obsoleteTag: addObj.obsoleteTag,
					location: addObj.location,
					reorderLevel: addObj.reorderLevel,
					actualCount: addObj.actualCount,
					remarks: addObj.remarks,
					dateAdded: addObj.dateAdded,
					lastUser: 'ako hihi',
					lastUpdate: addObj.lastUpdate
			},
			onComplete: function(response){
				 alert("Record Added!");
				 window.location.reload();
			}
		});
	}
	
	function searchRecord(){
		var searchID  = "";
		if ($F("txtSearch")==null || $F("txtSearch")=="") {
			searchID = "";
		}
		else {
			searchID = $F("txtSearch");
		}
		new Ajax.Request(contextPath + "/searchsupplies", {
			method: "POST",
			parameters: {
					action: "searchRecord",
					searchKey: searchID
			},
			onComplete: function(response){
				$("divTest").update(response.responseText);
			}
		});
		
	}
	
	function goToSupplyMaintenanceAdd(){
		new Ajax.Request(contextPath + "/supplymaintenance", {
			method: "GET",
			parameters: {
					page: "pages/SupplyMaintenance.jsp",
					buttonVal: "Add",
					itemName: "",
					itemUnit: "",
					location: "",
					reorderLevel: "",
					actualCount: "",
					remarks: ""
					
			},
			onComplete: function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	}
	
// 	FOR SUPPLY ID . OBSERVE ("CLICK")
	
	/* $("supplieslist").observe("mouseover", function(){
		$$(".unselected").each(function(r) {
			r.observe("mouseover", function () {
				if (r.readAttribute("class") == "tablerow selected") {
					r.removeClassName("unselected");
					r.removeClassName("unselectedWMouse");
					r.addClassName("selected");
				}
				else {
					r.removeClassName("unselected");
					r.addClassName("unselectedWMouse");
					r.removeClassName("selected");
				}

			 r.observe("click", function () {
				 $$(".selected").each(function(e) {
					e.addClassName("unselected");
					e.removeClassName("unselectedWMouse");
					e.removeClassName("selected");
				 });
					r.removeClassName("unselected");
					r.removeClassName("unselectedWMouse");
					r.addClassName("selected");
					new Ajax.Request(contextPath + "/supplymaintenance", {
						method: "GET",
						parameters: {
								page: "pages/SupplyMaintenance.jsp",
								buttonVal: "Update",
								supplyID: this.down('td',0).innerHTML,
								supplyTypeName: this.down('td',1).innerHTML,
								supplyTypeID: this.down('td',2).innerHTML,
								itemName: this.down('td',3).innerHTML,
								itemUnit: this.down('td',4).innerHTML,
								obsolete: this.down('td',5).innerHTML,
								location: this.down('td',6).innerHTML,
								reorderLevel: this.down('td',7).innerHTML,
								actualCount: this.down('td',8).innerHTML,
								remarks: this.down('td',9).innerHTML
								
						},
						onComplete: function(response) {
							$("mainContents").update(response.responseText);
						}
					});
				});
			
		});
		});
	});

	$("supplieslist").observe("mouseout", function(){
		$$(".unselected").each(function(r) {
			r.observe("mouseout", function () {

				if (r.readAttribute("class") != "tablerow selected") {
					r.addClassName("unselected");
					r.removeClassName("unselectedWMouse");
					r.removeClassName("selected");
				}
			
		});
		});
	}); */
	
	$("supplieslist").observe("mouseover", function(){
		$$(".unselected").each(function(r) {
			 r.observe("click", function () {			
					$("txtSupplyID").value = this.down('td',0).innerHTML;
					$('selSupplyTypeID').value = this.down('td',2).innerHTML;
					$("txtItemName").value = this.down('td',3).innerHTML;
					$("txtItemUnit").value = this.down('td',4).innerHTML;
					$("txtLocation").value = this.down('td',6).innerHTML;
					$("txtReorderLevel").value = this.down('td',7).innerHTML;
					$("txtDateAdded").value = this.down('td',10).innerHTML;
					$("txtRemarks").value = this.down('td',9).innerHTML;
					var obsolete = this.down('td',5).innerHTML;
					if (obsolete=='Y') {
						$('isObsolete').checked = true;
					}
					else {
						$('isNotObsolete').checked = true;
					}
					
				});
		});
	});
	
	
	
	$("supplieslist").observe("mouseover", function(){
		$$(".unselected").each(function(r) {
			r.observe("mouseover", function () {
				if (r.readAttribute("class") == "tablerow selected") {
					r.removeClassName("unselected");
					r.removeClassName("unselectedWMouse");
					r.addClassName("selected");
				}
				else {
					r.removeClassName("unselected");
					r.addClassName("unselectedWMouse");
					r.removeClassName("selected");
				}

			 r.observe("click", function () {
				 $$(".selected").each(function(e) {
					e.addClassName("unselected");
					e.removeClassName("unselectedWMouse");
					e.removeClassName("selected");
				 });
					r.removeClassName("unselected");
					r.removeClassName("unselectedWMouse");
					r.addClassName("selected");
					$("txtSupplyID").value = this.down('td',0).innerHTML;
					$('selSupplyTypeID').value = this.down('td',2).innerHTML;
					$("txtItemName").value = this.down('td',3).innerHTML;
					$("txtItemUnit").value = this.down('td',4).innerHTML;
					$("txtLocation").value = this.down('td',6).innerHTML;
					$("txtReorderLevel").value = this.down('td',7).innerHTML;
					$("txtDateAdded").value = this.down('td',10).innerHTML;
					$("txtRemarks").value = this.down('td',9).innerHTML;
					var obsolete = this.down('td',5).innerHTML;
					if (obsolete=='Y') {
						$('isObsolete').checked = true;
					}
					else {
						$('isNotObsolete').checked = true;
					}
				});
			
		});
		});
	});

	$("supplieslist").observe("mouseout", function(){
		$$(".unselected").each(function(r) {
			r.observe("mouseout", function () {

				if (r.readAttribute("class") != "tablerow selected") {
					r.addClassName("unselected");
					r.removeClassName("unselectedWMouse");
					r.removeClassName("selected");
				}
			
		});
		});
	}); 


	
</script>

</html>
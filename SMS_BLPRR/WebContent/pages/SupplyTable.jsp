<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supply Table</title>
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
 <script src="js/bootstrap.min.js"></script>
</head>
<body>
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
	<c:forEach var="sup" items="${supSearchList}">
		<tr class="tablerow unselected">
			<td class="supIDData"><a href="#" id="supID" onclick="UpdateThisSupply();return false;">${sup.supplyID}</a></td>
			<td><c:out value="${sup.typeName}"></c:out></td>
			<td style="display:none"><c:out value="${sup.supplyTypeID}"></c:out></td>
			<td><c:out value="${sup.itemName}"></c:out></td>
			<td><c:out value="${sup.itemUnit}"></c:out></td>
			<td><c:out value="${sup.obsoleteTag}"></c:out></td>
			<td><c:out value="${sup.location}"></c:out></td>
			<td><c:out value="${sup.reorderLevel}"></c:out></td>
			<td><c:out value="${sup.actualCount}"></c:out></td>
			<td><c:out value="${sup.remarks}"></c:out></td>
			<td><fmt:formatDate type="date" value="${sup.dateAdded}" /></td>
			<td><c:out value="${sup.lastUser}"></c:out></td>
			<td><fmt:formatDate type="date" value="${sup.lastUpdate}" /></td>
		</tr>
	</c:forEach>
</table>
</div>

<div class="col-md-1"></div>
</body>
<script>


	function UpdateThisSupply() {
		var supplyIDWithoutTags;
		$$(".tablerow").each(
				function(r) {
					r.observe("click", function() {
						supplyIDWithoutTags = r.cells[0].innerHTML;
						supplyIDWithoutTags = supplyIDWithoutTags.replace(
								/<(?:.|\n)*?>/gm, '');
						new Ajax.Request(contextPath + "/supplymaintenance",
								{
									method : "GET",
									parameters : {
										page : "pages/SupplyMaintenance.jsp",
										buttonVal : "Update",
										supplyID : supplyIDWithoutTags,
										supplyTypeName : r.cells[1].innerHTML,
										supplyTypeID : r.cells[2].innerHTML,
										itemName : r.cells[3].innerHTML,
										itemUnit : r.cells[4].innerHTML,
										obsolete : r.cells[5].innerHTML,
										location : r.cells[6].innerHTML,
										reorderLevel : r.cells[7].innerHTML,
										actualCount : r.cells[8].innerHTML,
										remarks : r.cells[9].innerHTML

									},
									onComplete : function(response) {
										$("mainContents").update(
												response.responseText);
									}
								});

					});
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
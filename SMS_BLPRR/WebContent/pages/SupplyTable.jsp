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
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
</head>
<body>
<table id="supplieslist" border=1>
	<tr>
		<td width="40px"><h5>Supply ID</h5></td>
		<td width="80px"><h5>Supply Type</h5></td>
		<td width="80px" style="display:none"><h5>Supply Type ID</h5></td>
		<td width="80px"><h5>Item Name</h5></td>
		<td width="80px"><h5>Item Unit</h5></td>
		<td width="80px"><h5>Obsolete Tag</h5></td>
		<td width="80px"><h5>Location</h5></td>
		<td width="80px"><h5>Reorder Level</h5></td>
		<td width="80px"><h5>Actual Count</h5></td>
		<td width="80px"><h5>Remarks</h5></td>
		<td width="80px"><h5>Entry Date</h5></td>
		<td width="80px"><h5>Last Updated</h5></td>
		<td width="80px"><h5>Last Update</h5></td>
	</tr>
	<c:forEach var="sup" items="${supSearchList}">
		<tr class="unselected">
			<td><c:out value="${sup.supplyID}"></c:out></td>
			<td><c:out value="${sup.typeName}"></c:out></td>
			<td style="display:none"><c:out value="${sup.supplyTypeID}"></c:out></td>
			<td><c:out value="${sup.itemName}"></c:out></td>
			<td><c:out value="${sup.itemUnit}"></c:out></td>
			<td><c:out value="${sup.obsoleteTag}"></c:out></td>
			<td><c:out value="${sup.location}"></c:out></td>
			<td><c:out value="${sup.reorderLevel}"></c:out></td>
			<td><c:out value="${sup.actualCount}"></c:out></td>
			<td><c:out value="${sup.remarks}"></c:out></td>
			<td><c:out value="${sup.dateAdded}"></c:out></td>
			<td><c:out value="${sup.lastUser}"></c:out></td>
			<td><c:out value="${sup.lastUpdate}"></c:out></td>
		</tr>
	</c:forEach>
</table>
</body>
<script>

	$("supplieslist").observe("mouseover", function() {
		$$(".unselected").each(function(r) {
			r.observe("mouseover", function() {
				if (r.readAttribute("class") == "tablerow selected") {
					r.removeClassName("unselected");
					r.removeClassName("unselectedWMouse");
					r.addClassName("selected");
				} else {
					r.removeClassName("unselected");
					r.addClassName("unselectedWMouse");
					r.removeClassName("selected");
				}

				r.observe("click", function() {
					$$(".selected").each(function(e) {
						e.addClassName("unselected");
						e.removeClassName("unselectedWMouse");
						e.removeClassName("selected");
					});
					r.removeClassName("unselected");
					r.removeClassName("unselectedWMouse");
					r.addClassName("selected");

					new Ajax.Request(contextPath + "/supplymaintenance", {
						method : "GET",
						parameters : {
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
						onComplete : function(response) {
							$("mainContents").update(response.responseText);
						}
					});
				});

			});
		});
	});

	$("supplieslist").observe("mouseout", function() {
		$$(".unselected").each(function(r) {
			r.observe("mouseout", function() {

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
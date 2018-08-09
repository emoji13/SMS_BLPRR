<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplies Issuance</title>
<script src="js/prototype.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<style>
.hidden{
	display:none;
}
.hovered{
	background-color: #ade5ff;
	color: #005a84;
}
.selected{
	background-color: #91dbff;
	color: #005a84;
}
</style>
</head>
<body>
	<div>
		<input type="text" class="hidden" id="txtIssueId"/>
		<table>
			<tr>
				<td><label>Item Name: </label></td>
				<td><select id="selSupply">
					<c:forEach items="${supList}" var="supply">
						<option value="${supply.supplyID}">${supply.itemName}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>Quantity: </label></td>
				<td><input type="text" id="txtQuantity"/></td>
			</tr>
			<tr>
				<td><label>Requested by: </label></td>
				<td><input type="text" id="txtRequestor"/></td>
			</tr>
			<tr>
				<td><label>Department: </label></td>
				<td><select id="selDept">
					<c:forEach items="${departments }" var="dept">
						<option value="${dept.deptId}">${dept.deptName}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>Issue Date: </label></td>
				<td><input type="text" id="txtIssueMonth" style="width:20px; text-align:right;"/><label>/</label>
			<input type="text" id="txtIssueDay" style="width:20px; text-align:right;"/><label>/</label>
			<input type="text" id="txtIssueYear"style="width:35px; text-align:right;"/></td>
			</tr>
		</table>
	</div>
	<table>
		<tr>
			<td><input type="button" id="btnIssueRequest" value="Issue Request"></td>
		</tr>
		<tr>
			<td><input type="button" id="btnSave" value="Save" class="hidden"></td>
		</tr>
		<tr>
			<td><input type="button" id="btnCancel" value="Cancel" class="hidden"></td>
		</tr>
	</table>
	<input type="button" id="btnSearch" value="Search"/><input type="text" id="txtSearch">
	<div id="issueList"></div>
</body>
<script src="js/issuesupply.js"></script>
<script>
loadIssueList();
</script>
</html>
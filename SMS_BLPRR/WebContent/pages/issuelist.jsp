<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table border=1 id="tblList">
	<tr>
		<td>Issue ID</td>
		<td>Item Name</td>
		<td>Qty</td>
		<td>Requested by</td>
		<td>Department Name</td>
		<td>Issue Date</td>
		<td>Last Updated By</td>
		<td>Last Updated</td>
	</tr>
	<c:forEach items="${issuedSupplies}" var="issuedSupply">
	<tr id="${issuedSupply.issueId}" class="tr">
		<td style="cursor: pointer"><c:out value="${issuedSupply.issueId}"/></td>
		<td style="display:none;">
			<c:out value="${issuedSupply.supplyId}"/>
		</td>
		<c:forEach items="${supList}" var="supply">
			<c:if test="${issuedSupply.supplyId == supply.supplyID}">
				<td><c:out value="${supply.itemName}"/></td>
			</c:if>
		</c:forEach>
		<td><c:out value="${issuedSupply.quantity}"/></td>
		<td><c:out value="${issuedSupply.requestor}"/></td>
		<td style="display:none;">
			<c:out value="${issuedSupply.deptId}"/>
		</td>
		<c:forEach items="${departments}" var="dept">
			<c:if test="${issuedSupply.deptId == dept.deptId}">
				<td><c:out value="${dept.deptName}"/></td>
			</c:if>
		</c:forEach>
		<td><fmt:formatDate value="${issuedSupply.issueDate}" pattern="MM/dd/yyyy"/></td>
		<td><c:out value="${issuedSupply.lastUser}"/></td>
		<td><fmt:formatDate value="${issuedSupply.lastUpdate}" pattern="MM/dd/yyyy"/></td>
	</tr>
	</c:forEach>
</table>
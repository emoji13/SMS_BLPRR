<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container" >
        <div class="navbar-header">
          <a class="navbar-brand" href="#home" >CPI</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li id="homeHeader"><a href="home.jsp" >Home<span class="glyphicon glyphicon-home" aria-hidden="true" style="margin-left: 5px;"></span></a></li>
            <c:if test="${access == 'A'}">
            <li id="maintenanceHeader"><a href="#maintenance">Maintenance<span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px;"></span></a></li>
            </c:if>
            <li id="suppliesHeader"><a href="issueSupplies">Issue Supplies<span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="margin-left: 5px;"></span></a></li>
            <li id="stocksHeader"><a href="supplystock">Add Stocks<span class="glyphicon glyphicon-folder-close" aria-hidden= "true" style="margin-left: 5px;"></span></a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
             <button id="btnLogOut" class="btn btn-danger navbar-btn">Logout</button>
          </ul>
        </div>
      </div>
    </nav>

<script>

$("btnLogOut").observe("click", function(){
	new Ajax.Request(contextPath + "/login",{
		method:"get",
		parameters: {
			action: "logOut"
		},
		onComplete: function(response){
			window.location = contextPath;
		}
	});
});
</script>

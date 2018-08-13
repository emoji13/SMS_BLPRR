<<<<<<< HEAD
<style>
.dropbtn {
    background-color: rgb(34,34,34);
    color: rgb(157,157,157);
    padding: 16px;
    font-size: 15px;
    border: none;
}
.dropdown {
    position: relative;
    display: inline-block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: rgb(34,34,34);
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    list-style-type: none;
    padding: 0;	
   
}
.dropdown-content a {
    color: rgb(157,157,157);
    padding: 12px 16px;
    margin: 0px;
    text-decoration: none;
    display: block;
    font-size: 15px;
    text-align: center;
    padding-left: 20px;
    padding-right: 30px;
}
.dropdown-content a:hover {color: white;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {color: white;} 
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container" >
        <div class="navbar-header">
          <a class="navbar-brand" href="#home" >CPI</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
		 <li id="homeHeader"><a href="#home" >Home<span class="glyphicon glyphicon-home" aria-hidden="true" style="margin-left: 5px;"></span></a></li>
            <li class="dropdown" id="maintenanceHeader">
  				<button class="dropbtn" id="maintenanceHeaders">Maintenance<span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px;"></span></button>
  					<ul class="dropdown-content">
    					<li><a href="#">Users<span class="glyphicon glyphicon-user" aria-hidden="true" style="margin-left: 5px;"></span></a></li>
    					<li><a href="supplylistings">Supplies<span class="glyphicon glyphicon-tasks" aria-hidden="true" style="margin-left: 5px;"></span></a></li>
  					</ul>
			</li>
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

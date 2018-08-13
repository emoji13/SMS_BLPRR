
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
          <a class="navbar-brand" href="" >CPI</a>
        </div>
      </div>
    </nav>


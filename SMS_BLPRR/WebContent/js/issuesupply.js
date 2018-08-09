
function loadIssueList(param){
	new Ajax.Request(contextPath+ "/issueSupplies", {
		method: "GET",
		parameters: {
			param: param,
			actionGet: "issueList"
		},
		onComplete: function(response){
			$("issueList").update(response.responseText);
			manageRows();
		}
		
	});
}

$w("btnIssueRequest btnCancel").each(function(r){
	$(r).observe("click", function(){
		clearFields();
		toggleClasses();
	});
});

$("btnSave").observe("click", function(){
	if ($F("txtIssueId") == null || $F("txtIssueId") == ""){
		saveRecord();
	} else{
		updateRecord();
	}
});

$("btnSearch").observe("click", function(){
	loadIssueList($F("txtSearch"));
});
function manageRows(){
	$$("tr.tr").each(function(r){
		r.observe("click", function(){
			
			$("txtIssueId").value = r.cells[0].innerHTML;
			$("selSupply").value = r.cells[1].innerHTML.trim();
			$("txtQuantity").value = r.cells[3].innerHTML;
			$("txtRequestor").value = r.cells[4].innerHTML;
			$("selDept").value = r.cells[5].innerHTML.trim();
			var issDate = (r.cells[7].innerHTML).split("/");
			$("txtIssueMonth").value = issDate[0];
			$("txtIssueDay").value = issDate[1];
			$("txtIssueYear").value = issDate[2];
			
			$$(".selected").each(function(sel){
				sel.removeClassName("selected");
			});
			r.addClassName("selected");
		});
		r.cells[0].observe("click", function(){
			clearFields();
			toggleClasses();
		});
		r.observe("mouseover", function(){
			if(!r.hasClassName("selected")){
				r.addClassName("hovered");
			}
		});
		r.observe("mouseout", function(){
			r.removeClassName("hovered");
		});
	});
}
function clearFields(){
	$("txtIssueId").value = "";
	$("selSupply").value = $$("#selSupply option:first-child")[0].value;
	$("txtQuantity").value = "";
	$("txtRequestor").value = "";
	$("selDept").value = $$("#selDept option:first-child")[0].value;
	$("txtIssueMonth").value = "";
	$("txtIssueDay").value = "";
	$("txtIssueYear").value = "";
}
function toggleClasses(){
	$("btnIssueRequest").toggleClassName("hidden");
	$("btnSave").toggleClassName("hidden");
	$("btnCancel").toggleClassName("hidden");
	$("issueList").toggleClassName("hidden");
	$("btnSearch").toggleClassName("hidden");
	$("txtSearch").toggleClassName("hidden");
}

function saveRecord(){
	var issueDate = fetchIssueDate();
	
	new Ajax.Request(contextPath + "/issueSupplies",{
		method: "POST",
		parameters: {
			actionPost: "insert",
			supplyId: $F("selSupply"),
			quantity: $F("txtQuantity"),
			requestor: $F("txtRequestor"),
			deptId: $F("selDept"),
			issueDate: issueDate,
			lastUser: "testUser"
		},
		onComplete: function(response){
			alert("successfully saved!");
			window.location.reload();
		}
	});
}

function updateRecord(){
	var issueDate = fetchIssueDate();
	new Ajax.Request(contextPath + "/issueSupplies",{
		method: "POST",
		parameters: {
			actionPost: "update",
			issueId: $F("txtIssueId"),
			supplyId: $F("selSupply"),
			quantity: $F("txtQuantity"),
			requestor: $F("txtRequestor"),
			deptId: $F("selDept"),
			issueDate: issueDate,
			lastUser: "testUser"
		},
		onComplete: function(response){
			alert("successfully updated!");
			window.location.reload();
		}
	});
}

function fetchIssueDate(){
	var issueYear = parseInt($F("txtIssueYear"));
	var issueMonth = parseInt($F("txtIssueMonth"));
	var issueDay = parseInt($F("txtIssueDay"));
	
	if($F("txtIssueYear").length < 3 ) {
		if(issueYear > 50){
			issueYear += 1900;
		}else{
			issueYear += 2000;
		}
	}
	
	var issueDate = [issueMonth, issueDay, issueYear];
	return issueDate;
}

$("txtIssueMonth").observe("input", function(){
	$("txtIssueMonth").value = $F("txtIssueMonth").replace(/\D/g, '');
	if($F("txtIssueMonth").length >2 ){
		$("txtIssueMonth").value = $F("txtIssueMonth").substr(0,2);
	}
});

$("txtIssueDay").observe("input", function(){
	$("txtIssueDay").value = $F("txtIssueDay").replace(/\D/g, '');
	if($F("txtIssueDay").length >2 ){
		$("txtIssueDay").value = $F("txtIssueDay").substr(0,2);
	}
	var isInvalid = false;
	if(parseInt($F("txtIssueDay")) > 31){
		isInvalid = true;
	} else if(parseInt($F("txtIssueDay")) == 30){
		if(!(parseInt($F("txtIssueMonth"))==4 || parseInt($F("txtIssueMonth"))==6 || parseInt($F("txtIssueMonth"))==9|| parseInt($F("txtIssueMonth"))==11)){
			isInvalid = true;
		}
	} else{
		if(!isLeapYear(parseInt($F("txtIssueYear"))) && parseInt($F("txtIssueDay")) == 29 && $F("txtIssueYear") != ""){
			isInvalid = true;
		}
	}
	if(isInvalid){
		alert("Invalid day.");
		$("txtIssueDay").value ="";
	}
});

$("txtIssueYear").observe("input", function(){
	$("txtIssueYear").value = $F("txtIssueYear").replace(/\D/g, '');
	if($F("txtIssueYear").length > 4 ){
		$("txtIssueYear").value = $F("txtIssueYear").substr(0,4);
	}
});

function isLeapYear(year){
	return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
}


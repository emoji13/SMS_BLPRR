$("btnIssueRequest").observe("click", function() {
	clearFields();
	toggleClasses();
	removeReadOnly();
	$("title").update("Issue Request");
});

$w("btnCancel btnOk").each(function(btn){
	$(btn).observe("click", function() {
		clearFields();
		window.location.reload();
	});
});

$("btnSave").observe("click", function() {
	var isValid = true;
	$w("txtQuantity txtRequestor txtIssueDate").each(function(r){
		if($F(r) == null || $F(r) == ""){
			alert($F(r));
			isValid = false;
		}
	});
	if(isValid){
		if ($F("txtIssueId") == null || $F("txtIssueId") == "") {
			saveRecord();
		} else {
			updateRecord();
		}
	} else{
		$("error").removeClassName("hidden");
		$("error").update("Unable to save. Complete the details first.");
	}
});

$("btnSearch").observe("click", function() {
	loadIssueList($F("txtSearch"));
});

$("txtQuantity").observe("input", function() {
	$("txtQuantity").value = $F("txtQuantity").replace(/\D/g, '');
	if (parseInt($F("txtQuantity")) < 1) {
		alert("Quantity should not be zero.");
		$("txtQuantity").value = "";
	}
});

function loadIssueList(param) {
	new Ajax.Request(contextPath + "/issueSupplies", {
		method : "GET",
		parameters : {
			param : param,
			actionGet : "issueList"
		},
		onComplete : function(response) {
			$("issueList").update(response.responseText);
			manageRows();
			writeReadOnly();
		}

	});
}

function manageRows() {
	$$("tr.tr").each(function(r) {
		r.observe("click", function() {
			$("txtIssueId").value = r.cells[0].innerHTML;
			$("selSupply").value = r.cells[1].innerHTML.trim();
			$("txtQuantity").value = r.cells[3].innerHTML;
			$("txtRequestor").value = r.cells[4].innerHTML;
			$("selDept").value = r.cells[5].innerHTML.trim();
			var issueDate = r.cells[7].innerHTML.split("/");
			$("txtIssueDate").value = issueDate[2]+"-"+issueDate[0]+"-"+issueDate[1];
			$$(".selected").each(function(sel) {
				if(!r.hasClassName("selected")){
					sel.removeClassName("selected");
				} else{
					clearFields();
				}
			});
			r.toggleClassName("selected");
		});
		
		r.cells[0].observe("click", function() {
			toggleClasses();
			removeReadOnly();
		});
		
		r.observe("mouseover", function() {
			if (!r.hasClassName("selected")) {
				r.addClassName("hovered");
			}
		});
		
		r.observe("mouseout", function() {
			r.removeClassName("hovered");
		});
	});
}

function clearFields() {
	$("txtIssueId").value = "";
	$("selSupply").value = $$("#selSupply option:first-child")[0].value;
	$("txtQuantity").value = "";
	$("txtRequestor").value = "";
	$("selDept").value = $$("#selDept option:first-child")[0].value;
	$("txtIssueDate").value = "";
	$("txtSearch").value = "";
}

function removeReadOnly(){
	$("selSupply").removeAttribute("disabled");
	$("txtQuantity").removeAttribute("readonly");
	$("txtRequestor").removeAttribute("readonly");
	$("selDept").removeAttribute("disabled");
	$("txtIssueDate").removeAttribute("readonly");
}

function writeReadOnly(){
	$("selSupply").writeAttribute("disabled","");
	$("txtQuantity").writeAttribute("readonly","");
	$("txtRequestor").writeAttribute("readonly","");
	$("selDept").writeAttribute("disabled","");
	$("txtIssueDate").writeAttribute("readonly","");
}

function toggleClasses() {
	$("btnIssueRequest").toggleClassName("hidden");
	$("btnSave").toggleClassName("hidden");
	$("btnCancel").toggleClassName("hidden");
	$("issueList").toggleClassName("hidden");
	$("btnSearch").toggleClassName("hidden");
	$("txtSearch").toggleClassName("hidden");
	$("list").toggleClassName("hidden");
}

function saveRecord() {
	new Ajax.Request(contextPath + "/issueSupplies", {
		method : "POST",
		parameters : {
			actionPost : "insert",
			supplyId : $F("selSupply"),
			quantity : $F("txtQuantity"),
			requestor : $F("txtRequestor"),
			deptId : $F("selDept"),
			issueDate : $F("txtIssueDate")
		},
		onComplete : function(response) {
			updatePage(response, "insert");
		}
	});
}

function updateRecord() {
	new Ajax.Request(contextPath + "/issueSupplies", {
		method : "POST",
		parameters : {
			actionPost : "update",
			issueId : $F("txtIssueId"),
			supplyId : $F("selSupply"),
			quantity : $F("txtQuantity"),
			requestor : $F("txtRequestor"),
			deptId : $F("selDept"),
			issueDate : $F("txtIssueDate")
		},
		onComplete : function(response) {
			updatePage(response, "update");
		}
	});
}

function showModal(){
	$("myModal").style.display = "block";
}

function updatePage(response, source){
	var error = response.getHeader("issueError") == null ? ""
			: response.getHeader("issueError");
	if (error != "") {
		$("error").removeClassName("hidden");
		$("error").update(response.getHeader("issueError"));
	} else {
		var warning = response.getHeader("issueWarning") == null ? ""
				: response.getHeader("issueWarning");
		if (warning != "") {
			$("modalBody2").update(response.getHeader("issueWarning"));
		}
		if(source == "insert"){
			$("modalBody1").update("Successfully saved!");
		} else{
			$("modalBody1").update("Successfully updated!");
		}
		showModal();
	}
}

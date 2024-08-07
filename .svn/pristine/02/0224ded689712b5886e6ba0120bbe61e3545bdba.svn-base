
var ajaxDropdownObj = new Object();
ajaxDropdownObj.ajaxobj = null;
ajaxDropdownObj.name = "";
ajaxDropdownObj.url = "";



function processLoadList(myajax, curDropDown) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 	//	alert("myajax.responseText "+myajax.responseText);
	 		if (typeof xmlDoc != "undefined"){
	 		//	alert("hh");
			    displayList(xmlDoc, curDropDown);
	 		}
      	}
		else {
		//	alert("The server could be too busy at the moment. Please try again");
		}
   	}
}

function displayList(curDoc, curDropDown) {
	if (curDropDown != null && curDoc != null) {
		var toAdd = document.getElementById(curDropDown);
		if (toAdd == null) {	//fix for other browsers since IE can retrieve those under Name as Id
			elname = document.getElementsByName(curDropDown);
			toAdd = elname[0];
		}
      	var optionList = curDoc.getElementsByTagName("option");
      	if (toAdd != null && optionList != null) {
      	//	alert("toAdd "+optionList[0].getAttribute("facType"));
      	//	alert("toAdd 1"+optionList[0]);
      	//	alert("toAdd "+optionList[0].getAttribute("legalAuditDate"));
      		if(!optionList[0] || optionList[0].getAttribute("legalAuditDate") == 'null'){
      			document.getElementById("legalAuditDate").value='';
      		}else{
      		document.getElementById("legalAuditDate").value=optionList[0].getAttribute("legalAuditDate");
      			}
      	 if(!optionList[0] || optionList[0].getAttribute("interveingPeriSearchDate") == 'null'){
      			document.getElementById("interveingPeriSearchDate").value='';
      		}else{
      		document.getElementById("interveingPeriSearchDate").value=optionList[0].getAttribute("interveingPeriSearchDate");
      		}
      		if(!optionList[0] || optionList[0].getAttribute("typeOfMargage") == 'null'){
      			document.getElementById("typeOfMargage").value='';
      		}else{
      			document.getElementById("typeOfMargage").value=optionList[0].getAttribute("typeOfMargage");
      		}
      		
      		if(!optionList[0] || optionList[0].getAttribute("salePurchareAmount") == 'null'){
      			document.getElementById("salePurchareAmount").value='';
      		}else{
      			document.getElementById("salePurchareAmount").value=optionList[0].getAttribute("salePurchareAmount");
      		}
      	
      		if(!optionList[0] || optionList[0].getAttribute("dateOfCersaiRegisteration") == 'null'){
      			document.getElementById("dateOfCersaiRegisteration").value='';
      		}else{
      		document.getElementById("dateOfCersaiRegisteration").value=optionList[0].getAttribute("dateOfCersaiRegisteration");
      		}
      		
      		if(!optionList[0] || optionList[0].getAttribute("cersaiId") == 'null'){
      			document.getElementById("cersaiId").value='';
      		}else{
      		document.getElementById("cersaiId").value=optionList[0].getAttribute("cersaiId");
      		}
      		if(!optionList[0] || optionList[0].getAttribute("cersaiTransactionRefNumber") == 'null'){
      			document.getElementById("cersaiTransactionRefNumber").value='';
      		}else{
      		document.getElementById("cersaiTransactionRefNumber").value=optionList[0].getAttribute("cersaiTransactionRefNumber");
      		}
		}	/*else{
			alert("inside else");
		}*/
	}	
}

function sendLoadListPrevMortReq(dropdownName, url) {
	//check if the last character is =, this means no parameter passed
	
	if ((url.length-1) == url.lastIndexOf("="))
	{
		cleardisplayList(dropdownName);
		return;
	}

    var xhr = createAjaxObj();
	//alert("xhr: " + xhr + "   ajaxDropdownObj: " + ajaxDropdownObj.ajaxobj + "   name: " + ajaxDropdownObj.name);
	if (ajaxDropdownObj.ajaxobj != null)
	{
		if (ajaxDropdownObj.ajaxobj.readyState != 0)
		{
			if (ajaxDropdownObj.name == dropdownName)
			{
				//if the previous request is for the same dropdown, then abort it
				ajaxDropdownObj.ajaxobj.abort();
				//window.status = "Aborting previous request for '" + dropdownName + "' dropdown list";
			}
		}
	}
	
	xhr.onreadystatechange = function() {
		processLoadList(xhr, dropdownName);
	};
	xhr.open('POST', url, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	//xhr.setRequestHeader("Content-length", ''.length);	//bypass ie6 bug
	//xhr.setRequestHeader("Connection", "close");		//bypass ie6 bug
	xhr.send('');
	
	ajaxDropdownObj.ajaxobj = xhr;
	ajaxDropdownObj.name = dropdownName;
	ajaxDropdownObj.url = url;
}


function cleardisplayList(curDropDown) {
	if (curDropDown != null)
	{
		var xmlDoc = createXMLDOM_string('<?xml version="1.0"?><objectlist></objectlist>');
		if (typeof xmlDoc != "undefined")
			displayList(xmlDoc, curDropDown);
	}
}


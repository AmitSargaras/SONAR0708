
var ajaxDropdownObj = new Object();
ajaxDropdownObj.ajaxobj = null;
ajaxDropdownObj.name = "";
ajaxDropdownObj.url = "";



function processLoadList(myajax, curDropDown) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 		//alert("myajax.responseText "+myajax.responseText);
	 		if (typeof xmlDoc != "undefined"){
	 			//alert("hh");
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
      		//alert("toAdd "+optionList[0].getAttribute("facType"));
      		if(optionList[0].getAttribute("facilityType") == 'null'){
      			document.getElementById("facilityType").value='';
      		}else{
      		document.getElementById("facilityType").value=optionList[0].getAttribute("facilityType");
      			}
      		if(optionList[0].getAttribute("facilitySystem") == 'null'){
      			document.getElementById("facilitySystem").value='';
      		}else{
      		document.getElementById("facilitySystem").value=optionList[0].getAttribute("facilitySystem");
      		}
      		if(optionList[0].getAttribute("lineNo") == 'null'){
      			document.getElementById("lineNo").value='';
      		}else{
      			document.getElementById("lineNo").value=optionList[0].getAttribute("lineNo");
      		}
      		
      		if(optionList[0].getAttribute("currencyCode") == 'null'){
      			document.getElementById("currencyCode").value='';
      		}else{
      			document.getElementById("currencyCode").value=optionList[0].getAttribute("currencyCode");
      		}
      	
      		if(optionList[0].getAttribute("facilityCode") == 'null'){
      			document.getElementById("facilityCode").value='';
      		}else{
      		document.getElementById("facilityCode").value=optionList[0].getAttribute("facilityCode");
      		}
      		
      		if(optionList[0].getAttribute("purpose") == "Others"){
      			document.getElementById("purpose").value=optionList[0].getAttribute("purpose");
      			document.getElementById("purpose").readOnly=true;
      			document.forms[0].isDPRequired[0].checked =false;
      			document.forms[0].isDPRequired[1].checked =false;
      			document.forms[0].isDP[0].checked =false;
				document.forms[0].isDP[1].checked =false;
      			document.forms[0].isDP[0].disabled =false;
				document.forms[0].isDP[1].disabled =false;
				document.getElementById("otherPurpose").readOnly =false;
      		}else
      			if(optionList[0].getAttribute("purpose") == "Working Capital" || optionList[0].getAttribute("purpose") == "WORKING_CAPITAL"){
      				document.getElementById("purpose").value=optionList[0].getAttribute("purpose");
      				document.getElementById("otherPurpose").value='';
      				document.forms[0].isDPRequired[0].checked = true;
      				document.forms[0].isDP[0].disabled =false;
					document.forms[0].isDP[1].disabled =false;
					document.forms[0].isDP[0].checked =true;
					document.getElementById("otherPurpose").readOnly =true;
      		}else {
      			document.getElementById("purpose").value=optionList[0].getAttribute("purpose");
      			document.getElementById("otherPurpose").value='';
      			document.getElementById("purpose").readOnly=true;
      			document.forms[0].isDP[0].disabled =false;
				document.forms[0].isDP[1].disabled =false;
      			document.forms[0].isDPRequired[0].checked =false;
      			document.forms[0].isDPRequired[1].checked =false;
				document.forms[0].isDP[0].checked =false;
				document.forms[0].isDP[1].checked =false;
      			
				document.getElementById("otherPurpose").readOnly =true;
      		}
      		if(optionList[0].getAttribute("purpose") == 'null'){
      			document.getElementById("purpose").value='';
      		}
      		
      		if(optionList[0].getAttribute("relationShipManager") == 'null'){
      			document.getElementById("relationShipManager").value='';
      		}else{
      			document.getElementById("relationShipManager").value=optionList[0].getAttribute("relationShipManager");
      		}
      		
      		if(optionList[0].getAttribute("grade") == 'null'){
      			document.getElementById("grade").value='';
      		}else{
      			//document.getElementById("grade").value=optionList[0].getAttribute("grade");
      		}
//      		alert('TEST');
      		if(optionList[0].getAttribute("isLoanOptionAvailable") == 'null'){
      			document.getElementById("availAndOptionApplicable").value='';
		}	
      		else{
      			document.getElementById("availAndOptionApplicable").value=optionList[0].getAttribute("isLoanOptionAvailable");
	}
      	
}
	}	
}

function sendLoadListReq(dropdownName, url) {
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


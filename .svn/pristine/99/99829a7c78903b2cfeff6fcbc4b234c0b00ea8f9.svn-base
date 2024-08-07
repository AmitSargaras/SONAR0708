
var ajaxDropdownObj = new Object();
ajaxDropdownObj.ajaxobj = null;
ajaxDropdownObj.name = "";
ajaxDropdownObj.url = "";

var ajaxDropdownObj2 = new Object();
ajaxDropdownObj2.ajaxobj = null;
ajaxDropdownObj2.name = "";
ajaxDropdownObj2.url = "";


function processLoadCriTranch(myajax, curDropDown) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 		if (typeof xmlDoc != "undefined")
			    displayCriTranch(xmlDoc, curDropDown);
      	}
		else {
		//	alert("The server could be too busy at the moment. Please try again");
		}
   	}
}

function displayCriTranch(curDoc, curDropDown) {
	if (curDropDown != null && curDoc != null) {
		var toAdd = document.getElementById(curDropDown);
		if (toAdd == null) {	//fix for other browsers since IE can retrieve those under Name as Id
			elname = document.getElementsByName(curDropDown);
			toAdd = elname[0];
		}
      	var criTranchList = curDoc.getElementsByTagName("critranch");
      	
      	if (toAdd != null && criTranchList != null) {
      		var estateType         = criTranchList[0].getAttribute("estateType");
      		var commRealEstateType = criTranchList[0].getAttribute("commRealEstateType");
      		var prioritySector 	   = criTranchList[0].getAttribute("prioritySector");
      		
	      	if(estateType == 'null'){
	  			document.getElementById("estateType").value='';
	  		}else{
	  			document.getElementById("estateType").value = estateType;
	  		}
	      	
	      	if(commRealEstateType == 'null'){
	  			document.getElementById("commRealEstateType").value='';
	  		}else{
	  			document.getElementById("commRealEstateType").value=commRealEstateType;
	  			document.getElementById("tempCommRealEstateType").value=commRealEstateType;
	  		}
	      	if(prioritySector == 'null'){
	  			document.getElementById("prioritySector").value='';
	  		}else{
	  			document.getElementById("prioritySector").value=prioritySector;
	  			document.getElementById("tempPrioritySector").value=prioritySector;
	  		}
      	}
	}	
}

function sendLoadCriTranchReq(dropdownName, url) {
	//check if the last character is =, this means no parameter passed
	if ((url.length-1) == url.lastIndexOf("="))
	{
		clearDisplayCriTranch(dropdownName);
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
		processLoadCriTranch(xhr, dropdownName);
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

function sendLoadDropdownReq2(dropdownName, url) {
	//check if the last character is =, this means no parameter passed
	if ((url.length-1) == url.lastIndexOf("="))
	{
		clearDisplayCriTranch(dropdownName);
		return;
	}

    var xhr = createAjaxObj();
	//alert("xhr: " + xhr + "   ajaxDropdownObj2: " + ajaxDropdownObj2.ajaxobj + "   name: " + ajaxDropdownObj2.name);
	if (ajaxDropdownObj2.ajaxobj != null)
	{
		if (ajaxDropdownObj2.ajaxobj.readyState != 0)
		{
			if (ajaxDropdownObj2.name == dropdownName)
			{
				//if the previous request is for the same dropdown, then abort it
				ajaxDropdownObj2.ajaxobj.abort();
				//window.status = "Aborting previous request for '" + dropdownName + "' dropdown list";
			}
		}
	}
	
	xhr.onreadystatechange = function() {
		processLoadCriTranch(xhr, dropdownName);
	};
	xhr.open('POST', url, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	//xhr.setRequestHeader("Content-length", ''.length);	//bypass ie6 bug
	//xhr.setRequestHeader("Connection", "close");		//bypass ie6 bug
	xhr.send('');

	ajaxDropdownObj2.ajaxobj = xhr;
	ajaxDropdownObj2.name = dropdownName;
	ajaxDropdownObj2.url = url;
}

function clearDisplayCriTranch(curDropDown) {
	if (curDropDown != null)
	{
		var xmlDoc = createXMLDOM_string('<?xml version="1.0"?><optionlist></optionlist>');
		if (typeof xmlDoc != "undefined")
			displayCriTranch(xmlDoc, curDropDown);
	}
}


var ajaxDropdownObj = new Object();
ajaxDropdownObj.ajaxobj = null;
ajaxDropdownObj.name = "";
ajaxDropdownObj.url = "";

var ajaxDropdownObj2 = new Object();
ajaxDropdownObj2.ajaxobj = null;
ajaxDropdownObj2.name = "";
ajaxDropdownObj2.url = "";


function processLoadNewTat(myajax, curDropDown) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 		if (typeof xmlDoc != "undefined")
			    displayNewTat(xmlDoc, curDropDown);
      	}
		else {
		//	alert("The server could be too busy at the moment. Please try again");
		}
   	}
}

function displayNewTat(curDoc, curDropDown) {
	if (curDropDown != null && curDoc != null) {
		var toAdd = document.getElementById(curDropDown);
		if (toAdd == null) {	//fix for other browsers since IE can retrieve those under Name as Id
			elname = document.getElementsByName(curDropDown);
			toAdd = elname[0];
		}
      
      	var NewTatList = curDoc.getElementsByTagName("option");
      	
      	if (toAdd != null && NewTatList != null) {
	      	if(NewTatList[0].getAttribute("lineNumber") == 'null'){
	  			document.getElementById("lineNumber").value='';
	  		}else{
	  			document.getElementById("lineNumber").value=NewTatList[0].getAttribute("lineNumber");
	  		}
	      	/*if(NewTatList[0].getAttribute("serialNumber") == 'null'){
	  			document.getElementById("serialNumber").value='';
	  		}else{
	  			document.getElementById("serialNumber").value=NewTatList[0].getAttribute("serialNumber");
	  		}*/
      	}
	}	
}

function sendLoadNewTatReq(dropdownName, url) {
	//check if the last character is =, this means no parameter passed
	if ((url.length-1) == url.lastIndexOf("="))
	{
		clearDisplayNewTat(dropdownName);
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
		processLoadNewTat(xhr, dropdownName);
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
		clearDisplayNewTat(dropdownName);
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
		processLoadNewTat(xhr, dropdownName);
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

function clearDisplayNewTat(curDropDown) {
	if (curDropDown != null)
	{
		var xmlDoc = createXMLDOM_string('<?xml version="1.0"?><optionlist></optionlist>');
		if (typeof xmlDoc != "undefined")
			displayNewTat(xmlDoc, curDropDown);
	}
}

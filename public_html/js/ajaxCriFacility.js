
var ajaxDropdownObj = new Object();
ajaxDropdownObj.ajaxobj = null;
ajaxDropdownObj.name = "";
ajaxDropdownObj.url = "";

var ajaxDropdownObj2 = new Object();
ajaxDropdownObj2.ajaxobj = null;
ajaxDropdownObj2.name = "";
ajaxDropdownObj2.url = "";


function processLoadCriFac(myajax, curDropDown) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 		if (typeof xmlDoc != "undefined")
			    displayCriFac(xmlDoc, curDropDown);
      	}
		else {
		//	alert("The server could be too busy at the moment. Please try again");
		}
   	}
}

function displayCriFac(curDoc, curDropDown) {
	if (curDropDown != null && curDoc != null) {
		var toAdd = document.getElementById(curDropDown);
		if (toAdd == null) {	//fix for other browsers since IE can retrieve those under Name as Id
			elname = document.getElementsByName(curDropDown);
			toAdd = elname[0];
		}
      	var optionList = curDoc.getElementsByTagName("option");
      	if (toAdd != null && optionList != null) {
        	while(toAdd.options.length > 0) {
            	toAdd.remove(0);
         	}
	        var newOp = new Option();
		 	//newOp.text = "Please Select ";
		 	//newOp.value = "";
	        //toAdd.add(newOp);
			//toAdd.options[toAdd.length] = newOp;
	        for (i=0; i<optionList.length; i++) {
			    var lb = optionList[i].getAttribute("label");
			    var val = optionList[i].getAttribute("value");
			    var newOp = new Option();
			    newOp.text = lb;
			    newOp.value = val;
				toAdd.options[toAdd.length] = newOp;
			    //toAdd.add(newOp);
		 	}
		}
      	var criFacList = curDoc.getElementsByTagName("crifac");
      	
      	if (toAdd != null && criFacList != null) {
	      	if(criFacList[0].getAttribute("facilityAmount") == 'null'){
	  			document.getElementById("facilityAmount").value='';
	  		}else{
	  			document.getElementById("facilityAmount").value=criFacList[0].getAttribute("facilityAmount");
	  		}
	      	if(criFacList[0].getAttribute("lineNo") == 'null'){
	  			document.getElementById("lineNo").value='';
	  		}else{
	  			document.getElementById("lineNo").value=criFacList[0].getAttribute("lineNo");
	  		}
      	}
	}	
}

function sendLoadCriFacReq(dropdownName, url) {
	//check if the last character is =, this means no parameter passed
	if ((url.length-1) == url.lastIndexOf("="))
	{
		clearDisplayCriFac(dropdownName);
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
		processLoadCriFac(xhr, dropdownName);
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
		clearDisplayCriFac(dropdownName);
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
		processLoadCriFac(xhr, dropdownName);
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

function clearDisplayCriFac(curDropDown) {
	if (curDropDown != null)
	{
		var xmlDoc = createXMLDOM_string('<?xml version="1.0"?><optionlist></optionlist>');
		if (typeof xmlDoc != "undefined")
			displayCriFac(xmlDoc, curDropDown);
	}
}

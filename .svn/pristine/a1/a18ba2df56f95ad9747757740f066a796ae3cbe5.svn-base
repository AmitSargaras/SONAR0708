var ajaxDropdownObj = new Object();
ajaxDropdownObj.ajaxobj = null;
ajaxDropdownObj.name = "";
ajaxDropdownObj.url = "";



function processLoadIncoDesc(myajax, curDropDown) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 		//alert("myajax.responseText "+myajax.responseText);
	 		if (typeof xmlDoc != "undefined"){
	 			//alert("hh");
			    displayIncoDesc(xmlDoc, curDropDown);
	 		}
      	}
		else {
		//	alert("The server could be too busy at the moment. Please try again");
		}
   	}
}

function displayIncoDesc(curDoc, curDropDown) {
	if (curDropDown != null && curDoc != null) {
		var toAdd = document.getElementById(curDropDown);
		if (toAdd == null) {	//fix for other browsers since IE can retrieve those under Name as Id
			elname = document.getElementsByName(curDropDown);
			toAdd = elname[0];
		}
      	var optionList = curDoc.getElementsByTagName("option");
      	if (toAdd != null && optionList != null) {
      		//alert("toAdd "+optionList[0].getAttribute("inrValue"));
      		if(optionList[0].getAttribute("incoDescription") == 'null'){
      			document.getElementById("incoDescription").value='';
      		}else{
      		document.getElementById("incoDescription").value=optionList[0].getAttribute("incoDescription");
      		}
		}	
	}	
}

function sendLoadIncoDescReq(dropdownName, url) {
	//check if the last character is =, this means no parameter passed
	
	if ((url.length-1) == url.lastIndexOf("="))
	{
		cleardisplayIncoDesc(dropdownName);
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
		processLoadIncoDesc(xhr, dropdownName);
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


function cleardisplayIncoDesc(curDropDown) {
	if (curDropDown != null)
	{
		var xmlDoc = createXMLDOM_string('<?xml version="1.0"?><objectlist></objectlist>');
		if (typeof xmlDoc != "undefined")
			displayIncoDesc(xmlDoc, curDropDown);
	}
}


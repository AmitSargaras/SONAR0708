var ajaxDropdownObj = new Object();
ajaxDropdownObj.ajaxobj = null;
ajaxDropdownObj.name = "";
ajaxDropdownObj.url = "";



function processLoadSancAmount(myajax, curDropDown) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 		//alert("myajax.responseText "+myajax.responseText);
	 		if (typeof xmlDoc != "undefined"){
	 			//alert("hh");
			    displaySancAmount(xmlDoc, curDropDown);
	 		}
      	}
		else {
		//	alert("The server could be too busy at the moment. Please try again");
		}
   	}
}

function displaySancAmount(curDoc, curDropDown) {
	if (curDropDown != null && curDoc != null) {
		var toAdd = document.getElementById(curDropDown);
		if (toAdd == null) {	//fix for other browsers since IE can retrieve those under Name as Id
			elname = document.getElementsByName(curDropDown);
			toAdd = elname[0];
		}
      	var optionList = curDoc.getElementsByTagName("option");
      	if (toAdd != null && optionList != null) {
      		//if(optionList[0].getAttribute("inrValue") === null || typeof(optionList[0].getAttribute("inrValue"))==='undefined' ){
      		if(typeof(optionList[0])==='undefined'){
      			document.getElementById("inrValue").value='';
      		}else{
      			document.getElementById("inrValue").value=optionList[0].getAttribute("inrValue");
      		}
      		
      		if(optionList[0]!=null && optionList[0].getAttribute("flag") == 'true'){
      			alert("Please enter numeric values only.");
      			document.getElementById("inrValue").value="0.00";
      		}
		}	
	}	
}

function sendLoadSancAmountReq(dropdownName, url) {
	//check if the last character is =, this means no parameter passed
	
	if ((url.length-1) == url.lastIndexOf("="))
	{
		cleardisplaySancAmount(dropdownName);
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
		processLoadSancAmount(xhr, dropdownName);
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


function cleardisplaySancAmount(curDropDown) {
	if (curDropDown != null)
	{
		var xmlDoc = createXMLDOM_string('<?xml version="1.0"?><objectlist></objectlist>');
		if (typeof xmlDoc != "undefined")
			displaySancAmount(xmlDoc, curDropDown);
	}
}


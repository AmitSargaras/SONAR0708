
/* need itgUtilities.js to function properly */

var ajaxGenericDropdownObj = new Object();
ajaxGenericDropdownObj.ajaxobj = null;
ajaxGenericDropdownObj.name = "";
ajaxGenericDropdownObj.url = "";
ajaxGenericDropdownObj.lastSelected = "";

var genericShowLoadingAnim = false;
var genericDropdownShowSize = 20;

if (document.getElementById("genericDropdown") == null) {
	document.write('<select name="genericDropdown" id="genericDropdown" size="10" style="display:none;position:absolute;z-index:99999" onclick="generic_select_click(this);" onblur="generic_select_blur(this)" onkeypress="generic_select_keypress(this);" DISABLED></select>');
	if (genericShowLoadingAnim == true)
		document.write('<div id="animLoading" name="animLoading" style="display:none;position:absolute;z-index:999999"><img src="' + getContextPath() + '/img/loading-circular.gif" border="0"></div>');
}

function processGenericLoadDropdown(myajax, curDropDown, ajaxObj) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 		if (typeof xmlDoc != "undefined") {
			    displayGenericDropdown(xmlDoc, curDropDown, ajaxObj);

				var toAdd = findObjectRef(curDropDown);
				if (toAdd.setScroll == "true") {
					var canvas = document.getElementById("contentCanvas");
					if (canvas != null) canvas.style.overflowX = "hidden";
					var canvasInnerTab = document.getElementById("contentCanvasInnerTab");
					if (canvasInnerTab != null) canvasInnerTab.style.overflowX = "scroll";
				}
				resize();
			}
      	}
		else {
			//alert("The server could be too busy at the moment. Please try again");
			var toAdd = findObjectRef(curDropDown);
			if (toAdd != null)
				toAdd.disabled = false;
		}
   	}
}

function displayGenericDropdown(curDoc, curDropDown, ajaxObj) {
	if (curDropDown != null && curDoc != null) {
		var toAdd = findObjectRef(curDropDown);
		if (toAdd != null) {
			toAdd.disabled = false;
			toAdd.blur();	//for chrome to hide dropdown
			toAdd.style.display = 'block';	//for chrome to hide dropdown
			toAdd.focus();
		}

		var mySelected = null;
      	var optionList = curDoc.getElementsByTagName("option");
      	if (toAdd != null && optionList != null) {
        	while (toAdd.options.length > 0) {
				toAdd.remove(0);
         	}

	        var newOp = new Option();
			if (ajaxObj == "loading") {
				newOp.text = "Loading... Please Wait ";
			} else {
				newOp.text = "Please Select ";
			}
		 	newOp.value = "";
	        //toAdd.add(newOp);
			toAdd.options[toAdd.length] = newOp;

	        for (i=0; i<optionList.length; i++) {
			    var lb = optionList[i].getAttribute("label");
			    var val = optionList[i].getAttribute("value");
			    var newOp = new Option();
			    newOp.text = lb;
			    newOp.value = val;
				toAdd.options[toAdd.length] = newOp;
			    //toAdd.add(newOp);

				if (ajaxObj != null) {
					if (val == ajaxObj.lastSelected) {
						mySelected = toAdd.length-1;
						//toAdd.options[mySelected].selected = true;
					}
				}
		 	}

			if (mySelected != null)
				toAdd.options[mySelected].selected = true;

			if (toAdd.onclick != null)
			{
				//disable onclick since dropdown is loaded
				//toAdd.onclick = function() {};
				toAdd.onclick = null;
			}
			else if (toAdd.onmousedown != null)
			{
				generic_dropdown_mouseup(toAdd);

				toAdd.onmousedown = null;
				toAdd.onmouseup = null;
			}
			//toAdd.blur();
			
			if (genericShowLoadingAnim == true) {
				var toAnim = findObjectRef("animLoading");
				if (toAnim != null) {
					toAnim.style.display = 'none';
				}
			}
		}
	}	
}

function sendGenericLoadDropdownReq(dropdownName, url, lastSelected) {
	//check if the last character is =, this means no parameter passed
	if ((url.length-1) == url.lastIndexOf("=")) {
		clearGenericdisplayGenericDropdown(dropdownName);
		return;
	} else {
		//use this to close dropdown
		if (findObjectRef(dropdownName).onmousedown == null) {
			//clearGenericdisplayGenericDropdown(dropdownName, "loading");
		}
	}

    var xhr = createAjaxObj();
	//alert("xhr: " + xhr + "   ajaxGenericDropdownObj: " + ajaxGenericDropdownObj.ajaxobj + "   name: " + ajaxGenericDropdownObj.name);
	if (ajaxGenericDropdownObj.ajaxobj != null)
	{
		if (ajaxGenericDropdownObj.ajaxobj.readyState != 0)
		{
			if (ajaxGenericDropdownObj.name == dropdownName)
			{
				//if the previous request is for the same dropdown, then abort it
				ajaxGenericDropdownObj.ajaxobj.abort();
				//window.status = "Aborting previous request for '" + dropdownName + "' dropdown list";
			}
		}
	}

	ajaxGenericDropdownObj.ajaxobj = xhr;
	ajaxGenericDropdownObj.name = dropdownName;
	ajaxGenericDropdownObj.url = url;
	ajaxGenericDropdownObj.lastSelected = lastSelected;
	
	xhr.onreadystatechange = function() {
		processGenericLoadDropdown(xhr, dropdownName, ajaxGenericDropdownObj);
	};
	xhr.open('POST', url, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	//xhr.setRequestHeader("Content-length", ''.length);	//bypass ie6 bug
	//xhr.setRequestHeader("Connection", "close");		//bypass ie6 bug
	xhr.send('');
	
}


function clearGenericdisplayGenericDropdown(curDropDown, tempAjaxObj) {
	if (curDropDown != null)
	{
		var xmlDoc = createXMLDOM_string('<?xml version="1.0"?><optionlist></optionlist>');
		if (typeof xmlDoc != "undefined")
			displayGenericDropdown(xmlDoc, curDropDown, tempAjaxObj);
	}
}

// invoke fireEvent() on object whose ID is passed as parameter
function doFireEvent(objID, eventName) {
    var newEvt = document.createEventObject()
    newEvt.button = 3;

    //document.all(objID).fireEvent("onclick", newEvt);	
	var myObj = document.getElementById(objID);
	if (myObj == null) {	//fix for other browsers since IE can retrieve those under Name as Id
		elname = document.getElementsByName(objID);
		myObj = elname[0];
	}
	myObj.fireEvent(eventName, newEvt);

    // don't let button clicks bubble
    event.cancelBubble = true;
}

function refreshGenericDropDownList(dropdown, serverpath) {	
	var currVal = "";
	for(i = 0; i < dropdown.options.length; i++) {
		if (dropdown.options[i].selected == true) {
			currVal = dropdown.options[i].value;
		}
	}
	dropdown.disabled = true;

	var myName;
	var myCode;
	if (dropdown.id != null && dropdown.id != "") {
		myName = dropdown.name;
		if (typeof dropdown.categoryCode == "undefined")
		{
			dropdown.categoryCode = getParameter("categoryCode", dropdown.id);
				if (dropdown.categoryCode == false) dropdown.categoryCode = "";
			dropdown.entryCode = getParameter("entryCode", dropdown.id);
				if (dropdown.entryCode == false) dropdown.entryCode = "";
			dropdown.source = getParameter("source", dropdown.id);
				if (dropdown.source == false) dropdown.source = "";
			dropdown.descWithCode = getParameter("descWithCode", dropdown.id);
				if (dropdown.descWithCode == false) dropdown.descWithCode = "true";
			dropdown.initial = getParameter("initial", dropdown.id);
				if (dropdown.initial == false) dropdown.initial = "";
			dropdown.country = getParameter("country", dropdown.id);
				if (dropdown.country == false) dropdown.country = "";
			dropdown.setScroll = getParameter("setScroll", dropdown.id);
				if (dropdown.setScroll == false) dropdown.setScroll = "true";
		}
		myCode = dropdown.categoryCode;
	} else {
		myName = dropdown.name;
		myCode = myName;
	}

	var url = serverpath + '/commoncode/' + 'get_common_code.jsp' + '?code=' + myCode;
	//code=SCHEME&source=MY&ref=ee&desc=true&initial=A&country=MY	
	if (typeof dropdown.entryCode != "undefined") {
		if (dropdown.entryCode != "")
			url = url + '&ref=' + dropdown.entryCode;
	}
	if (typeof dropdown.source != "undefined") {
		if (dropdown.source != "")
			url = url + '&source=' + dropdown.source;
	}
	if (typeof dropdown.descWithCode != "undefined") {
		if (dropdown.descWithCode != "")
			url = url + '&desc=' + dropdown.descWithCode;
	}
	if (typeof dropdown.initial != "undefined") {
		if (dropdown.initial != "")
			url = url + '&initial=' + dropdown.initial;
	}
	if (typeof dropdown.country != "undefined") {
		if (dropdown.country != "")
			url = url + '&country=' + dropdown.country;
	}
	//alert(url);
	sendGenericLoadDropdownReq(myName, url, currVal);
}

function findObjectRef(objID) {
	var myObj = document.getElementById(objID);
	if (myObj == null) {	//fix for other browsers since IE can retrieve those under Name as Id
		elname = document.getElementsByName(objID);
		myObj = elname[0];
	}
	return(myObj);
}


// disabling the select box stops the dropdown list happening
var generic_clickDown = false;
var generic_clickDown_Name = null;
var genericDropdownName = "genericDropdown";

function generic_dropdown_restore(dropdownName)
{
	var myObj = findObjectRef(dropdownName);
	if (myObj != null) {
		myObj.disabled = false;
		myObj.focus();

		if (myObj.onmouseup == null) {
			if (genericShowLoadingAnim == true) {
				var toAnim = findObjectRef("animLoading");
				if (toAnim != null) {
					toAnim.style.display = 'block';
					toAnim.style.top = myObj.offsetTop + 2;
					toAnim.style.left = myObj.offsetLeft + myObj.offsetWidth + 8;
				}
			}
			refreshGenericDropDownList(myObj, getContextPath());
		}
	}
}

//generic_dropdown_mousedown(this, "genericDropdown", document.body)
function generic_dropdown_mousedown(dropdown, listbox, newFocus)
{
var myName;

	dropdown.disabled = true;

	if (dropdown.id != null && dropdown.id != "") {
		myName = dropdown.name;
		dropdown.categoryCode = getParameter("categoryCode", dropdown.id);
			if (dropdown.categoryCode == false) dropdown.categoryCode = "";
		dropdown.entryCode = getParameter("entryCode", dropdown.id);
			if (dropdown.entryCode == false) dropdown.entryCode = "";
		dropdown.source = getParameter("source", dropdown.id);
			if (dropdown.source == false) dropdown.source = "";
		dropdown.descWithCode = getParameter("descWithCode", dropdown.id);
			if (dropdown.descWithCode == false) dropdown.descWithCode = "true";
		dropdown.initial = getParameter("initial", dropdown.id);
			if (dropdown.initial == false) dropdown.initial = "";
		dropdown.country = getParameter("country", dropdown.id);
			if (dropdown.country == false) dropdown.country = "";
		dropdown.setScroll = getParameter("setScroll", dropdown.id);
			if (dropdown.setScroll == false) dropdown.setScroll = "true";
	} else {
		myName = dropdown.name;
	}
	generic_clickDown_Name = myName;
	
	if ((typeof listbox == "undefined") || (listbox == null )) {
		listbox = findObjectRef(genericDropdownName);
		listbox.disabled = true;
	}
	if (!listbox.disabled) {
		generic_clickDown = true;
	} else {
		if ((typeof newFocus != "undefined") && (newFocus != null )) {
			newFocus.focus();
		}
	}

    setTimeout('generic_dropdown_restore("' + myName + '")', 20);
}

//generic_dropdown_mouseup(this, "genericDropdown")
function generic_dropdown_mouseup(dropdown, listbox)
{
	if ((typeof listbox == "undefined") || (listbox == null )) {
		listbox = findObjectRef(genericDropdownName);
	}

	if (!generic_clickDown)
	{
		if (dropdown.length > genericDropdownShowSize)
			listbox.size = genericDropdownShowSize;
		else
			listbox.size = dropdown.length;

		var xOffset = dropdown.offsetHeight + dropdown.offsetTop;
		var listboxHeight;
		if (BrowserDetect) {
			if (BrowserDetect.browser == "Explorer")
				listboxHeight = (listbox.size*dropdown.offsetHeight) - (5*dropdown.offsetHeight);
			else if (BrowserDetect.browser == "Chrome")
				listboxHeight = (listbox.size*dropdown.offsetHeight) - (2*dropdown.offsetHeight) - 8;
			else
				listboxHeight = (listbox.size*dropdown.offsetHeight) - (3*dropdown.offsetHeight) - 3;
		}
		if (listboxHeight < 0) listboxHeight = 0;
		if (xOffset+listboxHeight > calculateWindowHeight()) {
			listbox.style.top = xOffset - listboxHeight;
			////window.status = "< xOffset: " + xOffset + "  height: " + calculateWindowHeight() + "  listboxHeight: " + listboxHeight + "  listbox.style.top: " + listbox.style.top;
		}
		else {
			listbox.style.top = xOffset;
			////window.status = "> xOffset: " + xOffset + "  height: " + calculateWindowHeight() + "  listboxHeight: " + listboxHeight + "  listbox.style.top: " + listbox.style.top;
		}

		listbox.style.left = dropdown.offsetLeft;
		listbox.disabled = false;

		while (listbox.options.length > 0) {
			listbox.remove(0);
		}

		for (var i = 0; i < dropdown.length; i++)
		{
			listbox.options[i] = new Option(dropdown.options[i].text,
											dropdown.options[i].value,
											dropdown.options[i].defaultSelected,
											dropdown.options[i].selected);
        }

		//normal dropdown with ajax
		//alert("onmousedown: " + dropdown.onmousedown + "  onmouseup: " + dropdown.onmouseup)
		if (dropdown.onmousedown != null && dropdown.onmouseup != null)
		{
			if (BrowserDetect) {
				if (BrowserDetect.browser != "Chrome")
					listbox.style.display = 'block';	//skip this for chrome
			}
			else {
				listbox.style.display = 'block';
			}
			listbox.focus();
		}
		else {
			listbox.style.display = 'block';
			listbox.focus();
		}
	} else {
		generic_clickDown = false;
		listbox.disabled = true;
	}
}

function generic_select_click(listbox, dropdown)
{
	if (generic_clickDown_Name == null) return;
	if ((typeof dropdown == "undefined") || (dropdown == null )) {
		dropdown = findObjectRef(generic_clickDown_Name);
	}

	dropdown.selectedIndex = listbox.selectedIndex;
	dropdown.focus();

	listbox.style.display = 'none';
	//listbox.length = 0;	//this is very slow
	listbox.disabled = true;
}

function generic_select_blur(listbox, dropdown)
{
	if (generic_clickDown_Name == null) return;
	if ((typeof dropdown == "undefined") || (dropdown == null )) {
		dropdown = findObjectRef(generic_clickDown_Name);
	}

	listbox.style.display = 'none';
	listbox.disabled = true;
	if (!dropdown.disabled) {
		dropdown.focus();
	}
}

function generic_select_keypress(listbox, event, dropdown)
{
var charCode;
	
	if (event.keyCode) 
	   charCode = event.keyCode;
	else if (event.which) 
	   charCode = event.which;
	if ((charCode == 13) 
        || (charCode == 32)
		)
	{
		generic_select_click(listbox, dropdown);
	}
}


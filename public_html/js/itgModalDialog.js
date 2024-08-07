// JavaScript Document
/**********************************************************************
  BEGIN MODAL DIALOG CODE
***********************************************************************/
// Global for brower version branching.
var Nav4 = ((navigator.appName == "Netscape") && (parseInt(navigator.appVersion) >= 4))

// One object tracks the current modal dialog opened from this window.
var dialogWin = new Object()


// Generate a modal dialog
// Parameters:
// 		url -- URL of the page/frameset to be loaded into dialog
//		sFeatures --
//			height = number (default=300)
//			left = number
//			width = number (default=400)
//			top = number
// 			resizable = {yes | no | 1 | 0}
//			scollbars = {yes | no | 1 | 0}
//			status = {yes | no | 1 | 0}
//	    returnFunc -- [for netscape only] reference to the function (on this page)
//                  that is to act on the data returned from the dialog
// 		args -- [optional] any data you need to pass to the dialog; currently, the parent
//				window object is passed.
// Return:
//		a variant

function openModalDialog(url, sFeatures, returnFunc, args) {
	// IE -- use showModalDialog directly
	if(!Nav4) {
		return showModalDialog(url, args, assembleIEFeatures(sFeatures));
	}
	
	// Natscape
	if (!dialogWin.win || (dialogWin.win && dialogWin.win.closed)) {
		// Initialize properties of the modal dialog object.
		dialogWin.returnFunc = returnFunc;
		dialogWin.returnedValue = "";
		dialogWin.args = args;
		dialogWin.url = url;
		sFeatures = assembleNavFeatures(sFeatures);
		// note: after assemble, left becomes screenX and top becomes screenY
		dialogWin.width = getAttributeValue(sFeatures, "width");
		dialogWin.height = getAttributeValue(sFeatures, "height");
		// Keep name unique so Navigator doesn't overwrite an existing dialog.
		dialogWin.name = (new Date()).getSeconds().toString();
		// Assemble window attributes and try to center the dialog.
/*
		if (Nav4) {
			// Center on the main window.
			dialogWin.left = window.screenX + 
			   ((window.outerWidth - dialogWin.width) / 2)
			dialogWin.top = window.screenY + 
			   ((window.outerHeight - dialogWin.height) / 2)
			var attr = "screenX=" + dialogWin.left + 
			   ",screenY=" + dialogWin.top + ",resizable=no,width=" + 
			   dialogWin.width + ",height=" + dialogWin.height
		} else {
			// The best we can do is center in screen.
			dialogWin.left = (screen.width - dialogWin.width) / 2
			dialogWin.top = (screen.height - dialogWin.height) / 2
			var attr = "left=" + dialogWin.left + ",top=" + 
			   dialogWin.top + ",resizable=no,width=" + dialogWin.width + 
			   ",height=" + dialogWin.height
		}
*/		
		// Generate the dialog and make sure it has focus.
		//dialogWin.win=window.open(dialogWin.url, dialogWin.name, attr);
		dialogWin.win=window.open(dialogWin.url, dialogWin.name, sFeatures);
		dialogWin.win.focus();
	} else {
		dialogWin.win.focus()
	}
}

// return null if no such attrName found
function getAttributeValue(sFeatures, attrName) {
	if(sFeatures==null || sFeatures=="") {
		return null;
	}
	var arr = null;
	
	// note: if sFeatures contains only one set of name-value pair (without comma)
	// it returns the original string
	arr = sFeatures.split(",");  

	var p = / /g;
	var arr2=null;

	for(var i=0; i<arr.length; i++) {
		arr[i] = arr[i].replace(p,"");
		arr2 = arr[i].split("=");
		if(arr2[0]==attrName)
			return arr2[1];
	}
	return null;
}

function assembleNavFeatures(sFeatures) {
	var height = 300;
	var width = 400;
	var sFormatFeatures="";
	var v=0;

	if(sFeatures==null || sFeatures=="") {
		sFormatFeatures = "height=" + height + ",width:" + width;
		return sFormatFeatures;
	}
	
	if(getAttributeValue(sFeatures,"height")==null) {
		sFeatures = "height="+height+","+sFeatures;
	}
	if(getAttributeValue(sFeatures,"width")==null) {
		sFeatures = "width="+width+","+sFeatures;
	}
/*
	if(getAttributeValue(sFeatures,"left")==null) {
		v = window.screenX + ((window.outerWidth - dialogWin.width) / 2);
		sFeatures = "left="+v+","+sFeatures;
	}
	if(getAttributeValue(sFeatures,"top")==null) {
		v = window.screenY + ((window.outerHeight - dialogWin.height) / 2);
		sFeatures = "top="+v+","+sFeatures;
	} 
*/
	var arrAttr = new Array();
	var obj = new Object;
	obj.attrName = "height";
	obj.featureName = "height";
	obj.measurement = "";
	arrAttr[0] = obj;
	
	obj = new Object;
	obj.attrName = "width";
	obj.featureName = "width";
	obj.measurement = "";
	arrAttr[1] = obj;

	obj = new Object;
	obj.attrName = "left";
	obj.featureName = "screenX";
	obj.measurement = "";
	arrAttr[2] = obj;

	obj = new Object;
	obj.attrName = "top";
	obj.featureName = "screenY";
	obj.measurement = "";
	arrAttr[3] = obj;

	obj = new Object;
	obj.attrName = "resizable";
	obj.featureName = "resizable";
	obj.measurement = "";
	arrAttr[4] = obj;

	obj = new Object;
	obj.attrName = "scollbars";
	obj.featureName = "scrollbars";
	obj.measurement = "";
	arrAttr[5] = obj;

	obj = new Object;
	obj.attrName = "status";
	obj.featureName = "status";
	obj.measurement = "";
	arrAttr[6] = obj;

	var v=null;
	for(var i=0; i<arrAttr.length; i++) {
		v = getAttributeValue(sFeatures,arrAttr[i].attrName);
		if(v) {
			sFormatFeatures=sFormatFeatures+arrAttr[i].featureName+"="+v+arrAttr[i].measurement+",";
		}
	}
	//alert(sFormatFeatures);
	return sFormatFeatures;
}

function assembleIEFeatures(sFeatures) {
	var height = 300;
	var width = 400;
	var sFormatFeatures="";

	if(sFeatures==null || sFeatures=="") {
		sFormatFeatures = "dialogHeight:" + height + "px" + ";dialogWidth:" + width + "px;";
		return sFormatFeatures;
	}

	var arrAttr = new Array();
	var obj = new Object;
	obj.attrName = "height";
	obj.featureName = "dialogHeight";
	obj.measurement = "px";
	arrAttr[0] = obj;
	
	obj = new Object;
	obj.attrName = "width";
	obj.featureName = "dialogWidth";
	obj.measurement = "px";
	arrAttr[1] = obj;

	obj = new Object;
	obj.attrName = "left";
	obj.featureName = "dialogXPos";
	obj.measurement = "";
	arrAttr[2] = obj;

	obj = new Object;
	obj.attrName = "top";
	obj.featureName = "dialogYPos";
	obj.measurement = "";
	arrAttr[3] = obj;

	obj = new Object;
	obj.attrName = "resizable";
	obj.featureName = "resizable";
	obj.measurement = "";
	arrAttr[4] = obj;

	obj = new Object;
	obj.attrName = "scollbars";
	obj.featureName = "scroll";
	obj.measurement = "";
	arrAttr[5] = obj;

	obj = new Object;
	obj.attrName = "status";
	obj.featureName = "status";
	obj.measurement = "";
	arrAttr[6] = obj;

	var v=null;
	for(var i=0; i<arrAttr.length; i++) {
		v = getAttributeValue(sFeatures,arrAttr[i].attrName);
		if(v) {
			sFormatFeatures=sFormatFeatures+arrAttr[i].featureName+":"+v+arrAttr[i].measurement+";";
		}
	}
	//alert(sFormatFeatures);
	return sFormatFeatures;
}

// Event handler to inhibit Navigator form element 
// and IE link activity when dialog window is active.
function deadend() {
	if (dialogWin.win && !dialogWin.win.closed) {
		dialogWin.win.focus();
		return false;
	}
}

// The right-click menu from the parent's window cannot be blocked in
// netscape.  The menu provides function to unload the current page such as
// "back".  This makes the dialog window becomes an orphan.  Since there is no
// way to prevent such an action taken from the user and the action cannot be
// cancelled, to close the dialog to prevent data corruption seems to be a better
// bet even though it is user unfriendly. 
function closeDialog() {
	if (dialogWin.win && !dialogWin.win.closed) {
		dialogWin.win.close();
		return false;
	}	
}

// Since links in IE4 cannot be disabled, preserve 
// IE link onclick event handlers while they're "disabled."
// Restore when re-enabling the main window.
var IELinkClicks

// Disable form elements and links in all frames for IE.
function disableForms() {
	IELinkClicks = new Array()
	for (var h = 0; h < frames.length; h++) {
		for (var i = 0; i < frames[h].document.forms.length; i++) {
			for (var j = 0; j < frames[h].document.forms[i].elements.length; j++) {
				frames[h].document.forms[i].elements[j].disabled = true
			}
		}
		IELinkClicks[h] = new Array()
		for (i = 0; i < frames[h].document.links.length; i++) {
			IELinkClicks[h][i] = frames[h].document.links[i].onclick
			frames[h].document.links[i].onclick = deadend
		}
	}
}

// Restore IE form elements and links to normal behavior.
function enableForms() {
	for (var h = 0; h < frames.length; h++) {
		for (var i = 0; i < frames[h].document.forms.length; i++) {
			for (var j = 0; j < frames[h].document.forms[i].elements.length; j++) {
				frames[h].document.forms[i].elements[j].disabled = false
			}
		}
		for (i = 0; i < frames[h].document.links.length; i++) {
			frames[h].document.links[i].onclick = IELinkClicks[h][i]
		}
	}
}

// Grab all Navigator events that might get through to form
// elements while dialog is open. For IE, disable form elements.
function blockEvents() {
	if (Nav4) {
		window.captureEvents(Event.CLICK | Event.MOUSEDOWN | Event.MOUSEUP | Event.FOCUS | Event.ONUNLOAD);
		window.onclick = deadend;
		window.onunload = closeDialog;
	} else {
		disableForms();
	}
	window.onfocus = checkModal;
}
// As dialog closes, restore the main window's original
// event mechanisms.
function unblockEvents() {
	if (Nav4) {
		window.releaseEvents(Event.CLICK | Event.MOUSEDOWN | Event.MOUSEUP | Event.FOCUS | Event.ONUNLOAD);
		window.onclick = null;
		window.onunload = null;
		window.onfocus = null;
	} else {
		enableForms();
	}
}

// Invoked by onFocus event handler of EVERY frame,
// return focus to dialog window if it's open.
function checkModal() {
	if (dialogWin.win && !dialogWin.win.closed) {
		dialogWin.win.focus()	
	}
}

/**************************
  END MODAL DIALOG CODE
**************************/
// JavaScript Document
// Global varibale
var name = navigator.appName; // Don't call a variable in such name
var codename = navigator.appCodeName;
var version = navigator.appVersion.substring(0,4);
var platform = navigator.platform;
var javaEnabled = navigator.javaEnabled();
var screenWidth = screen.width;
var screenHeight = screen.height;
var date = new Date();
var netscapeBrowser = ((navigator.appName == "Netscape") && (parseInt(navigator.appVersion) >= 4))

var outerFrame=null;
var oContent=null;
var oWindow=null;

var g_LastURL="";

//--------------------------------------------------------------------------------------
//Browser UI and Resize Handling routine starts here
//
var BrowserDetect = {
	init: function () {
		this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
		this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
		this.OS = this.searchString(this.dataOS) || "an unknown OS";
	},
	searchString: function (data) {
		for (var i=0;i<data.length;i++)	{
			var dataString = data[i].string;
			var dataProp = data[i].prop;
			this.versionSearchString = data[i].versionSearch || data[i].identity;
			if (dataString) {
				if (dataString.indexOf(data[i].subString) != -1)
					return data[i].identity;
			}
			else if (dataProp)
				return data[i].identity;
		}
	},
	searchVersion: function (dataString) {
		var index = dataString.indexOf(this.versionSearchString);
		if (index == -1) return;
		return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
	},
	dataBrowser: [
		{
			string: navigator.userAgent,
			subString: "Chrome",
			identity: "Chrome"
		},
		{ 	string: navigator.userAgent,
			subString: "OmniWeb",
			versionSearch: "OmniWeb/",
			identity: "OmniWeb"
		},
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari",
			versionSearch: "Version"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.vendor,
			subString: "iCab",
			identity: "iCab"
		},
		{
			string: navigator.vendor,
			subString: "KDE",
			identity: "Konqueror"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{
			string: navigator.vendor,
			subString: "Camino",
			identity: "Camino"
		},
		{		// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 		// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
	dataOS : [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

};

BrowserDetect.init();


getAbsolutePos = function(el) {
	var r = { x: el.offsetLeft, y: el.offsetTop };
	if (el.offsetParent) {
		var tmp = getAbsolutePos(el.offsetParent);
		r.x += tmp.x;
		r.y += tmp.y-el.scrollTop;
		//alert(el.id + "--" + r.y)
	}
	return r;
};

function scrollToCoordinates(x, y) { 
	window.scrollTo(x, y); 
} 

function saveScrollCoordinates(id) { 
	var scrOfX = 0, scrOfY = 0;
	if( typeof( window.pageYOffset ) == 'number' ) {
		//Netscape compliant
		scrOfY = window.pageYOffset;
		scrOfX = window.pageXOffset;
	} else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
		//DOM compliant
		scrOfY = document.body.scrollTop;
		scrOfX = document.body.scrollLeft;
	} else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
		//IE6 standards compliant mode
		scrOfY = document.documentElement.scrollTop;
		scrOfX = document.documentElement.scrollLeft;
	}

	if ((typeof id == "undefined") || id == null || id == "") {

	}
	else {
		document.forms[id].scrollx.value = scrOfX; 
		document.forms[id].scrolly.value = scrOfY; 
	}
	return [ scrOfX, scrOfY ];
}

function scrollToElementFirstPos(elementTag, classTag, shiftUp) {
var jsElement;

	if (document.all) {
		jsElement = document.all.tags(elementTag);
	}
	else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName(elementTag);
	}

	for (var i = 0; i < jsElement.length; i++) {
		if (jsElement[i].className == classTag) {
			elem1 = getAbsolutePos(jsElement[i]);
			//alert(i + " = " + elem1);
			//do not jump to it directly, maybe move up a few elements so that it is in center
			if (shiftUp != 0) {
				if ((typeof shiftUp == "undefined") || shiftUp == null || shiftUp == "")  shiftUp = 10;
			}
			j = i - shiftUp;
			if (j < 0) j = 0;
			if (jsElement[j].innerHTML.indexOf('elemJUMP2') == -1)
				jsElement[j].innerHTML = "<a name='elemJUMP2'></a>" + jsElement[j].innerHTML;
			window.location.hash = 'elemJUMP2';
			//self.scrollTo(elem1[0], elem1[1]);
			break;
		}
	}
}

function calculateWindowWidth() {
	var myWidth = 0;
	if( typeof( window.innerWidth ) == 'number' ) {
		//Non-IE
		myWidth = window.innerWidth;
	} else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
		//IE 6+ in 'standards compliant mode'
		myWidth = document.documentElement.clientWidth;
	} else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
		//IE 4 compatible
		myWidth = document.body.clientWidth;
	}
	return myWidth;
}

function calculateWindowHeight() {
	var myHeight = 0;
	if( typeof( window.innerWidth ) == 'number' ) {
		//Non-IE
		myHeight = window.innerHeight;
	} else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
		//IE 6+ in 'standards compliant mode'
		myHeight = document.documentElement.clientHeight;
	} else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
		//IE 4 compatible
		myHeight = document.body.clientHeight;
	}
	return myHeight;
}

function getCurrentDate() {
	var day = date.getDate();
	var mth = date.getMonth()+1;
	var year = date.getYear();
	return day+'/'+mth+'/'+year;
}

function getCurrentYear() {
	return date.getYear();
}

function isToday(sDate){
	var today = new Date(sDate).toLocaleString();
	return new Date(getCurrentDate()).toLocaleString() == today ? true:false;
}

function toggleField(sId, flag) {
	id = document.getElementById(sId);
	id.disabled=flag;
	if(flag==true) {
	    id.value!=null ? id.value="" : null;
	}
	flag==false ? id.focus() : null;
}

function addEvent(obj, evType, fn, useCapture){
  if (obj.addEventListener){
   	obj.addEventListener(evType, fn, useCapture);
    return true;
  } else if (obj.attachEvent){
    var r = obj.attachEvent("on"+evType, fn);
   	return r;
  } else {
   	alert("Handler could not be attached");
  }
} 

function computeHeightObjects(){
	if (parseInt(version)>3) {
		if (name=="Netscape") {
			outerFrame.height=winH-20+"px";
			alert(oContent);
			//alert(oContentWindow.id);
			oContent.height=600+"px";
			oContentWindow.height=600+"px";
		 }
		 if (name.indexOf("Microsoft")!=-1) {
		 alert(winH);
			if(outerFrame!=null)outerFrame.height=winH-40+"px" ;
	    	if(oContent!=null)oContent.height=winH-42+"px";
			if(oWindow!=null)oWindow.height=winH-42+"px";		
		 }
	}
}

function resizeOnPrint() {
	var canvas = document.getElementById("contentCanvas");

	if(canvas!=null) {
		canvas.style.overflow="hidden";
		canvas.style.height="auto";
	}
	// alert("print canvas: " + canvas.style.height);
}

function resizeOnAfterPrint() {
	var canvas = document.getElementById("contentCanvas");
	if(canvas!=null) {
		canvas.style.overflow="auto";
		resize();
	}
}

function resize() {	
	var h=0;  // canvas height
	var offset=0; // layout offset
	var th=0;	  // ca tabs' height
	var canvas = document.getElementById("contentCanvas");
	var layout = document.getElementById("contentLayout");
	var gBar = document.getElementById("generalPurposeBar");
	var tabs = document.getElementById("tblTabs");
	var wlist = document.getElementById("windowList");
	if (tabs!=null) {
		th=31;
	}
	if (netscapeBrowser==true) {
		h = parseInt(window.innerHeight) - 1;
		offset = 10;
	} else { // IE
		h = parseInt(document.body.clientHeight);
		offset = 8;
	}

	if (canvas!=null) {	
		h = h - parseInt(canvas.style.top);
		if (wlist==null) {
			canvas.style.height = h + "px";
		} else {
			if (h <= parseInt(wlist.style.height)) h = parseInt(wlist.style.height);

			canvas.style.height = h - parseInt(wlist.style.height) + "px";
			wlist.style.top = parseInt(canvas.style.height) + parseInt(canvas.style.top);
		}
/*
		if(gBar!=null) {
			//canvas.style.height = parseInt(canvas.style.height) - parseInt(gBar.style.height) + "px";
			gBar.style.top = parseInt(wlist.style.top) - parseInt(gBar.style.height);
		}
*/
		//h = parseInt(document.body.clientHeight) - parseInt(canvas.style.top);
		//canvas.style.height=h + "px";
	}
	if(layout!=null) {
		layout.style.height=(gBar==null)?h-th+"px":h-parseInt(gBar.style.height)-th-offset+"px";
	}
	
	//hideIE6bug();

}

//allow browser like firefox to have scrollbar. 
//Note that overflowY='hidden' is needed to prevent double scrollbars in IE
function enabledAutoScrollbar() {
	var canvas = document.getElementById("contentCanvas");
	if(canvas != null) {
		if (BrowserDetect) {
			if (BrowserDetect.browser == "Firefox")
			{
				var canvasInnerTab = document.getElementById("contentCanvasInnerTab")
				if (canvasInnerTab != null) {
					//alert("canvas: " + canvas.style.overflowY + ", canvasInnerTab: " + canvasInnerTab.style.overflowX);
					if (canvas.style.overflowY == "hidden") {
						canvas.style.overflowY = "auto";
						canvasInnerTab.style.overflowY = "hidden";
					}
				}
				else {
					//alert("canvas: " + canvas.style.overflowY);
					if (canvas.style.overflowY == "hidden") {
						canvas.style.overflowY = "auto";
					}
				}
			}
		}
	}
}

var bodyStyleOverflowX = null;
var bodyStyleOverflowY = null;
var canvasStyleOverflowX = null;
var canvasStyleOverflowY = null;

function disableBodyScrollbar() {
	if (document.body != null) {
		bodyStyleOverflowX = document.body.style.overflowX;
		document.body.style.overflowX = "hidden";
		
		bodyStyleOverflowY = document.body.style.overflowY;
		document.body.style.overflowY = "hidden";
	}
	var canvas = document.getElementById("contentCanvas");
	if (canvas != null) {
		canvasStyleOverflowX = canvas.style.overflowX;
		canvas.style.overflowX = "hidden";
		
		canvasStyleOverflowY = canvas.style.overflowY;
		canvas.style.overflowY = "hidden";
	}
}

function restoreBodyScrollbar() {
	if (document.body != null) {
		if (bodyStyleOverflowX != null)
			document.body.style.overflowX = bodyStyleOverflowX;
		
		if (bodyStyleOverflowY != null)
			document.body.style.overflowY = bodyStyleOverflowY;
	}
	var canvas = document.getElementById("contentCanvas");
	if (canvas != null) {
		if (canvasStyleOverflowX != null)
			canvas.style.overflowX = canvasStyleOverflowX;
		
		if (canvasStyleOverflowY != null)
			canvas.style.overflowY = canvasStyleOverflowY;
	}
}

function showSilkScreen() {
	disableBodyScrollbar();

	if (BrowserDetect) {
		if (BrowserDetect.browser == "Explorer") {
			if (BrowserDetect.version == 6) {
				//hide dropdown for IE6
				/*
				var customerDropdown = document.getElementById("customerselect");
				if (customerDropdown != null) {
					customerDropdown.style.display = "none";
				}
				*/
			}
		}
	}

	var silkScreen = document.getElementById("fullscreensilk");
	if (silkScreen != null) {
		silkScreen.style.width = "600px";
		silkScreen.style.height = "400px";
		silkScreen.style.display = "block";
		silkScreen.align= "center";
		silkScreen.style.background= "green";
		
	}

}

function newShowSilkScreen() {
	unloadingCount = 0;
	//this makes focus back to main window so last control (i.e. dropdown) cannot be used, but not window.open
	//self.focus();
	
	var silkScreen = document.getElementById("fullscreensilk");
	if (silkScreen != null) {
		disableBodyScrollbar();

		if (BrowserDetect) {
			if (BrowserDetect.browser == "Explorer") {
				if (BrowserDetect.version == 6) {
					//hide dropdown for IE6
					var jsElement;
					if (document.all) {
						jsElement = document.all.tags("SELECT");
					} else if (document.getElementsByTagName) {
						jsElement = document.getElementsByTagName("SELECT");
					}
					for (var i = 0; i < jsElement.length; i++) {
						jsElement[i].style.display = "none";
					}
				}
			}
		}

		var screenInfo = calculatePageSize();
		var scrollData = calculateWindowScroll();

		silkScreen.style.width = (screenInfo.pageWidth) + "px";	//screenInfo.pageWidth, screen.width, 3000
		silkScreen.style.height = (screenInfo.pageHeight) + "px"; //screenInfo.pageHeight, screen.height, 3000
		silkScreen.style.display = "block";
		//silkScreen.innerHTML ="<center><span style='color:#800000;text-align:center;'> &lt; Please wait - System is processing &gt;</span></center>";

		var silkScreenImage = document.getElementById("fullscreensilkimage");
		if (silkScreenImage != null) {
			silkScreenImage.style.left = (scrollData.left) + "px";
			silkScreenImage.style.top = ((screenInfo.windowHeight/2) + scrollData.top - (141/2)) + "px";
			silkScreenImage.style.display = "block";

			//hack for IE to animate gif
			setTimeout("document.getElementById('spinLoading').src = document.getElementById('spinLoading').src", 100);
			//setTimeout("document.getElementById('spinLoading').src = 'images/loading.gif'", 200);
		}
	}

}

var bodyStyleOverflowX = null;
var bodyStyleOverflowY = null;

function disableBodyScrollbar () {
	return;

	if (document.body != null) {
		if (hasScrollBar(document.body, 'horizontal'))
		{
			bodyStyleOverflowX = document.body.style.overflowX;
			document.body.style.overflowX = "hidden";
		}

		if (hasScrollBar(document.body, 'vertical'))
		{
			bodyStyleOverflowY = document.body.style.overflowY;
			document.body.style.overflowY = "hidden";
		}
	}
}

calculateWindowScroll = function() {
var w = window;
var T, L, W, H;

	L = window.pageXOffset || document.body.scrollLeft;
	T = window.pageYOffset || document.body.scrollTop;

	if (window.ie) 
		W = Math.max(document.body.offsetWidth, document.body.scrollWidth);
	else if (window.khtml) 
		W = document.body.scrollWidth;
	else 
		W = document.body.scrollWidth;
	  
	if (window.ie) 
		H = Math.max(document.body.offsetHeight, document.body.scrollHeight);
	else if (window.khtml) 
		H = document.body.scrollHeight;
	else
		H = document.body.scrollHeight;

	return { top: T, left: L, width: W, height: H };
};


calculatePageSize = function() {
var xScroll, yScroll;

    if (window.innerHeight && window.scrollMaxY) {  
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
    } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
    }

var windowWidth, windowHeight;

    if (self.innerHeight) {  // all except Explorer
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
    }

var pageHeight, pageWidth;

    // for small pages with total height less then height of the viewport
    if(yScroll < windowHeight){
		pageHeight = windowHeight;
    } else { 
		pageHeight = yScroll;
    }

    // for small pages with total width less then width of the viewport
    if(xScroll < windowWidth){  
		pageWidth = windowWidth;
    } else {
		pageWidth = xScroll;
    }

    return {pageWidth: pageWidth, pageHeight: pageHeight, windowWidth: windowWidth, windowHeight: windowHeight};
};


function hideSilkScreen() {
	restoreBodyScrollbar();

	if (BrowserDetect) {
		if (BrowserDetect.browser == "Explorer") {
			if (BrowserDetect.version == 6) {
				//hide dropdown for IE6
				/*
				var customerDropdown = document.getElementById("customerselect");
				if (customerDropdown != null) {
					customerDropdown.style.display = "block";
				}
				*/
			}
		}
	}

	var silkScreen = document.getElementById("fullscreensilk");
	if (silkScreen != null) {
		silkScreen.style.display = "none";
	}

}



//deprecated - this is for old javascript menu routine
function hideIE6bug() {
	i = 57;
	if ((document.all[i].id == "ifmenu4") || (document.all[i].id == "ifmenu5") || (document.all[i].id == "ifmenu6"))
	{
		document.all[i].style.posLeft = -500;
		document.all[i].style.posTop = -500;
		//alert("-- clear 57 --");
		return;
	}

	i = 70;
	if ((document.all[i].id == "ifmenu4") || (document.all[i].id == "ifmenu5") || (document.all[i].id == "ifmenu6"))
	{
		document.all[i].style.posLeft = -500;
		document.all[i].style.posTop = -500;
		//alert("-- clear 70 --");
		return;
	}
	else
	{
		//alert("-- search all --");
		for (i=0; i<document.all.length; i++)
		{
			//(document.all[i].id.indexOf("menubackmenu") != -1)
				//weblogic			  //websphere-scb-test			//websphere-int
			//if ((document.all[i].id == "ifmenu4") || (document.all[i].id == "ifmenu5") || (document.all[i].id == "ifmenu6"))
			if ((document.all[i].id.indexOf("ifmenu") != -1) || (document.all[i].id.indexOf("menu") != -1))
			{
				document.all[i].style.posLeft = -500;
				document.all[i].style.posTop = -500;
				//alert("itg -> " + i + "  id:" + document.all[i].id + "  zIndex:" + document.all[i].zIndex );
			}
		}
	}
}

//--------------------------------------------------------------------------------------
//Browser UI and Resize Handling routine ends here
//


//--------------------------------------------------------------------------------------
//Cookie routine starts here
//
function getCookie(cookieName){var cookieJar=document.cookie.split("; ");for(var x=0;x<cookieJar.length;x++){var oneCookie=cookieJar[x].split("=");if(oneCookie[0]==escape(cookieName)){return unescape(oneCookie[1]);}}return null;}
function setCookie(cookieName,cookieValue,lifeTime,path,domain,isSecure){if(!cookieName){return false;}if(lifeTime=="delete"){lifeTime=-10;}document.cookie=escape(cookieName)+"="+escape(cookieValue)+(lifeTime?";expires="+(new Date((new Date()).getTime()+(1000*lifeTime))).toGMTString():"")+(path?";path="+path:"")+(domain?";domain="+domain:"")+(isSecure?";secure":"");if(lifeTime<0){if(typeof(getCookie(cookieName))=="string"){return false;}return true;}if(typeof(getCookie(cookieName))=="string"){return true;}return false;}
function deleteCookie(cookieName) {setCookie(cookieName, "", "delete");}
//--------------------------------------------------------------------------------------
//Cookie routine ends here
//

//--------------------------------------------------------------------------------------
//Ajax routine starts here
//

var unloadingNow = false
var unloadingCount = 0

//alert('create Ajax object');
var ajaxpack=new Object()

//ajaxpack.ajaxobj = createAjaxObj()
ajaxpack.ajaxobj = null;
ajaxpack.filetype = "txt"
ajaxpack.addrandomnumber = 1 //Set to 1 or 0. See documentation.
ajaxpack.countIndex = 1

var uID = ""
var countCache = false	//set to false to load counters everytime, if not they will be cached in cookies
var countCacheTimeout = 150; // seconds

//load order of counters:
//	- 1 notification
//	- 2 diarylist
//	- 5 item
//	- 3 borrowing customer
//	- 4 non borrowing customer

function createAjaxObj() {
	var httprequest = false
	if (window.XMLHttpRequest) { // if Mozilla, Safari etc
		httprequest=new XMLHttpRequest()
		if (httprequest.overrideMimeType)
			httprequest.overrideMimeType('text/xml')
	}
	else if (window.ActiveXObject) { // if IE
		try {
			httprequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				httprequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e) { 
				alert("Ajax creation error")
			}
		}
	}
	return httprequest
}

function createXMLDOM_file(inFile) {
	var xmlDoc = null;
	if (window.ActiveXObject) {	//only in IE browser!
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	}
	else if (document.implementation && document.implementation.createDocument) {	//Firefox, Mozilla, Opera, etc.
		xmlDoc = document.implementation.createDocument("", "", null);
	}
	
	try {
		if (typeof xmlDoc != "undefined") {
			xmlDoc.async = false;
			xmlDoc.load(inFile);

			if (window.ActiveXObject) {	//only in IE browser!
				if (xmlDoc.parseError.errorCode != 0) {
					alert("Ajax Error in line " + xmlDoc.parseError.line + 
						" position " + xmlDoc.parseError.linePos + 
						"\nError Code: " + xmlDoc.parseError.errorCode + 
						"\nError Reason: " + xmlDoc.parseError.reason + 
						"Error Line: " + xmlDoc.parseError.srcText
					);
				}
			}
			else {
				if (xmlDoc.documentElement.nodeName=="parsererror") {
					alert(xmlDoc.documentElement.childNodes[0].nodeValue);
				}			
			}
		}
	} catch(e) { 
		alert(e.message);
	}

	return (xmlDoc);
}

function createXMLDOM_string(inString) {
	var xmlDoc = null;
	if (window.ActiveXObject) {	//only in IE browser!
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		if (typeof xmlDoc != "undefined") {
			xmlDoc.async = false;
			xmlDoc.loadXML( trimNL(inString) );
			if (xmlDoc.parseError.errorCode != 0) {
				alert("Error in line " + xmlDoc.parseError.line + 
					" position " + xmlDoc.parseError.linePos + 
					"\nError Code: " + xmlDoc.parseError.errorCode + 
					"\nError Reason: " + xmlDoc.parseError.reason + 
					"Error Line: " + xmlDoc.parseError.srcText
				);
			}
		}
	} 
	else if (document.implementation && document.implementation.createDocument) {
		try { //Firefox, Mozilla, Opera, etc.
			parser = new DOMParser();
			if (typeof parser != "undefined") {
				xmlDoc = parser.parseFromString( trimNL(inString), "text/xml" );
				if (xmlDoc.documentElement.nodeName=="parsererror") {
					alert(xmlDoc.documentElement.childNodes[0].nodeValue);
				}
			}
		} catch(e) { 
			alert(e.message)
		}
	}
	return (xmlDoc);
}


ajaxpack.getAjaxRequest=function(url, parameters, callbackfunc, filetype, writeDiv, countIndex) {

	if (unloadingNow == true)
		return;

	ajaxpack.ajaxobj = createAjaxObj() //recreate ajax object to defeat cache problem in IE

	if (this.addrandomnumber == 1) //Further defeat caching problem in IE?
		var parameters = parameters + "&ajaxcachebust=" + new Date().getTime()

	if (this.ajaxobj) {
		this.writeDiv = writeDiv
		this.filetype = filetype
		this.countIndex = countIndex
		this.ajaxobj.onreadystatechange = callbackfunc
		this.ajaxobj.open('GET', url+"?"+parameters, true)

		this.ajaxobj.send(null)
	}

}

ajaxpack.postAjaxRequest=function(url, parameters, callbackfunc, filetype, writeDiv, countIndex) {

	if (unloadingNow == true)
	{
		//alert("unloading");
		return;
	}

	if (countCache == true)
	{	
		//display what is in cookie first
		displayCountCookie("aj_notification", "");
		displayCountCookie("aj_diarylist", "&nbsp;&nbsp;&nbsp;&nbsp;");
		displayCountCookie("aj_borrowing", "&nbsp;&nbsp;&nbsp;&nbsp;");
		displayCountCookie("aj_nonborrowing", "&nbsp;&nbsp;&nbsp;&nbsp;");
		displayCountCookie("aj_item", "&nbsp;&nbsp;&nbsp;&nbsp;");
		
		if (countIndex == 1)
			ret = displayCountCookie("aj_notification", "");
		else if (countIndex == 2)
			ret = displayCountCookie("aj_diarylist", "&nbsp;&nbsp;&nbsp;&nbsp;");
		else if (countIndex == 3)
			ret = displayCountCookie("aj_borrowing", "&nbsp;&nbsp;&nbsp;&nbsp;");
		else if (countIndex == 4)
			ret = displayCountCookie("aj_nonborrowing", "&nbsp;&nbsp;&nbsp;&nbsp;");
		else if (countIndex == 5)
			ret = displayCountCookie("aj_item", "&nbsp;&nbsp;&nbsp;&nbsp;");

		if (ret == true)
		{
			if (countIndex == 1)
				taskAfterCounter1();
			else if (countIndex == 2)
				taskAfterCounter2();
			else if (countIndex == 3)
				taskAfterCounter3();
			else if (countIndex == 4)
				taskAfterCounter4();
			else if (countIndex == 5)
				taskAfterCounter5();

			return;
		}
	}

	ajaxpack.ajaxobj = createAjaxObj() //recreate ajax object to defeat cache problem in IE

	if (this.ajaxobj) {
		this.writeDiv = writeDiv
		this.filetype = filetype
		this.countIndex = countIndex
		this.ajaxobj.onreadystatechange = callbackfunc;
		this.ajaxobj.open('POST', url, true);
		this.ajaxobj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		this.ajaxobj.setRequestHeader("Content-length", parameters.length);
		//this.ajaxobj.setRequestHeader("Connection", "close");	//bypass ie6 bug

		this.ajaxobj.send(parameters);
	}
}


ajaxpack.postAjaxRequestNormal=function(url, parameters, callbackfunc, filetype, writeDiv, countIndex) {

	ajaxpack.ajaxobj = createAjaxObj() //recreate ajax object to defeat cache problem in IE

	if (this.ajaxobj) {
		this.writeDiv = writeDiv
		this.filetype = filetype
		this.countIndex = countIndex
		this.ajaxobj.onreadystatechange = callbackfunc;
		this.ajaxobj.open('POST', url, true);
		this.ajaxobj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		this.ajaxobj.setRequestHeader("Content-length", parameters.length);
		//this.ajaxobj.setRequestHeader("Connection", "close");	//bypass ie6 bug

		this.ajaxobj.send(parameters);
	}
}


function initCountCookie(myID) {
	uID = myID;
}

function initCountCookie(myID, sessionTimeoutValue) {
	uID = myID;
	countDownInterval = sessionTimeoutValue;
	countDownTime = parseInt(countDownInterval, 10);
}

function restartCountCookie() {
	countDownTime = parseInt(countDownInterval, 10) - 1;
}

function clearCountCookie(myDiv) {

	deleteCookie(uID + "_" + myDiv);
}

function clearAllCountCookie() {

	clearCountCookie("aj_notification");
	clearCountCookie("aj_diarylist");
	clearCountCookie("aj_borrowing");
	clearCountCookie("aj_nonborrowing");
	clearCountCookie("aj_item");
}

function displayCount(xmlDoc, myDiv, addString) {

	if (document.getElementById(myDiv) != null)
	{
		xmlobj = xmlDoc.getElementsByTagName(myDiv)[0]
		if (xmlobj != null)
		{
			document.getElementById(myDiv).innerHTML = addString + xmlobj.childNodes[0].nodeValue
			
			if (countCache == true)
			{
				setCookie(uID + "_" + myDiv, xmlobj.childNodes[0].nodeValue, countCacheTimeout);
			}
		}
	}
}

function displayCountCookie(myDiv, addString) {

	if (document.getElementById(myDiv) != null)
	{
		//alert("displayCountCookie: " + uID + "_" + myDiv);
		if (getCookie(uID + "_" + myDiv))
		{
			document.getElementById(myDiv).innerHTML = addString + getCookie(uID + "_" + myDiv);
			return true;
		}
		else
		{
			document.getElementById(myDiv).innerHTML = addString + "You have 0 item(s)";
		}
	}
	return false;
}

function detectCount(myDiv) {

	if (document.getElementById(myDiv) != null)
		return true
	else
		return false
}

function processGetPostNormal() {

var myajax=ajaxpack.ajaxobj
var myfiletype=ajaxpack.filetype
var mycountindex=ajaxpack.countIndex

	if (myajax.readyState == 4) { //if request of file completed
		//alert(myajax.status)
		//alert(myajax.responseText)
		if (myajax.status==200 || window.location.href.indexOf("http")==-1) { //if request was successful or running script locally

			if (ajaxpack.writeDiv != null) {
				if (ajaxpack.writeDiv == "broadcast")
				{
					if (myajax.responseText.indexOf("broadcast item found") > -1)
					{
						//if (parent.debug) parent.debug("broadcast: (" + trim(myajax.responseText, " ") + ")  location: " + myajax.responseText.indexOf("broadcast"));
						if (showBroadcastMessage) {
							//this is generated by \template\check_broadcast.jsp which is triggered from topbanner.jsp and reload.jsp
							showBroadcastMessage();
						}
					}
				}
				else
				{
					document.getElementById(ajaxpack.writeDiv).innerHTML = myajax.responseText
				}
			}
			else
			{
				countDownTime = parseInt(countDownInterval, 10) - 1;
			}
		} //end for - //if request was successful or running script locally
	} //end for - if request of file completed
}

function processGetPost() {

var myajax=ajaxpack.ajaxobj
var myfiletype=ajaxpack.filetype
var mycountindex=ajaxpack.countIndex

	if (myajax.readyState == 4) { //if request of file completed

		//alert(myajax.status)
		//alert(myajax.responseText)
		if (myajax.status==200 || window.location.href.indexOf("http")==-1) { //if request was successful or running script locally

			if (ajaxpack.writeDiv != null) {
				document.getElementById(ajaxpack.writeDiv).innerHTML = myajax.responseText
			}
			else {
				var xmlDoc = createXMLDOM_string(myajax.responseText);
				if (typeof xmlDoc != "undefined") {
					if (mycountindex == 1)
					{
						//aj_notification
						displayCount(xmlDoc, "aj_notification", "");
						taskAfterCounter1();
					}
						
					if (mycountindex == 2)
					{
						//aj_diarylist
						displayCount(xmlDoc, "aj_diarylist", "&nbsp;&nbsp;&nbsp;&nbsp;");
						taskAfterCounter2();
					}
						
					if (mycountindex == 3)
					{
						//aj_borrowing
						displayCount(xmlDoc, "aj_borrowing", "&nbsp;&nbsp;&nbsp;&nbsp;");
						taskAfterCounter3();
					}
					
					if (mycountindex == 4)
					{
						//aj_nonborrowing
						displayCount(xmlDoc, "aj_nonborrowing", "&nbsp;&nbsp;&nbsp;&nbsp;");
						taskAfterCounter4();
					}
					
					if (mycountindex == 5)
					{
						//aj_item
						displayCount(xmlDoc, "aj_item", "&nbsp;&nbsp;&nbsp;&nbsp;");
						taskAfterCounter5();
					}
				}

			}
		} //end for - //if request was successful or running script locally
	} //end for - if request of file completed
}


function taskAfterCounter1() {
	if (detectCount("aj_diarylist"))
	{						
		if (window.location.href.indexOf("Welcome.do") != -1)
			ajaxpack.postAjaxRequest(getContextPath() + '/Welcome.do?event=list&countIndex=2', '', processGetPost, 'txt', null, 2);
	}
	else if (detectCount("aj_item"))
	{						
		if (window.location.href.indexOf("Welcome.do") != -1)
			ajaxpack.postAjaxRequest(getContextPath() + '/Welcome.do?event=list&countIndex=5', '', processGetPost, 'txt', null, 5);
	}
	else if (detectCount("aj_borrowing"))
	{						
		if (window.location.href.indexOf("Welcome.do") != -1)
			ajaxpack.postAjaxRequest(getContextPath() + '/Welcome.do?event=list&countIndex=3', '', processGetPost, 'txt', null, 3);
	}
	else if (detectCount("aj_nonborrowing"))
	{						
		if (window.location.href.indexOf("Welcome.do") != -1)
			ajaxpack.postAjaxRequest(getContextPath() + '/Welcome.do?event=list&countIndex=4', '', processGetPost, 'txt', null, 4);
	}
}

function taskAfterCounter2() {
	if (detectCount("aj_item"))
	{
		if (window.location.href.indexOf("Welcome.do") != -1)
			ajaxpack.postAjaxRequest(getContextPath() + '/Welcome.do?event=list&countIndex=5', '', processGetPost, 'txt', null, 5);
	}
}

function taskAfterCounter3() {
	if (detectCount("aj_nonborrowing"))
	{						
		if (window.location.href.indexOf("Welcome.do") != -1)
			ajaxpack.postAjaxRequest(getContextPath() + '/Welcome.do?event=list&countIndex=4', '', processGetPost, 'txt', null, 4);
	}
}

function taskAfterCounter4() {

}

function taskAfterCounter5() {
	if (detectCount("aj_borrowing"))
	{
		if (window.location.href.indexOf("Welcome.do") != -1)
			ajaxpack.postAjaxRequest(getContextPath() + '/Welcome.do?event=list&countIndex=3', '', processGetPost, 'txt', null, 3);
	}
	else if (detectCount("aj_nonborrowing"))
	{						
		if (window.location.href.indexOf("Welcome.do") != -1)
			ajaxpack.postAjaxRequest(getContextPath() + '/Welcome.do?event=list&countIndex=4', '', processGetPost, 'txt', null, 4);
	}
}


//--------------------------------------------------------------------------------------
//Ajax routine ends here
//


//--------------------------------------------------------------------------------------
//Session timeout routine starts here
//

//configure refresh interval (in seconds)
var actualTitle = document.title + " "
var countDownInterval = -999; //this is the default value to indicate first time access
var cookieSupport = false;
var counter;

if (cookieSupport) {
	if (getCookie("timeout"))
	  countDownInterval = getCookie("timeout");
	else
	  if (countDownInterval != -999)
		alert("Session cookie support not available. Please check browser settings.");
}

var countDownTime = parseInt(countDownInterval, 10);

function countDownSession() {

  timediff = parseInt(countDownTime, 10);
  //if (isNaN(timediff)) alert("count value is invalid");

  oneMinute = 60 //minute unit in seconds
  oneHour = 60*60 //hour unit in seconds
  oneDay = 60*60*24 //day unit in seconds
  dayfield = Math.floor(timediff/oneDay)
  hourfield = Math.floor((timediff-dayfield*oneDay)/oneHour)
  minutefield = Math.floor((timediff-dayfield*oneDay-hourfield*oneHour)/oneMinute)
  secondfield = Math.floor((timediff-dayfield*oneDay-hourfield*oneHour-minutefield*oneMinute))

  var countDownChoice = false;
  
  //check for broadcast message
  if (countDownTime % 300 == 0)
  {
    //ajaxpack.postAjaxRequestNormal(getContextPath() + '/reload.jsp', '', processGetPostNormal, 'txt', "broadcast", 1);
    //countDownTime = parseInt(countDownInterval) - 1;
  }

  //if ((countDownTime == 60) || (countDownTime == 301) || (countDownTime == 601))
  //if ((countDownTime == 60))   // Shiv 201212
 // { //Shiv 201212
	//countDownChoice = confirm("Your session will be terminated soon in " + minutefield + " minute(s).\nPlease respond now to avoid being logout.\n\nClick OK button to continue now.");  //Shiv 201212
	//if (countDownChoice)
	//  countDownTime = parseInt(countDownInterval);
  //} //Shiv 201212
  //Add alert message in every 5 min, By Govind S:14/11/2011 
  if ((countDownTime%300==0 ) && (countDownTime !=countDownInterval))
  {
	alert("Please save your data.");
  }
  
  countDownTime--;
  
  if (countDownChoice) {
    //window.location.reload();
    ajaxpack.postAjaxRequestNormal(getContextPath() + '/reload.jsp', '', processGetPostNormal, 'txt', null, 1);
    countDownTime = parseInt(countDownInterval) - 1;
  }
  
  if (countDownTime <= 0) {
    countDownTime = parseInt(countDownInterval);
    clearTimeout(counter);

    top.document.title = actualTitle + " - [ Session should have timeout, you may need to login again ]"
    return;
  }

  if (minutefield > 0) 
    top.document.title = actualTitle + " - Time left: [ " + minutefield + " minute(s) " + secondfield + " second(s) ]"
  else
    top.document.title = actualTitle + " - Time left: [ " + secondfield + " second(s) ]"  
	
  counter = setTimeout("countDownSession()", 1000);
}

//--------------------------------------------------------------------------------------
//Session timeout routine ends here
//


//--------------------------------------------------------------------------------------
//String TRIM routine starts here
//

function removeUnsafeXMLcharacter (XMLstring)
{
	//& is a required char for XML to denote an entity - with the enclosing & and ; characters, it is called an entity reference	
	result = XMLstring.replace(/&/g, "&amp;");		//global search for & - &amp; 
	result = result.replace(/&amp;amp/g, "&amp");	//in case &amp exists
	//result = result.replace(/</g, "&lt;");			//global search for < - &lt; 
	//result = result.replace(/&amp;lt/g, "&lt");		//in case &lt exists
	//result = result.replace(/>/g, "&gt;");			//global search for > - &gt; 
	//result = result.replace(/&amp;gt/g, "&gt");		//in case &gt exists
	//result = result.replace(/"/g, "&quot;");		//global search for " - &quot; 
	//result = result.replace(/&amp;quot/g, "&quot");	//in case &quot exists
	return (result);
}

function trimSpecialcharacter(str)
{
	//search for !~`@#$%^&*<>?;[]{}\/,.|:
	chars = "\\!|\\~|\\`|\\@|\\#|\\$|\\%|\\^|\\&|\\*|\\<|\\>|\\?|\\;|\\\\|\\[|\\]|\\{|\\}|\\/|\\,|\\.|\\||\\:";
	re = new RegExp(chars, "g");
	return str.replace(re, "");	
}

function trimAnySpecialcharacter (str, chars)
{
	re = new RegExp(chars, "g");
	return str.replace(re, "");	
}

function trim(str, chars) {
    return ltrim(rtrim(str, chars), chars);
}

function ltrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

function rtrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

function trimNL(str)
{ 
	return str.replace(/[\n\r\t]/g, ""); 
}

function removeNL(obj) // remove new line 
{ 
	s = obj.value;
	r = "";
	var hasNewLine = false;

	for (i=0; i < s.length; i++) {
		if (s.charAt(i) != '\n' &&
		    s.charAt(i) != '\r') {
			r += s.charAt(i);
		}
		else {
			hasNewLine = true;
		}
	}

	if (hasNewLine) alert("New line will be removed.");

	r_nospecial = trimSpecialcharacter(r);
	r_trim = trim(r_nospecial, " ");

	obj.value = r_trim;

	if (r_trim == "")
		alert("Data entered is found to be an empty string.\n\nPlease enter a valid string before submitting.");

}

function noEnter(evt)
{			
	var nbr, chr;

	if (window.Event) nbr = evt.which;
	else nbr = event.keyCode;

	if (nbr==13) {
		return false;
	}
}       

//--------------------------------------------------------------------------------------
//String TRIM routine ends here
//


//--------------------------------------------------------------------------------------
//URL routine starts here
//
function getParameter(name, urlData) {
  var q = document.location.search;
  if (urlData != "undefined" && urlData != null) q = urlData;

  var i = q.indexOf(name + '=');
  if (i == -1) {
    return false;
  }

  var r = q.substr(i + name.length + 1, q.length - i - name.length - 1);
  i = r.indexOf('&');
  if (i != -1) {
    r = r.substr(0, i);
  }

  return r.replace(/\+/g, ' ');
}

function getContextPath() {
  var q = document.location.pathname;
  var name = '/';

  var i = q.indexOf(name);
  if (i == -1) {
    return "";
  }
  
  //alert("i: " + i);
  var j = q.indexOf(name, i+1);
  if (j == -1) {
    return q;
  }

  //alert("j: " + j);
  var r = q.substr(0, j);
  //alert("r: " + r);

  return r.replace(/\+/g, ' ');
}

function showURLDetails()
 {
   var x = window.location;
   var t = ['Property - Typeof - Value',
            'window.location - ' + (typeof x) + ' - ' + x ];
   for (var prop in x){
     t.push(prop + ' - ' + (typeof x[prop]) + ' - ' +  (x[prop] || 'n/a'));
   }
   alert(t.join('\n'));
 }

//--------------------------------------------------------------------------------------
//URL routine ends here
//


//--------------------------------------------------------------------------------------
//Server Submit & Button Handling routine starts here
//

//this is attached to onunload
function setServerSubmit() {
	setUnloadFlag();
	disableLinks();
	
	save_DynamicStyleSheet();
}

var unloadedCount = 0;
function setUnloadFlag() {
	if (unloadedCount >= 9999) {
		//download object just returned from servlet
		//note that incUnloadCount(9999) need to be called before servlet is invoked
		unloadedCount = 1;
		return;
	}

	if (unloadingNow == false) {
		newShowSilkScreen();
	}

	unloadingNow = true;
	disablePaginationLinks();
	disableGoButtons(true);
}

function incUnloadCount(incValue) {
	unloadedCount = unloadedCount + incValue;
}

function getUnloadCount() {
	return (unloadedCount);
}

function removeOnStopEvent() {
	onStopEventObj = document.onstop;
	document.onstop = "";
}

function restoreOnStopEvent() {
	document.onstop = onStopEventObj;
}

//disable buttons that are used for server submit
function preventDoubleSubmit(formid, chkButton, chkSubmit, chkReset) {

	theform = document.forms[formid];
	for (i=0; i < theform.length; i++) {
		var tempobj = theform.elements[i]

		if (chkButton!="undefined" && chkButton!=null)
		{
			if (tempobj.type.toLowerCase()==chkButton)
			  tempobj.disabled = true			
		}
		if (chkSubmit!="undefined" && chkSubmit!=null)
		{
			if (tempobj.type.toLowerCase()==chkSubmit)
			  tempobj.disabled = true			
		}
		if (chkReset!="undefined" && chkReset!=null)
		{
			if (tempobj.type.toLowerCase()==chkReset)
			  tempobj.disabled = true			
		}
	}
}


var graphicsLinkArray_href = [];
var graphicsLinkArray_onclick = [];

//disable links that are used for server submit
//recognising by the images used in the url since there are no id, name, div for this kind of url
function disableLinks() {
	if (document.all || document.getElementById) {
		if (document.all)
			var links = document.all.tags("A")
		else if (document.getElementById)
			var links = document.getElementsByTagName("A")

		//clear array first
		graphicsLinkArray_href = [];
		graphicsLinkArray_onclick = [];

		var total = links.length
		//var win2 = window.open("","","menubar,scrollbars,status")
		//win2.document.write("<h2>Total Links="+total+"</h2><br>")
		for (i=0; i<total; i++) {
			if (typeof links[i].href == "unknown") continue;

			var str1 = links[i].innerHTML.toLowerCase();
			graphicsLinkArray_href[i] = links[i].href;
			graphicsLinkArray_onclick[i] = links[i].onclick;

			if ( (str1.indexOf("save1.gif")!=-1) || (str1.indexOf("save2.gif")!=-1) ||
			     (str1.indexOf("ok1.gif")!=-1) || (str1.indexOf("ok2.gif")!=-1) ||
			     (str1.indexOf("cancel1.gif")!=-1) || (str1.indexOf("cancel2.gif")!=-1) ||
			     (str1.indexOf("approve1.gif")!=-1) || (str1.indexOf("approve2.gif")!=-1) ||
			     (str1.indexOf("reject1.gif")!=-1) || (str1.indexOf("reject2.gif")!=-1) ||
			     (str1.indexOf("forwardto1.gif")!=-1) || (str1.indexOf("forwardto2.gif")!=-1) ||
				 (str1.indexOf("close1a.gif")!=-1) || (str1.indexOf("close2a.gif")!=-1) ||
			     (str1.indexOf("submit1.gif")!=-1) || (str1.indexOf("submit2.gif")!=-1)
			   )
			{
				//win2.document.write('<a href="'+links[i]+'">'+links[i].innerHTML+'</a><br>')
				links[i].href = "#";
				links[i].onclick = "";
			}
		}
		//win2.document.close()
	}
}

function restoreLinks() {
	if (document.all || document.getElementById) {
		if (document.all)
			var links = document.all.tags("A")
		else if (document.getElementById)
			var links = document.getElementsByTagName("A")

		var total = links.length
		if (graphicsLinkArray_href.length == 0 || graphicsLinkArray_href.length < total)
			return;

		for (i=0; i<total; i++) {
			links[i].href = graphicsLinkArray_href[i];
			links[i].onclick = graphicsLinkArray_onclick[i];
		}
	}
}


var paginationLinkArray_href = [];
var paginationLinkArray_onclick = [];

function disablePaginationLinks() {
	if (document.all||document.getElementById) {
	if (document.all)
		var links=document.all.tags("A")
	else if (document.getElementById)
		var links=document.getElementsByTagName("A")

	if (links == null)
		return;

	//clear array first
	paginationLinkArray_href = [];
	paginationLinkArray_onclick = [];

	var total = links.length
		//var win2=window.open("","","menubar,scrollbars,status")
		//win2.document.write("<h2>Total Links="+total+"</h2><br>")
		for (i=0;i<total;i++){
			if (typeof links[i].href == "unknown") continue;

			var str1 = links[i].href;
			paginationLinkArray_href[i] = links[i].href;
			paginationLinkArray_onclick[i] = links[i].onclick;

			if ( (str1.indexOf("goPageIndex") != -1) || (str1.indexOf("goAlphaIndex") != -1) 
			    )
			{
				//win2.document.write('<a href="'+links[i]+'">'+links[i].href+'</a><br>')
				links[i].href = "#";
				links[i].onclick = "";
			}
		}
		//win2.document.close()
	}
}

function restorePaginationLinks() {
	if (document.all||document.getElementById) {
	if (document.all)
		var links=document.all.tags("A")
	else if (document.getElementById)
		var links=document.getElementsByTagName("A")

	if (links == null)
		return;

	var total = links.length
		if (paginationLinkArray_href.length == 0 || paginationLinkArray_href.length < total)
			return;

		for (i=0;i<total;i++){
			links[i].href = paginationLinkArray_href[i];
			links[i].onclick = paginationLinkArray_onclick[i];
		}
	}
}

function disableGoButtons(buttonState) {

	var theform = document.forms[0];	
	if (theform == null)
		return;

	var total = theform.length

	for (i=0;i<total;i++) {
		var tempobj = theform.elements[i];
		if ( (tempobj.value.toUpperCase()=="GO" && tempobj.type.toUpperCase()=="BUTTON") ||
			 (tempobj.value.toUpperCase()=="ADD NEW" && tempobj.type.toUpperCase()=="BUTTON") ||
			 (tempobj.value.toUpperCase().indexOf("ADD")!=-1 && tempobj.type.toUpperCase()=="BUTTON") ||
			 (tempobj.value.toUpperCase().indexOf("REMOVE")!=-1 && tempobj.type.toUpperCase()=="BUTTON") ||
			 (tempobj.value.toUpperCase()=="REMOVE" && tempobj.type.toUpperCase()=="BUTTON")
		   )
		{
			theform.elements[i].disabled = buttonState
		}
	}
}

//--------------------------------------------------------------------------------------
//Server Submit & Button Handling routine ends here
//


//--------------------------------------------------------------------------------------
//HTML Tag routine starts here
//
function findElementByTagClass(elementTag, classTag, elementText, shift) {
var jsElement;

	if (document.all) {
		jsElement = document.all.tags(elementTag);
	} else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName(elementTag);
	}

	for (var i = 0; i < jsElement.length; i++) {
		if (typeof jsElement[i].name != "undefined") {
			//input field
			if (jsElement[i].name == elementText) {
				return (jsElement[i+shift]);
				break;
			}
		} else if (jsElement[i].className == classTag) {
			//alert(elementText + "  html: " + jsElement[i].innerHTML + "  indexof: " + jsElement[i].innerHTML.indexOf(elementText));
			//IE returns 0, Chrome returns 5
			if (jsElement[i].innerHTML.indexOf(elementText) >= 0) {
				return (jsElement[i+shift]);
				break;
			}
		}

		if ((typeof jsElement[i].id != "undefined") && (elementTag.toLowerCase() == "div")) {
			if (jsElement[i].id.indexOf(elementText) == 0) {
				return (jsElement[i+shift]);
				break;
			}
		}

		if (elementTag.toLowerCase() == "table") {
			if (jsElement[i] != null) {
				if (jsElement[i].style) {
					if (jsElement[i].style.backgroundImage.indexOf(elementText) >= 0) {
						return (jsElement[i+shift]);
						break;
					}
				}
			}
		}
	}
	return (null);
}

function findElementByClassName(elementTag, classTag, elementText, shift) {
var jsElement;

	if (document.all) {
		jsElement = document.all.tags(elementTag);
	} else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName(elementTag);
	}

	for (var i = 0; i < jsElement.length; i++) {
		if (jsElement[i].className == classTag) {
			//alert(elementText + "  html: " + jsElement[i].outerHTML + "  indexof: " + jsElement[i].outerHTML.indexOf(elementText));
			//IE returns 0, Chrome returns 5
			if (jsElement[i].outerHTML.indexOf(elementText) >= 0) {
				return (jsElement[i+shift]);
				break;
			}
		}
	}
	return (null);
}

function findEmptyElementByClassName(elementTag, classTag) {
var jsElement;

	if (document.all) {
		jsElement = document.all.tags(elementTag);
	} else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName(elementTag);
	}

	for (var i = 0; i < jsElement.length; i++) {
		if (jsElement[i].className == classTag || classTag == "") {
			//alert("i: " + i + "  ##" + myText + "##" + jsElement[i].outerHTML + " || " + jsElement[i].href);
			var myText = trim(jsElement[i].innerHTML, " ");
			if (myText == "") {
				jsElement[i].innerHTML = "-";
				
				if (elementTag == "A") {
					jsElement[i].href = "#";
					jsElement[i].onclick = "javascript: return false;";
					jsElement[i].style.textDecoration = "none";
					jsElement[i].style.border = "none";
				}
			}
		}
	}
}

//--------------------------------------------------------------------------------------
//HTML Tag routine ends here


//--------------------------------------------------------------------------------------
//Checker highlighted routine starts here
//
function highlightChangedDataForChecker(elementTag, classTag, highlightTag) {
var jsElement;

	if (document.all) {
		jsElement = document.all.tags(elementTag);
	}
	else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName(elementTag);
	}

	for (var i = 0; i < jsElement.length; i++) {
		if (jsElement[i].className == classTag) {
			if ((i+1) < jsElement.length)
				if (highlightTag.indexOf('#') == -1)
					jsElement[i+1].className = highlightTag;
				else
					jsElement[i+1].style.backgroundColor = highlightTag;

		}
	}
}

function highlightChangedDataForChecker2(elementTag, classTag, highlightTag) {
var jsElement;

	if (document.all) {
		jsElement = document.all.tags(elementTag);
	}
	else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName(elementTag);
	}

	for (var i = 0; i < jsElement.length; i++) {
		if (jsElement[i].className == classTag) {
			//alert("Found i: " + i + " " + jsElement[i].innerHTML);
		
			var j = 1;
			while ( ((i+j) < jsElement.length) && 
					(jsElement[i+j].className != 'fieldname' && jsElement[i+j].className != 'fieldnamediff' && 
					 jsElement[i+j].className != 'index' && jsElement[i+j].className != 'indexdel' &&
					 jsElement[i+j].className != 'indexdiff' && jsElement[i+j].className != 'indexadd')
			)
			{
				//alert("while " + j + " : " + jsElement[i+j].className + " " + jsElement[i+j].innerHTML);
				var jsContent = jsElement[i+j].innerHTML.toLowerCase();
				var jsContentNext = (jsElement[i+j+1] == null) ? null : jsElement[i+j+1].innerHTML.toLowerCase();
				if ((jsContent.indexOf('<h3>') >= 0)
					|| ((jsContent.indexOf('&nbsp;') == 0) && jsContentNext != null && (jsContentNext.indexOf('<h3>') >= 0))
					|| ((jsContent.indexOf('&nbsp;') >= 0) && jsContentNext != null && (jsContentNext.indexOf('last action by') >= 0))
					|| ((jsContent.indexOf('&nbsp;') == 0) && jsContentNext != null && (jsContentNext.indexOf('fieldname') >= 0))
					|| ((jsContent.indexOf('&nbsp;') == 0) && jsContentNext != null && (jsContentNext.indexOf('fieldnamediff') >= 0))
					//|| ((jsContent.indexOf('&nbsp;') == 0) && (jsElement[i+j+1].innerHTML == ''))
				    )
				{
					//alert("if: " + j + " (" + jsElement[i+j].outerHTML + ")");
					i = i + j;
					break;
				}
				else {
					//alert("else: " + j + " (" + jsElement[i+j].outerHTML + ")");
					//somehow the "<td> </td>" is not detected in Chrome, the space is viewable as &nbsp; in source
					if (highlightTag.indexOf('#') == -1)
						jsElement[i+j].className = highlightTag;
					else
						jsElement[i+j].style.backgroundColor = highlightTag;
				}
				j++;
			}
		}
	}
}

function checkForCheckerHighlighting() {
	//scrollToElementFirstPos('TD', 'fieldnamediff');	//scroll screen to first highlight for checker screen
	//scrollToElementFirstPos('span', 'errormsg');	//scroll screen to first error message for maker screen

	var userRole = document.getElementById("topUserRole");
	if (userRole == null) return;
	
	if (userRole.innerHTML.toLowerCase().indexOf("checker") >= 0) {	
		//rate can be used, but Charge table cannot be changed
		highlightChangedDataForChecker ('TD', 'fieldnamediff', '');
		highlightChangedDataForChecker2('TD', 'indexadd', '');
		highlightChangedDataForChecker2('TD', 'indexdel', '');
		highlightChangedDataForChecker2('TD', 'indexdiff', '');
	}
}

//--------------------------------------------------------------------------------------
//Checker highlighted routine ends here


//--------------------------------------------------------------------------------------
//Maturity date defaulting routine starts here
//
function checkForSecurityMaturityDate() {
	//performDefaultingSecurityMaturityDate ("collateralMaturityDate", "depMatDate", "31/Dec/2049", "31/Dec/2999");
	//used by setTenurePManFlag1()
}

function performDefaultingSecurityMaturityDate(secDateFieldName, depositDateFieldName, defaultValue, defaultProperty) {
	var depositMaturityDate = null;

	var maturityDate = findElementByTagClass ("INPUT", "", secDateFieldName, 0);
	if (maturityDate == null) {
		depositMaturityDate = findElementByTagClass ("INPUT", "", depositDateFieldName, 0);
		if (depositMaturityDate == null)
			return;
	}

	var sectype = findElementByTagClass ("TD", "fieldname", "Security Type", 1);
	if (sectype == null) {
		if (depositMaturityDate == null)
			return;
	}

	var secsubtype = findElementByTagClass ("TD", "fieldname", "Security Sub-type", 1);
	if (secsubtype == null) {
		if (depositMaturityDate == null)
			return;
	}

	if (depositMaturityDate != null) {
		//deposit found
		if (window.location.href.indexOf("CashCashCollateral.do") != -1) {
			if (trim(depositMaturityDate.value, " ") == "")
				depositMaturityDate.value = defaultValue;
		}
	}
	else
	{
		if (sectype.innerHTML.toLowerCase() == "asset based") {
			if (trim(maturityDate.value, " ") == "")
				maturityDate.value = defaultValue;
		}
		else if (sectype.innerHTML.toLowerCase() == "documentation") {
			if (trim(maturityDate.value, " ") == "")
				maturityDate.value = defaultValue;
		}
		else if (sectype.innerHTML.toLowerCase() == "guarantees") {
			if (secsubtype.innerHTML.toLowerCase() == "corporate" || secsubtype.innerHTML.toLowerCase() == "individual") {
				if (trim(maturityDate.value, " ") == "")
					maturityDate.value = defaultValue;
			}
		}
		else if (sectype.innerHTML.toLowerCase() == "insurance / protection") {

		}
		else if (sectype.innerHTML.toLowerCase() == "marketable securities") {
			if (secsubtype.innerHTML.toLowerCase() == "main index - local" || secsubtype.innerHTML.toLowerCase() == "other listed - local" || secsubtype.innerHTML.toLowerCase() == "non - listed - local") {
				if (trim(maturityDate.value, " ") == "")
					maturityDate.value = defaultValue;
			}
		}
		else if (sectype.innerHTML.toLowerCase() == "property") {
			//leasehold = <mandatory input>
			//freehold = <default>
			if (document.getElementById("tenure")) {
				ptyTenure = document.getElementById("tenure").options[document.getElementById("tenure").selectedIndex].value;
				if (ptyTenure == "F") {
					if (trim(maturityDate.value, " ") == "")
						maturityDate.value = defaultProperty;
				}
				else if (ptyTenure == "L") {
				
				}
			}
		}
		else if (sectype.innerHTML.toLowerCase() == "others") {
			if (trim(maturityDate.value, " ") == "")
				maturityDate.value = defaultValue;
		}
	}
}
//--------------------------------------------------------------------------------------
//Maturity date defaulting routine ends here


//--------------------------------------------------------------------------------------
//Stylesheet Switcher routine starts here

//used by template/topbanner.jsp also
function load_DynamicStyleSheet(runAll) {

	if (typeof set_ActiveStyleSheet != 'function')	return;
	
	var cookie = getCookie("cms_style");
	var styletitle = cookie ? cookie : get_PreferredStyleSheet();
	styletitle = "blue";
	set_ActiveStyleSheet(styletitle);
	
	if (runAll == false)
		return;

	var logoName = 'img/banner.jpg';
	var imageLogo = findElementByTagClass ("TD", "role", "", 0);
	//if (imageLogo) alert("imageLogo:  (" + imageLogo.style.backgroundImage + ")");
	if (imageLogo != null && imageLogo.style.backgroundImage.indexOf(logoName) >= 0) {
		imageLogo.style.backgroundImage = 'url(' + "themes/" + styletitle + "/" + logoName+ ')';
	}

	var stripbottomName = 'img/stripbottom.jpg';
	var imageStrip2 = findElementByTagClass ("DIV", "", "windowList", 0);
	//if (imageStrip2) alert("imageStrip2:  (" + imageStrip2.style.backgroundImage + ")");
	if (imageStrip2 != null && imageStrip2.style.backgroundImage.indexOf(stripbottomName) >= 0) {
		imageStrip2.style.backgroundImage = "url(themes/" + styletitle + "/" + stripbottomName + ")";
	}

	var stripName = 'img/strip.jpg';
	var imageStrip1 = findElementByTagClass ("TABLE", "-", stripName, 0);
	//if (imageStrip1) alert("imageStrip1:  (" + imageStrip1.style.backgroundImage + ")");
	if (imageStrip1 != null && imageStrip1.style != null) {
		imageStrip1.style.backgroundImage = "url(themes/" + styletitle + "/" + stripName + ")";
	}

}

function save_DynamicStyleSheet() {
	//if (typeof get_ActiveStyleSheet != 'function')	return;
	
	//var styletitle = get_ActiveStyleSheet();
	//setCookie('cms_style', styletitle, 31536000);
}

//--------------------------------------------------------------------------------------
//Stylesheet Switcher routine ends here


//--------------------------------------------------------------------------------------
//Onload routine starts here

var onStopEventObj = "";
function extraOnLoadTask() {

	onStopEventObj = document.onstop;

	taskAfterCounter1();	//to use ajax to display the diary count
	var topmenu = document.getElementById('topmenu');
	if (topmenu) {
		topmenu.style.display = 'block';
	}
	enabledAutoScrollbar();
	
	checkForSecurityMaturityDate();
	checkForCheckerHighlighting();

	load_DynamicStyleSheet(false);

	var tabResult;
	var cookie = getCookie("cms_layout");
	var layouttitle = cookie ? cookie : "flat";
	
	tabResult = false;
	if (layouttitle == "tabbed") {
		if (typeof makeTabForCollateral == 'function') {
			tabResult = makeTabForCollateral(true, false);
			//if (typeof createDivTabs == 'function') createDivTabs('sec_layouts', 'errormsg', true);
		}
	} else {
		if (typeof makeTabForCollateral == 'function') {
			tabResult = makeTabForCollateral(false, false);
		}
	}

	if (typeof parent.debug == 'function') {
		parent.debug("URL: " + window.location.href);
		g_LastURL = window.location.href;
	}
	
	if (tabResult == false) {
		//enableResizeTextarea();	//allow resize of textarea
	}
}

//--------------------------------------------------------------------------------------
//Onload routine ends here


//--------------------------------------------------------------------------------------
//Sessvars routine starts here

/*
sessvars.js ver 1.01
- JavaScript based session object
copyright 2008 Thomas Frank
*/
sessvars=function(){

	var x={};
	
	x.$={
		prefs:{
			memLimit:2000,
			autoFlush:true,
			crossDomain:false,
			includeProtos:false,
			includeFunctions:false
		},
		parent:x,
		clearMem:function(){
			for(var i in this.parent){if(i!="$"){this.parent[i]=undefined}};
			this.flush();
		},
		usedMem:function(){
			x={};
			return Math.round(this.flush(x)/1024);
		},
		usedMemPercent:function(){
			return Math.round(this.usedMem()/this.prefs.memLimit);
		},
		flush:function(x){
			var y,o={},j=this.$$;
			x=x||top;
			for(var i in this.parent){o[i]=this.parent[i]};
			o.$=this.prefs;
			j.includeProtos=this.prefs.includeProtos;
			j.includeFunctions=this.prefs.includeFunctions;
			y=this.$$.make(o);
			if(x!=top){return y.length};
			if(y.length/1024>this.prefs.memLimit){return false}
			x.name=y;
			return true;
		},
		getDomain:function(){
				var l=location.href
				l=l.split("///").join("//");
				l=l.substring(l.indexOf("://")+3).split("/")[0];
				while(l.split(".").length>2){l=l.substring(l.indexOf(".")+1)};
				return l
		},
		debug:function(t){
			var t=t||this,a=arguments.callee;
			if(!document.body){setTimeout(function(){a(t)},200);return};
			t.flush();
			var d=document.getElementById("sessvarsDebugDiv");
			if(!d){d=document.createElement("div");document.body.insertBefore(d,document.body.firstChild)};
			d.id="sessvarsDebugDiv";
			d.innerHTML='<div style="line-height:20px;padding:5px;font-size:11px;font-family:Verdana,Arial,Helvetica;'+
						'z-index:10000;background:#6688CC;border: 1px solid #333;margin-bottom:12px">'+
						'<b style="font-family:Trebuchet MS;font-size:20px">sessvars.js - debug info:</b><br/><br/>'+
						'Memory usage: '+t.usedMem()+' Kb ('+t.usedMemPercent()+'%)&nbsp;&nbsp;&nbsp;'+
						'<span style="cursor:pointer"><b>[Clear memory]</b></span><br/>'+
						top.name.split('\n').join('<br/>')+'</div>';
			d.getElementsByTagName('span')[0].onclick=function(){t.clearMem();location.reload()}
		},
		init:function(){
			var o={}, t=this;
			try {o=this.$$.toObject(top.name)} catch(e){o={}};
			this.prefs=o.$||t.prefs;
			if(this.prefs.crossDomain || this.prefs.currentDomain==this.getDomain()){
				for(var i in o){this.parent[i]=o[i]};
			}
			else {
				this.prefs.currentDomain=this.getDomain();
			};
			this.parent.$=t;
			t.flush();
			var f=function(){if(t.prefs.autoFlush){t.flush()}};
			if(window["addEventListener"]){addEventListener("unload",f,false)}
			else if(window["attachEvent"]){window.attachEvent("onunload",f)}
			else {this.prefs.autoFlush=false};
		}
	};
	
	x.$.$$={
		compactOutput:false, 		
		includeProtos:false, 	
		includeFunctions: false,
		detectCirculars:true,
		restoreCirculars:true,
		make:function(arg,restore) {
			this.restore=restore;
			this.mem=[];this.pathMem=[];
			return this.toJsonStringArray(arg).join('');
		},
		toObject:function(x){
			if(!this.cleaner){
				try{this.cleaner=new RegExp('^("(\\\\.|[^"\\\\\\n\\r])*?"|[,:{}\\[\\]0-9.\\-+Eaeflnr-u \\n\\r\\t])+?$')}
				catch(a){this.cleaner=/^(true|false|null|\[.*\]|\{.*\}|".*"|\d+|\d+\.\d+)$/}
			};
			if(!this.cleaner.test(x)){return {}};
			eval("this.myObj="+x);
			if(!this.restoreCirculars || !alert){return this.myObj};
			if(this.includeFunctions){
				var x=this.myObj;
				for(var i in x){if(typeof x[i]=="string" && !x[i].indexOf("JSONincludedFunc:")){
					x[i]=x[i].substring(17);
					eval("x[i]="+x[i])
				}}
			};
			this.restoreCode=[];
			this.make(this.myObj,true);
			var r=this.restoreCode.join(";")+";";
			eval('r=r.replace(/\\W([0-9]{1,})(\\W)/g,"[$1]$2").replace(/\\.\\;/g,";")');
			eval(r);
			return this.myObj
		},
		toJsonStringArray:function(arg, out) {
			if(!out){this.path=[]};
			out = out || [];
			var u; // undefined
			switch (typeof arg) {
			case 'object':
				this.lastObj=arg;
				if(this.detectCirculars){
					var m=this.mem; var n=this.pathMem;
					for(var i=0;i<m.length;i++){
						if(arg===m[i]){
							out.push('"JSONcircRef:'+n[i]+'"');return out
						}
					};
					m.push(arg); n.push(this.path.join("."));
				};
				if (arg) {
					if (arg.constructor == Array) {
						out.push('[');
						for (var i = 0; i < arg.length; ++i) {
							this.path.push(i);
							if (i > 0)
								out.push(',\n');
							this.toJsonStringArray(arg[i], out);
							this.path.pop();
						}
						out.push(']');
						return out;
					} else if (typeof arg.toString != 'undefined') {
						out.push('{');
						var first = true;
						for (var i in arg) {
							if(!this.includeProtos && arg[i]===arg.constructor.prototype[i]){continue};
							this.path.push(i);
							var curr = out.length; 
							if (!first)
								out.push(this.compactOutput?',':',\n');
							this.toJsonStringArray(i, out);
							out.push(':');                    
							this.toJsonStringArray(arg[i], out);
							if (out[out.length - 1] == u)
								out.splice(curr, out.length - curr);
							else
								first = false;
							this.path.pop();
						}
						out.push('}');
						return out;
					}
					return out;
				}
				out.push('null');
				return out;
			case 'unknown':
			case 'undefined':
			case 'function':
				if(!this.includeFunctions){out.push(u);return out};
				arg="JSONincludedFunc:"+arg;
				out.push('"');
				var a=['\n','\\n','\r','\\r','"','\\"'];
				arg+=""; for(var i=0;i<6;i+=2){arg=arg.split(a[i]).join(a[i+1])};
				out.push(arg);
				out.push('"');
				return out;
			case 'string':
				if(this.restore && arg.indexOf("JSONcircRef:")==0){
					this.restoreCode.push('this.myObj.'+this.path.join(".")+"="+arg.split("JSONcircRef:").join("this.myObj."));
				};
				out.push('"');
				var a=['\n','\\n','\r','\\r','"','\\"'];
				arg+=""; for(var i=0;i<6;i+=2){arg=arg.split(a[i]).join(a[i+1])};
				out.push(arg);
				out.push('"');
				return out;
			default:
				out.push(String(arg));
				return out;
			}
		}
	};
	
	x.$.init();
	return x;
}()

//--------------------------------------------------------------------------------------
//Sessvars routine ends here


//--------------------------------------------------------------------------------------
//Textarea resize routine starts here

var textareaObject;

function enableResizeTextarea() {
	//this returns the position of element
	function getElementPos( elmt ) {
		var x=0, y=0;
		do {
			x += elmt.offsetLeft;
			y += elmt.offsetTop;
		} while ( ( elmt = elmt.offsetParent ) );
		return { x: x, y: y };
	}
	
	//this returns the position of event element
	function getEventPos( evt ) {
		evt = evt || window.event || {};
		//alert("event: " + evt + " evt.y: " + evt.y + " evt.clientY: "  + evt.clientY);
		return ('number'==typeof evt.clientY) ? {x: evt.clientX, y: evt.clientY} : {x: evt.x, y: evt.y};
	}

	//this update the property of element
	function setElementProperty( elmt, p, v ) { 
		elmt.style[p] = Math.max( 1, v ) + 'px' ; 
	}

	//m is <div> object created
	var d = document;
	var m = d.createElement('div');

	var p;

	var dragObj;
	var textareaCount;
	var textareaArray;
	var textObj;

	var globalshift = 0;
	var xshift = 0; //16
	var yshift = 0; //18
	var xwinshift = 16;
	var ywinshift = 114; //90

	if ( !enableResizeTextarea.arguments.length ) { 
		textareaArray = d.getElementsByTagName('textarea');
		textareaCount = textareaArray.length;
		if ( !textareaCount ) { return; }
	}

	m.style.background = 'url( ' + getContextPath() + '/img/resizetextarea.gif ) no-repeat';
	m.style.position = 'absolute';
	m.style.border = 'none';
	m.style.cursor = 'move';
	m.style.width = '16px';
	m.style.height = '16px';

	while ( textareaCount-- ) {
		//t is textarea object
		textObj = textareaArray[textareaCount];
		//p is position of textarea object
		p = getElementPos(textObj);
		var canvas = document.getElementById("contentCanvas");
		//alert("  canvas: " + canvas.style.top + "  p.x: " + p.x + "   p.y: " + p.y + "   textObj.offsetWidth: " + textObj.offsetWidth + "   textObj.offsetHeight: " + textObj.offsetHeight);

		//dragObj the <div> created for dragging
		dragObj = m.cloneNode( true );
		setElementProperty( dragObj, 'left', p.x + textObj.offsetWidth - globalshift - xwinshift - xshift );
		setElementProperty( dragObj, 'top', p.y + textObj.offsetHeight - globalshift - ywinshift - yshift );
		//setElementProperty( dragObj, 'top', ywinshift );
		//alert(dragObj.style.top);

		dragObj.onmousedown = function( evt ) {
			textareaObject = this;

			//p is position of textarea object
			p = getElementPos(textareaObject);
			//q is position of event
			q = getEventPos(evt);
			textareaObject.oX = q.x - p.x;
			textareaObject.oY = q.y - p.y;

			d.onmousemove = function( evt ) {
				//p is position of textarea object
				var p = getElementPos(textareaObject.nextSibling);
				//q is position of event
				var q = getEventPos(evt);

				window.status = textareaObject.nextSibling.cols;
				//window.status = (q.x - textareaObject.oX - p.x) + "  -> " + q.x + " , " + textareaObject.oX + " , " + p.x + "  |  " + q.y + " , " + textareaObject.oY + " , " + p.y;
				if (q.x - textareaObject.oX - p.x <= textareaObject.nextSibling.cols*6 || q.y - textareaObject.oY - p.y <= textareaObject.nextSibling.rows*16) return;

				setElementProperty( textareaObject.nextSibling, 'width', Math.max(globalshift, q.x - textareaObject.oX - p.x + xshift) );
				setElementProperty( textareaObject.nextSibling, 'height', Math.max(globalshift, q.y - textareaObject.oY - p.y + yshift) );
				setElementProperty( textareaObject, 'left', q.x - textareaObject.oX - xwinshift );
				setElementProperty( textareaObject, 'top', q.y - textareaObject.oY - ywinshift );
			};
			d.onselectstart = function() { return false; };
			d.onmouseup = function( evt ) {
				//p is position of textarea object
				var p = getElementPos(textareaObject.nextSibling);
				//q is position of event
				var q = getEventPos(evt);
				//window.status = (q.x - textareaObject.oX - p.x) + "  -> " + q.x + " , " + textareaObject.oX + " , " + p.x + "  |  " + q.y + " , " + textareaObject.oY + " , " + p.y;
				if (q.x - textareaObject.oX - p.x <= textareaObject.nextSibling.cols*6 || q.y - textareaObject.oY - p.y <= textareaObject.nextSibling.rows*16) return;
				setElementProperty( textareaObject.nextSibling, 'width', Math.max(globalshift, q.x - textareaObject.oX - p.x + xshift) );
				setElementProperty( textareaObject.nextSibling, 'height', Math.max(globalshift, q.y - textareaObject.oY - p.y + yshift) );
				setElementProperty( textareaObject, 'left', q.x - textareaObject.oX - xwinshift );
				setElementProperty( textareaObject, 'top', q.y - textareaObject.oY - ywinshift );

				textareaObject = null;
				d.onmousemove = null;
				d.onselectstart = null;
				d.onmouseup = null;
			};
		};
		textObj.parentNode.insertBefore( dragObj, textObj );
	}
}

function amountFormat(field){
  // alert("field.value:"+field.value);
    var regex=/[^,.0-9\s]/gi;
    field.value=field.value.replace(regex ,"");
   // alert("field.value1:"+field.value)
}

function formatAmountAsCommaSeparated(obj){
	var name=obj.name;
	var nStr=obj.value;
	var id=obj.id;
//	alert("nStr:"+obj.name);
//	alert("nStr:"+nStr);
	
	nStr=nStr.replace(/,/g,'');
	nStr=nStr.replace(/^0+(?!\.|$)/, '');
	nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    if(x.length > 1){
    if(x[1].length == 2){
    	x2= '.' + x[1];
    }else if(x[1].length == 1){
    	x2= '.' + x[1]+'0';
    }else{
    	x2= '.' + x[1];
    }
    }
    else{
    	 x2 ='.00';
    }
 //   x2 = x.length > 1 ? '.' + x[1] : '.00';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
          x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    if(x1.length == 0){
    	//alert("x1 is of length zero");
    	x1='0';
    }
 
  //  alert("x1 + x2:"+x1 + x2);
    document.getElementById(id).value=x1 + x2;
} 


function formatAmountAsCommaSeparated1(value){

	var parts = value.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

function formatAmountAsCommaSeparatedWithoutDefaultDecimal(obj){
	var name=obj.name;
	var nStr=obj.value;
	var id=obj.id;
//	alert("nStr:"+obj.name);
//	alert("nStr:"+nStr);
	
	nStr=nStr.replace(/,/g,'');
	nStr=nStr.replace(/^0+(?!\.|$)/, '');
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];

    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
          x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    if(x1.length == 0){
    	//alert("x1 is of length zero");
    	x1='0';
    }
 
  //  alert("x1 + x2:"+x1 + x2);
    document.getElementById(id).value=x1 + x2;
}
//--------------------------------------------------------------------------------------
//Textarea resize routine ends here

//Uma Khot:Cam upload and Dp field calculation CR
function allowNumericDecimal(object){
	//alert("characterText");
	var id=object.id;
	//alert("id:"+id);
    var str=document.getElementById(id);
    var regex=/[^0-9.]/gi;
    str.value=str.value.replace(regex ,"");
}

function formatAmountAsCommaSeparatedOnlyDigit(obj){
	var name=obj.name;
	var nStr=obj.value;
	var id=obj.id;
//	alert("nStr:"+obj.name);
//	alert("nStr:"+nStr);
	
	var objValue = nStr.replace(/^\s+/g, '')
	if(objValue==''){
		return;
	}
	
	nStr=nStr.replace(/,/g,'');
	nStr=nStr.replace(/^0+(?!\.|$)/, '');
	nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    if(x.length > 1){
    if(x[1].length == 2){
    	x2= '.' + x[1];
    }else if(x[1].length == 1){
    	x2= '.' + x[1]+'0';
    }else{
    	x2= '.' + x[1];
    }
    }
    else{
    	 x2 ='.00';
    }
 //   x2 = x.length > 1 ? '.' + x[1] : '.00';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
          x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    if(x1.length == 0){
    	//alert("x1 is of length zero");
    	x1='0';
    }
 
  //  alert("x1 + x2:"+x1 + x2);
    document.getElementById(id).value=x1 + x2;
} 

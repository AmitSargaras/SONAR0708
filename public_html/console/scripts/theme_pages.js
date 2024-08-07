//use debugutil to help set to null on destroy
var Xloc, Yloc, Xwidth, Yheight;

var devMode = false;
var contentWin = null;

var win_main = null;
var win_sitemap = null;
var win_utilities = null;
var win_preferences = null;
var win_broadcast = null;

function show_sitemap(){
	Xloc = 8;
	Yloc = 50;
	Xwidth = 150;
	Ywidth = 360;
	if (win_sitemap == null) {
		win_sitemap = new Window('(Site Map)', {className: currentTheme, title: "Site Map", 
						left:Xloc, top:Yloc, width:Xwidth, height:Ywidth, maximizable: false, minimizable: false, closable: false,
						resizable: false, url: "sitemap.jsp", showEffectOptions: {duration: 0.7}, hideEffectOptions: {duration: 0.5}});
		
		win_sitemap.setConstraint(true, {left:4, right:4, top: 55, bottom:0})
		win_sitemap.toFront();
		win_sitemap.setDestroyOnClose();
		win_sitemap.show();
	}
	else {
		win_sitemap.toFront();
		win_sitemap.show();
	}
}


function ReplaceWindow(newlocation){
	newurl = $(win_sitemap.getId() + '_content');		
	newurl.src = newlocation;

}


function show_main() {

	Xloc = 0;
	Yloc = 0;
	Xwidth = WindowUtilities.getPageSize().windowWidth;
	Ywidth = WindowUtilities.getPageSize().windowHeight;

	if (win_main == null) {
	
		win_main = new Window('no_border', {className: "no_border", title: "", 
						left:Xloc, top:Yloc, width:Xwidth, height:Ywidth, recenterAuto: true, 
						maximizable: true, minimizable: true, closable: false, wiredDrag: false,
						resizable: false, url: "login.jsp", showEffectOptions: {duration: 0.0}, hideEffectOptions: {duration: 0.0}});

		//win_main.setConstraint(true, {left:-10, right:-10, top: -10, bottom:-10})
		div_showhide("no_border_minimize", 'hidden');
		div_showhide("no_border_maximize", 'hidden');
		win_main.toFront();
		win_main.setDestroyOnClose();
		win_main.show();
	}
	else {
		win_main.toFront();
		win_main.show();
	}

}

function handle_resize() {
	if (win_main != null) {	
		if (devMode == false) {
			Xwidth = WindowUtilities.getPageSize().windowWidth;
			Ywidth = WindowUtilities.getPageSize().windowHeight;
			win_main.setLocation(0, 0);
			win_main.setSize(Xwidth, Ywidth);
			win_main.toFront();
		}

		if (win_main.isMaximized()) {
			win_main.maximize();
			setTimeout("handle_resize()", 600);
		}
	}

	debug("***** Browser resize activated *****");
	debug("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "pageWidth: " + WindowUtilities.getPageSize().pageWidth);
	debug("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "pageHeight: " + WindowUtilities.getPageSize().pageHeight);
	debug("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "windowWidth: " + WindowUtilities.getPageSize().windowWidth);
	debug("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "windowHeight: " + WindowUtilities.getPageSize().windowHeight);
}


function reload_Theme() {

	setTimeout("reload_Theme_Actual()", 600);
	debug("Active theme is now [" + currentTheme + "]");
}

function reload_Theme_Actual() {

	if (win_preferences != null) {
		win_preferences.destroy();
		show_preferences();
	}
	
	//show_main();
}

function div_showhide(divName, showhide) { 
	//showhide = 'hidden', 'visible'
	if (document.getElementById) { // DOM3 = IE5, NS6 
		document.getElementById(divName).style.visibility = showhide; 
	} 
	else { 
		if (document.layers) { // Netscape 4 
			document.divName.visibility = showhide; 
		} 
		else { // IE 4 
			document.all.divName.style.visibility = showhide; 
		} 
	} 
} 

//this is injected into _initDrag: function(event) of window.js
function switch_DevMode(event) {
	if (debugWindow != null) {
		 debugWindow.show();
	}
	
	//alert("alt: " + event.altKey + "  ctrl: " + event.ctrlKey);
	//special event
	if (event.altKey && event.ctrlKey) {
		if (devMode == false) {
			devMode = true;
			if (div_showhide) {
				div_showhide("no_border_minimize", 'visible');
				div_showhide("no_border_maximize", 'visible');
				Xwidth = WindowUtilities.getPageSize().windowWidth;
				Ywidth = WindowUtilities.getPageSize().windowHeight;
				win_main.setLocation(310, 25);
				win_main.setSize(Xwidth-50, Ywidth-325);
			}
			if (showExtendedDebug) showExtendedDebug();
			return true;
		}
	} else {
		if (devMode == false) {
			if (location.href.indexOf("localhost") == -1) {
				return true;
			}
		}
	}
	return false;
}

//this is called by main.jsp
function cancel_DevMode(event) { 
	//alert("alt: " + event.altKey + "  ctrl: " + event.ctrlKey + " shift: " + event.shiftKey);
	if (event.altKey && event.ctrlKey && event.shiftKey) {
		if (devMode == true) {
			devMode = false;
			if (div_showhide) {
				div_showhide("no_border_minimize", 'hidden');
				div_showhide("no_border_maximize", 'hidden');
				Xwidth = WindowUtilities.getPageSize().windowWidth;
				Ywidth = WindowUtilities.getPageSize().windowHeight;
				win_main.setLocation(0, 0);
				win_main.setSize(Xwidth, Ywidth);
				win_main.toFront();
			}
			return true;
		}
	}
	return false;
}

function show_preferences(){
	Xloc = 0;
	Yloc = 0;
	Xwidth = 400;
	Ywidth = 370;
	if (win_preferences == null) {
		win_preferences = new Window('(Preferences)', {className: currentTheme, title: "Preferences", 
						left:Xloc, top:Yloc, width:Xwidth, height: Ywidth, maximizable: false,
						resizable: false, url: "themes/switchtheme.jsp", showEffectOptions: {duration: null}, hideEffectOptions: {duration: null}})
		
		win_preferences.setConstraint(true, {left:0, right:0, top: 24, bottom:0})
		win_preferences.toFront();
		win_preferences.setDestroyOnClose();
		win_preferences.showCenter();
	}
	else {
		win_preferences.toFront();
		win_preferences.show();
	}

}


function close_preferences(){
	if (win_preferences == null) {
	
	}
	else {
		win_preferences.close();
	}

}


function show_broadcastmessage(){
	Xloc = 0;
	Yloc = 0;
	Xwidth = 510;
	Ywidth = 310;
	if (win_broadcast == null) {
		win_broadcast = new Window('(Broadcast)', {className: currentTheme, title: "Broadcast Message", 
						left:Xloc, top:Yloc, width:Xwidth, height: Ywidth, maximizable: false, minimizable: false,
						resizable: false, url: "broadcast.jsp", showEffect:Effect.BlindDown, hideEffect: Effect.SwitchOff})
		
		win_broadcast.setConstraint(true, {left:0, right:0, top:24, bottom:80})
		win_broadcast.toFront();
		win_broadcast.setDestroyOnClose();
		win_broadcast.showCenter();
	}
	else {
		win_broadcast.close();
		bcTime = setTimeout('show_broadcastmessage()', 1000);
	}
}


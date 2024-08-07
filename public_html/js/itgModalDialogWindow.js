// JavaScript Document
var Nav4 = ((navigator.appName == "Netscape") && (parseInt(navigator.appVersion) >= 4))

function onloadEvent() {
	if(Nav4) {
		if (opener) {		
			opener.blockEvents();
		}
	}
}

function onUnloadEvent() {
	if(Nav4) {
		if (opener) {	
			opener.unblockEvents();
		}
	}
}

function getParentWindow() {
	if(Nav4) {
		return opener;
	} else {
		return window.dialogArguments;
	}
}
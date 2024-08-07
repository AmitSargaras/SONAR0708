
//findElementByTagClass - exists in itgUtilities.js

//--------------------------------------------------------------------------------------
//Functions to convert collateral screens within DIV
//
//this is used to store the document.body
//make global to speed up processing
var finalContent;
var validCollateralTags = new Array();

function makeTabForCollateral() {
var jsElement;

var elementTag = 'TABLE';
var classTag = 'tblFormSection';

var generalTag;
var securityTag;
var additionTag;
var insuranceTag;
var valuationTag;
var depositTag;
var chargeTag;
var pledgeTag;

	if (document.all) {
		jsElement = document.all.tags(elementTag);
	} else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName(elementTag);
	}

	funcType = findCollateralTagClass(jsElement, 'TABLE', 'tblFormSection', 0, '<H3>', ['Create', 'Close', 'Update', 'Process'], 'Security Details');
	if (funcType == -1) return;

	var sectype = findElementByTagClass ("TD", "fieldname", "Security Type", 1);	
	if (sectype == null) return;
	
	var secsubtype = findElementByTagClass ("TD", "fieldname", "Security Sub-type", 1);
	if (secsubtype == null) return;
	
	finalContent = document.body.innerHTML;

	generalTag = setCollateralDiv (jsElement, elementTag, classTag, 0, 'General', 'General');

	if (secsubtype.innerHTML.toLowerCase() == 'specific charge - vehicles/floor stocking') {
		securityTag = setCollateralDiv (jsElement, elementTag, classTag, (generalTag[0]+1), 'Vehicle Information', 'Vehicle');
		additionTag = setCollateralDiv (jsElement, elementTag, classTag, (securityTag[0]+1), 'Other Vehicle Information', 'Other');
		
		lastLoc = additionTag[0] + 1;
		
		closeCollateralDiv (jsElement, elementTag, classTag, additionTag[0]);

	} else {
		additionTag = setCollateralDiv (jsElement, elementTag, classTag, (generalTag[0]+1), 'Additional Information', 'Additional');

		lastLoc = additionTag[0] + 1;

		closeCollateralDiv (jsElement, elementTag, classTag, additionTag[0]);
	}

/*
	insuranceTag = setCollateralDiv (jsElement, elementTag, classTag, (lastLoc), 'Insurance Policies', 'Insurance');

	if (sectype.innerHTML.toLowerCase() == "deposit") {
		depositTag = setCollateralDiv (jsElement, elementTag, classTag, (lastLoc), 'Deposit Information', 'Deposit');
	}

	pledgeTag = setCollateralDiv (jsElement, elementTag, classTag, (lastLoc), 'Pledgor Information', 'Pledgor_Pledge');
	chargeTag = setCollateralDiv (jsElement, elementTag, classTag, (lastLoc), 'Charge Information', 'Charge');

	valuationTag = setCollateralDiv (jsElement, elementTag, classTag, (lastLoc), 'System Valuation Details', 'Valuation');

	closeCollateralDiv (jsElement, elementTag, classTag, (valuationTag[0]));
*/
	
	document.body.innerHTML = finalContent;
	
	//var win2 = window.open("","","menubar,scrollbars,status");
	//win2.document.write(document.body.outerHTML);
	//win2.document.close();

	finalContent = null;
	validCollateralTags = null;
	
	if (typeof createDivTabs == 'function')
		createDivTabs('sec_layouts', 'errormsg', true);

}


function findCollateralTagClass(jsElement, elementTag, classTag, startLoc, tag1, cond1, cond2) {
	if (jsElement == null) {
		if (document.all) {
			jsElement = document.all.tags(elementTag);
		} else if (document.getElementsByTagName) {
			jsElement = document.getElementsByTagName(elementTag);
		}
	}

	for (var i = startLoc; i < jsElement.length; i++) {
		if (jsElement[i].className == classTag) {
			elementContent = jsElement[i].innerHTML.toLowerCase();

			tag1loc = elementContent.indexOf(tag1);
			//alert("tag1loc: " + tag1loc + "  tag1: " + tag1 + "  elem: " + elementContent);
			if (tag1loc >= 0) {			
				if (typeof cond1 == 'string') {
					cond1loc = (cond1 != '') ? elementContent.indexOf(cond1) : (tag1loc+1);
				} 
				else if (typeof cond1 == 'object') {
					lastcond1loc = tag1loc+1;
					notFoundCount = 0;
					for (var ooi = 0; ooi < cond1.length; ooi++) {
						cond1loc = (cond1[ooi] != '') ? elementContent.indexOf(cond1[ooi]) : (lastcond1loc);
						//alert(cond1 + " " + ooi + " : " + cond1[ooi] + " --> " + cond1loc + "  " + lastcond1loc);
						if (cond1loc > lastcond1loc) lastcond1loc = cond1loc;
						if (cond1loc < 0) notFoundCount++;
					}
					//cond1 must have at least 1 match, otherwise it is an invalid case
					//alert("notFoundCount: " + notFoundCount +  " " + cond1.length);
					if (cond1loc < 0 && notFoundCount < cond1.length) cond1loc = lastcond1loc;
				}
				cond2loc = (cond2 != '') ? elementContent.indexOf(cond2) : (cond1loc+1);
				//alert("cond1loc: " + cond1loc + "  cond2loc: " + cond2loc+ "  tag1loc: " + tag1loc);
				if (cond1loc >= 0 && cond2loc >= 0 && cond2loc > cond1loc && cond1loc > tag1loc) {
					return (i);
					break;
				}
			}
		}
	}
	return (-1);
}

function findCollateralTagClass2(jsElement, elementTag, classTag, startLoc, tag1, cond1) {
	if (jsElement == null) {
		if (document.all) {
			jsElement = document.all.tags(elementTag);
		} else if (document.getElementsByTagName) {
			jsElement = document.getElementsByTagName(elementTag);
		}
	}

	for (var i = startLoc; i < jsElement.length; i++) {
		if (jsElement[i].className == classTag) {
			elementContent = jsElement[i].innerHTML;

			tag1loc = elementContent.indexOf(tag1);
			if (tag1loc >= 0) {
				cond1loc = (cond1 != '') ? elementContent.indexOf(cond1) : (tag1loc+1);
				if (cond1loc >= 0 && cond1loc > tag1loc) {
					return (i);
					break;
				}
			}
		}
	}
	return (-1);
}

function closeCollateralDiv(jsElement, elementTag, classTag, lastLoc) {
	for (var i = (jsElement.length-1); i > lastLoc; i--) {
		str1 = jsElement[i].innerHTML.toLowerCase();
		if ( (str1.indexOf("save1.gif")!=-1) ||
			 (str1.indexOf("ok1.gif")!=-1) ||
			 (str1.indexOf("cancel1.gif")!=-1) ||
			 (str1.indexOf("return1.gif")!=-1) ||
			 (str1.indexOf("approve1.gif")!=-1) ||
			 (str1.indexOf("reject1.gif")!=-1) ||
			 (str1.indexOf("close1a.gif")!=-1) ||
			 (str1.indexOf("submit1.gif")!=-1)
		   )
		{
			foundTagPos = findTagByOccurrence(('<'+elementTag), classTag, i, 0);
			insertCollateralTagDiv(foundTagPos, '</div>', '</div>');
			//alert(finalContent.substr(foundTagPos-1));
			return (i);
			break;
		}
	}
	return (-1);
}

function setCollateralDiv(jsElement, elementTag, classTag, lastLoc, headerName, tabName) {
	foundTagPos = -1;
	foundTag = findCollateralTagClass(jsElement, elementTag, classTag, lastLoc, '<H3>', headerName, '');
	//alert("setCollateralDiv: " + headerName + " found: " + foundTag + " last: " + lastLoc + "   " + jsElement[foundTag].outerHTML);
	
	if (foundTag != -1) {
		//jsElement[foundTag].style.visibility = 'hidden';
		//jsElement[foundTag].style.display = 'none';
		foundTagPos = findTagByOccurrence(('<'+elementTag), classTag, foundTag, 0);
		insertCollateralTagDiv(foundTagPos, '<div id="sec_layout_' + tabName + '" class="tabcontent">', '</div>');
		validCollateralTags[validCollateralTags.length] = tabName;
	}
	return [ foundTag, foundTagPos ];
}

function insertCollateralTagDiv(tagPos, openDiv, closeDiv) {
	if (validCollateralTags.length > 0) openDiv = closeDiv + openDiv;

	if (openDiv.indexOf('General') != -1) {
		openDiv = '<div id="sec_layout_master" style="border:1px solid gray; margin-bottom: 1em; padding: 2px; PADDING-BOTTOM: 40px;">' + openDiv;
	}

	finalContent = finalContent.substring(0, tagPos-1) + openDiv + finalContent.substring(tagPos);
}

function findTagByOccurrence(elementTag, classTag, count, fromLoc) {
var foundLoc;

	for (var i = 0; i <= count; i++) {
		foundLoc = finalContent.indexOf(elementTag, fromLoc);
		//alert("i: " + i + " " + elementTag + "  ->  " + foundLoc + " == " + jsElement.substr(foundLoc));
		fromLoc = foundLoc + 1;
	}
	return (foundLoc);
}


//--------------------------------------------------------------------------------------
//


////NO NEED TO EDIT BELOW////////////////////////

function ddtabcontent(tabinterfaceid){
	this.tabinterfaceid=tabinterfaceid //ID of Tab Menu main container
	if (document.getElementById(tabinterfaceid))
		this.tabs=document.getElementById(tabinterfaceid).getElementsByTagName("a") //Get all tab links within container
	else
		this.tabs=null;
	this.enabletabpersistence=true
	this.hottabspositions=[] //Array to store position of tabs that have a "rel" attr defined, relative to all tab links, within container
	this.currentTabIndex=0 //Index of currently selected hot tab (tab with sub content) within hottabspositions[] array
	this.subcontentids=[] //Array to store ids of the sub contents ("rel" attr values)
	this.revcontentids=[] //Array to store ids of arbitrary contents to expand/contact as well ("rev" attr values)
	this.selectedClassTarget="link" //keyword to indicate which target element to assign "selected" CSS class ("linkparent" or "link")
}

ddtabcontent.getCookie=function(Name){ 
	var re=new RegExp(Name+"=[^;]+", "i"); //construct RE to search for target name/value pair
	if (document.cookie.match(re)) //if cookie found
		return document.cookie.match(re)[0].split("=")[1] //return its value
	return ""
}

ddtabcontent.setCookie=function(name, value){
	document.cookie = name+"="+value+";path=/" //cookie value is domain wide (path=/)
}

ddtabcontent.prototype={

	expandit:function(tabid_or_position){ //PUBLIC function to select a tab either by its ID or position(int) within its peers
		this.cancelautorun() //stop auto cycling of tabs (if running)
		var tabref=""
		try{
			if (typeof tabid_or_position=="string" && document.getElementById(tabid_or_position).getAttribute("rel")) //if specified tab contains "rel" attr
				tabref=document.getElementById(tabid_or_position)
			else if (parseInt(tabid_or_position)!=NaN && this.tabs[tabid_or_position].getAttribute("rel")) //if specified tab contains "rel" attr
				tabref=this.tabs[tabid_or_position]
		}
		catch(err){alert("Invalid Tab ID or position entered!")}
		if (tabref!="") //if a valid tab is found based on function parameter
			this.expandtab(tabref) //expand this tab
	},

	cycleit:function(dir, autorun){ //PUBLIC function to move foward or backwards through each hot tab (tabinstance.cycleit('foward/back') )
		if (dir=="next"){
			var currentTabIndex=(this.currentTabIndex<this.hottabspositions.length-1)? this.currentTabIndex+1 : 0
		}
		else if (dir=="prev"){
			var currentTabIndex=(this.currentTabIndex>0)? this.currentTabIndex-1 : this.hottabspositions.length-1
		}
		if (typeof autorun=="undefined") //if cycleit() is being called by user, versus autorun() function
			this.cancelautorun() //stop auto cycling of tabs (if running)
		this.expandtab(this.tabs[this.hottabspositions[currentTabIndex]])
	},

	setpersist:function(bool){ //PUBLIC function to toggle persistence feature
			this.enabletabpersistence=bool
	},

	setselectedClassTarget:function(objstr){ //PUBLIC function to set which target element to assign "selected" CSS class ("linkparent" or "link")
		this.selectedClassTarget=objstr || "link"
	},

	getselectedClassTarget:function(tabref){ //Returns target element to assign "selected" CSS class to
		return (this.selectedClassTarget==("linkparent".toLowerCase()))? tabref.parentNode : tabref
	},

	urlparamselect:function(tabinterfaceid){
		var result=window.location.search.match(new RegExp(tabinterfaceid+"=(\\d+)", "i")) //check for "?tabinterfaceid=2" in URL
		return (result==null)? null : parseInt(RegExp.$1) //returns null or index, where index (int) is the selected tab's index
	},

	expandtab:function(tabref){
		var subcontentid=tabref.getAttribute("rel") //Get id of subcontent to expand
		//Get "rev" attr as a string of IDs in the format ",john,george,trey,etc," to easily search through
		var associatedrevids=(tabref.getAttribute("rev"))? ","+tabref.getAttribute("rev").replace(/\s+/, "")+"," : ""
		this.expandsubcontent(subcontentid)
		this.expandrevcontent(associatedrevids)
		for (var i=0; i<this.tabs.length; i++){ //Loop through all tabs, and assign only the selected tab the CSS class "selected"
			this.getselectedClassTarget(this.tabs[i]).className=(this.tabs[i].getAttribute("rel")==subcontentid)? "selected" : ""
		}
		if (this.enabletabpersistence) //if persistence enabled, save selected tab position(int) relative to its peers
			ddtabcontent.setCookie(this.tabinterfaceid, tabref.tabposition)
		this.setcurrenttabindex(tabref.tabposition) //remember position of selected tab within hottabspositions[] array
	},

	expandsubcontent:function(subcontentid){
		for (var i=0; i<this.subcontentids.length; i++){
			var subcontent=document.getElementById(this.subcontentids[i]) //cache current subcontent obj (in for loop)
			subcontent.style.display=(subcontent.id==subcontentid)? "block" : "none" //"show" or hide sub content based on matching id attr value
		}
	},

	expandrevcontent:function(associatedrevids){
		var allrevids=this.revcontentids
		for (var i=0; i<allrevids.length; i++){ //Loop through rev attributes for all tabs in this tab interface
			//if any values stored within associatedrevids matches one within allrevids, expand that DIV, otherwise, contract it
			document.getElementById(allrevids[i]).style.display=(associatedrevids.indexOf(","+allrevids[i]+",")!=-1)? "block" : "none"
		}
	},

	setcurrenttabindex:function(tabposition){ //store current position of tab (within hottabspositions[] array)
		for (var i=0; i<this.hottabspositions.length; i++){
			if (tabposition==this.hottabspositions[i]){
				this.currentTabIndex=i
				break
			}
		}
	},

	autorun:function(){ //function to auto cycle through and select tabs based on a set interval
		this.cycleit('next', true)
	},

	cancelautorun:function(){
		if (typeof this.autoruntimer!="undefined")
			clearInterval(this.autoruntimer)
	},

	init:function(automodeperiod){
		var persistedtab=ddtabcontent.getCookie(this.tabinterfaceid) //get position of persisted tab (applicable if persistence is enabled)
		var selectedtab=-1 //Currently selected tab index (-1 meaning none)
		var selectedtabfromurl=this.urlparamselect(this.tabinterfaceid) //returns null or index from: tabcontent.htm?tabinterfaceid=index
		this.automodeperiod=automodeperiod || 0
		
		if (this.tabs == null) return;
		if (this.tabs.length == 0) return;
		
		for (var i=0; i<this.tabs.length; i++){
			this.tabs[i].tabposition=i //remember position of tab relative to its peers
			if (this.tabs[i].getAttribute("rel")){
				var tabinstance=this
				this.hottabspositions[this.hottabspositions.length]=i //store position of "hot" tab ("rel" attr defined) relative to its peers
				this.subcontentids[this.subcontentids.length]=this.tabs[i].getAttribute("rel") //store id of sub content ("rel" attr value)
				this.tabs[i].onclick=function(){
					tabinstance.expandtab(this)
					tabinstance.cancelautorun() //stop auto cycling of tabs (if running)

					return false
				}
				if (this.tabs[i].getAttribute("rev")){ //if "rev" attr defined, store each value within "rev" as an array element
					this.revcontentids=this.revcontentids.concat(this.tabs[i].getAttribute("rev").split(/\s*,\s*/))
				}
				if (selectedtabfromurl==i || this.enabletabpersistence && selectedtab==-1 && parseInt(persistedtab)==i || !this.enabletabpersistence && selectedtab==-1 && this.getselectedClassTarget(this.tabs[i]).className=="selected"){
					selectedtab=i //Selected tab index, if found
				}
			}
		} //END for loop
		if (selectedtab!=-1) //if a valid default selected tab index is found
			this.expandtab(this.tabs[selectedtab]) //expand selected tab (either from URL parameter, persistent feature, or class="selected" class)
		else //if no valid default selected index found
			this.expandtab(this.tabs[this.hottabspositions[0]]) //Just select first tab that contains a "rel" attr
		if (parseInt(this.automodeperiod)>500 && this.hottabspositions.length>1){
			this.autoruntimer=setInterval(function(){tabinstance.autorun()}, this.automodeperiod)
		}
	} //END int() function

} //END Prototype assignment



function getSpanCount(spanClass) {
	var spans;
	if (document.all) {
		spans = document.all.tags('span');
	}
	else if (document.getElementsByTagName) {
		spans = document.getElementsByTagName('span');
	}

	var found = 0;
	for (i = 0; i < spans.length; i++) {
		if (spans[i].className == spanClass) {
			//alert(spans[i].innerHTML);
			found++;
		}
	}
	return (found);
}

function checkDivIfSpanExists(divClass, spanStr) {
	var allDivs;
	if (document.all) {
		allDivs = document.all.tags('div');
	}
	else if (document.getElementsByTagName) {
		allDivs = document.getElementsByTagName('div');
	}

	for (j = 0; j < allDivs.length; j++) {
		//alert(i + " " + divClass + "   " + allDivs[i].id);
		if (allDivs[j].id == divClass) {
			if (allDivs[j].innerHTML.indexOf(spanStr) != -1) {
				//alert(allDivs[i].innerHTML);
				return (true);
			}
			else {
				return (false);
			}
		}
	}
	return (false);
}

function getLIObject(searchTxt) {
	var allLIs;
	if (document.all) {
		allLIs = document.all.tags('li');
	}
	else if (document.getElementsByTagName) {
		allLIs = document.getElementsByTagName('li');
	}

	for (i = 0; i < allLIs.length; i++) {
		if (allLIs[i].innerHTML.indexOf(searchTxt) != -1) {
			return (allLIs[i]);
		}
	}
	return (null);
}

function highlightDirtyTab(tabObj, dirtyCode, showflag) {
	var firstTab = null;
	for (var count = 0; count < tabObj.tabs.length; count++) {
		name = tabObj.tabs[count].getAttribute("rel");
		if (checkDivIfSpanExists(name, dirtyCode)) {
			if (firstTab == null) firstTab = name;
			li_elt = getLIObject(name);
			if (li_elt != null) {
				li_elt.style.backgroundColor = 'red';
				//li_elt.style.color = 'red';
				//li_elt.style.background = "url(shade.gif)";
			}
		}
		else
		{
			li_elt = getLIObject(name);
			if (li_elt != null) {
				li_elt.style.backgroundColor = '';
			}
		}
	}
	if (showflag) {
		if (firstTab != null)
			tabObj.expandit('li_'+firstTab);
	}
}

function createDivTabs(tabName, dirtyCode, showFirst) {
	var cmstabs = new ddtabcontent(tabName);
	cmstabs.setpersist(false);
	cmstabs.setselectedClassTarget("link"); //"link" or "linkparent"
	cmstabs.init();

	//highlightDirtyTab(cmstabs, dirtyCode, showFirst);	
}



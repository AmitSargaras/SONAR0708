//findElementByTagClass - exists in itgUtilities.js

//--------------------------------------------------------------------------------------
//Functions to convert collateral screens
//
var secLayout_Prefix = 'sec_layout_';

var g_allCollateralHeaders = null;
var g_validCollateralTags = null;
var g_tagUL = null;
var g_tagShift = 0;

var g_cacheOkay = false;
var g_cachedName = null;
var g_cachedTagName = 'cms_tab_tag_';
var g_cachedHeaderName = 'cms_tab_header_';
var g_cachedTabCountName = 'cms_tab_cache';
var g_cachedTabCountData = null;

var flashTabColor = "red";
var flashTabInterval = 1000; //flash interval in miliseconds (1000=1 sec)
var flashTabCollect = [];

var firstTimeTabURL = ['CollateralRedirect.do'];

var perTimerTab = true;
var cookieDebug = false;

function makeTabForCollateral(tabbed, useCached) {
var jsElement;

var elementTag = 'TABLE';
var classTag = 'tblFormSection';
var headerTag = '<h3>';
var headerEndTag = '</h3>';

var fromCookie = false;

	if (useCached == false) {
		g_tagUL = null;
	}

	if (g_tagUL == null) {
		g_tagUL = findElementByTagClass ("UL", "shadetabs", "", 0);
		//alert(g_tagUL.outerHTML);
		if (g_tagUL == null) {
			simpleLogger("makeTabForCollateral -> Not a collateral screen....");
			return (false);
		}
	}

	if (useCached == false) {
		g_validCollateralTags = null;
	}

	if (g_validCollateralTags == null) {
		if (document.all) {
			jsElement = document.all.tags(elementTag);
		} else if (document.getElementsByTagName) {
			jsElement = document.getElementsByTagName(elementTag);
		}

		//funcType = findCollateralTagClass(jsElement, 'TABLE', 'tblFormSection', 0, headerTag, ['create', 'close', 'update', 'process'], 'security details');
		//if (funcType[0] == -1) return (false);

		var secsubtype = findElementByTagClass ("TD", "fieldname", "Security Sub-type", 1);
		//alert(secsubtype);
		if (secsubtype == null) return (false);

		var sectype = findElementByTagClass ("TD", "fieldname", "Security Type", 1);
		//alert(sectype);
		if (sectype == null) return (false);

		g_cachedName = (sectype.innerHTML+"-"+secsubtype.innerHTML);

		//alert("sectype: (" + sectype.innerHTML + ")   secsubtype: " + secsubtype.innerHTML);
		simpleLogger("makeTabForCollateral -> sectype: (" + sectype.innerHTML + ")   secsubtype: (" + secsubtype.innerHTML + ")");

		if (useCached == false) {
			g_allCollateralHeaders = null;
		}

		g_validCollateralTags = getCookieValidCollateralTag(g_cachedTagName+g_cachedName); ////

		//put all <H3> text into "cache" first
		getAllCollateralTagHeader(jsElement, elementTag, classTag, headerTag, headerEndTag);
		if (g_allCollateralHeaders == null) return (false);

		////alert("g_cacheOkay: " + g_cacheOkay);

		if (g_cacheOkay == true) {
			fromCookie = true;

		} else {
			g_validCollateralTags = new Array();

			//funcType[0] = findAllCollateralTagHeader(['create', 'close', 'update', 'process'], 'security details');
			//frontLoc = (funcType[0]+1);
			frontLoc = 0;

			generalTag = 'General';
			generalLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'general', generalTag);		

			frontLoc = generalLoc + 1;
			lastLoc = frontLoc;

			vehicleSubtype = 'Specific Charge - Vehicles/Floor Stocking';
			plantSubtype = 'Specific Charge - Plant &amp; Equipment';

			if (secsubtype.innerHTML == vehicleSubtype) {
				infoTag = 'Vehicle Info';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'vehicle information', infoTag);
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, lastLoc, headerTag, 'trade in information', infoTag);

				otherTag = 'Other Vehicle Info';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, lastLoc, headerTag, 'other vehicle information', otherTag);
			}

			if (sectype.innerHTML == 'Property') {
				infoTag = 'Property Info';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'property information', infoTag);
			}

			if (sectype.innerHTML != 'No Collateral' || sectype.innerHTML != 'Insurance' || secsubtype.innerHTML != vehicleSubtype) {
				additionalTag = 'Additional Info';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'additional information', additionalTag);

				//alert("additional " + secsubtype.innerHTML + " -> " + plantSubtype);
				if (secsubtype.innerHTML == plantSubtype) {
					lastLoc = setCollateralTable (jsElement, elementTag, classTag, lastLoc, headerTag, 'trade in information', additionalTag);
				}
			}

			if (sectype.innerHTML == 'Marketable Securities') {
				portfolioTag = 'Security Details';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'security details', portfolioTag);
			}

			insuranceTag = 'Insurance';
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'insurance policies', insuranceTag);

			if (sectype.innerHTML == 'Cash') {
				depositTag = 'Deposit Info';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'deposit information', depositTag);
			}

			if (secsubtype.innerHTML == 'Post-Dated Cheques') {
				chequeTag = 'Cheque Info';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'cheque details', chequeTag);
			}

			if (secsubtype.innerHTML == 'Credit Default Swaps') {
				creditSwapTag = 'Credit Default Swaps';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'credit default swaps details', creditSwapTag);
			}

			if (secsubtype.innerHTML == 'Government - Federal Government' || secsubtype.innerHTML == 'Government - Linked (CGC)') {
				feeTag = 'Fee Details';
				lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'fee details', feeTag);
			}

			pledgorTag = 'Pledgor';
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'pledgor information', pledgorTag);
			
			pledgeTag = 'Pledge';
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'pledge information', pledgeTag);
			
			chargeTag = 'Charge Info';
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'charge information', chargeTag);

			valuationTag = 'Valuation Details';
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, frontLoc, headerTag, 'system valuation details', valuationTag);
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, lastLoc, headerTag, 'valuation details from los/source system', valuationTag);
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, lastLoc, headerTag, 'valuation details input into cms', valuationTag);
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, lastLoc, '<td', 'realisable price', valuationTag);

			remarkTag = 'Remarks';
			lastLoc = setCollateralTable (jsElement, elementTag, classTag, lastLoc, '<td', ['remarks', 'last action by'], remarkTag);
		}
	}

	//listValidCollateralTags (g_validCollateralTags);

	if (tabbed == true) {
	
		if (perTimerTab) perTimer = new Date();

/*
		var finalContent = document.body.innerHTML;
		tabItemPos = findTagByOccurrence(finalContent, ('<'+elementTag), classTag, generalLoc+1, 0);
		if (tabItemPos >= 0) {
			var tabItemUL = [];
			tabItemUL.push(finalContent.substring(0, tabItemPos-1));
			tabItemUL.push('<ul id="sec_layouts" class="shadetabs">');
			for (var tabno = 0; tabno < g_validCollateralTags.length; tabno++) {
				tabItemUL.push('<li><a href="#" id="li_' + g_validCollateralTags[tabno].liName + '" rel="' + g_validCollateralTags[tabno].liName + '">' + g_validCollateralTags[tabno].name + '</a></li>');
			}
			tabItemUL.push('</ul>');
			tabItemUL.push(finalContent.substring(tabItemPos));
			//alert("tabItemUL: " + tabItemUL);
			//finalContent = finalContent.substring(0, tabItemPos-1) + tabItemUL + finalContent.substring(tabItemPos);
			document.body.innerHTML = tabItemUL.join('');
		}
		finalContent = null;
*/

		var tabItemUL = [];
		for (var tabno = 0; tabno < g_validCollateralTags.length; tabno++) {
			tabItemUL.push('<li><a href="#" id="li_' + g_validCollateralTags[tabno].liName + '" rel="' + g_validCollateralTags[tabno].liName + '"><span>' + g_validCollateralTags[tabno].name + '</span></a></li>');
		}
		g_tagUL.innerHTML = tabItemUL.join('');

		if (perTimerTab) simpleLogger("makeTabForCollateral -> insert UL for tab items: " + (new Date()-perTimer));


		if (perTimerTab) perTimer = new Date();

		if (typeof createDivTabs == 'function')
			createDivTabs('sec_layouts', 'errormsg', true);

		//if (typeof parent.cssdropdown == 'object')
		//	cssdropdown.startchrome("topmenu");

		if (perTimerTab) simpleLogger("makeTabForCollateral -> createDivTabs: " + (new Date()-perTimer));
		////return;	////
	}

	hidingButton = setTimeout("disableAddNewRemoveButton()", 300);

	//alert("fromCookie: " + fromCookie);
	if (fromCookie == true) return (true);

	g_cachedTabCountData = getCookieTabCount(g_cachedTabCountName);
	if (g_cachedTabCountData == null) {
		g_cachedTabCountData = new Array();
		g_cachedTabCountData[g_cachedTabCountData.length] = g_cachedName;
	}
	else {
		var listOfCachedTags = getCookie(g_cachedTabCountName);
		if (listOfCachedTags.indexOf(g_cachedName+cookieArrayIndexSeperator) == -1) {
			if (g_cachedTabCountData.length == 3) {
				//alert("deleting ... " + g_cachedTabCountData[0]);
				deleteCookie(g_cachedHeaderName+g_cachedTabCountData[0]);
				deleteCookie(g_cachedTagName+g_cachedTabCountData[0]);

				g_cachedTabCountData[0] = g_cachedTabCountData[1];
				g_cachedTabCountData[1] = g_cachedTabCountData[2];
				g_cachedTabCountData[2] = g_cachedName;
			} else {
				g_cachedTabCountData[g_cachedTabCountData.length] = g_cachedName;
			}
		}
	}
	setCookieTabCount(g_cachedTabCountName, g_cachedTabCountData, 86400);

	setCookieCollateralTagHeader(g_cachedHeaderName+g_cachedName, g_allCollateralHeaders, 86400);
	//test = getCookieCollateralTagHeader(g_cachedHeaderName+g_cachedName);
	//if (test.length > 0) alert(test.length + " = " + test[0].indexID + " : " + test[0].header);

	setCookieValidCollateralTag(g_cachedTagName+g_cachedName, g_validCollateralTags, 86400);
	//test = getCookieValidCollateralTag(g_cachedTagName+g_cachedName);
	//if (test.length > 0) alert(test.length + " = " + test[0].name + " : " + test[0].liName + " = " + test[0].tableList);

	return (true);
}

function disableAddNewRemoveButton() {
var jsElement;

var elementTag = 'TABLE';

	//alert('inside disableAddNewRemoveButton g_cachedName' + g_cachedName);
	if (g_cachedName.indexOf('Cash-') == -1 
		&& g_cachedName.indexOf('Marketable Securities-') == -1 
		&& g_cachedName != 'Asset Based-Post-Dated Cheques' 
		&& g_cachedName != 'Insurance-Credit Default Swaps'
		&& g_cachedName != 'Asset Based-Specific Charge - Vehicles/Floor Stocking') {
		//alert(g_cachedName);
		return;
	}

	if (document.all) {
		jsElement = document.all.tags(elementTag);
	} else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName(elementTag);
	}

	if (document.forms[0]) {
		if (g_cachedName.indexOf('Cash-') != -1) {
			lastLoc = findValidCollateralTags('Deposit Info');
			if (lastLoc > -1) {
				if (document.forms[0].depositSubmit1) {
					realLoc = parseInt(g_validCollateralTags[lastLoc].tableList[0], 10) + parseInt(g_tagShift, 10);
					//alert(" shift: " + g_tagShift + " -> " + jsElement[realLoc].innerHTML);
					if (jsElement[realLoc].innerHTML.indexOf("There is no ") == -1) {
						document.forms[0].depositSubmit1.disabled = true;
					} else {
						//if (document.forms[0].depositRemove1)
						//	document.forms[0].depositRemove1.disabled = true;
					}
				}
			}
		} else if (g_cachedName.indexOf('Marketable Securities-') != -1) {
			lastLoc = findValidCollateralTags('Security Details');
			if (lastLoc > -1) {
				if (document.forms[0].mktsecSubmit1) {
					realLoc = parseInt(g_validCollateralTags[lastLoc].tableList[0], 10) + parseInt(g_tagShift, 10);
					//alert(" shift: " + g_tagShift + " -> " + jsElement[realLoc].innerHTML);
					if (jsElement[realLoc].innerHTML.indexOf("There is no ") == -1) {
						document.forms[0].mktsecSubmit1.disabled = true;
					} else {
						//if (document.forms[0].mktsecRemove1)
						//	document.forms[0].mktsecRemove1.disabled = true;
					}
				}
			}
		} else if (g_cachedName == 'Asset Based-Post-Dated Cheques') {
			lastLoc = findValidCollateralTags('Cheque Info');
			if (lastLoc > -1) {
				if (document.forms[0].chequeSubmit1) {
					realLoc = parseInt(g_validCollateralTags[lastLoc].tableList[0], 10) + parseInt(g_tagShift, 10);
					//alert(" shift: " + g_tagShift + " -> " + jsElement[realLoc].innerHTML);
					if (jsElement[realLoc].innerHTML.indexOf("There is no ") == -1) {
						document.forms[0].chequeSubmit1.disabled = true;
					} else {
						//if (document.forms[0].chequeRemove1)
						//	document.forms[0].chequeRemove1.disabled = true;
					}
				}
			}
		} else if (g_cachedName == 'Insurance-Credit Default Swaps') {
			lastLoc = findValidCollateralTags('Credit Default Swaps');
			if (lastLoc > -1) {
				if (document.forms[0].creditswapSubmit1) {
					realLoc = parseInt(g_validCollateralTags[lastLoc].tableList[0], 10) + parseInt(g_tagShift, 10);
					//alert(" shift: " + g_tagShift + " -> " + jsElement[realLoc].innerHTML);
					if (jsElement[realLoc].innerHTML.indexOf("There is no ") == -1) {
						document.forms[0].creditswapSubmit1.disabled = true;
					} else {
						//if (document.forms[0].creditswapRemove1)
						//	document.forms[0].creditswapRemove1.disabled = true;
					}
				}
			}
		} else if (g_cachedName == 'Asset Based-Specific Charge - Vehicles/Floor Stocking') {
			lastLoc = findValidCollateralTags('Pledgor');
			if (lastLoc > -1) {
				if (document.forms[0].pledgorSubmit1) {
					realLoc = parseInt(g_validCollateralTags[lastLoc].tableList[0], 10) + parseInt(g_tagShift, 10);
					//alert(" shift: " + g_tagShift + " -> " + jsElement[realLoc].innerHTML);
					if (jsElement[realLoc].innerHTML.indexOf("There is no ") == -1) {
						document.forms[0].pledgorSubmit1.disabled = true;
					} else {
						//if (document.forms[0].pledgorSubmit1)
						//	document.forms[0].pledgorSubmit1.disabled = true;
					}
				}
			}
		}
	}
}

function simpleLogger(logText) {
	if (typeof parent.debug == 'function') {
		parent.debug(logText);
	}
}

function listValidCollateralTags(collateralTags) {
	if (perTimerTab) simpleLogger("listValidCollateralTags");

	for (var i = 0; i < collateralTags.length; i++) {
		if (perTimerTab) simpleLogger("&nbsp;&nbsp;&nbsp;&nbsp; " + i + ": name: " + collateralTags[i].name + " LI-name: " + collateralTags[i].liName + "  tablelist: " + collateralTags[i].tableList);

		//var newTabInfo = { name: tabName, tableList:  [foundTag] };
		//collateralTags[collateralTags.length] = newTabInfo;
	}
}

function showValidCollateralTags() {
var jsElement;

	if (g_validCollateralTags == null) return;

	if (perTimerTab) perTimer = new Date();

	if (document.all) {
		jsElement = document.all.tags('TABLE');
	} else if (document.getElementsByTagName) {
		jsElement = document.getElementsByTagName('TABLE');
	}

	for (var tabno = 0; tabno < g_validCollateralTags.length; tabno++) {
		for (var i = 0; i < g_validCollateralTags[tabno].tableList.length; i++) {
			foundTag = parseInt(g_validCollateralTags[tabno].tableList[i], 10) + parseInt(g_tagShift, 10);
			jsElement[foundTag].style.display = '';
		}
	}
	
	if (perTimerTab) simpleLogger("showValidCollateralTags : " + (new Date()-perTimer));

}

function findCollateralTagClass(jsElement, elementTag, classTag, startLoc, tag1, cond1, cond2) {
	if (jsElement == null) {
		if (document.all) {
			jsElement = document.all.tags(elementTag);
		} else if (document.getElementsByTagName) {
			jsElement = document.getElementsByTagName(elementTag);
		}
	}

	//alert("findCollateralTagClass -> startLoc: " + startLoc + "  jsElement.length: " + jsElement.length + "  classTag: " + classTag);
	for (var i = startLoc; i < jsElement.length; i++) {
		//alert(i + " : " + jsElement[i].innerHTML);
	
		//if (jsElement[i].className == classTag)	//no need since some types does not have it
		{
			elementContent = jsElement[i].innerHTML.toLowerCase();
			tag1loc = elementContent.indexOf(tag1);
			//alert("tag1loc: " + tag1loc + "  tag1: " + tag1 + "  elem: " + elementContent);

			if (tag1loc >= 0) {
				cond2loc = (cond2 != '') ? elementContent.indexOf(cond2) : (tag1loc);
				//alert("cond2: (" + cond2 + ")  -> " + cond2loc + "  " + "typeof cond1: " + (typeof cond1) + "  " + elementContent);
				if (cond2loc >= 0) {
					if (typeof cond1 == 'string') {
						cond1loc = (cond1 != '') ? elementContent.indexOf(cond1) : (tag1loc+1);
						//alert("cond1: (" + cond1 + ")  -> " + cond1loc);
						matchedStr = cond1;
					} 
					else if (typeof cond1 == 'object') {
						lastcond1loc = tag1loc+1;
						notFoundCount = 0;

						matchedStr = '';
						for (var ooi = 0; ooi < cond1.length; ooi++) {
							//cond1loc = (cond1[ooi] != '') ? elementContent.indexOf(cond1[ooi]) : (lastcond1loc);
							//if (cond1loc > lastcond1loc) lastcond1loc = cond1loc;
							//if (cond1loc < 0) notFoundCount++;

							cond1loc = elementContent.indexOf(cond1[ooi]);
							//alert("cond1[" + ooi + "] : (" + cond1[ooi] + ")  -> " + cond1loc);
							if (cond1loc >= 0) {
								matchedStr = cond1[ooi];
								notFoundCount = 0;
								break;
							}
							//alert(cond1 + " " + ooi + " : " + cond1[ooi] + " --> " + cond1loc + "  " + lastcond1loc);
						}
						//cond1 must have at least 1 match, otherwise it is an invalid case
						//alert("notFoundCount: " + notFoundCount +  " " + cond1.length);
						//if (cond1loc < 0 && notFoundCount < cond1.length) cond1loc = lastcond1loc;
					}
					if (cond2 == '') cond2loc = (cond1loc+1);
					//alert("cond1loc: " + cond1loc + "  cond2loc: " + cond2loc+ "  tag1loc: " + tag1loc);
					if (cond1loc >= 0 && cond2loc > cond1loc && cond1loc > tag1loc) {
						return [i, cond1[ooi]];
						break;
					}
				}
			}
		}
	}
	return [-1, ''];
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

function findTagByOccurrence(finalContent, elementTag, classTag, count, fromLoc) {
var foundLoc;

	if (finalContent == null) return (-1);

	finalContent = finalContent.toUpperCase();	
	for (var i = 0; i <= count; i++) {
		foundLoc = finalContent.indexOf(elementTag, fromLoc);
		fromLoc = foundLoc + 1;
	}
	return (foundLoc);
}

function findValidCollateralTags(checkName) {
	if (g_validCollateralTags == null) return (-1);

	for (var i = 0; i < g_validCollateralTags.length; i++) {
		if (checkName == g_validCollateralTags[i].name) {
			return (i);
			break;
		}
	}
	return (-1);
}

function findValidCollateralSecLayoutTags(checkName) {
	if (g_validCollateralTags == null) return (-1);

	for (var i = 0; i < g_validCollateralTags.length; i++) {
		if (checkName == g_validCollateralTags[i].liName) {
			return (i);
			break;
		}
	}
	return (-1);
}

function changeValidCollateralTagName(i, newName) {
	if (g_validCollateralTags == null) return (-1);

	if (i > -1 && i < g_validCollateralTags.length) {
		g_validCollateralTags[i].name = newName;
		return (i);
	}
	return (-1);
} 

function setCollateralTable(jsElement, elementTag, classTag, lastLoc, tag1, headerName, tabName) {
	if (perTimerTab) perTimer = new Date();

	if (lastLoc < 0) lastLoc = 0;
	if (typeof headerName == 'string') {
		foundTag = -1;
		for (var i = 0; i < g_allCollateralHeaders.length; i++) {
			//if (headerName.replace(/^\s+|\s+$/g, '') == g_allCollateralHeaders[i].header) {
			if (headerName == g_allCollateralHeaders[i].header) {
				foundTag = g_allCollateralHeaders[i].indexID;
				//alert(i + ": headerName: " + headerName + " -> " + g_allCollateralHeaders[i].header);
				//alert(jsElement[foundTag].innerHTML);
				break;
			}
		}
	}
	else {
		foundTag = findCollateralTagClass (jsElement, elementTag, classTag, lastLoc, tag1, headerName, '')[0];
		//alert("remarks: " + foundTag);
	}
	////alert("setCollateralTable: " + headerName + "    found: " + foundTag + " last: " + lastLoc);

	if (foundTag != -1) {
		//jsElement[foundTag].style.display = 'none';
		existingTab = findValidCollateralTags(tabName);
		if (existingTab == -1) {
			var liTabName = secLayout_Prefix + tabName.replace(/ /g, "_");

			var newTabInfo = { name: tabName, liName: liTabName, tableList:  [foundTag] };
			g_validCollateralTags[g_validCollateralTags.length] = newTabInfo;
		} 
		else {
			var newTabInfo = g_validCollateralTags[existingTab];
			newTabInfo.tableList[newTabInfo.tableList.length] = foundTag;
			g_validCollateralTags[existingTab] = newTabInfo;
		}
	}

	if (perTimerTab) simpleLogger("&nbsp;&nbsp;&nbsp;&nbsp; setCollateralTable -> " + tabName + " " + (new Date()-perTimer));

	return (foundTag);
}


function findAllCollateralTagHeader(cond1, cond2) {

	if (typeof cond1 == 'string') {
		foundTag = -1;
		for (var i = 0; i < g_allCollateralHeaders.length; i++) {
			cond2loc = g_allCollateralHeaders[i].header.indexOf(cond2);
			if (cond2loc == -1) continue;

			cond1loc = g_allCollateralHeaders[i].header.indexOf(cond1);
			if (cond1loc == -1) continue;

			if (cond2loc > cond1loc) {
				foundTag = g_allCollateralHeaders[i].indexID;
				//alert("cond1: " + cond1 + " -> " + g_allCollateralHeaders[i].header);
				break;
			}
		}
		return (foundTag);
	}
	else if (typeof cond1 == 'object') {
		foundTag = -1;
		for (var i = 0; i < g_allCollateralHeaders.length; i++) {
			cond2loc = g_allCollateralHeaders[i].header.indexOf(cond2);
			if (cond2loc == -1) continue;

			for (var ooi = 0; ooi < cond1.length; ooi++) {
				cond1loc = g_allCollateralHeaders[i].header.indexOf(cond1[ooi]);
				if (cond1loc == -1) continue;			
				//alert("[" + cond1 + "]  " + ooi + " : " + cond1[ooi] + " --> " + g_allCollateralHeaders[i].header + " pos: " + cond1loc);
			}
			if (cond2loc > cond1loc) {
				foundTag = g_allCollateralHeaders[i].indexID;
				//alert("matched at: " + i + " for " + g_allCollateralHeaders[i].indexID);
				break;
			}
		}
		return (foundTag);
	}

}

function getAllCollateralTagHeader(jsElement, elementTag, classTag, headerTag, headerEndTag) {
	if (perTimerTab) perTimer = new Date();

	if (jsElement == null) {
		if (document.all) {
			jsElement = document.all.tags(elementTag);
		} else if (document.getElementsByTagName) {
			jsElement = document.getElementsByTagName(elementTag);
		}
	}

	g_allCollateralHeaders = getCookieCollateralTagHeader(g_cachedHeaderName+g_cachedName);	////
	if (g_allCollateralHeaders != null) {
		if (g_allCollateralHeaders.length > 0) {
			try {
				g_cacheOkay = false;
				startloc = parseInt(g_allCollateralHeaders[0].indexID);
				endloc = ((startloc+10) >= jsElement.length) ? jsElement.length : (startloc+10);
				for (var i = startloc; i < endloc; i++) {
					//alert(i + " : " + g_allCollateralHeaders[0].header + " -> " + jsElement[i].innerHTML);

					if (jsElement[i].innerHTML.toLowerCase().indexOf(g_allCollateralHeaders[0].header) >= 0) {
						////alert(i + " : " + g_allCollateralHeaders[0].indexID + " : " + g_allCollateralHeaders[0].header + " -> " + jsElement[i].innerHTML);
						g_tagShift = (i - g_allCollateralHeaders[0].indexID);
						lastTagIndex = g_validCollateralTags.length - 1;
						lastTableList = (g_validCollateralTags[lastTagIndex].tableList.length > 1) ? (g_validCollateralTags[lastTagIndex].tableList.length-1) : 0;
						finalID = parseInt(g_validCollateralTags[lastTagIndex].tableList[lastTableList], 10) + parseInt(g_tagShift, 10);

						if (g_cachedName.indexOf('Property') == 0)
							lastHeader = g_allCollateralHeaders.length - 2;
						else
							lastHeader = g_allCollateralHeaders.length - 1;

						if (jsElement[finalID].innerHTML.toLowerCase().indexOf(g_allCollateralHeaders[lastHeader].header) != -1) {
							//for maker
							////alert("Found 1 @ lastTableList: " + lastTableList + " -> tableList: " + g_validCollateralTags[lastTagIndex].tableList[lastTableList] + " -> indexID: " + g_allCollateralHeaders[lastHeader].indexID + " g_tagShift: " + g_tagShift);
							////alert(jsElement[g_validCollateralTags[lastTagIndex].tableList[lastTableList]].innerHTML + " -> " + g_allCollateralHeaders[lastHeader].header);

							//alert(jsElement[finalID].innerHTML + " -> " + g_validCollateralTags[lastTagIndex].name);
							/*
							if (jsElement[finalID].innerHTML.indexOf(g_validCollateralTags[lastTagIndex].name) != -1) {
								////alert(g_validCollateralTags[lastTagIndex].name + " -> " + jsElement[g_validCollateralTags[lastTagIndex].tableList[lastTableList]].innerHTML);
								g_cacheOkay = true;
							} else {
								g_cacheOkay = false;
							}
							*/
							g_cacheOkay = true;
							break;
						} else if (jsElement[finalID].innerHTML.indexOf(g_validCollateralTags[lastTagIndex].name) != -1) {
							//for checker
							////alert("Found 2 @ lastTableList: " + lastTableList + " -> " + g_validCollateralTags[lastTagIndex].tableList[lastTableList] + " -> " + g_allCollateralHeaders[lastHeader].indexID + " g_tagShift: " + g_tagShift);
							g_cacheOkay = true;
							break;
						} else {
							////alert("Not found @ lastTableList: " + lastTableList + " -> " + g_validCollateralTags[lastTagIndex].tableList[lastTableList] + " -> " + g_allCollateralHeaders[lastHeader].indexID + " g_tagShift: " + g_tagShift);

							g_cacheOkay = false;
							break;
						}
					}
				}
			} catch (err) { 
				////alert(err.message);
				g_cacheOkay = false;
			}

			////g_cacheOkay = false;	////set this is false will force cache NOT to be used
			//alert("g_cacheOkay: " + g_cacheOkay);	////

			if (g_cacheOkay == false) {
				g_tagShift = 0;
				g_allCollateralHeaders = null;
			}
		}
	}

	if (g_allCollateralHeaders == null) {
		g_allCollateralHeaders = new Array();

		for (var i = 0; i < jsElement.length; i++) {
			if (jsElement[i].className == classTag) {
				elementContent = jsElement[i].innerHTML.toLowerCase();
				startloc = elementContent.indexOf(headerTag);
				if (startloc >= 0) {
					endloc = elementContent.indexOf(headerEndTag);
					if (endloc >= 0) {
						headerText = elementContent.substring(startloc+4, endloc).replace(/^\s+|\s+$/g, '');
						//if (headerText != '&nbsp;' && headerText.indexOf('create')<0 && headerText.indexOf('close')<0 && headerText.indexOf('update')<0 && headerText.indexOf('process')<0) {
						if (headerText != '&nbsp;') {
							//alert("i: " + i + " -> (" + headerText + ")");
							var newHeaderInfo = { indexID: i, header:  headerText };
							g_allCollateralHeaders[g_allCollateralHeaders.length] = newHeaderInfo;
						}
					}
				} else {
					startloc = elementContent.indexOf('realisable price');
					if (startloc >= 0) {
						var newHeaderInfo = { indexID: i, header:  'realisable price' };
						g_allCollateralHeaders[g_allCollateralHeaders.length] = newHeaderInfo;				
					}
				}
			}
		}
	}

	if (perTimerTab) simpleLogger("getAllCollateralTagHeader -> "+ (new Date()-perTimer));

}

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
		this.expandsubcontent(subcontentid)
		for (var i=0; i<this.tabs.length; i++) { //Loop through all tabs, and assign only the selected tab the CSS class "selected"
			this.getselectedClassTarget(this.tabs[i]).className=(this.tabs[i].getAttribute("rel")==subcontentid)? "selected" : ""
		}
		if (this.enabletabpersistence) //if persistence enabled, save selected tab position(int) relative to its peers
			ddtabcontent.setCookie(this.tabinterfaceid, tabref.tabposition)

		this.setcurrenttabindex(tabref.tabposition) //remember position of selected tab within hottabspositions[] array
	},

	expandsubcontent:function(subcontentid){
		var jsElement;

		if (document.all) {
			jsElement = document.all.tags('TABLE');
		} else if (document.getElementsByTagName) {
			jsElement = document.getElementsByTagName('TABLE');
		}

		for (var tabno = 0; tabno < g_validCollateralTags.length; tabno++) {
			for (var i = 0; i < g_validCollateralTags[tabno].tableList.length; i++) {
				foundTag = parseInt(g_validCollateralTags[tabno].tableList[i], 10) + parseInt(g_tagShift, 10);
				//"show" or hide sub content based on matching id attr value
				//Firebox is unable to support "block"
				jsElement[foundTag].style.display = (g_validCollateralTags[tabno].liName == subcontentid) ? "" : "none";
			}
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
					return false
				}
				if (selectedtabfromurl==i || this.enabletabpersistence && selectedtab==-1 && parseInt(persistedtab)==i || !this.enabletabpersistence && selectedtab==-1 && this.getselectedClassTarget(this.tabs[i]).className=="selected"){
					selectedtab=i //Selected tab index, if found
					
					currentURL = window.location.href.toLowerCase();
					if (firstTimeTabURL.length > 0) {
						for (var k = 0; k < firstTimeTabURL.length; k++) {
							//alert(k + " : " + firstTimeTabURL[k] + " -> " + currentURL);
							if (currentURL.indexOf(firstTimeTabURL[k].toLowerCase()) != -1) {
								selectedtab = -1;
								break;
							}
						}
					}
				}
			}
		} //END for loop
		if (selectedtab!=-1) //if a valid default selected tab index is found
			this.expandtab(this.tabs[selectedtab]) //expand selected tab (either from URL parameter, persistent feature, or class="selected" class)
		else //if no valid default selected index found
			this.expandtab(this.tabs[this.hottabspositions[0]]) //Just select first tab that contains a "rel" attr
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

function checkTableIfSpanExists(divClass, spanStr) {
	var allDivs;
	if (document.all) {
		allDivs = document.all.tags('TABLE');
	}
	else if (document.getElementsByTagName) {
		allDivs = document.getElementsByTagName('TABLE');
	}

	tabno = findValidCollateralSecLayoutTags(divClass);
	//alert("tabno: " + tabno + " " + divClass);
	if (tabno < 0) return (false);

	for (var i = 0; i < g_validCollateralTags[tabno].tableList.length; i++) {
		foundTag = parseInt(g_validCollateralTags[tabno].tableList[i], 10) + parseInt(g_tagShift, 10);
		if (allDivs[foundTag].innerHTML.indexOf(spanStr) != -1) {
			//alert("found: " + foundTag + " -> " + spanStr + " -> " + allDivs[foundTag].innerHTML);
			return (true);
		}
		else {
			return (false);
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
	if (tabObj.tabs == null) return;
	for (var count = 0; count < tabObj.tabs.length; count++) {
		name = tabObj.tabs[count].getAttribute("rel");

		if (checkTableIfSpanExists(name, dirtyCode)) {
			if (firstTab == null) firstTab = findValidCollateralSecLayoutTags(name);
			li_elt = getLIObject(name);
			if (li_elt != null) {
				tabObj.tabs[count].style.backgroundColor = flashTabColor;
				flashTabCollect[flashTabCollect.length] = tabObj.tabs[count];

				//li_elt.style.backgroundColor = flashTabColor;
				//li_elt.style.color = 'red';
				//alert(name + " : " + count + " -> " + tabObj.tabs[count] + " -> " + firstTab);
			}
		}
		else {
		/*
			li_elt = getLIObject(name);
			if (li_elt != null) {
				//tabObj.tabs[count].style.color = flashTabColor;
				li_elt.style.backgroundColor = '';
			}
		*/
		}
	}
	if (showflag) {
		if (firstTab != null) {
			tabObj.expandtab(tabObj.tabs[firstTab]);
		}
	}
}

var cookieArrayItemSeperator = "^";
var cookieArrayIndexSeperator = "#";

function getCookieCollateralTagHeader(name) {
	var ent = getCookie(name);
	if (ent) {
		if (cookieDebug) simpleLogger("getCookieCollateralTagHeader -> " + name);

		ary = new Array();
		while (ent.indexOf(cookieArrayIndexSeperator) != -1) {
			dataPos = ent.indexOf(cookieArrayIndexSeperator);
			dataInfo = ent.substring(0, dataPos);

			itemPos = dataInfo.indexOf(cookieArrayItemSeperator);
			id = dataInfo.substring(0, itemPos);
			headerText = dataInfo.substring(itemPos+1, 9999);

			if (cookieDebug) simpleLogger("&nbsp;&nbsp;&nbsp;&nbsp; " + ary.length + ": indexID: " + id + " -> headerText: " + headerText);

			var newHeaderInfo = { indexID: id, header:  headerText };
			ary[ary.length] = newHeaderInfo;

			ent = ent.substring(dataPos+1, ent.length);
		}
		return (ary);
	}
	return (null);
}

function setCookieCollateralTagHeader(name, ary, expires) {
	var value = '';

	for (var i = 0; i < ary.length; i++) {
		value += ary[i].indexID + cookieArrayItemSeperator;
		value += ary[i].header + cookieArrayIndexSeperator;
	}
	setCookie(name, value, expires);

	//if (cookieDebug) simpleLogger("setCookieCollateralTagHeader: (" + name + " -> " + value + ")");
}

function getCookieValidCollateralTag(name) {
	var ent = getCookie(name);
	if (ent) {
		if (cookieDebug) simpleLogger("getCookieValidCollateralTag -> " + name);

		ary = new Array();
		while (ent.indexOf(cookieArrayIndexSeperator) != -1) {
			dataPos = ent.indexOf(cookieArrayIndexSeperator);

			dataInfo = ent.substring(0, dataPos);
			itemPos = dataInfo.indexOf(cookieArrayItemSeperator);
			tabName = dataInfo.substring(0, itemPos);

			dataInfo = dataInfo.substring(itemPos+1, 9999);
			itemPos = dataInfo.indexOf(cookieArrayItemSeperator);
			liTabName = dataInfo.substring(0, itemPos);

			dataInfo = dataInfo.substring(itemPos+1, 9999);
			dataTableList = [];
			while (dataInfo.indexOf(cookieArrayItemSeperator) != -1) {
				listPos = dataInfo.indexOf(cookieArrayItemSeperator);
				dataTableList[dataTableList.length] = dataInfo.substring(0, listPos);

				dataInfo = dataInfo.substring(listPos+1, dataInfo.length);
			}

			if (cookieDebug) simpleLogger("&nbsp;&nbsp;&nbsp;&nbsp; " + ary.length + ": name: " + tabName + " -> liName: " + liTabName + " -> tableList: [" + dataTableList + "]");

			var newTabInfo = { name: tabName, liName: liTabName, tableList: dataTableList };
			ary[ary.length] = newTabInfo;

			ent = ent.substring(dataPos+1, ent.length);
		}
		return (ary);
	}
	return (null);
}

function setCookieValidCollateralTag(name, ary, expires) {
	var value = '';

	for (var i = 0; i < ary.length; i++) {
		value += ary[i].name + cookieArrayItemSeperator;
		value += ary[i].liName + cookieArrayItemSeperator;
		for (var tabno = 0; tabno < ary[i].tableList.length; tabno++) {
			value += ary[i].tableList[tabno] + cookieArrayItemSeperator;
		}		
		value += cookieArrayIndexSeperator;
	}
	setCookie(name, value, expires);

	//if (cookieDebug) simpleLogger("setCookieValidCollateralTag: (" + name + " -> " + value + ")");
}

function getCookieTabCount(name) {
	var ent;
	if (typeof getCookie == 'function') {
		ent = getCookie(name);
	} else if (typeof parent.getCookie == 'function') {
		ent = parent.getCookie(name);
	}

	if (ent) {
		if (cookieDebug) simpleLogger("getCookieTabCount -> " + name);

		ary = new Array();
		while (ent.indexOf(cookieArrayIndexSeperator) != -1) {
			dataPos = ent.indexOf(cookieArrayIndexSeperator);
			nameText = ent.substring(0, dataPos);

			if (cookieDebug) simpleLogger("&nbsp;&nbsp;&nbsp;&nbsp; " + ary.length + ": name: " + nameText);

			ary[ary.length] = nameText;
			ent = ent.substring(dataPos+1, ent.length);
		}
		return (ary);
	}
	return (null);
}

function setCookieTabCount(name, ary, expires) {
	var value = '';

	for (var i = 0; i < ary.length; i++) {
		value += ary[i] + cookieArrayIndexSeperator;
	}
	setCookie(name, value, expires);

}

function flashTabElements() {
	for (var f=0; f < flashTabCollect.length; f++) {
		flashTabCollect[f].style.backgroundColor = (flashTabCollect[f].style.backgroundColor == '') ? flashTabColor : '';
	}
}

function createDivTabs(tabName, dirtyCode, showFirst) {

	var cmstabs = new ddtabcontent(tabName);
	cmstabs.setpersist(true);
	cmstabs.setselectedClassTarget("link"); //"link" or "linkparent"
	cmstabs.init();

	highlightDirtyTab(cmstabs, dirtyCode, showFirst);
	
	if (flashTabCollect.length > 0) {
		setInterval("flashTabElements()", flashTabInterval);
	}
}


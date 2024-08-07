function compareTwoDates(fromdate,todate) {
      fromdatestr = changeDateFormat(fromdate);
      todatestr = changeDateFormat(todate);
      if(isValidDate(fromdatestr) && isValidDate(todatestr)) {
          fromdate1 = new Date(fromdatestr);
          todate2 = new Date(todatestr);
          if(fromdate1.getTime() > todate2.getTime()) {
            return true;
          }
          else {
            return false;
          }
      }
}


function changeDateFormat(dateval) {
    var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/; // requires 4 digit year
    var matchArray = dateval.match(datePat); // is the format ok?
    if (matchArray == null) {
    alert(dateval + " Date is not in a valid format.")
    return false;
    }
    day = matchArray[1]; // parse date into variables
    month = matchArray[3];
    year = matchArray[4];
    finaldateval = month+"/"+day+"/"+year;
    return finaldateval;
}

function isValidDate(dateStr) {

// Checks for the following valid date formats:
// MM/DD/YY   MM/DD/YYYY   MM-DD-YY   MM-DD-YYYY

var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/; // requires 4 digit year

var matchArray = dateStr.match(datePat); // is the format ok?
if (matchArray == null) {
alert(dateStr + " Date is not in a valid format.")
return false;
}
month = matchArray[1]; // parse date into variables
day = matchArray[3];
year = matchArray[4];
if (month < 1 || month > 12) { // check month range
//alert("Month must be between 1 and 12.");
return false;
}
if (day < 1 || day > 31) {
//alert("Day must be between 1 and 31.");
return false;
}
if ((month==4 || month==6 || month==9 || month==11) && day==31) {
//alert("Month "+month+" doesn't have 31 days!")
return false;
}
if (month == 2) { // check for february 29th
var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
if (day>29 || (day==29 && !isleap)) {
//alert("February " + year + " doesn't have " + day + " days!");
return false;
   }
}
return true;
}


function removeErrorMsg(myObj) {
  if(document.all) {
	var oSpan = myObj.parentNode.lastChild;
	if(oSpan.id=="spanError" && (typeof(oSpan.id) != "undefined")) {
		var oBr = oSpan.previousSibling;
		oSpan.removeNode(true);
		if(oBr.id=="spaceError" && (typeof(oBr.id) != "undefined")) oBr.removeNode(true);
	}
  } else {
	var oSpan1= myObj.parentNode.lastChild;
	var oBr1 = oSpan1.previousSibling;
	if(oSpan1.id=="spanError" ){
		myObj.removeAdjacentElement(oSpan1);
		myObj.removeAdjacentElement(oBr1);
	}
  }
}


function displayErrorMsg(myObj,myErr) {
    if(document.all) {
        //alert("add node");
        var oErr = document.createElement('<span class="txtError" id="spanError"></span>');
        var oBr = document.createElement("<br id='spaceError'>");
        oErr.innerText = myErr;
        myObj.parentNode.insertAdjacentElement("BeforeEnd",oBr);
        oBr.insertAdjacentElement("AfterEnd",oErr);
        return oErr.innerText;
    } else {
        var oErr = document.createElement("SPAN");
        var oBr = document.createElement("br");
        oErr.setAttribute("class","txtError");
        oErr.id="spanError"; oBr.id="spaceError";
        var oTxtNode = document.createTextNode(myErr);
        oErr.appendChild(oTxtNode);
        myObj.parentNode.insertAdjacentElement("beforeEnd",oBr);
        oBr.insertAdjacentElement("afterEnd",oErr);
        return oTxtNode.data;
    }
}

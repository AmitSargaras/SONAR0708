// This function is to check all the checkboxes, i.e. the array for checkObj
// @param selectedObj is the checkbox to check to indicate whether to check all the checkboxes
// @param checkObj are all the checkboxes field that need to update, either check all or uncheck all
function updateAllCheckbox(selectedObj, checkObj) {
    var updateObj = checkObj
    var checkedValue = selectedObj.checked;

    if (!updateObj.length) {
        updateObj.checked = checkedValue;
    } else {
    	for (i = 0; i < updateObj.length; i++) {
        	updateObj[i].checked = checkedValue;
    	}
	}
}

function selectAllMultipleOptions() {	
	var selects = document.forms[0].getElementsByTagName('select');
	for (var j = 0; j < selects.length; j++) {
		if (selects[j].multiple) {
			var inputs = selects[j].options;
		
			for (var i = 0; i < inputs.length; i++) {
				inputs[i].selected = true;
			}			
		}
	}
}

function disableAllFormElements()
{    
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = true;
	}	
}


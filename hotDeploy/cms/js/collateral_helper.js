function submitData(num, id, appType, colType) {
	enableAllFormElements();
	if (num == 10) {
		document.forms[0].event.value="search_pledgor_prepare";
	}
	else if (num == 11) {
		document.forms[0].event.value="remove_pledgor";
	}
	else if (num == 12) {
		if (appType == 'HP' && colType == 'AB' &&
				document.forms[0].deletePledge != null ) {
			var answer = confirm('This collateral has already linked to a facility. Do you want to continue?');
			if (!answer) return;
		}
		document.forms[0].event.value="add_pledge_prepare";
	}
	else if (num == 13) {
		document.forms[0].event.value="remove_pledge";
	}
	else if (num == 14) {
		document.forms[0].event.value="edit_pledge_prepare";
		document.forms[0].limitId.value=id;
		
	}
    else if (num == 15) {
        document.forms[0].event.value="edit_pledgor_prepare";
		document.forms[0].index.value=id;
    }
    document.forms[0].submit();
}
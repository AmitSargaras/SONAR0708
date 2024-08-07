
function submitPage(num) {
    if (num == 1) {
    	document.forms[0].event.value="approve";
    }
	else if (num == 2) {
    	document.forms[0].event.value="reject";
    }
    document.forms[0].submit();

}


function sbmPage(num, id) {
	if (num == 3) {
    	document.forms[0].event.value="view_pledge";
    	document.forms[0].helperId.value=id;
    }
    document.forms[0].submit();

}
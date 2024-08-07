<%@page import="com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<script language="JavaScript" type="text/JavaScript">

function removeExpense() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'check1') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check1') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    temp = temp + "," + formObj.check1[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check1') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    temp = temp + "," + formObj.check1.value;
                }
            }
        }
    }

    if (!checkIncome()) {
        alert('You may remove item(s) from one section at one time. Please un-check all remove selections from one section to proceed.');
        return false;
    }

    if (temp == "") {
        alert('Please select Expense items to remove');
        return false;
    }
    temp = temp.substring(1);
    formObj.removeIndex.value = temp;
    //alert('remove index'+temp);
    document.forms[0].removeIndex.value = temp;
    document.forms[0].event.value = "<%=LiquidationAction.EV_REMOVE_RECOVERY_EXPENSE%>";
    document.forms[0].submit();
}

function checkExpense() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "$";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'check1') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check1') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID[j].value);
                    temp = temp + "," + formObj.check1[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check1') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.check1.value;
                }
            }
        }
    }
    //alert(temp);
    if (temp == "$") {
        return true;
    }
    return false;
}

function checkRecovery() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "$";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'check3') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check3') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID[j].value);
                    temp = temp + "," + formObj.check3[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check3') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.check3.value;
                }
            }
        }
    }
    //alert(temp);
    if (temp == "$") {
        return true;
    }
    return false;
}

function checkIncome() {
        var formObj = document.forms[0];
        var k = 0;
        var temp = "$";
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check2') {
                k++;
            }
        }
        j = 0;
        if (k > 1) {
            for (var i = 0; i < formObj.elements.length; i++) {
                var type = formObj.elements[i].type;
                var name = formObj.elements[i].name;
                if (type == 'checkbox' && name == 'check2') {
                    var obj = formObj.elements[i];
                    if (obj.checked) {
                        //				alert(formObj.removeID[j].value);
                        temp = temp + "," + formObj.check2[j].value;
                    }
                    j++;
                }
            }
        } else {
            for (var i = 0; i < formObj.elements.length; i++) {
                var type = formObj.elements[i].type;
                var name = formObj.elements[i].name;
                if (type == 'checkbox' && name == 'check2') {
                    var obj = formObj.elements[i];
                    if (obj.checked) {
                        //				alert(formObj.removeID.value);
                        temp = temp + "," + formObj.check2.value;
                    }
                }
            }
        }
        //alert(temp);
        if (temp == "$") {
            return true;
        }
        return false;

    }

function removeIncome() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'check2') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check2') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    temp = temp + "," + formObj.check2[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check2') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    temp = temp + "," + formObj.check2.value;
                }
            }
        }
    }

    if (!checkExpense()) {
        alert('You may remove document(s) from one section at one time. Please un-check all remove selections from one section to proceed.');
        return false;
    }

    if (temp == "") {
        alert('Please select Income items to remove');
        return false;
    }
    temp = temp.substring(1);
    formObj.removeIndex.value = temp;
    //alert('remove index'+temp);
    document.forms[0].removeIndex.value = temp;
    document.forms[0].event.value = "<%=LiquidationAction.EV_REMOVE_RECOVERY_INCOME%>";
    document.forms[0].submit();
}

function addIncome() {
        if (checkExpense() == true && checkIncome() == true) {
            document.forms[0].event.value = "<%=LiquidationAction.EV_PREPARE_ADD_RECOVERY_INCOME%>";
            document.forms[0].submit();
        } else {
            alert('Please remove Expense/Income items before adding new Income/ Expense items');
        }

    }

function addRecovery() {
        if (checkExpense() == true && checkRecovery() == true && checkIncome() == true) {
            document.forms[0].event.value = "<%=LiquidationAction.EV_PREPARE_ADD_RECOVERY%>";
            document.forms[0].submit();
        } else {
            alert('Please remove Expense/ Income/ Recovery items before adding new Income/ Expense/ Recovery items');
        }

    }

function removeRecovery() {
        var formObj = document.forms[0];
        var k = 0;
        var temp = "";
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check3') {
                k++;
            }
        }
        j = 0;
        if (k > 1) {
            for (var i = 0; i < formObj.elements.length; i++) {
                var type = formObj.elements[i].type;
                var name = formObj.elements[i].name;
                if (type == 'checkbox' && name == 'check3') {
                    var obj = formObj.elements[i];
                    if (obj.checked) {
                        temp = temp + "," + formObj.check3[j].value;
                    }
                    j++;
                }
            }
        } else {
            for (var i = 0; i < formObj.elements.length; i++) {
                var type = formObj.elements[i].type;
                var name = formObj.elements[i].name;
                if (type == 'checkbox' && name == 'check3') {
                    var obj = formObj.elements[i];
                    if (obj.checked) {
                        temp = temp + "," + formObj.check3.value;
                    }
                }
            }
        }

        if (!checkExpense()) {
            alert('You may remove document(s) from one section at one time. Please un-check all remove selections from one section to proceed.');
            return false;
        }

        if (temp == "") {
            alert('Please select Recovery items to remove');
            return false;
        }
        temp = temp.substring(1);
        formObj.removeIndex.value = temp;
        //alert('remove index'+temp);
        document.forms[0].removeIndex.value = temp;
        document.forms[0].event.value = "<%=LiquidationAction.EV_REMOVE_RECOVERY%>";
        document.forms[0].submit();
    }

function addExpense() {
        if (checkIncome() == true && checkExpense() == true) {
            document.forms[0].event.value = "<%=LiquidationAction.EV_PREPARE_ADD_RECOVERY_EXPENSE%>";
            document.forms[0].submit();
        } else {
            alert('Please remove Income/Expense items before adding new Expense/ Income items');
        }

    }
</script>
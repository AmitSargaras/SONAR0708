<%--Beatified and formatted by jj--%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.*,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.common.constant.PropertiesConstantHelper,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 java.util.*" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% ICheckListTrxValue checkListTrxVal = (ICheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.cc.CCCheckListAction.checkListTrxVal");
    ICheckList checkList = (ICheckList) session.getAttribute("com.integrosys.cms.ui.checklist.cc.CCCheckListAction.checkList");
    ICheckList actualCheckList = null;
    ICheckListItem[] actualItems = null;
    if (checkListTrxVal != null) {
        actualCheckList = checkListTrxVal.getCheckList();
        if (actualCheckList != null) {
            actualItems = actualCheckList.getCheckListItemList();
        }
    }

    String remarks = "";
    String lastActionBy = "";
    if (checkList != null)
        pageContext.setAttribute("checkList", checkList);
    int row = 0;
    int index = 0;
    int countDeletable = 0;            //for the select all checkbox for delete

    String status = "";
    if (checkListTrxVal != null) {
        status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }
    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";

    String cCode = "";
    String cName = "";
    if (cName.equals("")) {
        CCCheckListForm aForm = (CCCheckListForm) request.getAttribute("CCCheckListForm");
        cName = aForm.getLimitBkgLoc();
        if (cName == null || cName.trim().length() == 0) {
            cName = (String) request.getAttribute("limitBkgLoc");
        }
        cName = CountryList.getInstance().getCountryName(cName);
    }

    ICheckListItem[] checkListItems = checkList.getCheckListItemList();
    //this block gets the list of parents to be used for hiding the delete checkbox
    ArrayList parentList = new ArrayList();
    for (int i = 0; i < checkListItems.length; i++) {
        long itemRefLong = checkListItems[i].getParentCheckListItemRef();
        String itemRef = String.valueOf(itemRefLong);
        if (itemRef != null && !itemRef.equals("0")
                && !itemRef.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))
                && !parentList.contains((String) itemRef)) {

            parentList.add(itemRef); //adds to the list of parents
        }
    }

    String checkListIDStr = "";
    if (actualCheckList != null) {
        checkListIDStr = String.valueOf(actualCheckList.getCheckListID());
    }


%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->

<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" src="js/validation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
    var i,x,a = document.MM_sr;
    for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
}

function MM_preloadImages() { //v3.0
    var d = document;
    if (d.images) {
        if (!d.MM_p) d.MM_p = new Array();
        var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
        for (i = 0; i < a.length; i++)
            if (a[i].indexOf("#") != 0) {
                d.MM_p[j] = new Image;
                d.MM_p[j++].src = a[i];
            }
    }
}

function MM_findObj(n, d) { //v4.01
    var p,i,x;
    if (!d) d = document;
    if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
        d = parent.frames[n.substring(p + 1)].document;
        n = n.substring(0, p);
    }
    if (!(x = d[n]) && d.all) x = d.all[n];
    for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
    for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
    if (!x && d.getElementById) x = d.getElementById(n);
    return x;
}

function MM_swapImage() { //v3.0
    var i,j = 0,x,a = MM_swapImage.arguments;
    document.MM_sr = new Array;
    for (i = 0; i < (a.length - 2); i += 3)
        if ((x = MM_findObj(a[i])) != null) {
            document.MM_sr[j++] = x;
            if (!x.oSrc) x.oSrc = x.src;
            x.src = a[i + 2];
        }
}


function refreshContent() {
    window.location = "CCDocTemp(sscmaker,cty=hk).htm";
    //parent.location=".htm";
}

function gotopage(aLocation) {
    window.location = aLocation;
}

function MM_jumpMenu(targ, selObj, restore) { //v3.0
    eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
    if (restore) selObj.selectedIndex = 0;
}

function addNew() {

        formCheck1();
        formCheck2();
 //        formCheck3();
        formCheck4();
        document.forms[0].event.value = "add_template_list";
        document.forms[0].submit();
}


function create() {
    document.forms[0].event.value = "create_item";
    document.forms[0].submit();
}


function formCheck1() {
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
    //    alert('j'+j);
    temp = temp.substring(1);
    //    alert(temp);
    formObj.mandatoryRows.value = temp;
}

function formCheck2() {
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
    //    alert('j'+j);
    temp = temp.substring(1);
    //    alert(temp);
    formObj.checkedInVault.value = temp;
}

function formCheck3() {
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
    //    alert('j'+j);
    temp = temp.substring(1);
    //    alert(temp);
    formObj.checkedExtCustodian.value = temp;
}
function formCheck4() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'check4') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check4') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID[j].value);
                    temp = temp + "," + formObj.check4[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check4') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.check4.value;
                }
            }
        }
    }
    //    alert('j'+j);
    temp = temp.substring(1);
    //    alert(temp);
    formObj.checkedAudit.value = temp;
}

function submitForm() {
        formCheck1();
        formCheck2();
    //     formCheck3();
        formCheck4();
    <% if(ICMSConstant.STATE_REJECTED.equals(status)){ %>
        document.forms[0].event.value = "update";
    <% } else {%>
        document.forms[0].event.value = "submit";
    <% } %>
        document.forms[0].submit();
}

function checkMutEx() {
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
                    //				alert(formObj.removeID[j].value);
                    if (formObj.check3[j].checked) {
                        alert('InVault and External Custodian are Mutually Exclusive');
                        return false;
                    }
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
                    if (formObj.check3.checked) {
                         alert('InVault and External Custodian are Mutually Exclusive');
                        return false;
                    }
                }
            }
        }
    }
    return true;

}


function remove() {

    formCheck1();
    formCheck2();
 //    formCheck3();
    formCheck4();

    var formObj = document.forms[0];
    var k = 0;
    var temp = "";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'check5') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check5') {
                var obj = formObj.elements[i];
                if ((obj.checked)) {           //updated: changed from "Delete" to "Required"
                    //therefore instead of if(obj.checked), its if(!(obj.checked))
                    //				alert("here: " + formObj.removeID[j].value);
                    temp = temp + "," + formObj.check5[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check5') {
                var obj = formObj.elements[i];
                if ((obj.checked)) {       //updated: changed from "Delete" to "Required"
                    //therefore instead of if(obj.checked), its if(!(obj.checked))
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.check5.value;
                }
            }
        }
    }
    //    alert('j'+j);
    if (temp == "") {
        alert('There are no records to remove!');
        return false;
    }
    temp = temp.substring(1);
    formObj.event.value = "remove_item";
    formObj.removeIndex.value = temp;
    formObj.submit();
}

function add(index) {
        formCheck1();
        formCheck2();
   //      formCheck3();
        formCheck4();
        document.forms[0].event.value = "copy_item";
        document.forms[0].index.value = index;
        document.forms[0].submit();
}

function link(index) {
    formObj = document.forms["CCCheckListForm"];
    formObj.event.value = "link_item";
    formObj.index.value = index;
    formObj.submit();
}

function replace(index) {
    formObj = document.forms["CCCheckListForm"];
    formObj.event.value = "replace_item";
    formObj.index.value = index;
    formObj.submit();
}

function perform(selObj, rowNum){
    temp = selObj.options[selObj.selectedIndex].value;
    if (temp == "") {
        return false;
    } else {
        if (temp == "add") {
            add(rowNum);
        }else if (temp == "link") {
            link(rowNum);
        } else if (temp == "replace") {
            replace(rowNum);
        } else {
            return false;
        }
    }
}

function checkAll() {
    var formObj = document.forms[0];
    var count = formObj.check5.length;
    //checkbox.length returns "undefine" if its anything less than 2
    if (count > 1) {
        if (formObj.selectAll.checked) {
            for (var i = 0; i < count; i++) {
                formObj.check5[i].checked = true;
            }
        } else {
            for (var i = 0; i < count; i++) {
                formObj.check5[i].checked = false;
            }
        }
    } else {
        if (formObj.selectAll.checked) {
            formObj.check5.checked = true;
        } else {
            formObj.check5.checked = false;
        }
    }
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCCheckList">
<input type="hidden" name="event"/>
    <%-- for check boxes--%>
<input type="hidden" name="mandatoryRows"/>
<input type="hidden" name="checkedInVault"/>
<input type="hidden" name="checkedExtCustodian"/>
<input type="hidden" name="checkedAudit"/>

<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index"/>

<html:hidden property="limitProfileID"/>
<html:hidden property="legalID"/>
<html:hidden property="custCategory"/>
<html:hidden property="limitBkgLoc"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td><h3>Constitutional / Contractual Checklist</h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <%
        ICheckListOwner owner = checkList.getCheckListOwner();
        if (owner instanceof ICCCheckListOwner) {
            ICCCheckListOwner ccowner = (ICCCheckListOwner) owner;
            //boolean isSubOwnerType = ICMSConstant.CHECKLIST_PLEDGER.equals(ccowner.getSubOwnerType());             
            boolean isSubOwnerType = false;

            String categoryLabel = PropertyManager.getValue("cc.category." + ccowner.getSubOwnerType());
            categoryLabel = (categoryLabel == null) ? ccowner.getSubOwnerType() : categoryLabel;

    %> <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        </thead>
        <tbody>
            <tr class="odd">
                <td class="fieldname">Customer Category</td>
                <td colspan="3"><%=categoryLabel%></td>
            </tr>
            <tr class="even">
                <td class="fieldname">CIF</td>
                <td>
                    <% if (ccowner.getLegalReference() != null) {
                    %>              <%= ccowner.getLegalReference()%>
                    <% } else {
                    %>              -
                    <% }%>
                </td>
            </tr>
            <tr class="odd">
                <td class="fieldname">Customer Name</td>
                <td><%= ccowner.getLegalName()%></td>
            </tr>
			<tr class="even">
            <td class="fieldname">Checklist ID</td>
                <td>&nbsp;<%=checkListIDStr %></td>
            </tr>
            <% if (isSubOwnerType) {
            %> <tr class="odd">
            <td class="fieldname">Pledgor ID</td>
            <td><integro:empty-if-null value="<%= ccowner.getSubOwnerReference()%>"/></td>
        </tr>
            <% }%>
            <tr class="<%= isSubOwnerType?"even":"odd" %>"  >
                <td class="fieldname">Checklist Status</td>
                <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) ==null) ?
                        checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
                </td>
            </tr>
        </tbody>
    </table>
    </td>
</tr>
    <% }%>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <logic:iterate id="OB" name="checkList" property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem">
            <%
                long docNoLong = OB.getCheckListItemRef();
                String docNo = String.valueOf(docNoLong);
                docNo = (docNo == null || docNo.equals("") || docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;
                if (OB.isDeletable() && !parentList.contains((String) docNo)) {
                    ++countDeletable;

                    if (countDeletable > 0) {
                        break;
                    }
                }
            %>
        </logic:iterate>
        <td valign="bottom">
                    <% if (countDeletable > 0) { %>
                        <table width="160" border="0" align="right" cellpadding="0" cellspacing="2">
                        
                    <% } else { %>
                        <table width="160" border="0" align="right" cellpadding="0" cellspacing="2">
                    <% } %>
                        <tr>
                     <!--   
                        <td width="120" valign="baseline" align="right"><h6>Select All<input type="checkbox" name="selectAll" onClick="checkAll()"/>
                            <br/><font color="Red">Check Required Docs only</font></h6></td>
                         -->
                        <td width="100" valign="top" align="right">
                            <input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
                        </td>
                        <td width="100" valign="top" align="right">
                            <input type="button" name="Submit2" value="Remove" class="btnNormal" onclick="remove()"/>
                        </td>
                    </tr>
                </table>
         </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
    <tr>
        <td>S/N</td>
        <td>Mandatory for Borrower</td>
        <td>Doc Code</td>
        <td>Doc No.</td> 
        <td>Description</td>
        <td>Pre-Approval Document</td>
        <td>In Vault</td>
        <td>Audit</td>
        <td>Action</td>
        <td>Delete</td>
    </tr>
</thead>
<tbody>

<logic:present name="checkList" property="checkListItemList">
<logic:iterate id="OB" name="checkList" property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem">
<%
    String rowClass = "";
    row++;

    if (!ICMSConstant.STATE_DELETED.equals(OB.getItemStatus()) 
    		&& CheckListHelper.toDisplayCheckListItem(OB)) {
        index++;
        if (index % 2 != 0) {
            rowClass = "odd";
        } else {
            rowClass = "even";
        }
        boolean inherited = false;
        boolean mandatory = false;
        boolean mandatoryforBorrower = false;
        boolean mandatoryForPledgorInd = false;
        boolean inVault = false;
        boolean extCustodian = false;
        boolean audit = false;
        boolean sharedViewOnly = false;

        if (OB.getIsInherited()) {
            inherited = true;
        }
        if (OB.getIsMandatoryInd()) {
            mandatory = true;
        }
        if (OB.getIsInVaultInd()) {
            inVault = true;
        }
        if (OB.getIsExtCustInd()) {
            extCustodian = true;
        }
        if (OB.getIsAuditInd()) {
            audit = true;
        }
        if (OB.getShared() && OB.getViewable()) {
            sharedViewOnly = true;
        }

        long docNoLong = OB.getCheckListItemRef();

        String docNo = String.valueOf(docNoLong);
        docNo = (docNo == null || docNo.equals("") || docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;

        long parentDocNoLong = OB.getParentCheckListItemRef();
        String parentDocNo = String.valueOf(parentDocNoLong);
        parentDocNo = (parentDocNo == null || parentDocNo.equals("") || parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>(" + parentDocNo + ")";

        //if current checklist item is linked (i.e. has a parent), get the master doc code
        String parentDocCode = "&nbsp;";
        if (parentDocNoLong != 0 && parentDocNoLong != ICMSConstant.LONG_INVALID_VALUE) {
            ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
            parentDocCode = parentCheckListItem.getItem().getItemCode();
        }

        Date expiryDate = OB.getExpiryDate();
        Calendar calendar = Calendar.getInstance();
        Date currentDate = calendar.getTime();
        if (expiryDate != null && expiryDate.before(currentDate))
            DefaultLogger.debug(this, docNo + " has already expired!");
        //DefaultLogger.debug(this, ">>>>>>>> item viewable " + OB.getViewable() + " | share flag: " + OB.getShared() + " | shareViewOnly: " + sharedViewOnly);

        String isPreApprove = "N";
        if (OB.getItem().getIsPreApprove()) {
            isPreApprove = "Y";
        }

%>
<tr class="<%=rowClass%>">
    <td class="index"><%=index%></td>
    <td style="text-align:center">&nbsp;
        <%if (mandatory && inherited) { %>
        <img src="img/tick(black).gif" width="18" height="16" border="0"/>
        <%} else if (!inherited && !sharedViewOnly) {%>
        <input type="checkbox" name="check1" value="<%=row-1%>" <%if (mandatory) {%> checked <%} %> />
        <%} else if (!inherited && sharedViewOnly && mandatory) { %>
        <input type="checkbox" name="check1" value="<%=row-1%>" checked disabled/>
        <% } %>
    </td>
    <td><bean:write name="OB" property="item.itemCode"/></td>
    <td style="text-align:left"><%=docNo%></td>
    <td height="18">&nbsp;<bean:write name="OB" property="item.itemDesc"/></td>
    <td height="18" style="text-align:center">&nbsp;<%=isPreApprove %></td>
    
    <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>"
    <% if (inVault) {
            out.print(" Checked ");
        }
        if (inherited || !OB.isEditable() || sharedViewOnly) {
            out.print("disabled='true'");
        } %> />
    </td>
    <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>"
    <% if (audit) {
            out.print(" Checked ");
        }
        if (inherited || !OB.isEditable() || sharedViewOnly) {
            out.print("disabled='true'");
        } %> />
    </td>
    <td style="text-align:center">
        <%
            if (!ICMSConstant.STATE_ITEM_NOT_USED.equals(OB.getItemStatus())) {
        %>
        <select name="actionMenu" onChange="perform(this, '<%=row-1%>')">
            <option value="" selected>Please Select</option>
            <% // CMS-2236
                // Allow spawning of new items at any item. Even for expired doc
                //if (expiryDate==null || currentDate.before(expiryDate)) //if item has not expired yet, allow spawning (Add)
                //{
            %> <option value="add">Add Sub</option>
            <%-- //}

                if (!CheckListHelper.isNewCheckListItem(actualItems, docNoLong))
                //if (docNoLong!=0 && docNoLong!=ICMSConstant.LONG_INVALID_VALUE)
                {
            %> <option value="link">Link/De-Link</option>
            <option value="replace">Replace</option>
            <% }
            --%></select>
        <%
        } else {
        %> (Expired)
        <% }%>
    </td>
    <td style="text-align:center">&nbsp;
    <%--<%if(!inherited){ %>--%>
    <%  if (OB.isDeletable() && !parentList.contains((String) docNo) && !(OB.getShared() || OB.getViewable())) { %>
        <input type="checkbox" name="check5" value="<%=row-1%>" />
    <% } %>
    <%--<%}%>--%>
    </td>
</tr>
<% }%>
</logic:iterate>
</logic:present>
<% if (row == 0) { %>
<tr class="odd">
    <td colspan="10">There is no document</td>
</tr>
<% } %>
</tbody>
</table>
</td>
</tr>
<tr>
    <td colspan="9"><html:errors property="remove.error"/></td>
</tr>
</tbody>
</table>

<%if (ICMSConstant.STATE_REJECTED.equals(status)) { %>
    <p/> <p/><p/>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr>
                    <td class="fieldname">Remarks</td>
                    <td class="odd"><textarea name="remarks" rows="4" cols="90" onkeyup="limitTextInput(this,250,'Remarks')"></textarea></td>
                </tr>
                <tr>
                    <td class="fieldname">Last Action By</td>
                    <td class="even">&nbsp;<%=lastActionBy%></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Last Remarks Made</td>
                    <td><integro:wrapper value="<%=remarks%>"/>&nbsp;</td>
                </tr>
            </tbody>
        </table>
<% } %>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
	        <% if (PropertyManager.getBoolean("checklist.maintain.suppress.checker.approval")) { %>
            <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/confirm2.gif',1)" onClick="submitForm()">
                <img src="img/confirm1.gif" name="Image3" border="0" id="Image3"/>
            </a>
            <% } else { %>
            <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)" onClick="submitForm()">
                <img src="img/submit1.gif" name="Image3" border="0" id="Image3"/>
            </a>
            <% } %>
        </td>
        <% if (ICMSConstant.STATE_REJECTED.equals(status)) { %>
        <td width="100" valign="baseline" align="center">
            <a href="ToDo.do" onmouseout="MM_swapImgRestore()"  onmouseover="MM_swapImage('Image441','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image4411"  border="0" id="Image441"/></a>
        </td>
        <%} else {%>
        <td width="100" valign="baseline" align="center">
            <a href="CCCheckList.do?event=list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif"  name="Image4411" border="0" id="Image4411"/></a>
        </td>
        <%}%>
</tr>
<tr>
    <td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
<br>&nbsp;<br>
<br>&nbsp;<br>
<br>&nbsp;<br>
</body>
<!-- InstanceEnd --></html>

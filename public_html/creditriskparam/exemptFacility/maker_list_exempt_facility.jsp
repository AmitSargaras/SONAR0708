<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.creditriskparam.trx.exemptFacility.IExemptFacilityGroupTrxValue,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityForm,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.IExemptFacilityGroup,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.IExemptFacility,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.OBExemptFacility,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.OBExemptFacilityGroup,
                 java.util.Collection,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.creditriskparam.trx.exemptFacility.OBExemptFacilityGroupTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityAction,
                 com.integrosys.base.techinfra.util.AccessorUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.constant.ICategoryEntryConstant,
                 java.util.List,
                 java.util.Arrays,
                 java.util.Comparator,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityUIHelper"%>
                 
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    *
    * Purpose: Exempt Facility
    *
    * @author $Author: Lini $<br>
    * @version $Revision: 1.1 $
    * @since $Date: 2007/Mar/08 $
    * Tag: $Name:  $
    */
%>

<% class AlphabeticComparator implements Comparator {
        public int compare(Object o1, Object o2) {
            IExemptFacility s1 = (IExemptFacility) o1;
            IExemptFacility s2 = (IExemptFacility) o2;
            return s1.getFacilityCode().compareTo(s2.getFacilityCode());
        }
    }
%>  

<%
    String event = request.getParameter("event");
    Object obj = session.getAttribute("com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityAction.exemptFacilityTrxValue");

    OBExemptFacilityGroupTrxValue obTrxValue = null;
    boolean entries_editable = true;     //todo FALSE
    boolean isRejected = false;
    IExemptFacility[] facArr = null ;
    boolean isClose=false;

    if (event.equals(ExemptFacilityAction.EVENT_MAKER_CLOSE) ){
        entries_editable = false;
        isClose = true;
        isRejected = true;
    } else if (event.equals(ExemptFacilityAction.EVENT_READ)){
        entries_editable = true;
        isRejected = true;
    } 
    
    
    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.ExemptFacilityTrxValue");
        obTrxValue = (OBExemptFacilityGroupTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus());
        
        if (obTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_CREATE) ||
        		obTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_UPDATE)) {
            entries_editable = true;
            isRejected = true;
        }
        
        if (obTrxValue.getStagingExemptFacilityGroup() != null){
        	facArr = obTrxValue.getStagingExemptFacilityGroup().getExemptFacility();
        }
        
    }

    if( facArr!=null ) {
        
        ExemptFacilityUIHelper helper = new ExemptFacilityUIHelper();
        
        List sortList = helper.getSortedExemptFacilityMap(Arrays.asList(facArr));
        
        facArr = (IExemptFacility[])sortList.toArray(new IExemptFacility[] {});
        
        pageContext.setAttribute("facArr", facArr);
    }

    DefaultLogger.debug(this,"request.getAttribute(isRejected)" + request.getAttribute("isRejected"));
    DefaultLogger.debug(this,"entries_editable = " + entries_editable);
    DefaultLogger.debug(this,"isRejected = " + isRejected);

%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function closePage() {
    document.forms[0].event.value="<%=ExemptFacilityAction.EVENT_MAKER_CLOSE_CONFIRM%>";
    document.forms[0].submit();
}
function submitPage() {
    document.forms[0].event.value="<%=ExemptFacilityAction.EVENT_SUBMIT%>";
    document.forms[0].submit();
}
function gotoPreparePage() {
    document.forms[0].event.value="<%=ExemptFacilityAction.EVENT_PREPARE%>";
    document.forms[0].submit();
}
function JumpOnSelectactive(selectObj, exemptFacilityID)
	{

  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "View")
		{
        	location.href = "ExemptFacility.do?event=view&index=" +exemptFacilityID;
        	//location.href = "ExemptFacility.do?event=view&exemptFacilityID=" +exemptFacilityID;
   		}
		else if (selectObj.options[selectIndex].value == "Edit")
        {
        	location.href = "ExemptFacility.do?event=prepare_edit&index=" +exemptFacilityID;
        	//location.href = "ExemptFacility.do?event=prepare_edit&exemptFacilityID=" +exemptFacilityID;
		}
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

    //if (temp == "") {
    //    alert('Please select items to remove');
    //    return false;
   // }
    temp = temp.substring(1);
    formObj.removeIndex.value = temp;
    //alert('remove index'+temp);
    document.forms[0].removeIndex.value = temp;
    document.forms[0].event.value = "<%=ExemptFacilityAction.EV_REMOVE%>";
    document.forms[0].submit();
    }

    function addExpense() {
        if (checkExpense() == true) {
            document.forms[0].event.value = "<%=ExemptFacilityAction.EV_PREPARE_ADD%>";
            document.forms[0].submit();
        } else {
            alert('Please remove Income/Expense items before adding new Expense/ Income items');
        }

    }
    
  function remove() {
	    
    var formObj = document.forms[0];
    var str = "";
    var cnt = 0;
    
    for (var i = 0; i < formObj.elements.length; i++) {
	    if (formObj.elements[i].name == 'checkSelects')
	     cnt++;
	  }
    
    if (cnt > 1) {
	    for (var i = 0; i < formObj.checkSelects.length; i++) {
		    	if (formObj.checkSelects[i].checked){
		    		if (str.length != "") str += ",";
		    		str += formObj.checkSelects[i].value;
	    		}
	    }
   }else if (cnt == 1){
		   if(formObj.checkSelects.checked){
		   	str = formObj.checkSelects.value;
	     }
   }
    
    document.forms[0].removeIndex.value = str;  
    document.forms[0].event.value = "remove"
    document.forms[0].submit();
  }


	function cancelSubmit(){
	    var url = 'Welcome.do';
	    document.location.href = url;
	}
//-->
</script>
<!-- InstanceEndEditable -->
</head>


<html:form action="ExemptFacility.do">
<input type="hidden" name="event"/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index"/>
<% if(isRejected) { %>
    <input type="hidden" name="isRejected" value="<%=ICMSConstant.TRUE_VALUE%>"/>
<% } %>
<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
    <td><h3><bean:message key="title.crp.exemptfac.list"/></h3></td>
<%--    <td align="right" valign="bottom"></td>--%>
    <% if (entries_editable && !isClose){%>
        <td width="25%" align="right" valign="bottom"><input type="button" value='<bean:message key="label.add.new"/>' class="btnNormal" onclick="addExpense()"/>
        <input type="button" onclick="remove()" value='<bean:message key="label.remove"/>' class="btnNormal"/>
        </td>
    <%}%>
</tr>
<tr>
    <td colspan="2"><hr /> </td>

</tr>
</thead>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:errors property="deleteItems"/>
<table id="tblExchange" width="95%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
<tr style="text-align:center">
    <td width="3%"><bean:message key="label.global.sno"/></td>
    <td width="12%"><bean:message key="label.crp.exemptfac.facility.desc"/><font color="#0000FF">*</font></td>
    <td width="5%"><bean:message key="label.crp.exemptfac.facility.code"/></td>
    <td width="12%"><bean:message key="label.crp.exemptfac.status.exempted"/>&nbsp;/&nbsp;<bean:message key="label.crp.exemptfac.conditional.perc"/>&nbsp;<font color="#0000FF">*</font></td>
    <% if (entries_editable && !isClose){%>
    <td width="11%"><bean:message key="label.global.delete"/></td><%}%>
</tr>
</thead>
<tbody>
<%

boolean allDeleted=true;
    int index  = 1;
if (facArr != null && facArr.length >0) {
    for (int i = 0; i < facArr.length; i++) {
	if(!"DELETED".equals(facArr[i].getStatus()))
	{
	allDeleted=false;
	}
        if (isRejected){ %>
																	
        <tr class='<%=(i%2==0?"even":"odd")%>'>
            <%if (ICMSConstant.STATE_DELETED.equals(facArr[i].getStatus())){%>
            <td valign="center" class="indexdel"><%=(index++)%></td>
            <%}else{%>
            <td valign="center" class="index"><%=(index++)%></td>
            <%}%>
            <td style="text-align:center">
                <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICategoryEntryConstant.FACILITY_DESCRIPTION, facArr[i].getFacilityCode())%>"/> &nbsp;
            </td>
            <td style="text-align:center">
                <integro:empty-if-null value="<%=facArr[i].getFacilityCode()%>"/>&nbsp;
            </td>
            <td style="text-align:center">
            <% if (ICMSConstant.EXEMPT_FACILITY_STATUS_EXEMPTED.equals(facArr[i].getFacilityStatusExempted())) {%>
                Exempted
            <%}else{%>
                <%=facArr[i].getFacilityStatusConditionalPerc()%>
            <%}%>
            </td>
            <% if (entries_editable && !isClose){%>
            <td style="text-align:center">
                <%if (ICMSConstant.STATE_DELETED.equals(facArr[i].getStatus())){%>
                <input type="checkbox" name="checkSelects" value='<%=i%>' disabled/>
                
                <%}else{%>
                <input type="checkbox" name="checkSelects" value='<%=i%>'/>
                <%}%>
            </td><%}%>
        </tr>
        <%}
        else{
        if (!ICMSConstant.STATE_DELETED.equals(facArr[i].getStatus())){
        %>
        <tr class='<%=(i%2==0?"even":"odd")%>'>
            <td valign="center" class="index"><%=(index++)%></td>
            <td style="text-align:center">
                <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICategoryEntryConstant.FACILITY_DESCRIPTION, facArr[i].getFacilityCode())%>"/> &nbsp;
            </td>
            <td style="text-align:center">
                <integro:empty-if-null value="<%=facArr[i].getFacilityCode()%>"/>&nbsp;
            </td>
            <td style="text-align:center">
            <% if (ICMSConstant.EXEMPT_FACILITY_STATUS_EXEMPTED.equals(facArr[i].getFacilityStatusExempted())) {%>
                Exempted
            <%}else{%>
                <%=facArr[i].getFacilityStatusConditionalPerc()%>
            <%}%>
            </td>
            <% if (entries_editable){%>
            <td style="text-align:center">
                <input type="checkbox" name="checkSelects" value='<%=i%>' />
            </td>
            <%}%>
        </tr>
        <%
        } // Deleted
       }// else of isrejected
    }  // For
}
%>
<%if(allDeleted){%>
<tr class="odd">
        <td colspan="10"><bean:message key="label.global.not.found"/></td>
    </tr>
<%}%>
</tbody>
</table>
<p align="center"><html:errors property="noItemSelected" /></p>
<%
   if (isRejected && !isClose) {
%>
    <table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
    <br>
    <tr>
        <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr>
            <td width="43%" class="fieldname"><bean:message key="label.remarks"/></td>
            <td width="57%" class="odd"><html:textarea property="remarks" rows="3" cols="120" /><br/>
	                        <html:errors property="remarks"/></td>
        </tr>
        <tr>
            <td class="fieldname"><bean:message key="label.last.action.by"/></td>
            <td class="even"> <%=obTrxValue.getUserInfo()==null?"-":obTrxValue.getUserInfo()%> &nbsp; </td>

            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                <td><integro:wrapper value='<%=(obTrxValue.getRemarks()==null || obTrxValue.getRemarks().equals("null")?" ":obTrxValue.getRemarks())%>' />&nbsp;&nbsp;</td>
            </tr>
        </tbody>
        </table>
        </td>
    </tr>
    </tbody>
    </table>
<% } %>

<%
   if (isRejected && isClose) {
%>
    <table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
    <br>
    <tr>
        <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        	<tr class="even">
            	<td class="fieldname"><bean:message key="label.last.action.by"/></td>
            	<td class="odd"> <%=obTrxValue.getUserInfo()==null?"-":obTrxValue.getUserInfo()%> &nbsp; </td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                <td class="even"><integro:wrapper value='<%=(obTrxValue.getRemarks()==null || obTrxValue.getRemarks().equals("null")?" ":obTrxValue.getRemarks())%>' />&nbsp;&nbsp;</td>
            </tr>
        </tbody>
        </table>
        </td>
    </tr>
    </tbody>
    </table>
<% } %>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
</tr>
<tr>
    <%
        if (isClose) { %>
            <td><a href='javascript:closePage()' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image3" width="70" height="20" border="0" id="Image2" /></a></td>
            <td><a href='ToDo.do' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td><%
        } else if (entries_editable && !isRejected /*&& facArr != null && facArr.length>0*/) {%>
            <td><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
            <td><a href="javascript:cancelSubmit();"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a></td>
      <%} else if (isRejected) { %>
            <td><a href='javascript:submitPage()' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="70" height="20" border="0" id="Image2" /></a></td>
            <td><a href='ToDo.do' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td><%
        }
    %>
</tr>
<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>
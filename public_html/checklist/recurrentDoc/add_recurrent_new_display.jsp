<%@ page import="java.util.List,
                 java.util.ArrayList,
                 java.util.Collection,
                 org.apache.struts.util.LabelValueBean,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Calendar,
                 com.integrosys.cms.ui.checklist.recurrentDoc.RecurrentDocCheckListForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recurrent/add_recurrent.jsp,v 1.29 2006/10/27 08:19:27 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.29 $
* Date: $Date: 2006/10/27 08:19:27 $
* Tag: $Name:  $
*/
%>
<%
int sno = 0;
boolean viewOnly = false;
if(request.getParameter("view")!=null &&request.getParameter("view").equals("view")){
    viewOnly=true;
}
  String event = request.getParameter("event");
    RecurrentDocCheckListForm aForm = (RecurrentDocCheckListForm)request.getAttribute("RecurrentDocCheckListForm");
    boolean isOneOff = false;
    boolean isMoreThanOneSubItem = false;
  /*  if (aForm.getOneOff() != null && aForm.getOneOff().equals("true")) {
        isOneOff = true;
    }
    if (aForm.getHasMoreSubItems() != null && aForm.getHasMoreSubItems().equals("true")) {
	    isMoreThanOneSubItem = true;
    }*/
    String index = (String)request.getParameter("index");
    boolean isNew = true;
    if (index != null && index.trim().length() > 0) {
        isNew = false;
    }

	try {
%>



<%@page import="com.integrosys.cms.ui.common.FrequencyList"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
</style>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage(num) {
	 var formObj = document.forms[0];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      if (type == 'checkbox') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
		      if (type == 'checkbox') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.itemID[j].value);
					temp = temp + "-" + formObj.itemID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
		      if (type == 'checkbox') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.itemID.value);
					temp = temp + "-" + formObj.itemID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
	    if(temp==""){
	        alert('Please select atleast one to save.');
	        return false;
	    }
		temp=temp.substring(1);
	//	alert(temp);
		document.forms[0].appendStatementType.value = temp;
   if (num == 0) {
	    document.forms[0].event.value="update_recurrent";
	    document.forms[0].submit();
   }
   if (num == 1) {
   //	 document.forms[0].action="RecurrentDocCheckList.do?event=add_recurrent&selectedValues="+temp;
       document.forms[0].event.value="add_recurrent";
       document.forms[0].submit();
   }
   if (num == 2) {
       document.forms[0].event.value="back";
       document.forms[0].submit();
   }
	
}

function setDueDate(cal, date) {
	if (cal != "" && date != "") {
			cal.sel.value = date;
	}
	strDocEndDate = document.forms[0].docEndDate.value;
	frequency = document.forms[0].frequency.value;
	if (frequency != null && frequency != '') {
		frequency = parseFloat(frequency.split(' ').join(''));
	}
	else {
		frequency = 0;
	}
	frequencyUnit = document.forms[0].frequencyUnit.value;
	docEndDate = convertStrToDate(strDocEndDate);
	dueDate = new Date();
	if (strDocEndDate == null || strDocEndDate == '') {
		 document.forms[0].dueDate.value = '';
	}
	else {
		if (frequency == null || frequency == '' || frequencyUnit == null || frequencyUnit == '') {
			// dueDate = docEndDate when gracePeriod is not available
			document.forms[0].dueDate.value = strDocEndDate;
		}
		else {
			if (frequencyUnit != null && frequencyUnit != '') {
				// dueDate = docEndDate + gracePeriod
				dueDate = calculateNextDate(docEndDate, frequency, frequencyUnit);
				strDueDate = convertDateToStr(dueDate);
				document.forms[0].dueDate.value = strDueDate;
			}
		}
	}
}

var tmpFreq = "";
var tmpFreqUnit = "";
var tmpLastDocEntryDate = "";

function changeFrequency(selectedObj) {
    if(selectedObj.value == 'true') {
        tmpFreq = document.forms[0].frequency.value;
        tmpFreqUnit = document.forms[0].frequencyUnit.value;
        tmpLastDocEntryDate = document.forms[0].lastDocEntryDate.value;
        document.forms[0].frequency.value="";
        document.forms[0].frequencyUnit.value="";
        document.forms[0].lastDocEntryDate.value="";
        document.forms[0].frequency.disabled=true;
        document.forms[0].frequencyUnit.disabled=true;
        document.forms[0].lastDocEntryDateCal.disabled=true;
    } else {
        document.forms[0].frequency.disabled=false;
        document.forms[0].frequencyUnit.disabled=false;
        document.forms[0].lastDocEntryDateCal.disabled=false;
        document.forms[0].frequency.value = tmpFreq;
        document.forms[0].frequencyUnit.value = tmpFreqUnit;
        document.forms[0].lastDocEntryDate.value = tmpLastDocEntryDate;
    }
}
function addRecurrentDoc() {
    //alert('add recurrent');
    var type=document.forms[0].statementType.value;
    alert(type);
  		document.forms[0].action="RecurrentDocCheckList.do?event=show_recurrent_master&type="+type;
        document.forms[0].submit();
   

}
function cancel(){
	//alert("aa");
	        document.forms[0].event.value="back";
			document.forms[0].submit();

}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="RecurrentDocCheckList" >
<input type="hidden" name="event" />
<html:hidden property="appendStatementType"/>
<!--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>-->
<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.maintain.rec.doc.checklist"/> - <%=isNew?"New":"Edit"%></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
   
  </tbody>
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
<!--   <tr>-->
<!--      <td class="fieldname" align="right">Statement Type&nbsp; : </td>-->
<!--           <td align="left">  <html:select property="statementType" >-->
<!--                                    	<integro:common-code	categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE%>" descWithCode="false" />-->
<!--                                    </html:select>-->
<!--                                     <input type="button" value="GO" class="btnNormal" onclick="addRecurrentDoc()"/>-->
<!--                                    </td>-->
<!--    </tr>-->
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead>
        <tr>
          <td width="4%">S/N</td>
          <td width="11%">Code</td>
          <td width="50%">Description</td>
<!--           <td width="10%">Document Frequency</td>-->
		   <td width="10%">Status</td>
          <td width="10%">Statement Type</td>
         	<td width="15%">Select</td>
				
       
        </tr>
        </thead>
        <tbody>
<logic:present name="globalDocChkList">
   <logic:iterate id="OB" name="globalDocChkList"  type="com.integrosys.cms.app.chktemplate.bus.DocumentSearchResultItem" >
   <%
       String rowClass="";
       sno++;
      if(sno%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }

   %>

        <tr class="<%=rowClass%>">
          <td class="index" height="18" ><%=sno%></td>
          <td >&nbsp;<bean:write property="itemCode" name="OB"/></td>
          <td height="18" >&nbsp;<bean:write property="itemDesc" name="OB"/></td>
    <%--    <td>
          <%if(OB.getTenureCount()==0){
          %>&nbsp;<%}else{ %>
          <%=OB.getTenureCount()%> &nbsp;<integro:common-code-single  entryCode="<%=OB.getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" display="true" descWithCode="false" />
          <%} %>
          </td>
            --%>  
             
        <td ><%if(OB.getStatus().trim().equalsIgnoreCase("ENABLE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
          <td ><integro:common-code-single 
                                    		categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE%>" entryCode="<%=OB.getStatementType() %>" descWithCode="false" display="true"/>
                                   &nbsp;</td>
             <td style="text-align:center">
            <input type="checkbox" name="itemID" value="<%=OB.getItemCode()%>" />
          </td>
         
        </tr>
</logic:iterate>
</logic:present>
<%if(sno == 0) { %>
<tr class="odd">
<td colspan='<%=viewOnly?"7":"8"%>' ><bean:message key="label.global.not.found"/></td>
</tr>
<% }%>

  </tbody>
</table>
</td>
</tr>
</tbody>
</table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">
    <%  if (!isNew) {  %>
        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)" onclick="submitPage(0)" >
    <% } else { %>
        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)" onclick="submitPage(1)" >
    <% } %>
        <img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
    </td>
    <td width="100" valign="baseline" align="center"> <a href="#" onclick="cancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
<%
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>

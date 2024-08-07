<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    OtherReceiptForm form = (OtherReceiptForm) request.getAttribute("OtherReceiptForm");
    
    String hdfcAmt="";
    if(form.getHdfcAmt()!=null && !form.getHdfcAmt().trim().equals("")){
    	hdfcAmt=form.getHdfcAmt();
    }
    
    String docAmt="";
    if(form.getDocAmt()!=null && !form.getDocAmt().trim().equals("")){
    	docAmt=form.getDocAmt();
    }
    String lableDocDate = "Doc Expiry Date";
    String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if (isPolicy == null|| isPolicy.trim().length() == 0) {
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}

	if ( (isPolicy != null && isPolicy.equals("false")) || (monitorType != null && monitorType.equals (ICMSConstant.PREMIUM_RECEIPT)) )
	{
        isPolicy = "false";
        lableDocDate = "Due Date to Receive Premium Receipt";
	}
	List currencyList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.otherreceipt.OtherReceiptAction.currencyList");
    if(currencyList!=null){
    	pageContext.setAttribute("currencyList",currencyList);
    }
	String status = (String) request.getAttribute("status");

%>




<%@page import="com.integrosys.cms.ui.checklist.otherreceipt.OtherReceiptForm"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/validation.js"></script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>

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

function saveForm(){
    if (document.forms["OtherReceiptForm"].isPolicy.value == "true"){
		if (document.forms["OtherReceiptForm"].docEffDate.value != document.forms["OtherReceiptForm"].docOldEffDate.value) {
			document.forms["OtherReceiptForm"].isEffDateChanged.value="true";
		}
	}
	document.forms["OtherReceiptForm"].event.value="save_update";
	document.forms["OtherReceiptForm"].submit();
}

function cancelForm() {
	document.forms["OtherReceiptForm"].event.value="view_ok";
	document.forms["OtherReceiptForm"].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>
<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>
<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif')">
<html:form action="OtherReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName"/>
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />

<!--to keep fields value when error come -->
<html:hidden property="docCode" />
<html:hidden property="docNo"/>
<html:hidden property="docDesc" />
<html:hidden property="docOldEffDate" />
<html:hidden property="isEffDateChanged" />

<html:hidden property="isPolicy" value="<%=isPolicy%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Other Doc Receipt </h3></td>
    </tr>
    <tr>
      <td> <h3> Doc Description - Updated</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <!--start table for  to  document  item in Details-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="OtherReceiptForm" property="docCode" /></td>
            </tr>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Doc No</td>-->
<!--              <td>&nbsp;<bean:write name="OtherReceiptForm" property="docNo" /></td>-->
<!--            </tr>-->
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="OtherReceiptForm" property="docDesc" /></td>
            </tr>
 <%--
            <tr class="even">
              <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="docRef" maxlength="100" size="30"/><html:errors property="docRef"/></td>
            </tr>
--%>
<!--             <tr class="even">-->
<!--               <td class="fieldname">Document Type</td>-->
<!--               <td><html:select property="monitorType">-->
<!--                        <integro:common-code categoryCode="MONITOR_TYPE"/>-->
<!--                    </html:select>-->
<!--               </td>-->
<!--            </tr>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Form No</td>-->
<!--              <td><html:text property="formNo" maxlength="50" size="30"/><html:errors property="formNo"/></td>-->
<!--            </tr>-->
 <tr class="even">
              <td class="fieldname">Doc Amount &nbsp;</td>
              <td><html:text property="docAmt" size="33" maxlength="22" value="<%=UIUtil.mapOBAmount_FormString(locale, UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),docAmt)) %>" styleId="docAmt" onblur="javascript:formatAmountAsCommaSeparated(this)" />
                <html:errors property="docAmt" />
              </td>
            </tr>
             <tr class="odd">
              <td class="fieldname">HDFC Amount &nbsp;</td>
              <td><html:text property="hdfcAmt" size="33" maxlength="22" value="<%=UIUtil.mapOBAmount_FormString(locale, UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),hdfcAmt)) %>" styleId="hdfcAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                <html:errors property="hdfcAmt" />
              </td>
            </tr>
             <tr class="even">
              <td class="fieldname">Currency &nbsp;</td>
              <td>
              <html:select property="currency">
              <option value="">Please Select </option>	
                     
               <%
              
              String selected="INR";
              
              
              if(form.getCurrency()!=null && !form.getCurrency().trim().equals("")){
            	  selected=form.getCurrency();
              }
              for(int i =0;i<currencyList.size();i++){ 
              
              LabelValueBean labelValueBean=(LabelValueBean)currencyList.get(i);
              
              %>
              
              <%if(labelValueBean.getValue().trim().equalsIgnoreCase(selected.trim())){ 
            	 // System.out.println("=======================:"+labelValueBean.getLabel());
              %>
               <option value="<%=labelValueBean.getValue()%>" selected="selected"><%=labelValueBean.getLabel()%></option>	
              
              <%}else{ %>
              <option value="<%=labelValueBean.getValue()%>"><%=labelValueBean.getLabel()%></option>	
              
              <%}} %>
<!--                      <html:options collection="currencyList" property="value" labelProperty="label" filter="" />-->
              </html:select>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Doc Date &nbsp;</td>
              <td><html:text property="docDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="docDate" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Original Target Date &nbsp;<font color="RED">* </font></td>
              <td><html:text property="originalTargetDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('originalTargetDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="originalTargetDate" />
              </td>
            </tr>
 <%--
            <%
				if(isPolicy!=null && isPolicy.equals("true"))
				{

			%>
            <tr class="even">
              <td class="fieldname">Document Effective Date&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="docEffDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docEffDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="docEffDate" />
              </td>
            </tr>
            <%
       			 }
       		%>
--%>
            <tr class="even">
              <td class="fieldname"><%=lableDocDate%></td>
              <td><html:text property="docExpDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docExpDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="docExpDate" />
              </td>
            </tr>
 <%--
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td><html:text property="identifyDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('identifyDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="identifyDate" />
              </td>
            </tr>
--%>		

<!--            <tr class="even">-->
<!--              <td class="fieldname">Action Party </td>-->
<!--              <td><html:select property="actionParty">-->
<!--                      <integro:common-code categoryCode="ACTION_PARTY"/>-->
<!--                  </html:select>-->
<!--                  <html:errors property="actionParty" />-->
<!--                </td>-->
<!--            </tr>-->
<!--             <tr class="even">-->
<!--              <td class="fieldname">Credit Approver </td>-->
<!--              <td><html:select property="actionParty">-->
<!--                      <integro:common-code categoryCode="ACTION_PARTY"/>-->
<!--                  </html:select>-->
<!--                  <html:errors property="actionParty" />-->
<!--                </td>-->
<!--            </tr>-->
<%-- start here for cr-17 
           <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >
                    <html:radio property="shared" value="true"   />Yes
                    <html:radio property="shared" value="false"  />No
                    <html:errors property="shared" />
              </td>
              </tr>
--%>
            </tbody>
            </table>
            <html:hidden property="actionParty" />
<%--
            <jsp:include page="/checklist/secreceipt/update_sharechecklist.jsp" />
--%>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                 <tbody>
                 <tr class="old">
                     <td class="fieldname">Remarks</td>
                     <td><html:textarea name="OtherReceiptForm" rows="5" style="width:97%"  property="docRemarks" onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks" /></td>
                    </tr>
                  </tbody>
            </table>
            <html:hidden property="itemStatus"  value="PENDING_UPDATE"/>
            <!--start  for  save and cancel -->
             <table width="100%">
                <tr>
				<td>
				<br></br>
 <jsp:include page="view_audit_details_individual.jsp"></jsp:include>
				</td>
				
			</tr>
			</table>
            <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" valign="middle">
                          <a href="#" onclick="saveForm()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1" border="0" id="Image1" /></a>
                          <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
                  </td>
                </tr>
            </table>
 <%-- End here  for cr-17 --%>
        </td>
    </tr>
  </tbody>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

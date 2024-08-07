<%@ page import="java.util.*,com.integrosys.cms.ui.collateral.CategoryCodeConstant,java.util.List,java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.secglobal.SecurityGlobalForm" %>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/global_doc_view.jsp,v 1.11 2006/10/27 08:13:10 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.11 $
 * @since $Date: 2006/10/27 08:13:10 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    OBDocumentItemTrxValue trxVal = (com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue) session.getAttribute("com.integrosys.cms.ui.secglobal.SecurityGlobalAction.docTrxObj");
    SecurityGlobalForm aForm = (SecurityGlobalForm)request.getAttribute("SecurityGlobalForm");
    
    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";

    String closeFlag = (String) request.getAttribute("closeFlag");
    boolean close = false;
    if ("true".equals(closeFlag)) {
        close = true;
    }
    boolean toTrack = false;
    
    
	/*CommonCodeList commonCode = CommonCodeList.getInstance("APPLICATION_TYPE");
	
    List appCodeID   = (List) commonCode.getCommonCodeValues();
    List appCodeValue   = (List) commonCode.getCommonCodeLabels();
    
    Collection appListing = (Collection)request.getAttribute("appCodeValue");
    
    List savedAppCodeValue = new ArrayList();
    Iterator iter = appListing.iterator();
    while(iter.hasNext())
    {
    	com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem docAppItem = (com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem) iter.next();
    	savedAppCodeValue.add(docAppItem.getAppType());
    }*/


    String status = trxVal.getStatus();
    String event = "update_doc_item";
    if (ICMSConstant.STATE_PENDING_DELETE.equals(trxVal.getFromState())) {
    	 event = "update_staging_doc_item";
       
    }else{
    	if (ICMSConstant.STATE_REJECTED.equals(status)) {
            event = "update_staging_doc_item";
        }
    }

   
    boolean showDocCode = true;
    if (aForm.getItemCode() == null || aForm.getItemCode().trim().length() < 1) {
        if (trxVal != null && trxVal.getStatus().equals(ICMSConstant.STATE_REJECTED)) {
            showDocCode = false;
        }
    }
    
	Boolean docCodeNonUnique = (Boolean) request.getAttribute("docCodeNonUnique");
	if (docCodeNonUnique == null) {
		docCodeNonUnique = Boolean.FALSE;
	}
	
	String startIndex=(String)request.getAttribute("startIndex");
    System.out.println("/////////////////////******************* startIndex:-"+startIndex);
%>





<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->


<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
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

function loadPage() {
	window.opener.refreshContent();
	window.close();
}
function submitPage () {
	//selectLists();
	document.forms[0].event.value="<%=event%>";
	document.forms[0].submit();
}


function skipImageTagCheckbox(){
	var x = document.getElementById("skipImgTag").checked;
		if (x == true) {
		document.getElementById("skipImgTag").value="ENABLE";
		document.getElementById("skipImgTag1").value="ENABLE";
		}
	else
		{
		document.getElementById("skipImgTag").value="DISABLE";
		document.getElementById("skipImgTag1").value="DISABLE";
		}	
}

//-->
</script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="SecurityGlobal.do">
<input type="hidden" name="event" />
<%
if(trxVal.getFromState().trim().equalsIgnoreCase("PENDING_DELETE")){
%>
<html:hidden property="deprecated" value="Y" />
<%}else { %>
<html:hidden property="deprecated" value="N" />
<%} %>
<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global Collateral Document Template - Edit</h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="even">
              <td class="fieldname">Document Code&nbsp;</td>
              <td><bean:write name="SecurityGlobalForm"  scope="request"  property="itemCode"  />&nbsp;<br /><html:errors property="itemCode" /></td>
            <html:hidden property="itemCode"/>
            </tr>
            <tr class="odd">
              <td class="fieldname">Document Description&nbsp;<font color="red">*</font>
              <br/><bean:message key="error.string.document.name"/></td>
              <td><html:textarea name="SecurityGlobalForm"  property="itemDesc" cols="50" rows="3" />
              <html:errors property="itemDesc" /></td>
            </tr>
             <tr class="odd">
          <td class="fieldname">Document Tenure&nbsp;<font color="red">* </font></td>
          <td>
            <html:text property="tenureCount"  maxlength="3" />
             <html:select property="tenureType" >
                                    	<integro:common-code  entryCode="<%=aForm.getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" descWithCode="false" />
                                    </html:select><html:errors property="tenureError" /><html:errors property="tenureTypeError" />
           
          </td>
        </tr>
        <tr class= "even">
         <td class="fieldname" >Status&nbsp;</td>
             <%  if( event.equals("update_doc_item") || trxVal.getFromState().equals("PENDING_UPDATE") ){ %>
	              <td >Enable<html:radio   property="status" value="ENABLE" />&nbsp;
	              Disable<html:radio  property="status" value="DISABLE" />&nbsp;</td>
         
        	<%}else{ %>
         
	         	<td >Enable<html:radio   property="status" value="ENABLE" disabled="true"/>&nbsp;
	              Disable<html:radio  property="status" value="DISABLE" disabled="true"/>&nbsp;</td>
         	<%} %>     
        
        </tr>
        
        <tr class= "odd">
         <td class="fieldname" >CERSAI Applicable&nbsp;<font color="red">* </font></td>
            <td >Yes<html:radio   property="isApplicableForCersaiInd" value="Y" />&nbsp;
	              No<html:radio  property="isApplicableForCersaiInd" value="N" />&nbsp;
				<html:errors property="isApplicableForCersaiIndError"/>
	        </td>
        </tr>
        
         <tr class="even">
        <td class="fieldname">Skip Image Tagging&nbsp;<font color="red">*</font></td>
              <td><% if(aForm.getSkipImgTag().equalsIgnoreCase("ENABLE")){  %>
               <input type="checkbox"  value="ENABLE" checked="checked"  name="skipImgTag" id="skipImgTag" onclick="skipImageTagCheckbox()">
           
              <%}else{%>
            <input type="checkbox" value="DISABLE"  name="skipImgTag" id="skipImgTag" onclick="skipImageTagCheckbox()" >
              <%} %>
              </td>           
        </tr>
        <html:hidden property="skipImgTag" styleId="skipImgTag1"/>
        
        
<!--            <tr class="even">-->
<!--              <td class="fieldname">Document Version</td>-->
<!--              <td>&nbsp;<html:text name="SecurityGlobalForm"  property="docVersion" /></td>-->
<!--            </tr>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Expiry Date</td>-->
<!--              <td><html:text name="SecurityGlobalForm"  property="expDate" />-->
<!--              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"-->
<!--			             onclick="showCalendar('expDate', 'dd/mm/y')"-->
<!--			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"-->
<!--			             onmouseout="MM_swapImgRestore()"/>&nbsp;</td>-->
<!--            </tr>-->
<!--            <tr class="even">-->
<!--				<td class="fieldname">Pre-Approval Document</td>-->
<!--				<td><html:radio name="SecurityGlobalForm" property="isPreApprove" value="Y"  />Yes -->
<!--				<html:radio name="SecurityGlobalForm" property="isPreApprove" value="N"  />No</td>-->
<!--			</tr>-->
			
	<html:hidden property="docVersion" value="0"/>
	<html:hidden property="isPreApprove" value="N"/>	
	<html:hidden property="itemID" />
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%if(ICMSConstant.STATE_REJECTED.equals(status)) { %>
<p/>
<p/>
<p/>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr class="odd">
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="80"></textarea></td>
					</tr>
					<tr class="even">
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>

<% } %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>

    <td width="100" valign="baseline" align="center"> <a href="#"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)" 
    	onClick="<%=(docCodeNonUnique.booleanValue()) ? "javascript: alert('There is already an existing document with the same code [" + aForm.getItemCode() + "]. \\nPlease close the transaction.')" : "submitPage()"%>" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
                        <td width="100" valign="baseline" align="center">
                        <%if(ICMSConstant.STATE_REJECTED.equals(status)) { %>
                        <a href="ToDo.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        <% } else {%>
                        <a href="SecurityGlobal.do?event=global_list&type=S&go=N&startIndex=<%=startIndex %>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        <% } %>
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

<%@ page import="java.util.*,com.integrosys.cms.ui.collateral.CategoryCodeConstant,java.util.List,java.util.ArrayList,,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.otherdoc.OtherGlobalForm"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/global_doc_edit.jsp,v 1.16 2006/10/27 08:13:10 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.16 $
 * @since $Date: 2006/10/27 08:13:10 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    OBDocumentItemTrxValue trxVal = (OBDocumentItemTrxValue) session.getAttribute("com.integrosys.cms.ui.otherdoc.OtherGlobalAction.docTrxObj");

   System.out.println("------------------------- trxVal.getFromState()"+trxVal.getFromState());
   System.out.println("------------------------- trxVal.getStatus()"+trxVal.getStatus());
   String critical= (String) session.getAttribute("com.integrosys.cms.ui.otherdoc.OtherGlobalAction.critical");
   String mandatory = (String) session.getAttribute("com.integrosys.cms.ui.otherdoc.OtherGlobalAction.mandatory");
   System.out.println("::::::::critical::::::::::"+critical);
   System.out.println("::::::::mandatory::::::::::"+mandatory);
   boolean criticalInd=false;
   boolean mandatoryInd =false;
   
   if("true".equals(critical))
   	criticalInd=true;
   
   if("true".equals(mandatory))
   	mandatoryInd=true;
    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";

    String status = trxVal.getStatus();
    String event = "update_doc_item";
    if (ICMSConstant.STATE_REJECTED.equals(status)) {
        event = "update_staging_doc_item";
    }

    OtherGlobalForm aForm = (OtherGlobalForm) request.getAttribute("OtherGlobalForm");
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
	 String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute("com.integrosys.cms.ui.otherdoc.OtherGlobalAction.migratedFlag");	 
	 if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
/*	CommonCodeList commonCode = CommonCodeList.getInstance("APPLICATION_TYPE");
	
    List appCodeID   = (List) commonCode.getCommonCodeValues();
    List appCodeValue   = (List) commonCode.getCommonCodeLabels();
    Collection appListing = (Collection)request.getAttribute("appCodeValue");
    
    List savedAppCodeValue = new ArrayList();
    Iterator iter = appListing.iterator();
    while(iter.hasNext())
    {
    	com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem docAppItem = (com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem) iter.next();
    	savedAppCodeValue.add(docAppItem.getAppType());
    } */
    String startIndex=(String)request.getAttribute("startIndex");
    System.out.println("/////////////////////******************* startIndex:-"+startIndex);
%>

<html>
<body>
<table align="center" width="100%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>


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

function selectLists(){
    List = document.forms[0].loanApplicationList;
    Append = document.forms[0].appendLoanList;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
        Append.value = List.options[i].value + "-" + Append.value;
    }

}

function submitPage () {
	document.forms[0].event.value="<%=event%>";
	document.forms[0].submit();
}


//-->


function skipImageTagCheckbox()
{
	var x =document.getElementById("skipImgTag").checked;
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
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<html:form action="OtherGlobal.do">
<input type="hidden" name="event" />
<html:hidden property="itemID" />
<html:hidden property="itemCode" />
<%
if(trxVal.getFromState().trim().equalsIgnoreCase("PENDING_DELETE")){
%>
<html:hidden property="deprecated" value="Y" />
<%}else { %>
<html:hidden property="deprecated" value="N" />
<%} %>
<input type="hidden" name="appendLoanList" value="" />

<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>

<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global Other Document Template - Edit</h3></td>
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
                <%if(showDocCode) { %>
            <tr class="even">
              <td class="fieldname">Document Code&nbsp;</td>
              <td>
                <bean:write name="OtherGlobalForm" scope="request" property="itemCode" />
                <br /><html:errors property="itemCode" />
              </td>
            </tr>
                <% } %>
            <tr class="odd">
              <td class="fieldname">Document Description&nbsp;<font color="red">* </font>
              <br/><bean:message key="error.string.document.name"/></td>
              <td><html:textarea property="itemDesc" cols="50" rows="3" /><html:errors property="itemDesc" /></td>
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
         <%
         	//if( ( trxVal.getStatus().equals("ACTIVE") || trxVal.getStatus().equals("REJECTED") ) && ( trxVal.getFromState().equals("PENDING_CREATE") )){
         		
         		if( event.equals("update_doc_item") || trxVal.getFromState().equals("PENDING_UPDATE") ){
         %>
              <td >Enable<html:radio   property="status" value="ENABLE" />&nbsp;
              Disable<html:radio  property="status" value="DISABLE" />&nbsp;</td>
         
        <%}else{ %>
         
         <td >Enable<html:radio   property="status" value="ENABLE" disabled="true"/>&nbsp;
              Disable<html:radio  property="status" value="DISABLE" disabled="true"/>&nbsp;</td>
         <%} %>          
        
        </tr>
         <tr >
         <td class="fieldname" >Critical&nbsp;</td>
        <td  ><input name="mandatoryID" type="checkbox"  <%if(criticalInd){ %>checked="checked" <%} %> />
              </td>
              
              </tr>
              <tr>
               <td class="fieldname" >Mandatory&nbsp;</td>
                 <td  ><input name="mandatoryDisplayID" type="checkbox"  <%if(mandatoryInd){ %>checked="checked" <%} %>  />
              </td>
        </tr>
        
             <tr>
        <td class="fieldname">Skip Image Tagging&nbsp;<font color="red">*</font></td>
              <td><% if(aForm.getSkipImgTag().equalsIgnoreCase("ENABLE")){  %>
               <input type="checkbox" checked="checked" value="ENABLE"  name="skipImgTag" id="skipImgTag" onclick="skipImageTagCheckbox()">
           
              <%}else{%>
            <input type="checkbox" value="DISABLE"  name="skipImgTag" id="skipImgTag" onclick="skipImageTagCheckbox()" >
              <%} %>
              </td>           
        </tr>
        <html:hidden property="skipImgTag" styleId="skipImgTag1"/>
<!--             <tr class="even">-->
<!--				<td class="fieldname">Document Version&nbsp;<font color="#0000FF">* </font></td>-->
<!--				<td><html:text property="docVersion" size="50" maxlength="7" />-->
<!--				<html:errors property="docVersion" /></td>-->
<!--			</tr>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Expiry Date</td>-->
<!--              <td><html:text property="expDate" size="12" maxlength="12" />-->
<!--                <img src="img/calendara.gif"  name="Image32" border="0" id="Image32" onclick="return showCalendar('expDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />-->
<!--                <html:errors property="expDate" />-->
<!--              </td>-->
<!--            </tr>-->
<!--            <tr class="even">-->
<!--				<td class="fieldname">Pre-Approval Document</td>-->
<!--				<td><html:radio name="OtherGlobalForm" property="isPreApprove" value="Y" />Yes -->
<!--				<html:radio name="OtherGlobalForm" property="isPreApprove" value="N" />No</td>-->
<!--			</tr>-->
<html:hidden property="docVersion" value="0"/>			
 	
		<input type="hidden" name="mandatoryID" />
<input type="hidden" name="mandatoryDisplayID" />               		
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
                        <a href="OtherGlobal.do?event=global_list&type=O&go=N&startIndex=<%=startIndex %>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        <% } %>
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>
<html:hidden property="status"/>                    
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

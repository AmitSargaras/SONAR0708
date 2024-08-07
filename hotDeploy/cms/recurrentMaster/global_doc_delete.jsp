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
    OBDocumentItemTrxValue trxVal = (com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue) session.getAttribute("com.integrosys.cms.ui.recurrentMaster.RecurrentGlobalAction.docTrxObj");
    RecurrentGlobalForm aForm = (RecurrentGlobalForm)request.getAttribute("RecurrentGlobalForm");
    
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
    String event = request.getParameter("event");
    if ("to_track".equals(event)) {
        toTrack = true;
    }
    
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
    String startIndex=(String)request.getAttribute("startIndex");
    System.out.println("/////////////////////****************** startIndex-:"+startIndex);


%>






<%@page import="com.integrosys.cms.ui.recurrentMaster.RecurrentGlobalForm"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
	document.forms[0].event.value="delete_doc_item";
	document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="RecurrentGlobal.do">
<input type="hidden" name="event" />
<html:hidden name="RecurrentGlobalForm"  property="itemCode" />
<html:hidden name="RecurrentGlobalForm"  property="itemDesc" />
<html:hidden name="RecurrentGlobalForm"  property="expDate" />
<html:hidden name="RecurrentGlobalForm"  property="tenureCount" />
<html:hidden name="RecurrentGlobalForm"  property="status" />
<html:hidden name="RecurrentGlobalForm"  property="tenureType" />
<html:hidden name="RecurrentGlobalForm"  property="deprecated" value="Y" />
	<html:hidden property="docVersion" value="0"/>
	<html:hidden property="isPreApprove" value="N"/>
	<html:hidden name="RecurrentGlobalForm"  property="rating" />
<html:hidden name="RecurrentGlobalForm"  property="isRecurrent" />
<html:hidden name="RecurrentGlobalForm"  property="classification" />
<html:hidden name="RecurrentGlobalForm"  property="segment" />
<html:hidden name="RecurrentGlobalForm"  property="guarantor" />
<html:hidden name="RecurrentGlobalForm"  property="totalSancAmt" />

<html:hidden name="RecurrentGlobalForm"  property="oldItemCode" />

<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global  Document Template - Delete</h3></td>
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
              <td class="fieldname">Document Code</td>
              <td><bean:write name="RecurrentGlobalForm" scope="request" property="itemCode" />&nbsp;<br /><html:errors property="itemCode" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Document Description</td>
              <td><bean:write name="RecurrentGlobalForm" scope="request" property="itemDesc" /></td>
            </tr>
            
            <%--
            <tr class="even">
             <td class="fieldname" >Document Frequency&nbsp;<font color="#0000FF"> </font></td>
            <td>
         
          <%=aForm.getTenureCount()%> &nbsp; <integro:common-code-single  entryCode="<%=aForm.getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" display="true" descWithCode="false" />
         
          </td>
         
            </tr>
             --%> 
            
            <tr class="odd">
            <td class="fieldname" >Status&nbsp;</td>
              <td ><%if(aForm.getStatus().trim().equalsIgnoreCase("ENABLE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
            </tr>
             <tr class="even">
        <td class="fieldname" >Statement Type&nbsp;</td>
              <td >
                                    	<integro:common-code-single 
                                    		categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE%>" entryCode="<%=aForm.getStatementType() %>" descWithCode="false" display="true"/>
                                   &nbsp;</td>
        
        </tr>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Document Version</td>-->
<!--              <td>&nbsp;<bean:write name="RecurrentGlobalForm" scope="request" property="docVersion" /></td>-->
<!--            </tr>-->
            <tr class="odd">
              <td class="fieldname">Document Due Date</td>
              <td><bean:write name="RecurrentGlobalForm" scope="request" property="expDate" />&nbsp;</td>
<!--            </tr>-->
<!--            <tr class="even">-->
<!--				<td class="fieldname">Pre-Approval Document</td>-->
<!--				<td><html:radio name="RecurrentGlobalForm" property="isPreApprove" value="Y" disabled="true" />Yes -->
<!--				<html:radio name="RecurrentGlobalForm" property="isPreApprove" value="N" disabled="true" />No</td>-->
<!--			</tr>-->
<tr class="even">
        <td class="fieldname" >Is Recurrent&nbsp;</td>
             <td >
              <%if(aForm.getIsRecurrent()!=null){
            	  if("on".equalsIgnoreCase(aForm.getIsRecurrent())){
            	  %>
            	  <input type="checkbox" disabled="disabled" checked="checked">
              <%}else{%>
            	  <input type="checkbox" disabled="disabled">
              <%
              }     }%>
              &nbsp;</td>
        
        </tr>	
        
          <tr>
        <td class="fieldname">Skip Image Tagging&nbsp;<font color="red">*</font></td>
              <td><% if(aForm.getSkipImgTag().equalsIgnoreCase("ENABLE")){ %>
               <input type="checkbox" id="skipImgTag" name="skipImgTag" value="ENABLE" checked="checked" disabled="disabled">
              <%}else{ %>
            <input type="checkbox" id="skipImgTag" name="skipImgTag" value="DISABLE" disabled="disabled">
              <%} %>
              </td>           
        </tr>
        <html:hidden property="skipImgTag"/>		
		
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global  Document Template - Criteria</h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead> </thead> <tbody>
        <tr class="even">
        <td class="fieldname" >Rating&nbsp;</td>
               <td >
                                   <% 		 String rating= aForm.getRating();
                                   String[] ratingArray=rating.split("-");
         			  if(ratingArray!=null){
         			  for(int i =0; i< ratingArray.length ;i++){
         				
         			    	%>
         			    	<integro:common-code-single categoryCode="<%=CategoryCodeConstant.CommonCode_RISK_GRADE%>" entryCode="<%=ratingArray[i]%>" display="true" descWithCode="false" />
	        											<br>
         			    	
         			    	<%
										}
         			  }
										 %>      &nbsp;</td>
        
        </tr>
        <tr class="even">
        <td class="fieldname" >Segment&nbsp;</td>
              <td >
                                   <% 		 String segment= aForm.getSegment();
                                   String[] segmentArray=segment.split("-");
         			  if(segmentArray!=null){
         			  for(int i =0; i< segmentArray.length ;i++){
         				
         			    	%>
         			    	<integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" entryCode="<%=segmentArray[i]%>" display="true" descWithCode="false" />
	        											<br>
         			    	
         			    	<%
										}
         			  }
										 %>      &nbsp;</td>
        </tr>
        <tr class="even">
        <td class="fieldname" >Total Sanction Amount&nbsp;</td>
              <td >
                   <integro:empty-if-null value="<%=aForm.getTotalSancAmt()%>"/>                 	&nbsp;</td>
        
        </tr>
        <tr class="even">
        <td class="fieldname" >Classification&nbsp;</td>
              <td >
                                   <% 		 String classification= aForm.getClassification();
                                   String[] classificationArray=classification.split("-");
         			  if(classificationArray!=null){
         			  for(int i =0; i< classificationArray.length ;i++){
         				
         			    	%>
         			    	<integro:common-code-single categoryCode="<%=CategoryCodeConstant.CommonCode_ASSET_ClASSIFICATION%>" entryCode="<%=classificationArray[i]%>" display="true" descWithCode="false" />
	        											<br>
         			    	
         			    	<%
										}
         			  }
										 %>      &nbsp;</td>
        
        </tr>
        <tr class="even">
        <td class="fieldname" >Guarantor&nbsp;</td>
               <td >
              <%if(aForm.getGuarantor()!=null){
            	  
            	 if(aForm.getGuarantor().equals("OPEN")){ 
            	  %>
            	Yes  <input type="radio" checked="checked" disabled="disabled">
            	  NO  <input type="radio" disabled="disabled">
               <%}else if(aForm.getGuarantor().equals("CLOSE")) {
            	%>  
              Yes  <input type="radio"  disabled="disabled">
            	  NO  <input type="radio" checked="checked" disabled="disabled">
              <%}else {%>
              
              Yes  <input type="radio"  disabled="disabled">
            	  NO  <input type="radio"  disabled="disabled">
              
              
              <% }}%>
              
                                    	   &nbsp;</td>
        
        </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
			<%if(!toTrack && close) {%>
<p/>
<p/>
<p/>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
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
			<%}%>
<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"><a href="#"
				onMouseOut="MM_swapImgRestore()"
				onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick="submitPage()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /></a></td>
			<td width="100" valign="baseline" align="center">
			
			 <a href="RecurrentGlobal.do?event=global_list&type=REC&go=N&startIndex=<%=startIndex %>"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>
			
			</td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

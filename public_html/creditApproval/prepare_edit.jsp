<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
				java.util.List,
				com.integrosys.cms.ui.creditApproval.CreditApprovalAction,
				com.integrosys.cms.app.creditApproval.bus.OBSegment,
				com.integrosys.cms.app.creditApproval.bus.OBCreditApproval,
				com.integrosys.cms.app.creditApproval.trx.OBCreditApprovalTrxValue,
				java.util.Iterator,
				com.integrosys.cms.ui.creditApproval.CreditApprovalForm,
				java.text.DateFormat,
				java.text.SimpleDateFormat,com.integrosys.cms.ui.collateral.CategoryCodeConstant,
				org.apache.struts.util.LabelValueBean,
				java.text.DecimalFormat,
				com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<%
String startIndex=(String)request.getAttribute("startIndex");
String approvalCode=(String)request.getAttribute("approvalCode");
String approvalName=(String) request.getAttribute("approvalName");
	

	String event = request.getParameter("event");
	String actionEvent=null;
    String headingLabel="Edit";
    DefaultLogger.debug("prepare_edit.jsp","event from getParameter is > "+event);
    if(event.equals(CreditApprovalAction.EVENT_RESUBMIT_EDIT_VIEW)||event.equals(CreditApprovalAction.MAKER_CONFIRM_RESUBMIT_EDIT_REJECTED))
    {
    actionEvent =CreditApprovalAction.MAKER_CONFIRM_RESUBMIT_EDIT_REJECTED;
    }
    else
    {
    actionEvent = "maker_confirm_resubmit_edit";
    }
    // maker_update_save_process
    
 %>   
  <%
String actionStr1 = "com.integrosys.cms.ui.creditApproval.CreditApprovalAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
  <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    
    <!-- InstanceBeginEditable name="CssStyle" -->
    
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>

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

function submitForm() {
document.forms[0].event.value = "<%=CreditApprovalAction.MAKER_SAVE_CREATE%>";
document.forms[0].submit();
}


function approvePage() {
    document.forms[0].action="credit_approval.do?event=checker_confirm_approve_create";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="credit_approval.do?event=reject";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
}

	function submitPage(idx) {
		document.forms[0].action="credit_approval.do?event=<%=actionEvent%>&creditApprovalId="+idx;
		document.forms[0].submit();
	}
function saveForm() {

 	document.forms[0].action="credit_approval.do?event=maker_update_draft_creditApproval";

 	
    document.forms[0].submit();
}
//-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<%
    DecimalFormat dft = new DecimalFormat("#0.00");
    DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
	CreditApprovalForm creditApprovalForm = (CreditApprovalForm)request.getAttribute("creditApprovalForm");	

	pageContext.setAttribute("CreditApprovalObj",creditApprovalForm);

    OBCreditApprovalTrxValue creditApprovalTrxVal = (OBCreditApprovalTrxValue)request.getAttribute("creditApprovalTrxValue");
    pageContext.setAttribute("creditApprovalTrxVal",creditApprovalTrxVal);
	OBCreditApproval oBCreditApproval = (OBCreditApproval) request.getAttribute("oBCreditApproval");
	session.setAttribute("oBCreditApproval",oBCreditApproval);
	//session.setAttribute("creditApprovalTrxVal",creditApprovalTrxVal);
	
	String creditApprovalId = creditApprovalForm.getId();
    creditApprovalForm.setWaivingPowers(oBCreditApproval.getWaivingPowers());
	creditApprovalForm.setDeferralPowers(oBCreditApproval.getDeferralPowers());
	
	//This code for regionList
	List regionList = (java.util.ArrayList) request.getAttribute("regionList");
	LabelValueBean lvBean = null;
    String regionName = "";
    String regionId = "";
	Iterator itregion = regionList.iterator();

	while(itregion.hasNext())
	{
	lvBean = (LabelValueBean)itregion.next();
		if(lvBean.getValue().equals(new Long(oBCreditApproval.getRegionId()).toString()))
		{
			regionName = lvBean.getLabel();
			regionId = lvBean.getValue();
		}
	}
	
	
%>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>
<html:form action="credit_approval.do">
<html:hidden name="creditApprovalForm" property="id" value="<%=Long.toString(oBCreditApproval.getId())%>" />
<html:hidden name="creditApprovalForm" property="createBy" value="<%=oBCreditApproval.getCreateBy()%>" />
<html:hidden name="creditApprovalForm" property="lastUpdateBy" value=""/>
<html:hidden name="creditApprovalForm"property="lastUpdateDate" value="<%=df.format(oBCreditApproval.getLastUpdateDate())%>"/>
<html:hidden name="creditApprovalForm"property="creationDate" value="<%=df.format(oBCreditApproval.getCreationDate())%>"/>
<html:hidden name="creditApprovalForm" property="deprecated" value="<%=oBCreditApproval.getDeprecated()%>"/>
<html:hidden name="creditApprovalForm" property="versionTime" value="<%=Long.toString(oBCreditApproval.getVersionTime())%>"/>
<html:hidden name="creditApprovalForm" property="event" value="<%=CreditApprovalAction.EVENT_PREPARE_SUBMIT%>" />
<input type="hidden" name="creditAppId" value="<%=Long.toString(oBCreditApproval.getId())%>" />
<input type="hidden" name="TrxId" value="<%=request.getParameter("TrxId")%>" />
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection" align="center"><tr><td width="100%">      
      <h3><bean:message key="title.manual.update.subtitle.feed.creditapproval"/>:<%=headingLabel%></h3>
      <hr />
      
      <table class="tblInput" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">      
        <tbody>   
          <tr>            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput" id="backEdit2" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">     
                <tbody>
                  <tr class="even" >
                    <td width="20%" class="fieldname" >Credit Approver Code <span class="style11"></span></td>
                  <td width="20%" class="even"><span class="odd">
                   <%=oBCreditApproval.getApprovalCode()%>                 
                   <html:hidden name="creditApprovalForm"  property="approvalCode"  value="<%=oBCreditApproval.getApprovalCode()%>"/>
                   </span></td>
                  
              <td width="20%" class="fieldname" > Name</td>
                  <td width="20%"><span class="odd">
                  <% if(oBCreditApproval.getApprovalName()==null || oBCreditApproval.getApprovalName().equals("")){%>
                    <html:text property="approvalName"/>
                    <%}else{%>
                    <%=oBCreditApproval.getApprovalName()%>
                    <html:hidden name="creditApprovalForm"  property="approvalName"  value="<%=oBCreditApproval.getApprovalName()%>"/>
                    <%} %>
                    <br/><html:errors property="approvalName"/>
                    
                  </span></td>
                </tr>

                  <tr class="odd">
              	   <td width="20%" class="fieldname" >Minimum Limit(INR)&nbsp;<font color="#ff0000">*</font></td>
                   <td width="20%" class="odd">

						<html:text property="minimumLimit" size="30" maxlength="23" value="<%=UIUtil.formatWithCommaAndDecimal(oBCreditApproval.getMinimumLimit().toString()) %>" styleId="minimumLimit" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
						
                    	<html:errors property="minimumLimit"/>
 						 
				   </td>
				   
				 
                    <td width="20%" class="fieldname">Maximum Limit (INR)
                   &nbsp;<font color="#ff0000">*</font>
                    </td>
                     <td width="20%" class="odd">

						<html:text property="maximumLimit" size="30" maxlength="23" value="<%=UIUtil.formatWithCommaAndDecimal(oBCreditApproval.getMaximumLimit().toString()) %>" styleId="maximumLimit" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
					
                    	<html:errors property="maximumLimit"/>
 						  
				 </td>
             </tr>
             <tr class="odd">
                    <td width="20%" class="fieldname"  >Segment</td>
                  	<td width="20%" class="even">
                  	                             
                       <html:select property="segmentId" value="<%=oBCreditApproval.getSegmentId() %>">
						   <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"  />
					   </html:select>                         
                       <html:errors property="segmentId" />
                   </td>
             	   <td width="20%" class="fieldname"  >E-mail</td>
                   <td width="20%" class="odd">
                     <% if(oBCreditApproval.getEmail()==null){%>
                     <html:text property="email"/>
                     <%}else{ %>
                      <html:text property="email" value="<%=oBCreditApproval.getEmail() %>"/>
                     <%} %>
                      <html:errors property="email"/>
			       </td>
            </tr>
            <tr class="even">
                   <td width="20%" class="fieldname">Senior<span class="style11"></span></td>
                   <td width="20%" class="even">
                     <%String check;
                     if(oBCreditApproval.getSenior()!=null && oBCreditApproval.getSenior().equals("Y")){
                     check = "";
                     }
                     else{
                      check = "on";
                     }%>
                     
                      <html:checkbox property="senior"  value="<%=check%>"/>
                   </td>  
              	   <td width="20%" class="fieldname" >Risk<span class="style11"></span></td>
                   <td width="20%" class="even"><label>
                     <%
                     if(oBCreditApproval.getRisk()!= null && oBCreditApproval.getRisk().equals("Y")){
                     check = "";
                     }
                     else{
                      check = "on";
                      }%>
                      <html:checkbox property="risk" value="<%=check%>"/>
                      
                      </label>
                  </td>
            </tr> 
            
            <tr class="odd">
                    <td width="20%" class="fieldname">Deferral Powers</td>
                    <td width="20%" class="odd"><label>
                       <html:radio name="creditApprovalForm" property="deferralPowers" value="Y"/>Yes 
                       <html:radio name="creditApprovalForm" property="deferralPowers" value="N"/>No 
                   </label></td>
                     
                    <td width="20%" class="fieldname" >Waiving Powers<span class="style11"></span></td>
                    <td width="20%" class="odd"><label>
                      <html:radio property="waivingPowers" value="Y"/>Yes 
                      <html:radio property="waivingPowers" value="N"/>No 
                    </label></td>
            </tr>
             
             <tr class="even">
                    <td class="fieldname">Region</td>
                    <td class="even" width="20%">
                    <%
                    String strRegionId = String.valueOf(oBCreditApproval.getRegionId());
                     %>
					<html:select property="regionId" value="<%=strRegionId%>">
						    <option value="">Please Select</option>
							<html:options collection="regionList" labelProperty="label" property="value" />
					</html:select>												
		           </td>
                   
                   <td width="20%" class="fieldname" >Status<span class="style11"></span></td>
                   <td width="20%" class="odd">
                   
                   <%
                   	 if( creditApprovalTrxVal.getFromState().equalsIgnoreCase("ACTIVE") ){  // edit
					 	if( oBCreditApproval.getStatus().equalsIgnoreCase("ACTIVE") ){						 
				   %>
                     	 <input type="radio" name="status" checked="checked" value="ACTIVE" ><%=ICMSConstant.STATE_ENABLE.toString()%></input>
					     <input type="radio" name="status" value="INACTIVE" ><%=ICMSConstant.STATE_DISABLE.toString()%></input>
					<%}else{%>
						<input type="radio" name="status"  value="ACTIVE"><%=ICMSConstant.STATE_ENABLE.toString()%></input>
						<input type="radio" name="status" checked="checked" value="INACTIVE"><%=ICMSConstant.STATE_DISABLE.toString()%></input>
					<%} } else if( creditApprovalTrxVal.getFromState().equalsIgnoreCase("PENDING_CREATE") && creditApprovalTrxVal.getStatus().equalsIgnoreCase("REJECTED") ){ 
					if( oBCreditApproval.getStatus().equalsIgnoreCase("ACTIVE")  ){%>
						 <input type="radio" name="status" checked="checked" value="ACTIVE"  disabled="disabled" ><%=ICMSConstant.STATE_ENABLE.toString()%></input>
					     <input type="radio" name="status" value="INACTIVE" disabled="disabled"><%=ICMSConstant.STATE_DISABLE.toString()%></input>
					<%}else{%>
						<input type="radio" name="status"  value="ACTIVE" disabled="disabled"><%=ICMSConstant.STATE_ENABLE.toString()%></input>
						<input type="radio" name="status" checked="checked" value="INACTIVE" disabled="disabled"><%=ICMSConstant.STATE_DISABLE.toString()%></input>
               		</td>
               		<%} } else { 
					if( oBCreditApproval.getStatus().equalsIgnoreCase("ACTIVE")  ){%>
						 <input type="radio" name="status" checked="checked" value="ACTIVE"><%=ICMSConstant.STATE_ENABLE.toString()%></input>
					     <input type="radio" name="status" value="INACTIVE"><%=ICMSConstant.STATE_DISABLE.toString()%></input>
					<%}else{%>
						<input type="radio" name="status"  value="ACTIVE"><%=ICMSConstant.STATE_ENABLE.toString()%></input>
						<input type="radio" name="status" checked="checked" value="INACTIVE"><%=ICMSConstant.STATE_DISABLE.toString()%></input>
               		</td>
               		<%} }%>
             </tr>       
              <tr class="odd">
                  <td class="fieldname">Employee Id &nbsp;<font color="#ff0000">*</font>
                  </td>
                <td width="20%"><span class="odd">
                  
                    <html:text name="creditApprovalForm"  property="employeeId"  value="<%=oBCreditApproval.getEmployeeId()%>" style="text-transform: uppercase" tabindex="1" size="30" maxlength="30"/>
                   
                    <br/> <html:errors property="employeeIdError" /></br> <html:errors property="employeeIdDuplicateError" />
                    
                  </span></td>
                  <td >
                  </td>
                 <td></td>
                  </tr>   
                    </tbody>
              </table>
          <br/>            </td></tr>
  <%//if(event.equals(CreditApprovalAction.EVENT_RESUBMIT_EDIT_VIEW)||event.equals("maker_update_save_process")) {%>
<% if(creditApprovalTrxVal.getFromState().equals("PENDING_PERFECTION")||creditApprovalTrxVal.getStatus().equals("DRAFT")||creditApprovalTrxVal.getStatus().equals("DRAFT")){%>
 <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <tr>
                                  <td class="fieldname">Remarks</td>
                                  <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
                                </tr>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                   <td class="even"><%=creditApprovalTrxVal.getUserInfo()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><%=creditApprovalTrxVal.getRemarks()!=null?creditApprovalTrxVal.getRemarks():""%>&nbsp;</td>
                                </tr>
                              </tbody>
                            </table></td>
                        </tr>
                        <% }%>
     <!-- App -->
 <tr>
 	<table width="130" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
 	<td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr align="center">
  <% if(creditApprovalTrxVal.getFromState().equals("PENDING_PERFECTION")){%>
			<td><a href="#" onClick="submitForm()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/submit2.gif',1)">
            	<img src="img/submit1.gif" name="Image3" width="75"height="22" border="0" id="Image3"/></a>
            </td>	
			
			<%} else {%>	
			<td width="100" valign="baseline" align="center"><a href="#"
				onMouseOut="MM_swapImgRestore()"
				onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick="submitPage('<%=creditApprovalId %>')"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /></a></td>
			<%}%>

			<%if(event.equals(CreditApprovalAction.EVENT_RESUBMIT_EDIT_VIEW)||event.equals(CreditApprovalAction.MAKER_UPDATE_SAVE_PROCESS)){%>
			<td width="100" valign="baseline" align="center">
			 <a href="ToDo.do?event=prepare"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>
			</td>
			<%}else { 
			if(event.equals(CreditApprovalAction.PREPARE_MAKER_SUBMIT_EDIT)){
			%>
			<td colspan="2"><center> <a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" 
				border="0" id="ImageSave" /></a>
				</center>
			</td>
			<%}%>
			<td width="100" valign="baseline" align="center">
			 <a href="credit_approval.do?event=maker_search_list_creditApproval&startIndex=<%=startIndex %>&approvalCode=<%=approvalCode %>&approvalName=<%=approvalName %>"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>
			</td>
			<%} %>
		</tr>	
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</tr>                 
  <!-- End App -->

</table></td></tr></table>
<html:hidden property="status" name="creditApprovalForm"/>
<html:hidden property="cps_id" name="creditApprovalForm" value = "<%=oBCreditApproval.getCpsId()%>"/>
<html:hidden property="employeeId" name="creditApprovalForm" value = "<%=oBCreditApproval.getEmployeeId()%>"/>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
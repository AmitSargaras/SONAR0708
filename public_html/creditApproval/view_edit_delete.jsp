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
				com.integrosys.cms.ui.common.UIUtil"%>
				
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<%
String startIndex=(String)request.getAttribute("startIndex");
String approvalCode=(String)request.getAttribute("approvalCode");
String approvalName=(String) request.getAttribute("approvalName");
	

    DecimalFormat dft = new DecimalFormat("#0.00");
	String event = request.getParameter("event");
	String actionEvent=null;
    String headingLabel="Edit";
    DefaultLogger.debug("checker_image_upload.jsp","event from getParameter is >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "+event);
    if(event.equals("prepare_maker_submit_remove"))
    {
     actionEvent="confirm_maker_submit_remove";
     headingLabel = "Delete";
    
    }
    
    
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
//-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<%
	DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
	CreditApprovalForm creditApprovalForm = (CreditApprovalForm)request.getAttribute("creditApprovalForm");	
	pageContext.setAttribute("CreditApprovalObj",creditApprovalForm);

    OBCreditApprovalTrxValue creditApprovalTrxVal = (OBCreditApprovalTrxValue)request.getAttribute("creditApprovalTrxValue");
    pageContext.setAttribute("creditApprovalTrxVal",creditApprovalTrxVal);
	OBCreditApproval oBCreditApproval = (OBCreditApproval) request.getAttribute("oBCreditApproval");
	session.setAttribute("oBCreditApproval",oBCreditApproval);
	String creditApprovalId = creditApprovalForm.getId();
	
	
	List regionList = (java.util.ArrayList) request.getAttribute("regionList");
	LabelValueBean lvBean = null;
    String regionName = "";
    String regionId = "";
	Iterator it = regionList.iterator();

	while(it.hasNext())
	{
	lvBean = (LabelValueBean)it.next();
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

<input type="hidden" name="event"value="<%=CreditApprovalAction.EVENT_PREPARE_SUBMIT%>" />
<html:hidden name="creditApprovalForm" property="id" value="<%=Long.toString(oBCreditApproval.getId())%>" />
<html:hidden name="creditApprovalForm" property="createBy" value="<%=oBCreditApproval.getCreateBy()%>" />
<html:hidden name="creditApprovalForm"property="lastUpdateBy" value="<%=oBCreditApproval.getLastUpdateBy()%>"/>
<html:hidden name="creditApprovalForm"property="lastUpdateDate" value="<%=df.format(oBCreditApproval.getLastUpdateDate())%>"/>
<html:hidden name="creditApprovalForm"property="creationDate" value="<%=df.format(oBCreditApproval.getCreationDate())%>"/>
<html:hidden name="creditApprovalForm" property="deprecated" value="<%=oBCreditApproval.getDeprecated()%>"/>
<html:hidden name="creditApprovalForm" property="status" value="<%=oBCreditApproval.getStatus()%>"/>
<html:hidden name="creditApprovalForm" property="versionTime" value="<%=Long.toString(oBCreditApproval.getVersionTime())%>"/>	

<html:hidden name="creditApprovalForm" property="approvalCode" value="<%=oBCreditApproval.getApprovalCode()%>" />
<html:hidden name="creditApprovalForm" property="approvalName" value="<%=oBCreditApproval.getApprovalName()%>" />
<html:hidden name="creditApprovalForm"property="maximumLimit" value="<%=oBCreditApproval.getMaximumLimit().toString()%>"/>
<html:hidden name="creditApprovalForm"property="minimumLimit" value="<%=oBCreditApproval.getMinimumLimit().toString()%>"/>
<html:hidden name="creditApprovalForm"property="segmentId" value="<%=oBCreditApproval.getSegmentId()%>"/>
<html:hidden name="creditApprovalForm" property="email" value="<%=oBCreditApproval.getEmail()%>"/>
<html:hidden name="creditApprovalForm" property="senior" value="<%=oBCreditApproval.getSenior()%>"/>
<html:hidden name="creditApprovalForm" property="risk" value="<%=oBCreditApproval.getRisk()%>"/>	

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
      <h3><bean:message key="title.manual.update.subtitle.feed.creditapproval"/>:<%=headingLabel%>
      <hr />
      
      <table class="tblInput" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">      
        <tbody>   
          <tr>            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput" id="backEdit2" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">     
                <tbody>
                  <tr class="even" >
                    <td width="20%" class="fieldname" >Approval Code <span class="style11"></span></td>
                  <td width="20%" class="even"><span class="odd">
                       <%=oBCreditApproval.getApprovalCode() %>
                  </span></td>
                  
              <td width="20%" class="fieldname" > Name<span class="style11"></span></td>
                  <td width="20%"><span class="odd">
                    <%=oBCreditApproval.getApprovalName() %>
                  </span></td>
                </tr>
              <tr class="odd">
              
                   <td width="20%" class="fieldname" >Minimum Limit (INR)<span class="style11"></span></td>
                   <td width="20%" class="odd">

 						  <%=UIUtil.formatWithCommaAndDecimal(oBCreditApproval.getMinimumLimit().toString()) %>
				   </td>
                    <td width="20%" class="fieldname">Maximum Limit  (INR)<span class="style11"></span>
                   
                    </td>
                     <td width="20%" class="odd">

 						  <%=UIUtil.formatWithCommaAndDecimal(oBCreditApproval.getMaximumLimit().toString()) %>
				  </td>
                    

             </tr>
             <tr class="odd">
                    <td width="20%" class="fieldname"  >Segment</td>
                  	<td width="20%" class="even">                                 
                        <input type="hidden" name="segmentId" value="<%=oBCreditApproval.getSegmentId()%>" />
					   <integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" entryCode="<%=oBCreditApproval.getSegmentId()%>" display="true" descWithCode="false" pleaseSelect="false"/>                                              
                       <html:errors property="segmentId" />
                   </td>
             	   <td width="20%" class="fieldname"  >E-mail</td>
                   <td width="20%" class="odd">
                    <integro:empty-if-null value="<%=oBCreditApproval.getEmail() %>" />
				       
			       </td>
            </tr>
            <tr class="even">
                   <td width="20%" class="fieldname">Senior<span class="style11"></span></td>
                   <td width="20%" class="even">
                     <%String check;
                     if(oBCreditApproval.getSenior() != null && oBCreditApproval.getSenior().equals("Y")){
                     check = "";}
                     else
                     { check = "on";}%>
                      <html:checkbox property="senior" disabled="true" value="<%=check%>"/>
                   </td>  
              	   <td width="20%" class="fieldname" >Risk<span class="style11"></span></td>
                   <td width="20%" class="even"><label>
                     <%
                     if(oBCreditApproval.getRisk()!=null && oBCreditApproval.getRisk().equals("Y")){
                     check = "";}
                     else
                     { check = "on";}%>
                      <html:checkbox property="risk" disabled="true" value="<%=check%>"/>
                      
                      </label>
                  </td>
            </tr> 
            
             <tr class="even">
                    <td width="20%" class="fieldname">Deferral Powers</td>
                    <td width="20%" class="even"><%=oBCreditApproval.getDeferralPowers()==null?"-":(oBCreditApproval.getDeferralPowers().equals("Y")?"Yes":"No")%></td>
                  
                  <td width="20%" class="fieldname" >Waiving Powers<span class="style11"></span></td>
                  <td width="20%" class="even"><label><%=oBCreditApproval.getWaivingPowers()==null?"-":(oBCreditApproval.getWaivingPowers().equals("Y")?"Yes":"No")%>
                  </label></td>
             </tr>
             <tr class="even">
                    <td class="fieldname">Region</td>
                    <td class="even"><%=regionName%>&nbsp;</td>
                    <td class="fieldname" >Status</td>
                    <td class="even"><%= oBCreditApproval.getStatus().equalsIgnoreCase("ACTIVE")?"ENABLED":"DISABLED"%></td>
             </tr>   
                <tr class="odd">
                  <td class="fieldname">Employee Id
                  </td>
                 <td><integro:empty-if-null value="<%=oBCreditApproval.getEmployeeId()%>"/>&nbsp;</td>
                  <td >
                  </td>
                 <td></td>
                  </tr>  
                    </tbody>
              </table>
          <br/>            </td></tr>

     <!-- App -->
 <tr>
 	<table width="130" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
 	<td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
     <!-- App -->
 <tr>
 	<table width="130" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
 	<td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr align="center">
						<td width="100" valign="baseline" align="center"><a href="#"
							onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image3311','','img/delete2.gif',1)"
							onClick="submitPage('<%=creditApprovalId %>')"><img src="img/delete1.gif"
							name="Image3311" border="0" id="Image3311" /></a></td>
						<td width="100" valign="baseline" align="center">
						 <a href="credit_approval.do?event=maker_search_list_creditApproval&startIndex=<%=startIndex %>&approvalCode=<%=approvalCode %>&approvalName=<%=approvalName %>"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>
						
						</td>
					</tr>	
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</tr>                 
  <!-- End App -->
 
 </td></tr></table>
<html:hidden property="employeeId" name="creditApprovalForm" value = "<%=oBCreditApproval.getEmployeeId()%>"/>
 </td></tr></table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
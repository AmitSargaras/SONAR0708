<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
				java.util.List,
				com.integrosys.cms.ui.creditApproval.CreditApprovalAction,
				com.integrosys.cms.app.creditApproval.bus.OBSegment,
				com.integrosys.cms.app.creditApproval.bus.OBCreditApproval,
				java.util.Iterator,
				com.integrosys.cms.app.creditApproval.trx.OBCreditApprovalTrxValue,
				java.util.Iterator,com.integrosys.cms.ui.collateral.CategoryCodeConstant,
				org.apache.struts.util.LabelValueBean,
				java.text.DecimalFormat"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<%
    DecimalFormat dft = new DecimalFormat("#0.00");
	String event = request.getParameter("event");
    String actionEvent=null;
    String headingLabel="View";
    
    if(event.equals(CreditApprovalAction.MAKER_DRAFT_CLOSE_PROCESS)){
        actionEvent="maker_confirm_draft_close";
        headingLabel="Close";
    }
    
 %>    <!-- InstanceBeginEditable name="doctitle" -->
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
    document.forms[0].action="credit_approval.do?event=<%=actionEvent%>";
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
function submitPage() {
    document.forms[0].event.value="<%=actionEvent%>";
    document.forms[0].submit();
}
//-->
    </script>
    <!-- InstanceEndEditable -->
</head>
<%


    OBCreditApprovalTrxValue creditApprovalTrxVal = (OBCreditApprovalTrxValue)request.getAttribute("creditApprovalTrxValue");
	OBCreditApproval oBCreditApproval = (OBCreditApproval) request.getAttribute("oBCreditApproval");
	pageContext.setAttribute("oBCreditApproval",oBCreditApproval);
	
		List regionList = (java.util.ArrayList) request.getAttribute("regionList");
	LabelValueBean lvBean = null;
    System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@==>"+regionList.size());
    String regionName = "";
    String regionId = "";
	Iterator it = regionList.iterator();

	while(it.hasNext())
	{
	lvBean = (LabelValueBean)it.next();
	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@==>"+lvBean.getValue()+":"+lvBean.getLabel());
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
			<input type="hidden" name="createBy" value="" />
			<input type="hidden" name="lastUpdateBy" value="" />
			<input type="hidden" name="deprecated" value="N" />
			<input type="hidden" name="status" value="Y" />


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
                    <td width="20%" class="fieldname" >Credit Approver Code</td>
                  <td width="20%" class="even"><span class="odd">
                       <%=oBCreditApproval.getApprovalCode() %>
                  </span></td>
                  
              <td width="20%" class="fieldname" > Name</td>
                  <td width="20%"><span class="odd">
                    <%=oBCreditApproval.getApprovalName() %>
                  </span></td>
                </tr>
              <tr class="odd">
                    <td width="20%" class="fieldname" >Minimum Limit (INR)</td>
                    <td width="20%" class="odd">

 						  <%=UIUtil.formatWithCommaAndDecimal(oBCreditApproval.getMinimumLimit().toString())%>
				   </td>
                    <td width="20%" class="fieldname">Maximum Limit (INR)
                   
                    </td>
                     <td width="20%" class="odd">
 						  <%=UIUtil.formatWithCommaAndDecimal(dft.format(oBCreditApproval.getMaximumLimit())) %>
				   </td>
                    
              	   
             </tr>
             <tr class="odd">
                    <td width="20%" class="fieldname"  >Segment</td>
                  	<td width="20%" class="even">                                 
                       <input type="hidden" name="segmentId" />
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
                     
                     if(oBCreditApproval.getSenior().equals("Y")){
                    
                     check = "checked";}
                     else
                     { 
                     check = "";
                     }%>
                      <input type=checkbox name="senior" disabled="disabled" <%=check%>>
                     <!--  <html:checkbox property="senior" disabled="true" value="<%=check%>"/>-->
                   </td>  
              	   <td width="20%" class="fieldname" >Risk<span class="style11"></span></td>
                   <td width="20%" class="even"><label>
                     <%
                     
                     if(oBCreditApproval.getRisk().equals("Y")){
                     check = "checked";}
                     else
                     { 
                     check = "";
                     }%>
                     <input type=checkbox name="risk" disabled="disabled" <%=check%>>
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
                    <td class="even"><%=regionName%></td>
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
           <%if(event.equals(CreditApprovalAction.CHECKER_VIEW_CREDIT_APPROVAL)||event.equals(CreditApprovalAction.CHECKER_VIEW_UPDATE_CREDIT_APPROVAL)) {%>
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
          <%}else if(event.equals(CreditApprovalAction.MAKER_DRAFT_CLOSE_PROCESS)) {%>
           <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
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
          <%} %>
     <!-- App -->
 <tr>
 	<table width="130" border="0" align="center" cellpadding="0" cellspacing="0"><tr>
 	<td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
  <%if(event.equals(CreditApprovalAction.CHECKER_VIEW_CREDIT_APPROVAL)||event.equals(CreditApprovalAction.CHECKER_VIEW_UPDATE_CREDIT_APPROVAL)) {%>
    <td><a href="javascript:approvePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <%}else if(event.equals(CreditApprovalAction.CHECKER_VIEW_APPROVED)||event.equals(CreditApprovalAction.CHECKER_VIEW_REJECTED)){ %>
   <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()"onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
  <%}else if(event.equals(CreditApprovalAction.MAKER_DRAFT_CLOSE_PROCESS)){%>
    <td valign="baseline" align="center">
    	<a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;
    </td>
    <td valign="baseline" align="center">
    	<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
   </td>
  <%}%>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</tr>                 
  <!-- End App -->
 

 </td></tr></table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
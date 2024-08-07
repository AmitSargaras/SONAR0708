<%@ page import="com.integrosys.cms.ui.feed.bond.item.BondItemAction,
                 com.integrosys.cms.ui.common.CurrencyList,com.integrosys.base.businfra.currency.ICurrency,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.ui.feed.bond.item.BondItemAction,com.integrosys.cms.ui.feed.bond.item.BondItemForm,java.util.List,com.integrosys.cms.ui.creditApproval.CreditApprovalAction" %>
<%@page import="com.integrosys.cms.app.creditApproval.bus.OBSegment,
com.integrosys.cms.app.creditApproval.trx.OBCreditApprovalTrxValue,
com.integrosys.cms.app.creditApproval.bus.OBCreditApproval,java.util.Iterator"%>
<%@page import="java.util.Iterator,com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="org.apache.struts.util.LabelValueBean,java.text.DecimalFormat,
				com.integrosys.cms.ui.common.UIUtil"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<%
String event = request.getParameter("event");
String returnEvent = "";
if(event.equals(CreditApprovalAction.MAKER_VIEW_CREDIT_APPROVAL_READ))
{
	returnEvent = CreditApprovalAction.EVENT_CHECKER_PREPARE_LIST;
}
else
{
	returnEvent = CreditApprovalAction.EVENT_PREPARE_LIST;
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
document.forms[0].submit();
}

function cancelForm() {
    document.forms[0].action = "credit_approval.do";
    document.forms[0].event.value = "<%=returnEvent%>";
    document.forms[0].submit();
}

//-->
    </script>
    <!-- InstanceEndEditable -->
</head>
<%
    DecimalFormat dft = new DecimalFormat("#0.00");
	OBCreditApproval oBCreditApproval = (OBCreditApproval) request.getAttribute("oBCreditApproval");
	OBCreditApprovalTrxValue creditApprovalTrxVal = (OBCreditApprovalTrxValue)request.getAttribute("creditApprovalTrxValue");
	
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
			<input type="hidden" name="createBy" value="<%=oBCreditApproval.getCreateBy()%>" />
			<input type="hidden" name="lastUpdateBy" value="<%=oBCreditApproval.getLastUpdateBy()%>" />
			<input type="hidden" name="deprecated" value="<%=oBCreditApproval.getDeprecated()%>" />
			<input type="hidden" name="status" value="<%=oBCreditApproval.getStatus()%>" />





			<table width="98%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection" align="center">

  <tr>
    <td width="100%">      
      <h3>Credit Approval Details</h3>
      <hr />
      
      <table class="tblInput" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">      
        <tbody>   
          <tr>            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput" id="backEdit2" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">     
                <tbody>
                  <tr class="even" >
                    <td width="20%" class="fieldname" >Approval Code</td>
                  <td width="20%" class="even"><span class="odd">
                       <%=oBCreditApproval.getApprovalCode() %>
                  </span></td>
                  
              <td width="20%" class="fieldname" > Name </td>
                  <td width="20%"><span class="odd">
                    <%=oBCreditApproval.getApprovalName() %>
                  </span></td>
                </tr>
              <tr class="odd">
                    <td width="20%" class="fieldname">Maximum Limit (INR)</span>
                   
                    </td>
                     <td width="20%" class="odd">

 						  <%=UIUtil.formatWithCommaAndDecimal(dft.format(oBCreditApproval.getMaximumLimit())) %>
				   </td>
                    
              	   <td width="20%" class="fieldname" >Minimum Limit (INR)</td>
                   <td width="20%" class="odd">

 						 <%=UIUtil.formatWithCommaAndDecimal(oBCreditApproval.getMinimumLimit().toString()) %>
				   </td>
             </tr>
             <tr class="odd">
                    <td width="20%" class="fieldname"  >Segment</td>
                  	<td width="20%" class="even">                                 
                       <input type="hidden" name="segmentId" value="<%=oBCreditApproval.getSegmentId()%>" />
					   <integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" entryCode="<%=oBCreditApproval.getSegmentId()%>" display="true" descWithCode="false" pleaseSelect="false"/>
                   </td>
             	   <td width="20%" class="fieldname"  >E-mail</td>
                   <td width="20%" class="odd">
				       <integro:empty-if-null value="<%=oBCreditApproval.getEmail() %>" />
			       </td>
            </tr>
            <tr class="even">
                   <td width="20%" class="fieldname">Senior<span class="style11"></span></td>
                   <td width="20%" class="even">
                     <%String checkValue;
                     if(oBCreditApproval.getSenior().equals("Y")){
                     checkValue = "";}
                     else
                     { checkValue = "false";}%>
                      <html:checkbox property="senior" disabled="true" value="<%=checkValue%>"/>
                   </td>  
              	   <td width="20%" class="fieldname" >Risk<span class="style11"></span></td>
                   <td width="20%" class="even"><label>
                     <%
                     if(oBCreditApproval.getRisk().equals("Y")){
                     checkValue = "";}
                     else
                     { checkValue = "false";}%>
                      <html:checkbox property="risk" disabled="true" value="<%=checkValue%>"/>
                      </label>
                  </td>
            </tr>   
            
            <%System.out.println("===============>"+oBCreditApproval.getDeferralPowers()); %>
            <%System.out.println("===============>"+oBCreditApproval.getWaivingPowers()); %>
            
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
                  
            

                  <tr><td></td></tr>
                    </tbody>
              </table>
                <br/> 
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
                   </tr> </td></tr></tbody>
      </table>
      <!--  -->
                       
      <!--  -->
      <!--            edited-->      <table width="170" border="0" align="center" cellpadding="0" cellspacing="0">

        <tr>
        <!-- 
            <td><a href="#" onClick="submitForm()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/submit2.gif',1)">
            <img src="img/submit1.gif" name="Image3" width="75"height="22" border="0" id="Image3"/></td>
            <td><a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image3" width="70"height="20" border="0" id="Image3"/></a></td>
           -->
            <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
<img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a>
            </td>
        </tr>
    </table></td> 
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>



</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
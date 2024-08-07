<%@ page import="java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                  com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositForm"%>
                 
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<%

FixedDepositForm customer = (FixedDepositForm) request.getAttribute("FixedDepositForm");
String index = (String) request.getAttribute("index");
String event = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositAction.event");
String baselSerial=(String)request.getAttribute("baselSerial");
if(baselSerial.equals("null"))
baselSerial="    -";
if( event == null )
event = (String) request.getAttribute("event");

if(index == null || index == "")
{
	index="0";
}

String cashId = (String)request.getAttribute("cashId");

String lienAmount=(String)request.getAttribute("lienAmount");
%>
<script language="JavaScript" type="text/JavaScript">

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

  function returnPage(name) {
	    document.forms[0].action = "FixedDeposit.do";
	    document.forms[0].event.value = name;
	    document.forms[0].submit();
	}
	
function saveOtherSystem(name) 
{	
	document.forms[0].action = "FixedDeposit.do";
    document.forms[0].event.value = name;
    document.forms[0].submit();
    
    //alert(document.getElementById("customerNameShort").value);
}

</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="FixedDeposit.do">
<body>
<input type="hidden" name="cashId" value="<%=request.getParameter("cashId")%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="65%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
           <tr>
    <td width="100%">      
      <h3>View Lien Details</h3>
      <hr />
     
      <table class="tblFormSection" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">      
        <tbody>   
          <tr>            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput" id="backEdit2" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">     
                <tbody>
                  <tr class="even" >
                 <td width="20%" class="fieldname" >Facility Name<span class="style11"></span>
                 </td>
                  <td width="20%">
                  <bean:write property="facilityName" name="FixedDepositForm"/>
				</td>
                 <td width="20%" class="fieldname" >Facility ID<span class="style11"></span>
                 </td>
                  <td width="20%">
                  <bean:write property="facilityId" name="FixedDepositForm"/>
				</td>
                </tr>                
                  <tr class="even" >
                 <td width="20%" class="fieldname" >Line No.<font color="red">*</font><span class="style11"></span>
                 </td>
                  <td width="20%">
                  <bean:write property="lienNo" name="FixedDepositForm"/>
								
								</td>
                  <%--<td><bean:write name="FixedDepositForm" property="fdLinePercentage"/>&nbsp;</td>
              --%><td width="20%" class="fieldname" >Lien Amount<font color="red">*</font><span class="style11"></span></td>
                  <td width="20%"><!--<bean:write property="lienAmount" name="FixedDepositForm"></bean:write>-->
                  <html:text property="lienAmount" value="<%=UIUtil.formatWithCommaAndDecimal(lienAmount) %>" readonly="true" />&nbsp;
								
								
								
								</td>
                </tr>
                 <tr class="even" >
                 <td width="20%" class="fieldname" >Serial No.<font color="red">*</font><span class="style11"></span>
                 </td>
                  <td width="20%">
                  <bean:write property="serialNo" name="FixedDepositForm"/>
				</td>
				<td width="20%" class="fieldname" >LCN No.<span class="style11"></span>
                 </td>
                  <td width="20%">
                  <bean:write property="lcnNo" name="FixedDepositForm"/>
				</td>
								</tr>
								<tr>
               	<td width="20%" class="fieldname" ><span><bean:message key="label.security.asset.description"/></span>&nbsp; </td>
                  <td width="20%">
                  <%String strRemark = "";
                  strRemark = customer.getRemark().equals("null")?"":customer.getRemark();
                  %>
                  &nbsp;<integro:empty-if-null value="<%=strRemark %>"/>
						</td>
                </tr>
                <tr  class="even">
                <td width="20%" class="fieldname" >Basel Serial No.<span class="style11"></span>
                 </td>
                 <td width="20%"><input type="text" value="<%= baselSerial %>" disabled="disabled"/></td>
                </tr>
        </table>
      </td>
    </tr>
    </tbody></table>
    

<%--@ include file="/customer/view_credit_rating.jsp"--%>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>    
   <%if(event.equals("view_lien")){ %>  
      <td align="center">     		
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('read')"/></a>	        	
      </td> 
      	
      	<%} %>
  </tr>
 
</table>
</td></tr></table>
</td></tr></thead></table>
<!-- InstanceEndEditable -->
</body>
<html:hidden name="FixedDepositForm" property="cashDepositID" />
	<html:hidden name="FixedDepositForm"property="depCurr"  />
	<html:hidden name="FixedDepositForm" property="depAmt" />
	<html:hidden name="FixedDepositForm" property="depMatDate" />
	<html:hidden name="FixedDepositForm" property="depNo" />
	<html:hidden name="FixedDepositForm" property="depositRefNo" />
	<html:hidden name="FixedDepositForm" property="depositReceiptNo" />
    <html:hidden name="FixedDepositForm" property="accountType" />
	<html:hidden name="FixedDepositForm" property="fdrRate" />
	<html:hidden name="FixedDepositForm" property="issueDate" />
	<html:hidden name="FixedDepositForm" property="thirdPartyBank" />
	<html:hidden name="FixedDepositForm" property="accountTypeValue" />
	<html:hidden name="FixedDepositForm" property="accountTypeNum" />
	<html:hidden name="FixedDepositForm" property="tenure" />
	<html:hidden name="FixedDepositForm" property="tenureUOM" />
	<html:hidden name="FixedDepositForm" property="ownBank" />
	<html:hidden name="FixedDepositForm" property="groupAccountNumber" />
	<html:hidden name="FixedDepositForm" property="holdStatus" />
	<%--<html:hidden name="FixedDepositForm" property="fdLinePercentage" />
	--%><html:hidden name="FixedDepositForm" property="depositeInterestRate" />
	<html:hidden name="FixedDepositForm" property="verificationDate" />
	<html:hidden name="FixedDepositForm" property="depositorName" />
	<html:hidden name="FixedDepositForm" property="lienNo" />
	<html:hidden name="FixedDepositForm" property="lienAmount" />
	<html:hidden name="FixedDepositForm" property="index" />
	<html:hidden name="FixedDepositForm" property="remark" />
	<html:hidden name="FixedDepositForm" property="serialNo" />
	<html:hidden name="FixedDepositForm" property="systemName" />
			<html:hidden name="FixedDepositForm" property="systemId" />
			<html:hidden name="FixedDepositForm" property="customerId" />
			<html:hidden name="FixedDepositForm" property="finwareId" />
			<html:hidden name="FixedDepositForm" property="active" />
	<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
	<input type="hidden" name="from_event" value="<%=request.getParameter("from_event")%>"/>
	<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
	<html:hidden name="FixedDepositForm" property="fdWebServiceFlag" />		
	<html:hidden property="event"></html:hidden>
	
	
</html:form>

<!-- InstanceEnd -->
</html>

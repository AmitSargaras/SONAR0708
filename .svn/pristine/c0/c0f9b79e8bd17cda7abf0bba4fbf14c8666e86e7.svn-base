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
<script type="text/javascript" src="js/validation.js"></script>
<%

//FixedDepositForm customer = (FixedDepositForm) request.getAttribute("FixedDepositForm");
String index = (String) request.getAttribute("index");
String event = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositAction.event");
String baselSerial=(String)request.getAttribute("baselSerial");
if(null != baselSerial){
if(baselSerial.equals("null"))
baselSerial="    -";
}
if( event == null )
event = (String) request.getAttribute("event");

if(index == null || index == "")
{
	index="0";
}
List line = (List)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.line");
pageContext.setAttribute("line",line);

List facilityNameList=(List) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.facilityNameList");
pageContext.setAttribute("facilityNameList",facilityNameList);

List facilityIdList = (List) request.getAttribute("facilityIdList"); 
pageContext.setAttribute("facilityIdList", facilityIdList); 

String collateralID = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.collateralID");
pageContext.setAttribute("collateralID", collateralID);

String context = request.getContextPath() + "/";

String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

String lienAmount=(String)request.getAttribute("lienAmount");
String facId=(String)request.getAttribute("facilityId");
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

function refreshFacilityIdList(dropdown) {
    var curSel = "";
    var custID = '<%=collateralID%>';
   	for(i=0; i < dropdown.options.length; i++)   {
        if (dropdown.options[i].selected == true) {
            curSel = dropdown.options[i].value;
        }
    }  
    var dep = 'facilityId';
    var url = '/cms/FixedDeposit.do?event=refresh_facility_id&facilityName='+curSel+'&partyId='+custID;
    sendLoadDropdownReq(dep, url);
}

</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="FixedDeposit.do">
<body>


<!-- InstanceBeginEditable name="Content" -->
<table width="65%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
           <tr>
    <td width="100%">      
      <h3>Edit Lien Details</h3>
      <hr />
     
      <table class="tblFormSection" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">      
        <tbody>   
          <tr>            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput" id="backEdit2" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">     
                <tbody>
                                <tr class="even" >
                 <td width="20%" class="fieldname" >Facility Name<span class="style11"></span></td>
                  <td width="20%">
						<html:select property="facilityName" onchange="javascript:refreshFacilityIdList(this);">
						    <option value="">Please Select</option>
							<html:options collection="facilityNameList" labelProperty="label" property="value" />
					</html:select>	
								<br><html:errors property="facilityName"/>
								</td>
                  
              
                 <td width="20%" class="fieldname" >Facility Id<span class="style11"></span></td>
                  <td width="20%">
                  <%
                  if(event.equals("refresh_facility_id")){%>
 						<html:select property="facilityId" >
						    <html:option value="">Please Select</html:option>
 							<html:options name="facilityIdList" />
						
					</html:select>	
					<%}else{%>
					<html:select property="facilityId" >
						    <html:option value="">Please Select</html:option>
						    <html:option value="<%=facId %>"/>
 																			
					</html:select>
					<%} %>
								<br><html:errors property="facilityId"/>						
								
								</td>
                </tr>
                  <tr class="even" >
                 <td width="20%" class="fieldname" >Line No.<font color="red">*</font><span class="style11"></span></td>
                  <td width="20%"><%--<html:text property="lienNo" size="15"
								maxlength="10"></html:text>&nbsp;
								<br><html:errors property="lienNo"/>
							--%>	
							<html:select property="lienNo" >
						    <option value="">Please Select</option>
							<html:options collection="line" labelProperty="label" property="value" />
					</html:select>	
								<br><html:errors property="lienNo"/>
								
								</td>
                  
              <td width="20%" class="fieldname" >Lien Amount <font color="red">*</font><span class="style11"></span></td>
                  <td width="20%"><html:text property="lienAmount" 
								maxlength="16" size="24" styleId="lienAmount" value="<%=lienAmount%>" onblur="javascript:formatAmountAsCommaSeparated(this)" ></html:text>&nbsp;
								<br><html:errors property="lienAmount"/>
								
								
								</td>
                </tr>
                
                <tr class="odd">
	        <td width="20%" class="fieldname" >Serial No.<font color="red">*</font><span class="style11"></span></td>
                  <td width="20%"><html:text property="serialNo" size="10"
								maxlength="30"></html:text>&nbsp;
								<br><html:errors property="serialNo"/>
								</td>
								<td width="20%" class="fieldname" >LCN No.</td>
								<td width="20%"><html:text property="lcnNo" size="2"
								maxlength="10"></html:text>&nbsp;
								<html:errors property="lcnNo"/>	</td>
	        </tr>
                
                 <tr class="odd">
	                <td class="fieldname">
						<span><bean:message key="label.security.asset.description"/></span>&nbsp; </td>
	                <td colspan="3">
	                    <html:textarea  property="remark" rows="3" style="width:100%"  onkeyup="limitTextInput(this,100,'Remark ')"/>
	                    <html:errors property="remark"/></td>
	        </tr>
	        <tr>
	        	<td width="20%" class="fieldname" >Basel Serial No.</td>
								<td width="20%"><input type="text" value="<%= baselSerial %>" disabled="disabled" /></td>
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
   <%if(event.equals("edit_lien")){ %>  
      <td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/edit1.gif',1)">
     		<img src="img/edit1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('edit_conf_lien')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('display_lien_details')"/></a>	        	
      </td>
      	<%}else if(event.equals("add_lien_in_edit")){ %>
      	<td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('save_lien_in_edit')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('edit_lien_details')"/></a>	        	
      </td>
      	
      	 	<%}else if(event.equals("add_lien_in_resubmit")){ %>
      	<td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('save_lien_in_resubmit')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('process_lien_details')"/></a>	        	
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
	<html:hidden name="FixedDepositForm" property="serialNo" />
			<html:hidden name="FixedDepositForm" property="remark" />
			<html:hidden name="FixedDepositForm" property="systemName" />
			<html:hidden name="FixedDepositForm" property="systemId" />
			<html:hidden name="FixedDepositForm" property="customerId" />
			<html:hidden name="FixedDepositForm" property="finwareId" />
			<html:hidden name="FixedDepositForm" property="active" />
			<html:hidden name="FixedDepositForm" property="facilityName" />
			<html:hidden name="FixedDepositForm" property="facilityId" />
			<html:hidden name="FixedDepositForm" property="lcnNo" />
	<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>	
	<input type="hidden" name="newEvent" value="<%=request.getParameter("newEvent")%>"/>
	<input type="hidden" name="baselSerial" value="<%=request.getParameter("baselSerial")%>"/>
	<input type="hidden" name="radioSelect" value="<%=request.getParameter("radioSelect")%>"/>
	<html:hidden name="FixedDepositForm" property="fdWebServiceFlag" />
	<html:hidden name="FixedDepositForm" property="depositRecNoInSearch" /><!--Uma Khot: Added to cpture FD details manully when fd no is other than FC. -->
	<html:hidden property="event"></html:hidden>
	
	
</html:form>

<!-- InstanceEnd -->
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.IInsuranceGCTrxValue,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.cms.ui.collateral.MaintainInsuranceGCForm, java.util.Date" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MaintainInsuranceGCForm insuranceForm = (MaintainInsuranceGCForm) request.getAttribute("MaintainInsuranceGCForm");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String dp=(String)request.getAttribute("calculatedDP");
OBInsuranceGC insuranceObj = (OBInsuranceGC) request.getAttribute("insuranceObj");

List deferCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.deferCreditApproverList");
if(deferCreditApproverList!=null){
	pageContext.setAttribute("deferCreditApproverList",deferCreditApproverList);
}

String calculatedDP = (String) request.getAttribute("calculatedDP");
String fundedShare = (String) request.getAttribute("fundedShare");
String dueDate = (String) request.getAttribute("dueDate");
String insuranceStatusRadio = (String) request.getAttribute("insuranceStatusRadio");
String dpCalculateManually = (String) request.getAttribute("dpCalculateManually");
String stockdocMonth = (String) request.getAttribute("stockdocMonth");
String stockdocYear = (String) request.getAttribute("stockdocYear");

String migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
String totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");


System.out.println("maker_create_insgc_deferred.jsp   stockdocMonth:"+stockdocMonth+"  stockdocYear:"+stockdocYear);

System.out.println("insuranceStatusRadio:"+insuranceStatusRadio);
%>



<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.insurancecoverage.bus.OBInsuranceCoverage"%>

<%@page import="com.integrosys.cms.ui.collateral.IInsuranceGCDao"%>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="JavaScript" type="text/JavaScript">

function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}

function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}



function submitForm() {

	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_submit_insurance_deferred&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&dpCalculateManually=<%=dpCalculateManually%>';
    document.forms[0].submit();
}
function cancleForm() {

	
 	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_cancle_submit_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&dpCalculateManually=<%=dpCalculateManually%>';
    document.forms[0].submit();
}



</script>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>



<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

</head>

<body>
<html:form action="AssetInsuranceCollateral.do" >
<input type="hidden" name="calculatedDP" value="<%=calculatedDP %>"></input>
<input type="hidden" name="fundedShare" value="<%=fundedShare %>"></input>
<input type="hidden" name="dueDate" value="<%=dueDate %>"></input>
<input type="hidden" name="stockdocMonth" value="<%=stockdocMonth %>"></input>
<input type="hidden" name="stockdocYear" value="<%=stockdocYear %>"></input>

<input type="hidden" name="migrationFlag" value="<%=migrationFlag %>"></input>
<input type="hidden" name="totalLonable" value="<%=totalLonable %>"></input>

<input type="hidden" name="insuranceStatusRadio" value="<%=insuranceStatusRadio %>"></input>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

  <thead>
  <tr><td align="right"><font color="red">*</font>Mandatory</td>
  </tr>
  <tr>
      <td><h3>Add Insurance - Deferred </h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" id="choiceTable">
          
          <%
        	    int rowIdx = 0;
				Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
            %>
          <tbody>
               
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.originaltarget.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <%DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
                 String originalTargetDate="";
                 String dateDeferred=df.format(new Date());
                 String nextDueDate="";
                
                 if(insuranceObj!= null){
                	  if(insuranceObj.getOriginalTargetDate()!=null && (!"".equals(insuranceObj.getOriginalTargetDate()))){
                          originalTargetDate=df.format(insuranceObj.getOriginalTargetDate());
                	    }
                	  if(insuranceObj.getDateDeferred()!=null && (!"".equals(insuranceObj.getDateDeferred()))){
                              dateDeferred=df.format(insuranceObj.getDateDeferred());
                    	 }
                	  if(insuranceObj.getNextDueDate()!=null && (!"".equals(insuranceObj.getNextDueDate()))){
                          nextDueDate=df.format(insuranceObj.getNextDueDate());
                	    }
                  } %>
                  <% if(insuranceObj== null){%>
                <html:text property="originalTargetDate" maxlength="30" readonly="true" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('originalTargetDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			      <%}else{ %>       
			          <html:text property="originalTargetDate" maxlength="30" readonly="true" value="<%=originalTargetDate %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('originalTargetDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp; 
			        <%} %>     
			               <br><html:errors property="originalTargetDateError"/> 
                </td>
                 <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.deferred.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                
                  <% if(insuranceObj== null){%>
                <html:text property="dateDeferred" maxlength="30" readonly="true" value="<%=dateDeferred %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('dateDeferred', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			      <%}else{ %>       
			          <html:text property="dateDeferred" maxlength="30" readonly="true" value="<%=dateDeferred %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('dateDeferred', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp; 
			        <%} %>     
			               <br><html:errors property="dateDeferredError"/> 
                </td>
              </tr>
            
             <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.nextdue.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <% if(insuranceObj== null){%>
                <html:text property="nextDueDate" maxlength="30" readonly="true" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('nextDueDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			      <%}else{ %>       
			          <html:text property="nextDueDate" maxlength="30" readonly="true" value="<%=nextDueDate %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('nextDueDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp; 
			        <%} %>     
			               <br><html:errors property="nextDueDateError"/> 
                </td>
                 <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.credit.approver" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <html:select property="creditApprover"  >
						<option value="">Please Select</option>
						<html:options collection="deferCreditApproverList" labelProperty="label" property="value" />
				</html:select>   
			               <br><html:errors property="creditApproverError"/> 
                </td>
              </tr>
          </tbody>
        </table> </td>
  </tr>
  <input type="hidden" name="insuranceRequired"></input>
  <html:hidden property="appendedComponent"/>
<html:hidden name="MaintainInsuranceGCForm"  property="parentId"  value="<%=itrxValue.getReferenceID()%>"/> 
<html:hidden name="MaintainInsuranceGCForm" property="isProcessed" value="N"/>
<html:hidden name="MaintainInsuranceGCForm" property="deprecated" value="N"/>
<html:hidden property="insuranceStatus"  value="PENDING_DEFER"/>
  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
  <td colspan="4">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"
							onClick=" submitForm()"><img src="img/ok1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
			
			<td colspan="4">
						
							<a href="#;"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0" onclick="cancleForm()"
									id="Image4411" />
							</a>
						
						&nbsp;&nbsp;
					</td>
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
</body>
</html>
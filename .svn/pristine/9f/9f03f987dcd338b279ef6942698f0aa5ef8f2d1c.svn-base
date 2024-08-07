<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC,
					com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
					com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,com.integrosys.cms.app.transaction.OBTrxContext,java.util.Date" %>    
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
OBInsuranceGC insuranceObj = (OBInsuranceGC) request.getAttribute("insuranceObj");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.serviceColObj");

List companyList = (List) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.insuranceCoverageList");
String dp=(String)request.getAttribute("calculatedDP");
String event=(String)request.getAttribute("event");
String trxID=(String)request.getAttribute("trxID");
if("null".equals(trxID)){
	trxID=itrxValue.getTransactionID();
}

List deferCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.deferCreditApproverList");

HashMap actualMap = (HashMap) request.getAttribute("actualMap");
HashMap stageMap = (HashMap) request.getAttribute("stageMap");

System.out.println("/////////////////**********************  actualMap "+actualMap);

System.out.println("/////////////////**********************  stageMap "+stageMap);

String dueDate=(String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dueDate");

pageContext.setAttribute("companyList", companyList);
OBInsuranceGC actualInsurance = new OBInsuranceGC();
for(int i = 0;i<actualMap.size();i++){
if(insuranceObj.getInsuranceCode()!=null){
	actualInsurance = (OBInsuranceGC)actualMap.get(insuranceObj.getInsuranceCode());
}
}
OBInsuranceGC stageInsurance = (OBInsuranceGC) request.getAttribute("insuranceObj");

System.out.println("/////////////////**********************  actualInsurance "+actualInsurance);
System.out.println("/////////////////**********************  stageInsurance "+stageInsurance);
OBInsuranceGC actualIns=(OBInsuranceGC)request.getAttribute("actualObj");

boolean isMaker= false;
boolean isChecker= false;
ICommonUser user1 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user1.getTeamTypeMembership().getMembershipID()==1006){
	isMaker=true;
}else {
	isChecker=true;
}

String from_page=(String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.from_page");
System.out.println(" from_page:"+from_page+" event:"+event+" isMaker:"+isMaker);

IGeneralCharge iColActual = (IGeneralCharge) itrxValue.getCollateral();
String	viewPath =	"RecurrentDocReceipt.do?event=read&dueDate=" + dueDate + "&collateralID=" + iColActual.getCollateralID() + "&from=" + CollateralAction.READ_SECURITIES_2;

/*OBTrxContext theOBTrxContext=(OBTrxContext)request.getAttribute("theOBTrxContext");
System.out.println("/////////////////**********************  ID "+theOBTrxContext);
long customerID=theOBTrxContext.getCustomer().getCustomerID();*/

%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.MaintainInsuranceGCForm"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="JavaScript" type="text/JavaScript">

function cancelPage(){
	
    document.forms[0].action="<%=viewPath%>";
    document.forms[0].submit();
}

</script>


</head>
<body>
<html:form action="AssetInsuranceCollateral.do">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>

  <tr>
      <td><h3>View Insurance - Deferred</h3></td>
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
                 String dateDeferred="";
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
                     
              }%>
                  <integro:empty-if-null value="<%=originalTargetDate %>"/>&nbsp;
                </td>
                  <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.deferred.date" /><font color="#FF0000">*</font></td>
                <td width="30%">  <integro:empty-if-null value="<%=dateDeferred %>"/>&nbsp;
                </td>
              </tr>
              <tr class="odd">
                 <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.nextdue.date" /><font color="#FF0000">*</font></td>
                <td width="30%"> <integro:empty-if-null value="<%=nextDueDate %>"/>&nbsp;
                </td>
               <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.credit.approver" /><font color="#FF0000">*</font></td>
                <td width="30%">
                   <%
           			if(deferCreditApproverList!=null){
        			for(int a=0; a<deferCreditApproverList.size();a++){   
          			 LabelValueBean bean=(LabelValueBean) deferCreditApproverList.get(a);
           			if(bean.getValue()!=null){
          			 if(bean.getValue().trim().equals(insuranceObj.getCreditApprover())){
          		
          				%>	 
          				 <integro:empty-if-null value="<%=bean.getLabel()%>"/>
          			<% 
          	 		}
          	 		}          
        		}
        		} %> 
                </td>
            	</tr>
          
          </tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>
<br/><br/>
<table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInput" align="center">
<tr class="even">
<td class="fieldname" width="20%">Edited By</td>
<%if(actualIns != null && actualIns.getLastUpdatedBy()!=null ){ %>
<td width="30%"><%=actualIns.getLastUpdatedBy() %></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
<td class="fieldname" width="20%">Last Approved By</td>
<%if(actualIns != null && actualIns.getLastApproveBy()!=null ){ %>
<td width="30%"><%=actualIns.getLastApproveBy() %></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
</tr>
<tr class="even">
<td class="fieldname" width="20%">Edited On</td>
<%if(actualIns != null && actualIns.getLastUpdatedOn()!=null ){ %>
<td width="30%"><%=actualIns.getLastUpdatedOn()%></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
<td class="fieldname" width="20%">Last Approved On</td>
<%if(actualIns != null && actualIns.getLastApproveOn()!=null ){ %>
<td width="30%"><%=actualIns.getLastApproveOn()%></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
</tr>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
 <td colspan="4">
		
				<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
				</center>
						
						&nbsp;
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
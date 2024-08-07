<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC,
					com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,com.integrosys.cms.app.transaction.OBTrxContext,java.util.Date" %>    
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MaintainInsuranceGCForm insuranceObj = (MaintainInsuranceGCForm) request.getAttribute("MaintainInsuranceGCForm");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

List companyList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
String dp=(String)request.getAttribute("calculatedDP");

String migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
String totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");

String event=(String)request.getAttribute("event");
String trxID=(String)request.getAttribute("trxID");
if("null".equals(trxID)){
	trxID=itrxValue.getTransactionID();
}

HashMap actualMap = (HashMap) request.getAttribute("actualMap");
HashMap stageMap = (HashMap) request.getAttribute("stageMap");

System.out.println("/////////////////**********************  actualMap "+actualMap);

System.out.println("/////////////////**********************  stageMap "+stageMap);

String dueDate=(String)request.getAttribute("dueDate");

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
if(actualIns!=null){
System.out.println("/////////////////**********************  actualIns.getLastUpdatedBy "+actualIns.getLastUpdatedBy());
System.out.println("/////////////////**********************  actualIns.getLastUpdatedOnStr() "+actualIns.getLastUpdatedOn());
}
System.out.println("/////////////////**********************  insuranceObj.getLastUpdatedBy "+insuranceObj.getLastUpdatedBy());
System.out.println("/////////////////**********************  insuranceObj.getLastUpdatedOnStr() "+insuranceObj.getLastUpdatedOnStr());
boolean isMaker= false;
boolean isChecker= false;
ICommonUser user1 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user1.getTeamTypeMembership().getMembershipID()==1006){
	isMaker=true;
}else {
	isChecker=true;
}

String from_page=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
System.out.println(" from_page:"+from_page+" event:"+event+" isMaker:"+isMaker);

/*OBTrxContext theOBTrxContext=(OBTrxContext)request.getAttribute("theOBTrxContext");
System.out.println("/////////////////**********************  ID "+theOBTrxContext);
long customerID=theOBTrxContext.getCustomer().getCustomerID();*/

%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
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
function cancelPageMakerView(){
	document.forms[0].action="AssetGenChargeCollateral.do?event=read&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
	document.forms[0].submit();
}

function cancelPage(){
	//alert("cancel");
		document.forms[0].action='AssetInsuranceCollateral.do?event=maker_edit_cancle_insstatus&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>';
	    document.forms[0].submit();
 }

function cancelPage1(){
	//alert("cancel");
		document.forms[0].action="CollateralRedirect.do?event=process&trxID=<%=trxID%>&calculatedDP=<%=dp%>&dueDate=<%=dueDate%>";
	    document.forms[0].submit();
 }

function cancelPage2(){
	//alert("cancel");
		document.forms[0].action="CollateralRedirect.do?event=prepare_close&collateralID=<%=itrxValue.getReferenceID()%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
	    document.forms[0].submit();
 }

function cancelPage3(){
	
	document.forms[0].action="AssetGenChargeCollateral.do?event=prepare_close&collateralID=<%=itrxValue.getReferenceID()%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
	document.forms[0].submit();
}

function cancelPage4(){
document.forms[0].action="AssetGenChargeCollateral.do?event=read&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
document.forms[0].submit();
}

function cancelPage1(){
	//alert("cancel");
		document.forms[0].action="CollateralRedirect.do?event=process&trxID=<%=trxID%>&calculatedDP=<%=dp%>&dueDate=<%=dueDate%>";
	    document.forms[0].submit();
 }
</script>


</head>
<body>
<html:form action="AssetInsuranceCollateral.do">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
<input type="hidden" name="migrationFlag" value="<%=migrationFlag %>"></input>
<input type="hidden" name="totalLonable" value="<%=totalLonable %>"></input>
  <tr>
      <td><h3>View Insurance - Received</h3></td>
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
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.num" /><font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsurancePolicyNo() %>"/>&nbsp;
                </td>
                 <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.cover.note" /></td>
                <td width="30%">
                 <integro:empty-if-null value="<%=insuranceObj.getCoverNoteNo() %>"/>&nbsp;
                </td>
              </tr>
              
              <tr class="even"">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.company.name" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <%
                               	LabelValueBean company = new LabelValueBean();
                               			for (int k = 0; k < companyList.size(); k++) {
                               				LabelValueBean lvb = (LabelValueBean) companyList
                               						.get(k);
                               				if (lvb.getValue().equals(insuranceObj.getInsuranceCompany())) {
                               					company.setLabel(lvb.getLabel());
                               				}
                               			}
                               %><integro:empty-if-null value="<%=company.getLabel() %>"/>&nbsp;                 
               </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.currency" /><font color="#FF0000">*</font></td>
                <td width="30%">
                
                <integro:empty-if-null value="<%=insuranceObj.getInsuranceCurrency() %>"/>&nbsp;              
                </td>
                
              </tr> 
              
              <tr class="even">
              <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.type.perils1" /><font color="#FF0000">*</font></td>
              <td width="30%">
              <integro:common-code-single categoryCode="<%=CategoryCodeConstant.INSURANCE_COMPANY_CATEGORY %>" entryCode="<%=insuranceObj.getInsuranceCoverge()%>" display="true" descWithCode="false" />&nbsp;
               </td>
               <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurable.amt.policy" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsurancePolicyAmt()) %>"/>&nbsp;
                 </td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.amt" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsuredAmount()) %>"/>&nbsp;
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.received.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <%DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
                 String receivedDate="";
                 String effectiveDate="";
                 String expiryDate="";
                
                 if(insuranceObj!= null){
                	 
                	 if(insuranceObj.getReceivedDate()!=null && (!"".equals(insuranceObj.getReceivedDate()))){
                          receivedDate=df.format(df.parse(insuranceObj.getReceivedDate()));
                	    }
                     if(insuranceObj.getEffectiveDate()!=null && (!"".equals(insuranceObj.getEffectiveDate()))){
                          effectiveDate=df.format(df.parse(insuranceObj.getEffectiveDate()));
                	    }
                     if(insuranceObj.getExpiryDate()!=null && (!"".equals(insuranceObj.getExpiryDate()))){
                          expiryDate=df.format(df.parse(insuranceObj.getExpiryDate()));
                        }
              }%>
                  <integro:empty-if-null value="<%=receivedDate %>"/>&nbsp;
                </td>
              </tr>
             <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.effective.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                <integro:empty-if-null value="<%=effectiveDate %>"/>&nbsp;      
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.expiry.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <integro:empty-if-null value="<%=expiryDate %>"/>&nbsp;            
                </td>
              </tr>
              
               <tr class="even">
               <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.premium" /><font color="#FF0000">*</font></td>
                <td width="30%">
                <integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsurancePremium()) %>"/>&nbsp;
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.insurance.defaulted" /></td>
               	<td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsuranceDefaulted() %>"/>&nbsp;
                </td>
               
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.addr" /></td>
                <td colspan="3"><integro:empty-if-null value="<%=insuranceObj.getInsuredAddress() %>"/>&nbsp;</td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.remark1" /></td>
                <td colspan="3">
               <integro:empty-if-null value="<%=insuranceObj.getRemark() %>"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.remark2" /></td>
               <td colspan="3">
                <integro:empty-if-null value="<%=insuranceObj.getRemark2() %>"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.against" /></td>
                 <td colspan="3">
				<integro:empty-if-null value="<%=insuranceObj.getInsuredAgainst() %>"/>&nbsp;
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

<%if(from_page.equalsIgnoreCase("process")){
	if(insuranceObj != null && insuranceObj.getLastUpdatedBy()!=null ){ %>
<td width="30%"><%=insuranceObj.getLastUpdatedBy() %></td>
<%}else{ %>
<td width="30%">-</td>
<%}
	} else{ 
	if(actualIns != null && actualIns.getLastUpdatedBy()!=null ){ %>
<td width="30%"><%=actualIns.getLastUpdatedBy() %></td>
<%}else{ %>
<td width="30%">-</td>
<%}} %>
<td class="fieldname" width="20%">Last Approved By</td>
<%if(actualIns != null && actualIns.getLastApproveBy()!=null ){ %>
<td width="30%"><%=actualIns.getLastApproveBy() %></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
</tr>
<tr class="even">
<td class="fieldname" width="20%">Edited On</td>
<%if(from_page.equalsIgnoreCase("process")){
	if(insuranceObj != null && insuranceObj.getLastUpdatedOnStr()!=null ){ %>
<td width="30%"><%=insuranceObj.getLastUpdatedOnStr() %></td>
<%}else{ %>
<td width="30%">-</td>
<%}
	} else{ 
if(actualIns != null && actualIns.getLastUpdatedOn()!=null ){ %>
<td width="30%"><%=actualIns.getLastUpdatedOn()%></td>
<%}else{ %>
<td width="30%">-</td>
<%}} %>
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
 <% if(isMaker){%>
 <td colspan="4">
		
	<%	if(event.equals("maker_view_insurance_received")){%>		
				<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						<%}else if(event.equals("checker_view_insurance_received") && "prepare_close".equals(from_page)){ %>
						<center>
							<a href="javascript:cancelPage3();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						<%} else if(event.equals("checker_view_insurance_received")){%>		
							<center>
							<a href="javascript:cancelPageMakerView();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						 <%-- <%}else if (event.equals("maker_view_ins_edit")){%>
						<center>
							<a href="javascript:submitPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
							</center><%}else if (event.equals("maker_view_ins_track")){%>
						<center>
							<a href="javascript:cancelPage3();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center> --%>
						
						<%} %>
						&nbsp;
					</td>
					<%} %>
					
	<% if(isChecker){%>
 <td colspan="4">
  				<%if(event.equals("checker_view_insurance_received") && "read".equals(from_page)){ %>
					<center><a href="javascript:cancelPage4();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
					</center>
					<%} else if(event.equals("checker_view_insurance_received") && "process".equals(from_page)){ %>
					<center><a href="javascript:cancelPage1();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
					</center>
					<%} else if(event.equals("checker_view_insurance_received") ){ %>
					<center><a href="javascript:cancelPageMakerView();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
					</center>
					<%}else if(event.equals("maker_view_insurance_received")  && ("maker_cancle_create_insurance".equals(from_page) || "prepare_update".equals(from_page) || "maker_return_from_submit_insurance".equals(from_page) || "return_from_due_date_and_stock".equals(from_page))){ %>
					<center><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
					</center>
					<%}} %>
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
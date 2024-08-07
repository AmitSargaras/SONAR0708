<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="com.crystaldecisions.celib.properties.n"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.integrosys.base.businfra.contact.IAddress,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.common.Constants,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
                 com.integrosys.cms.ui.collateral.insurancepolicy.InsurancePolicyForm,
                 com.integrosys.cms.ui.collateral.InsuranceTypeList,
                 com.integrosys.cms.ui.collateral.InsurerNameList,
                 com.integrosys.cms.ui.common.UIUtil,
                 org.apache.commons.lang.StringUtils,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CollateralAction" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
String indexID = (String) request.getParameter("indexID");

InsurancePolicyForm aForm = (InsurancePolicyForm) request.getAttribute(formStr);

String subType = request.getParameter("subtype");
System.out.println("subtype::::::::::::::"+subType);

List waiverCreditApproverList = new ArrayList();
List companyList= new ArrayList();
if("PropCommGeneral".equals(subType))
{
	waiverCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.waiverCreditApproverList");
	companyList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList");
	pageContext.setAttribute("companyList",companyList);
}
else if(prefix.equals("Asset"))
{
	waiverCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.waiverCreditApproverList");
	companyList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
	pageContext.setAttribute("companyList",companyList);
}
else if(prefix.equals("Others"))
{
	waiverCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.waiverCreditApproverList");
	companyList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList");
	pageContext.setAttribute("companyList",companyList);
}

String trxID=(String)request.getAttribute("trxID");
if(null == trxID){
	trxID=itrxValue.getTransactionID();
	
}

HashMap insuranceCoverageMap = new HashMap();
if(prefix.equals("Property"))
{
	insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageMap");
}
else if(prefix.equals("Asset"))
{
	insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageMap");
}
else if(prefix.equals("Others"))
{
	insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageMap");
}

boolean isMaker= false;
boolean isChecker= false;
ICommonUser user1 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user1.getTeamTypeMembership().getMembershipID()==1006 || user1.getTeamTypeMembership().getMembershipID()==1001
	|| user1.getTeamTypeMembership().getMembershipID()==1034){
	isMaker=true;
}else {
	isChecker=true;
}

String event=(String)request.getAttribute("event");

String from_event=(String)request.getAttribute("from_event");
System.out.println("from_event:"+from_event);
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
function cancelPageMakerView1(){
	document.forms[0].action="<%=actionNameStr%>?event=read_return&from_event=<%=from_event%>";
	document.forms[0].submit();
}

function cancelPageMakerView(){
	document.forms[0].action="<%=actionNameStr%>?event=read";
	document.forms[0].submit();
}

function cancelPage(){
	//alert("cancel");
		document.forms[0].action='<%=actionNameStr%>?event=maker_edit_cancle_insstatus';
	    document.forms[0].submit();
 }

function cancelPage1(){
	//alert("cancel");
		document.forms[0].action="CollateralRedirect.do?event=process&trxID=<%=trxID%>";
	    document.forms[0].submit();
 }

function cancelPage2(){
	//alert("cancel");
		document.forms[0].action='<%=actionNameStr%>?event=prepare_close';
	    document.forms[0].submit();
 }
function cancelPage4(){
	document.forms[0].action="<%=subType%>Collateral.do?event=read&collateralID=<%=itrxValue.getReferenceID()%>";
	document.forms[0].submit();
	}
</script>


</head>
<body>
<html:form action="<%=actionNameStr%>">
<input type="hidden" name="event"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>

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
                <td width="30%"><integro:empty-if-null value="<%=aForm.getInsPolicyNum() %>"/>&nbsp;
                </td>
                 <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.cover.note" /></td>
                <td width="30%">
                 <integro:empty-if-null value="<%=aForm.getCoverNoteNumber() %>"/>&nbsp;
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
                               				System.out.println("aForm.getInsuranceCompanyName()-----"+aForm.getInsurerName());
                               				if (lvb.getValue().equals(aForm.getInsurerName())) {
                               					company.setLabel(lvb.getLabel());
                               				}
                               			}
                               %><integro:empty-if-null value="<%=company.getLabel() %>"/>&nbsp;                 
               </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.currency" /><font color="#FF0000">*</font></td>
                <td width="30%">
                
                <integro:empty-if-null value="<%=aForm.getInsPolicyCurrency() %>"/>&nbsp;              
                </td>
                
              </tr> 
              
              <tr class="even">
              <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.type.perils1" /><font color="#FF0000">*</font></td>
              <td width="30%">
              <integro:common-code-single categoryCode="<%=CategoryCodeConstant.INSURANCE_COMPANY_CATEGORY %>" entryCode="<%=aForm.getTypeOfPerils1()%>" display="true" descWithCode="false" />&nbsp;
               </td>
               <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurable.amt.policy" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimalNew(aForm.getInsurableAmt()) %>"/>&nbsp;
                 </td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.amt" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimalNew(aForm.getInsuredAmt()) %>"/>&nbsp;
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.received.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <%DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
                 String receivedDate="";
                 String effectiveDate="";
                 String expiryDate="";
                
                 if(aForm!= null){
                	 
                	 if(aForm.getReceivedDate()!=null && (!"".equals(aForm.getReceivedDate()))){
                          receivedDate=df.format(df.parse(aForm.getReceivedDate()));
                	    }
                     if(aForm.getEffectiveDateIns()!=null && (!"".equals(aForm.getEffectiveDateIns()))){
                          effectiveDate=df.format(df.parse(aForm.getEffectiveDateIns()));
                	    }
                     if(aForm.getExpiryDateIns()!=null && (!"".equals(aForm.getExpiryDateIns()))){
                          expiryDate=df.format(df.parse(aForm.getExpiryDateIns()));
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
                <integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimalNew(aForm.getInsurancePremium()) %>"/>&nbsp;
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.insurance.defaulted" /></td>
               	<td width="30%"><integro:empty-if-null value="<%=aForm.getNonSchemeScheme() %>"/>&nbsp;
                </td>
               
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.addr" /></td>
                <td colspan="3"><integro:empty-if-null value="<%=aForm.getInsuredAddress() %>"/>&nbsp;</td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.remark1" /></td>
                <td colspan="3">
               <integro:empty-if-null value="<%=aForm.getRemark1() %>"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.remark2" /></td>
               <td colspan="3">
                <integro:empty-if-null value="<%=aForm.getRemark2() %>"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.against" /></td>
                 <td colspan="3">
				<integro:empty-if-null value="<%=aForm.getInsuredAgainst() %>"/>&nbsp;
              </td>
              </tr>
              
              
              
                     
		
          </tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>
<br/><br/>
<%-- <table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInput" align="center">
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
</table> --%>

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
							<%	}else if(event.equals("checker_view_insurance_received") && "read".equals(from_event)){%>		
							<center>
							<a href="javascript:cancelPageMakerView1();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						 
						<%}else if(event.equals("checker_view_insurance_received")){%>		
						<center>
						<a href="javascript:cancelPageMakerView1();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
								src="img/return1.gif" name="Image4411" border="0"
								id="Image4411" />
						</a>
					</center>
					 
					<%} %>
						&nbsp;
					</td>
					<%} %>
					
	<% if(isChecker){%>
 <td colspan="4">
				<%if(event.equals("checker_view_insurance_received") && "read".equals(from_event)){ %>
				<center><a href="javascript:cancelPage4();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
				</center>
				<%}else if(event.equals("checker_view_insurance_received")){ %>
					<center><a href="javascript:cancelPage1();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
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
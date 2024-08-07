<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC,
					com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,com.integrosys.cms.app.transaction.OBTrxContext" %>    
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
OBInsuranceGC insuranceObj = (OBInsuranceGC) request.getAttribute("insuranceObj");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.serviceColObj");
List componentList = (List) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.componentList");
List companyList = (List) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.insuranceCoverageList");
String dp=(String)request.getAttribute("calculatedDP");
System.out.println("/////////////////**********************  DP "+componentList.size());
System.out.println("/////////////////**********************  DP "+companyList.size());
String event=(String)request.getAttribute("event");
System.out.println("/////////////////**********************  EVENT  "+event);
IGeneralCharge iColActual = (IGeneralCharge) itrxValue.getCollateral();
String trxID=(String)request.getAttribute("trxID");
//String dueDate=(String)request.getAttribute("dueDate");
String dueDate=(String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dueDate");
System.out.println("/////////////////**********************  dueDate :  "+dueDate);
pageContext.setAttribute("componentList", componentList);
pageContext.setAttribute("companyList", companyList);
String	viewPath =	"RecurrentDocReceipt.do?event=read&dueDate=" + dueDate + "&collateralID=" + iColActual.getCollateralID() + "&from=" + CollateralAction.READ_SECURITIES_2;
System.out.println("/////////////////**********************  viewPath :  "+viewPath);
boolean isCputUserMaker=false;
ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);

if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH){
	isCputUserMaker=true;
}
OBInsuranceGC actualIns=(OBInsuranceGC)request.getAttribute("actualObj");
boolean isMaker= false;
boolean isChecker= false;
ICommonUser user1 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user1.getTeamTypeMembership().getMembershipID()==1006){
	isMaker=true;
}else {
	isChecker=true;
}
System.out.println("//////////////////*******************  USER MAKER "+isMaker);
System.out.println("//////////////////*******************  USER CHECKER "+isChecker);

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
<%@page import="com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge"%>
<%@page import="com.integrosys.cms.ui.collateral.MaintainInsuranceGCForm"%>
<%@page import="java.util.Date"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="JavaScript" type="text/JavaScript">

function cancelPage2(){
		document.forms[0].action="CollateralRedirect.do?event=process&trxID=<%=trxID%>&calculatedDP=<%=dp%>&dueDate=<%=dueDate%>";
	    document.forms[0].submit();
}
// to track -checker -return from insurance view page
function cancelPage(){
document.forms[0].action="<%=viewPath%>";
    
    document.forms[0].submit();
}

function submitPage(){
	document.forms[0].action="AssetInsuranceCollateral.do?event=maker_return_view_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&dueDate=<%=dueDate%>";
	document.forms[0].submit();
}

function cancelPage3(){
	//document.forms[0].action="AssetGenChargeCollateral.do?event=track_return&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
	document.forms[0].action="AssetGenChargeCollateral.do?event=track&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
	document.forms[0].submit();
}
// to track -maker -return from insurance view page
function cancelPage1_old(){
	document.forms[0].action="AssetGenChargeCollateral.do?event=read&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
	document.forms[0].submit();
}
function cancelPage1(){
	
    document.forms[0].action="<%=viewPath%>";
    
    document.forms[0].submit();
}

function submitPage1(){
	document.forms[0].action="AssetGenChargeCollateral.do?event=read&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
	document.forms[0].submit();
}

function submitForm(){
	document.forms[0].action="AssetGenChargeCollateral.do?event=prepare_close&collateralID=<%=itrxValue.getReferenceID()%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
	document.forms[0].submit();
}



</script>


</head>
<body>
<html:form action="AssetInsuranceCollateral.do">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
<input type="hidden" name="trxID" value=<%=trxID%>/>
  <tr>
      <td><h3>View Insurance </h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      
      <%
        	    int rowIdx = 0;
				Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
            %>
          <thead>
          </thead>
          <tbody>
           <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Insurance Required for</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsuranceRequired() %>"/></td>
                
                <td class="fieldname" width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr> 
              
           
     		<tr class="even">
                <td class="fieldname" width="20%">Select Component</td>
                 <%if(insuranceObj.getInsuranceRequired().equals("Component_wise")){ %>
                <td width="30%"> <%
                							LabelValueBean lvb1 = new LabelValueBean();              
                							String valueCode = "";
                               				String[] abc = insuranceObj.getSelectComponent().split("-");
                               				List selectList = Arrays.asList(abc);
                               				StringBuffer result = new StringBuffer();
                               				for (int i = 0; i < componentList.size(); i++) {
                               					for (int j = 0; j < selectList.size(); j++) {
                               						LabelValueBean lvb = (LabelValueBean) componentList.get(i);
                               						String selctVal = (String) selectList.get(j);
                               						String lable = lvb.getLabel();
                               						String value = lvb.getValue();
                               						if (selctVal.equals(value)) {
                               							if(valueCode.equals("")){
															valueCode=valueCode+lable;
														}else{
															valueCode= valueCode+",";
															valueCode=valueCode+lable;
														}
                               						}
                               						//lvb1.setLabel(result.toString());
                               					}
                               				}%><integro:empty-if-null value="<%=valueCode.toString()%>"/> </td>  
                               				   <%}else{ %>				
                               		<td width="30%" >
                               				- </td>  		
                               				
                               		<%} %>		
                     <td class="fieldname" width="20%"></td>
                	<td width="30%">&nbsp;</td>
                     </tr>
            
     
     
              
              <tr class="even">
                <td class="fieldname" width="20%">Insurance Policy No.</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsurancePolicyNo() %>"/>&nbsp;</td>
                <td class="fieldname" width="20%">Cover Note No.</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getCoverNoteNo() %>"/>&nbsp;</td>
              </tr>
              
              <tr class="even"">
                <td class="fieldname" width="20%">Insurance Company Name<font color="#FF0000">*</font></td>
                <td width="30%"><%
                               	LabelValueBean company = new LabelValueBean();
                               			for (int k = 0; k < companyList.size(); k++) {
                               				LabelValueBean lvb = (LabelValueBean) companyList
                               						.get(k);
                               				if (insuranceObj.getInsuranceCompany().equals(lvb.getValue())) {
                               					company.setLabel(lvb.getLabel());
                               				}
                               			}
                               %>&nbsp;<integro:empty-if-null value="<%=company.getLabel() %>"/> </td>
                
                <td class="fieldname" width="20%">Insurance Policy Currency<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsuranceCurrency() %>"/>&nbsp;
                </td>&nbsp;                
              </tr> 
              
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname" width="20%">Insurance Coverage Type</td>
              <td width="30%">
              <integro:common-code-single categoryCode="INSURANCE_TYPE" display="true" descWithCode="false" entryCode="<%=insuranceObj.getInsuranceCoverge() %>"  />
              &nbsp; </td>
               <td width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%">Total Policy Amount<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsurancePolicyAmt() %>"/>&nbsp;</td>
                <td class="fieldname" width="20%">Insured Amount</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsuredAmount() %>"/>&nbsp;</td>
              </tr>
              <%DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
              String receivedDate = "";
              String effectiveDate =  "";
              String expiryDate = "";
               if(insuranceObj.getReceivedDate()!=null){
               receivedDate=df.format(insuranceObj.getReceivedDate());
               }
                if(insuranceObj.getEffectiveDate()!=null){
               effectiveDate=df.format(insuranceObj.getEffectiveDate());
               }
                if(insuranceObj.getExpiryDate()!=null){
               expiryDate=df.format(insuranceObj.getExpiryDate());
               }
               %>
              <tr class="even">
                <td class="fieldname" width="20%">Received Date</td>
                <td width="30%"><integro:empty-if-null value="<%=receivedDate %>"/>&nbsp;
                </td>
                <td class="fieldname" width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%">Effective Date Of Insurance<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=effectiveDate %>"/>&nbsp;
                </td>
                <td class="fieldname" width="20%">Insurance Expiry Date<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=expiryDate %>"/>&nbsp;
                </td>
              </tr>
              
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Insurance Defaulted</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsuranceDefaulted() %>"/>               </td>
                <td class="fieldname" width="20%">Insurance Premium</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsurancePremium() %>"/></td>
              </tr>
              
              
              <tr class="even">
                <td class="fieldname" width="20%">Remark </td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getRemark() %>"/>&nbsp;</td>
                <td width="20%"></td>
                 <td width="30%"></td>
              </tr>
              
            
        <html:hidden name="MaintainInsuranceGCForm"  property="parentId"  value="<%=itrxValue.getReferenceID()%>"/> 
<html:hidden name="MaintainInsuranceGCForm" property="isProcessed" value="N"/>
<html:hidden name="MaintainInsuranceGCForm" property="deprecated" value="N"/>   

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
  <% if(isMaker){%>
 <td colspan="4">
		
	<%	if(event.equals("maker_view_insurance")){%>		
				<center>
							<a href="javascript:cancelPage1();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center><%}else if (event.equals("maker_view_ins_edit")){%>
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
						</center><%}else if(event.equals("maker_view_ins_close")){ %>
						<center>
							<a href="javascript:submitForm();"
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
		
	<%	if(event.equals("checker_view_insurance")){%>		
				<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						<%}else if(event.equals("checker_view_insurance_process")){%>		
				<center>
							<a href="javascript:cancelPage2();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						<%}else if (event.equals("checker_view_ins_read")){%>
						<center>
							<a href="javascript:submitPage1();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center><%}} %>
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
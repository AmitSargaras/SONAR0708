<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC,
					com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,com.integrosys.cms.app.transaction.OBTrxContext" %>    
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MaintainInsuranceGCForm insuranceObj = (MaintainInsuranceGCForm) request.getAttribute("MaintainInsuranceGCForm");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
List componentList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.componentList");
List companyList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
String dp=(String)request.getAttribute("calculatedDP");
String event=(String)request.getAttribute("event");
String trxID=(String)request.getAttribute("trxID");
if(trxID.equals("null")){
	trxID=itrxValue.getTransactionID();
}
HashMap actualMap = (HashMap) request.getAttribute("actualMap");
HashMap stageMap = (HashMap) request.getAttribute("stageMap");

System.out.println("/////////////////**********************  actualMap "+actualMap);

System.out.println("/////////////////**********************  stageMap "+stageMap);

String dueDate=(String)request.getAttribute("dueDate");

String migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
String totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");


pageContext.setAttribute("componentList", componentList);
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

boolean isCputUserMaker=false;
ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);

if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH){
	isCputUserMaker=true;
}

boolean isMaker= false;
boolean isChecker= false;
ICommonUser user1 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user1.getTeamTypeMembership().getMembershipID()==1006){
	isMaker=true;
}else {
	isChecker=true;
}

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

function cancelPage2(){
		document.forms[0].action="CollateralRedirect.do?event=process&trxID=<%=trxID%>&calculatedDP=<%=dp%>&dueDate=<%=dueDate%>";
	    document.forms[0].submit();
}
// to track -checker -return from insurance view page
function cancelPage(){
		document.forms[0].action="CollateralRedirect.do?event=read&trxID=<%=trxID%>&calculatedDP=<%=dp%>&dueDate=<%=dueDate%>";
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
function cancelPage1(){
	document.forms[0].action="AssetGenChargeCollateral.do?event=read&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&trxID=<%=trxID%>&dueDate=<%=dueDate%>";
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
  
  
<input type="hidden" name="migrationFlag" value="<%=migrationFlag %>"></input>
<input type="hidden" name="totalLonable" value="<%=totalLonable %>"></input>
<input type="hidden" name="trxID" value=<%=trxID%>/>
  <tr>
      <td><h3>View Insurance   </h3></td>
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
         
           <tbody>
           <tr class="even">
               <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insuranceRequired")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Insurance Required for</td>
                <%String ins="";
                if(insuranceObj.getInsuranceRequired().equals("Component_wise")){ 
                ins="Component Wise";
                }else{
                ins=insuranceObj.getInsuranceRequired();
                }%>               
                <td width="30%" ><integro:empty-if-null value="<%=ins %>"/></td>              
               <td class="fieldname" width="20%">&nbsp;</td>
               <td width="30%">&nbsp;</td>
              </tr> 
              
           
     		<tr class="even">
                <td class="fieldname" width="20%">Select Component</td>
                <%if(insuranceObj.getInsuranceRequired().equals("Component_wise")){ %>
                <td width="30%" > <%
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
                               				
                               				<td class="fieldname" width="20%">&nbsp;</td>
               <td width="30%">&nbsp;</td>
                     
                     </tr>
            
     
     
              
              <tr class="even">
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insurancePolicyNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Insurance Policy No.</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsurancePolicyNo() %>"/>&nbsp;</td>
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"coverNoteNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
             
Cover Note No.</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getCoverNoteNo() %>"/>&nbsp;</td>
              </tr>
              
              <tr class="even">
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insuranceCompany")?"fieldname":"fieldnamediff"):"fieldname"%>">
               
                Insurance Company Name<font color="#FF0000">*</font></td>
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
                
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insuranceCurrency")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Insurance Policy Currency<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsuranceCurrency() %>"/>&nbsp;
                </td>&nbsp;                
              </tr> 
              
              <tr class="even">
              <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insuranceCoverge")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
              Insurance Coverage Type<font color="#FF0000">*</font></td>
              <td width="30%">
              <integro:common-code-single categoryCode="INSURANCE_COMPANY_CATEGORY" display="true" descWithCode="false" entryCode="<%=insuranceObj.getInsuranceCoverge() %>"  />
              &nbsp; </td>
              <td class="fieldname" width="20%">&nbsp;</td>
               <td width="30%">&nbsp;</td>
               
              </tr>
              
              <tr class="even">
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insurancePolicyAmt")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Policy Amount<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(insuranceObj.getInsurancePolicyAmt()) %>"/>&nbsp;</td>
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insuredAmount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Insured Amount<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(insuranceObj.getInsuredAmount()) %>"/>&nbsp;</td>
              </tr>
              <%DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
              String receivedDate = "";
              String effectiveDate =  "";
              String expiryDate = "";
               if(insuranceObj.getReceivedDate()!=null){
               receivedDate=df.format(df.parse(insuranceObj.getReceivedDate()));
               }
                if(insuranceObj.getEffectiveDate()!=null){
               effectiveDate=df.format(df.parse(insuranceObj.getEffectiveDate()));
               }
                if(insuranceObj.getExpiryDate()!=null){
               expiryDate=df.format(df.parse(insuranceObj.getExpiryDate()));
               }
               %>
              <tr class="even">
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"receivedDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Received Date<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=receivedDate %>"/>&nbsp;
                </td>
                <td class="fieldname" width="20%">&nbsp;</td>
               <td width="30%">&nbsp;</td>
                
              </tr>
              
              <tr class="even">
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"effectiveDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Effective Date Of Insurance<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=effectiveDate %>"/>&nbsp;
                </td>
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"expiryDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Insurance Expiry Date<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%=expiryDate %>"/>&nbsp;
                </td>
              </tr>
              
               <tr class="even">
               <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insuranceDefaulted")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Insurance Defaulted</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsuranceDefaulted() %>"/>               </td>
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"insurancePremium")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Insurance Premium</td>
                <td width="30%"><integro:empty-if-null value="<%=insuranceObj.getInsurancePremium() %>"/></td>
              </tr>
              
              
              <tr class="even">
                <td width="20%"class="<%=true?(CompareOBUtil.compOB(stageInsurance,actualInsurance,"remark")?"fieldname":"fieldnamediff"):"fieldname"%>">
                
                Remark </td>
                <td width="30%" colspan="3"><integro:empty-if-null value="<%=insuranceObj.getRemark() %>"/>&nbsp;</td>
                
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
							<a href="javascript:cancelPage1();"
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
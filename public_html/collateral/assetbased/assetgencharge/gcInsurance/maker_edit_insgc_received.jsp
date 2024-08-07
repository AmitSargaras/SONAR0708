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
MaintainInsuranceGCForm insuranceObj = (MaintainInsuranceGCForm) request.getAttribute("MaintainInsuranceGCForm");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String dp=(String)request.getAttribute("calculatedDP");

List insuranceCoverageList= (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
List currencyList= (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.currencyList");
 
pageContext.setAttribute("insCompanyList",insuranceCoverageList);
pageContext.setAttribute("currencyList",currencyList);

String calculatedDP = (String) request.getAttribute("calculatedDP");
String fundedShare = (String) request.getAttribute("fundedShare");
String dueDate = (String) request.getAttribute("dueDate");

String migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
String totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");

//String insuranceStatus = (String) request.getAttribute("insuranceStatus");

//System.out.println("insuranceObj:"+insuranceObj);

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

	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_edit_insreceived_list&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&fundedShare=<%=fundedShare%>&dueDate=<%=dueDate%>&insuranceCode=<%=insuranceObj.getInsuranceCode()%>';
    document.forms[0].submit();
}
function cancleForm() {

	
 	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_edit_cancle_insstatus&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>';
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
<html:hidden property="insuranceStatus"  value="PENDING_RECEIVED"/>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

  <thead>
  <tr><td align="right"><font color="red">*</font>Mandatory</td>
  </tr>
  <tr>
      <td><h3>Edit Insurance - Received </h3></td>
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
                <td width="30%">
               <% if(insuranceObj== null){%> 
                <html:text  property="insurancePolicyNo" size = "40" maxlength="30"/>&nbsp;
                <%}else{ %>
                 <html:text  property="insurancePolicyNo" size = "40" maxlength="30" value="<%=insuranceObj.getInsurancePolicyNo() %>"/>&nbsp;
                <%} %>
                  <br><html:errors property="insurancePolicyNoError"/>
                  	<html:errors property="duplicateInsuranceError"/>
                </td>
                 <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.cover.note" /></td>
                <td width="30%">
                 <% if(insuranceObj== null){%> 
                <html:text  property="coverNoteNo" maxlength="50"/>&nbsp;
                 <%}else{ %>
                   <html:text  property="coverNoteNo" maxlength="50" value="<%=insuranceObj.getCoverNoteNo() %>"/>&nbsp;
                    <%} %>
                 <br><html:errors property="coverNoteNoError"/>
                </td>
              </tr>
              
              <tr class="even"">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.company.name" /><font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%> 
                <html:select property="insuranceCompany">
                <option value="">Please Select </option>
                                      <logic:iterate id="ob" name="insCompanyList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>" ><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                                     </html:select>&nbsp;
                                     
                    <%}else{ %>                  
                <html:select property="insuranceCompany" value="<%=insuranceObj.getInsuranceCompany() %>">
                <option value="">Please Select </option>
                                      <logic:iterate id="ob" name="insCompanyList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>" ><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                                     </html:select>&nbsp;                     
                  <%} %>                    
                 <br><html:errors property="insuranceCompanyError"/>                     
               </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.currency" /><font color="#FF0000">*</font></td>
                <td width="30%">
                
                  <% if(insuranceObj== null){%> 
                <html:select property="insuranceCurrency">
                <option value="">Please Select </option>
                                      <logic:iterate id="ob" name="currencyList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>"><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                                     </html:select>&nbsp;
                   <%}else{ %>                        
                    <html:select property="insuranceCurrency" value="<%=insuranceObj.getInsuranceCurrency() %>">
                <option value="">Please Select </option>
                                      <logic:iterate id="ob" name="currencyList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>"><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                                     </html:select>&nbsp;
                    <%} %>                 
                <br><html:errors property="insuranceCurrencyError"/>                     
                </td>&nbsp;
                
              </tr> 
              
              <tr class="even">
              <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.type.perils1" /><font color="#FF0000">*</font></td>
              <td width="30%">
               <% if(insuranceObj== null){%> 
              <html:select property="insuranceCoverge"  >
                 <integro:common-code 	categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
         	</html:select>&nbsp;&nbsp;
         	 <%}else{ %>      
         	<html:select property="insuranceCoverge" value="<%=insuranceObj.getInsuranceCoverge() %>" >
         	<integro:common-code 	categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
         	</html:select>&nbsp;&nbsp;
         	  <%} %>    
         	 <br><html:errors property="insuranceCoverageError"/>
               </td>
               <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurable.amt.policy" /><font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%> 
                <html:text  property="insurancePolicyAmt" maxlength="23" size="30" styleId="insurancePolicyAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                	 <%}else{ %>      
                 <html:text  property="insurancePolicyAmt" maxlength="23" value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsurancePolicyAmt()) %>" size="30" styleId="insurancePolicyAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <%} %>    
                <br><html:errors property="insurancePolicyAmtError"/>
                  <html:errors property="insurancePolicyAmtLengthError"/>
                
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.amt" /><font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%> 
                <html:text  property="insuredAmount" maxlength="23" size="30" styleId="insuredAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                	 <%}else{ %>      
               <html:text  property="insuredAmount" maxlength="23" value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsuredAmount()) %>" size="30" styleId="insuredAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <%} %>    
                  <br><html:errors property="insuredAmtLengthError"/>
                  <html:errors property="insuredAmtError"/>
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.received.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <%DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
                 String receivedDate=df.format(new Date());
                 String effectiveDate="";
                 String expiryDate="";
                
                 if(insuranceObj!= null){
                	// System.out.println("insuranceObj.getReceivedDate():"+insuranceObj.getReceivedDate());
                	 if(insuranceObj.getReceivedDate()!=null && (!"".equals(insuranceObj.getReceivedDate()))){
                          receivedDate=df.format(df.parse(insuranceObj.getReceivedDate()));
                	    }
                	 if("".equals(receivedDate)){
                		 receivedDate=df.format(new Date());
                	 }
                     if(insuranceObj.getEffectiveDate()!=null && (!"".equals(insuranceObj.getEffectiveDate()))){
                          effectiveDate=df.format(df.parse(insuranceObj.getEffectiveDate()));
                	    }
                     if(insuranceObj.getExpiryDate()!=null && (!"".equals(insuranceObj.getExpiryDate()))){
                          expiryDate=df.format(df.parse(insuranceObj.getExpiryDate()));
                        }
              }%>
                  <% if(insuranceObj== null){%>
                <html:text property="receivedDate" maxlength="30" readonly="true" value="<%=receivedDate %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('receivedDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			      <%}else{ %>       
			          <html:text property="receivedDate" maxlength="30" readonly="true" value="<%=receivedDate %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('receivedDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp; 
			        <%} %>     
			               <br><html:errors property="receivedDateError"/> 
                </td>
              </tr>
             <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.effective.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <% if(insuranceObj== null){%>
                <html:text property="effectiveDate" maxlength="30" readonly="true" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('effectiveDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			          <%}else{ %>       
			    <html:text property="effectiveDate" maxlength="30" readonly="true" value="<%=effectiveDate %>" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('effectiveDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;         
			           <%} %>       
			     <br><html:errors property="effectiveDateError"/>         
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.expiry.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%>
                <html:text property="expiryDate" maxlength="30" readonly="true" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('expiryDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			       <%}else{ %>      
			     <html:text property="expiryDate" maxlength="30" readonly="true" value="<%=expiryDate %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('expiryDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;      
			 <%} %>                    
			       <br><html:errors property="expiryDateError"/>                  
                </td>
              </tr>
              
               <tr class="even">
               <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.premium" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <% if(insuranceObj== null){%>
                <html:text property="insurancePremium" maxlength="23" size="30" styleId="insurancePremium" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                <%}else{ %>
                <html:text property="insurancePremium" maxlength="23" size="30" styleId="insurancePremium" value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsurancePremium())%>" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                <%} %>
                  <br><html:errors property="insurancePremiumLengthError"/> <html:errors property="insurancePremiumError"/> 
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.insurance.defaulted" /></td>
                
                  <% if(insuranceObj== null){%>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="insuranceDefaulted"/>&nbsp;No<input type="radio" value="No" name="insuranceDefaulted"/>
                </td>
                  <%}else{ %>      
                   <%if(insuranceObj.getInsuranceDefaulted()!=null){
                	if(insuranceObj.getInsuranceDefaulted().equals("Yes")){
                	
                	%>
                	<td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="insuranceDefaulted" id="insuranceDefaulted" checked="checked"/>&nbsp;No<input type="radio" value="No" name="insuranceDefaulted" id=insuranceDefaulted/>
                </td>
                <%}else if(insuranceObj.getInsuranceDefaulted().equals("No")){ %>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="insuranceDefaulted" id="insuranceDefaulted"/>&nbsp;No<input type="radio" value="No" name="insuranceDefaulted" checked="checked" id="insuranceDefaulted"/>
                </td>
                
                <%} }else{%>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="insuranceDefaulted" id="insuranceDefaulted"/>&nbsp;No<input type="radio" value="No" name="insuranceDefaulted" id="insuranceDefaulted"/>
              
                </td>
                <%} %>
                  <%} %>
                
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.addr" /></td>
                <td colspan="3">
				<html:textarea property="insuredAddress" rows="3" cols="150"/>&nbsp;
	           	<html:errors property="insuredAddress"/><br>
               
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%">
                	<bean:message bundle="message-collateral" key="label.insurance.policy.remark1" />
                	<font color="#FF0000">*</font>
                </td>
                <td colspan="3">
                <% if(insuranceObj== null){%>
                <html:text property="remark" maxlength="50"  size="60"/>&nbsp;
                 <%}else{ %>
                <html:text property="remark" maxlength="50"  size="60"  value="<%=insuranceObj.getRemark() %>"/>&nbsp;
                 <%} %>
                 <html:errors property="remarkError"/>
                </td>
                
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.remark2" /></td>
               <td colspan="3">
                <% if(insuranceObj== null){%>
                <html:text property="remark2" maxlength="50"  size="60"/>&nbsp;
                 <%}else{ %>
                <html:text property="remark2" maxlength="50"  size="60"  value="<%=insuranceObj.getRemark2() %>"/>&nbsp;
                 <%} %>
                </td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.against" /></td>
                 <td colspan="3">
				<html:textarea property="insuredAgainst" rows="3" cols="150"/>&nbsp;
              	<html:errors property="insuredAgainst"/>
              </td>
              </tr>
              
              
              
                     
		
          </tbody>
        </table> </td>
  </tr>
  <input type="hidden" name="insuranceRequired"></input>
  <html:hidden property="appendedComponent"/>
<html:hidden name="MaintainInsuranceGCForm"  property="parentId"  value="<%=itrxValue.getReferenceID()%>"/> 
<html:hidden name="MaintainInsuranceGCForm" property="isProcessed" value="<%=insuranceObj.getIsProcessed()%>"/>
<html:hidden name="MaintainInsuranceGCForm" property="deprecated" value="N"/>

<html:hidden name="MaintainInsuranceGCForm" property="id" value="<%=String.valueOf(insuranceObj.getId()) %>"/>

<html:hidden name="MaintainInsuranceGCForm" property="insuranceCode" value="<%=insuranceObj.getInsuranceCode() %>"/>

<html:hidden name="MaintainInsuranceGCForm" property="lastUpdatedBy" value="<%=insuranceObj.getLastUpdatedBy() %>"/>
<html:hidden name="MaintainInsuranceGCForm" property="lastApproveBy" value="<%=insuranceObj.getLastApproveBy() %>"/>
<html:hidden name="MaintainInsuranceGCForm" property="lastUpdatedOnStr" value="<%=insuranceObj.getLastUpdatedOnStr()%>"/>
<html:hidden name="MaintainInsuranceGCForm" property="lastApproveOnStr" value="<%=insuranceObj.getLastApproveOnStr()%>"/>

<input type="hidden" name="migrationFlag" value="<%=migrationFlag %>"></input>
<input type="hidden" name="totalLonable" value="<%=totalLonable %>"></input>

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
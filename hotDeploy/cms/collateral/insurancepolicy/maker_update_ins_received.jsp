<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@ page import="com.integrosys.base.techinfra.util.PropertyUtil" %>
<%@ page import="com.integrosys.cms.host.stp.common.IStpConstants" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insurancepolicy/update_insurance_policy.jsp,v 1.7 2006/10/27 08:34:44 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.7 $
* Date: $Date: 2006/10/27 08:34:44 $
* Tag: $Name:  $
*/
%>

<%
String indexID = (String)request.getParameter("indexID");
/*	String title = indexID.equals("-1")?"Add":"Edit";

    String isStpStatus = (String) request.getAttribute("isStpStatus");
    if (isStpStatus == null || isStpStatus.equals(""))
        isStpStatus = "fail";

    //Added By KLYong: Stp switch mode 
    String stpMode = PropertyUtil.getInstance("/stp.properties").getProperty(IStpConstants.STP_SWITCH_MODE); */
    
  //  InsurancePolicyForm insuranceObj = (InsurancePolicyForm) request.getAttribute("InsurancePolicyForm");
    
    InsurancePolicyForm insuranceObj = (InsurancePolicyForm) request.getAttribute(formStr);
    String insuranceStatusRadio = (String)request.getParameter("insuranceStatusRadio");
    String subtypeCode = (String)request.getAttribute("getSubtypeCode");
    List insuranceCoverageList = null;
   	
    if(session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList");
   	}
    else if(session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
   	}
    else if(session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList");
   	}
    
    pageContext.setAttribute("insuranceCoverageList", insuranceCoverageList);
    
    List currencyList= (List) request.getAttribute("currencyList");
    
    pageContext.setAttribute("currencyList", currencyList);
    
%>

<%@page import="com.integrosys.cms.ui.collateral.insurancepolicy.InsurancePolicyForm"%>
<%
	String[] style = {"even", "odd"};
	int count = 0;
%>

<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="java.util.Date"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/JavaScript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">


function submitForm() {

	document.forms[0].action='<%=actionNameStr%>?event=maker_update_insreceived_list';
    document.forms[0].submit();
}
function cancleForm() {

	
 	document.forms[0].action='<%=actionNameStr%>?event=maker_edit_cancle_insstatus';
    document.forms[0].submit();
}

</script>
</head>
<body>

<html:form action="<%=actionNameStr%>">
<input type="hidden" name="event"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<!--<input type="hidden" name="from_event" value="<%=request.getParameter("from_event")%>"/>-->
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="insuranceStatusRadio" value="<%=insuranceStatusRadio %>"></input>
<html:hidden property="insuranceStatus"  value="UPDATE_RECEIVED"/>

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
				
            %>
          <tbody>
              
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.num" /><font color="#FF0000">*</font></td>
                <td width="30%">
               <% if(insuranceObj== null){%> 
                <html:text  property="insPolicyNum" maxlength="30" size="50"/>&nbsp;
                <html:errors property="insuranceErr"/>
                <%}else{ %>
                 <html:text  property="insPolicyNum" maxlength="30" size="50" value="<%=insuranceObj.getInsPolicyNum() %>"/>&nbsp;
                 <html:errors property="insuranceErr"/>
                <%} %>
                  <br><html:errors property="insPolicyNum"/>
                  <!--  <html:errors property="duplicateInsuranceError"/> -->	
                </td>
                 <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.cover.note" /></td>
                <td width="30%">
                 <% if(insuranceObj== null){%> 
                <html:text  property="coverNoteNumber" maxlength="20" size="25"/>&nbsp;
                 <%}else{ %>
                   <html:text  property="coverNoteNumber" maxlength="20" size="25" value="<%=insuranceObj.getCoverNoteNumber() %>"/>&nbsp;
                    <%} %>
                 <br><html:errors property="coverNoteNumber"/>
                </td>
              </tr>
              
              <tr class="even"">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.company.name" /><font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%> 
                <html:select property="insurerName">
                <option value="">Please Select </option>
                                      <logic:iterate id="ob" name="insuranceCoverageList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>" ><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                                     </html:select>&nbsp;
                                     
                    <%}else{ %>                  
                <html:select property="insurerName" value="<%=insuranceObj.getInsurerName() %>">
                <option value="">Please Select </option>
                                      <logic:iterate id="ob" name="insuranceCoverageList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>" ><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                                     </html:select>&nbsp;                     
                  <%} %>                    
                 <br><html:errors property="insurerName"/>                     
               </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.currency" /><font color="#FF0000">*</font></td>
                <td width="30%">
                
                  <% if(insuranceObj== null){%> 
                <html:select property="insPolicyCurrency">
                	  <option value="">Please Select </option>
                      <html:options collection="currencyList" property="value" labelProperty="label" />
                                     </html:select>&nbsp;
                   <%}else if(insuranceObj.getInsPolicyCurrency()==null || "".equals(insuranceObj.getInsPolicyCurrency())){ %>                        
                    <html:select property="insPolicyCurrency">
                	  <option value="">Please Select </option>
                      <html:options collection="currencyList" property="value" labelProperty="label" />
                                     </html:select>&nbsp;
                    <%}else{ %>                        
                    <html:select property="insPolicyCurrency" value="<%=insuranceObj.getInsPolicyCurrency().trim() %>">
                 	  <option value="">Please Select </option>
                      <html:options collection="currencyList" property="value" labelProperty="label" />	
                                     </html:select>&nbsp;
                    <%} %>              
                <br><html:errors property="insPolicyCurrency"/>                     
                </td>&nbsp;
                
              </tr> 
              
              <tr class="even">
              <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.type.perils1" /><font color="#FF0000">*</font></td>
              <td width="30%">
               <% if(insuranceObj== null){%> 
              <html:select property="typeOfPerils1"  >
                 <integro:common-code 	categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
         	</html:select>&nbsp;&nbsp;
         	 <%}else{ %>      
         	<html:select property="typeOfPerils1" value="<%=insuranceObj.getTypeOfPerils1() %>" >
         	<integro:common-code 	categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
         	</html:select>&nbsp;&nbsp;
         	  <%} %>    
         	 <br><html:errors property="typeOfPerils1"/>
               </td>
               <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurable.amt.policy" /><font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%> 
                		<html:text  property="insurableAmt" maxlength="22" size="32" styleId="insurableAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <%}else if(insuranceObj.getInsurableAmt()==null || "".equals(insuranceObj.getInsurableAmt())){ %>      
                 		<html:text  property="insurableAmt" maxlength="22" size="32" styleId="insurableAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <%} else { %>      
                 		<html:text  property="insurableAmt" maxlength="22" size="32" value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsurableAmt()) %>" styleId="insurableAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <%} %>    
                <br><html:errors property="insurableAmt"/>
               <!-- <html:errors property="insurancePolicyAmtLengthError"/>  -->   
                
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insured.amt" /><font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%> 
                		<html:text  property="insuredAmt" maxlength="22" size="32" styleId="insuredAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                <%}else if(insuranceObj.getInsuredAmt()==null || "".equals(insuranceObj.getInsuredAmt())){ %>      
               			<html:text  property="insuredAmt" maxlength="22" size="32" styleId="insuredAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                 <%}else{ %>      
               			<html:text  property="insuredAmt" maxlength="22" size="32" value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsuredAmt()) %>" styleId="insuredAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                 <%} %>    
                  <br><html:errors property="insuredAmt"/>
                 <!--  <html:errors property="insuredAmtError"/>  -->
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.received.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <%DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
                 String receivedDate=df.format(new Date());
                 String effectiveDate="";
                 String expiryDate="";
                
                 if(insuranceObj!= null){
                	 
                	 if(insuranceObj.getReceivedDate()!=null && (!"".equals(insuranceObj.getReceivedDate()))){
                          receivedDate=df.format(df.parse(insuranceObj.getReceivedDate()));
                	    }
                     if(insuranceObj.getEffectiveDateIns()!=null && (!"".equals(insuranceObj.getEffectiveDateIns()))){
                          effectiveDate=df.format(df.parse(insuranceObj.getEffectiveDateIns()));
                	    }
                     if(insuranceObj.getExpiryDateIns()!=null && (!"".equals(insuranceObj.getExpiryDateIns()))){
                          expiryDate=df.format(df.parse(insuranceObj.getExpiryDateIns()));
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
			               <br><html:errors property="receivedDate"/> 
                </td>
              </tr>
             <tr class="even">
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.effective.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <% if(insuranceObj== null){%>
                <html:text property="effectiveDateIns" maxlength="30" readonly="true" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('effectiveDateIns', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			          <%}else{ %>       
			    <html:text property="effectiveDateIns" maxlength="30" readonly="true" value="<%=effectiveDate %>" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('effectiveDateIns', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;         
			           <%} %>       
			     <br><html:errors property="effectiveDateIns"/>         
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.expiry.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%>
                <html:text property="expiryDateIns" maxlength="30" readonly="true" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('expiryDateIns', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			       <%}else{ %>      
			     <html:text property="expiryDateIns" maxlength="30" readonly="true" value="<%=expiryDate %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('expiryDateIns', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;      
			 <%} %>                    
			       <br><html:errors property="expiryDateIns"/>                  
                </td>
              </tr>
              
               <tr class="even">
               <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.premium" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <% if(insuranceObj== null){%>
                	<html:text property="insurancePremium" maxlength="20" size="30" styleId="insurancePremium" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                <%}else if(insuranceObj.getInsurancePremium()==null || "".equals(insuranceObj.getInsurancePremium())){ %>
                	<html:text property="insurancePremium" maxlength="20" size="30" styleId="insurancePremium" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                <%}else{ %>
                	<html:text property="insurancePremium" maxlength="20" size="30" styleId="insurancePremium" value="<%=UIUtil.formatWithCommaAndDecimalNew(insuranceObj.getInsurancePremium())%>" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                <%} %>
                  <br><html:errors property="insurancePremium"/> <!-- <html:errors property="insurancePremiumError"/>  --> 
                </td>
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.insurance.defaulted" /></td>
                
                  <% if(insuranceObj== null){%>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="nonSchemeScheme"/>&nbsp;No<input type="radio" value="No" name="nonSchemeScheme"/>
                </td>
                  <%}else{ %>      
                   <%if(insuranceObj.getNonSchemeScheme()!=null){
                	if(insuranceObj.getNonSchemeScheme().equals("Yes")){
                	
                	%>
                	<td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="nonSchemeScheme" id="nonSchemeScheme" checked="checked"/>&nbsp;No<input type="radio" value="No" name="nonSchemeScheme" id=nonSchemeScheme/>
                </td>
                <%}else if(insuranceObj.getNonSchemeScheme().equals("No")){ %>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="nonSchemeScheme" id="nonSchemeScheme"/>&nbsp;No<input type="radio" value="No" name="nonSchemeScheme" checked="checked" id="nonSchemeScheme"/>
                </td>
                
                <%} }else{%>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="nonSchemeScheme" id="nonSchemeScheme"/>&nbsp;No<input type="radio" value="No" name="nonSchemeScheme" id="nonSchemeScheme"/>
              
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
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.policy.remark1" /></td>
                <td colspan="3">
                <% if(insuranceObj== null){%>
                <html:text property="remark1" maxlength="50"  size="60"/>&nbsp;
                 <%}else{ %>
                <html:text property="remark1" maxlength="50"  size="60"  value="<%=insuranceObj.getRemark1() %>"/>&nbsp;
                 <%} %>
                  <html:errors property="remark1Error"/>
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
  

  </tbody>
        </table> </td>
  </tr>

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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC,
					com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,com.integrosys.cms.ui.collateral.MaintainInsuranceGCForm" %> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MaintainInsuranceGCForm insuranceObj = (MaintainInsuranceGCForm) request.getAttribute("MaintainInsuranceGCForm");
//OBInsuranceGC insuranceObj = (OBInsuranceGC) request.getAttribute("insuranceGCObj");
List insuranceCoverageList= (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
List currencyList= (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.currencyList");
List componentList= (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.componentList");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

String migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
String totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");

String dp=(String)request.getAttribute("calculatedDP");
//String fundedShare=(String)request.getAttribute("fundedShare");

String dpShare=(String)request.getAttribute("dpShare");
System.out.println("/////////////////**********************  dpShare "+dpShare);
String dueDate=(String)request.getAttribute("dueDate");

System.out.println("/////////////////**********************  calculatedDP "+dp);
System.out.println("/////////////////**********************  itrxValue "+itrxValue.getReferenceID());

pageContext.setAttribute("insCompanyList",insuranceCoverageList);
pageContext.setAttribute("currencyList",currencyList);
pageContext.setAttribute("componentList",componentList);

String test=(String) request.getAttribute("dpCalculateManually");
String dpCalculateManually=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpCalculateManually");
System.out.println("<<<<<<<maker edit add insu>>>>>>>>"+dpCalculateManually);
System.out.println("<<<<<<maker edit request insu>>>>>"+dpCalculateManually);
%>

<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.insurancecoverage.bus.OBInsuranceCoverage"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="java.util.List"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.util.Date"%>

<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="JavaScript" type="text/JavaScript">

function submitForm () {

ListComponentType = document.forms[0].selectComponent;

    AppendedComponentType = document.forms[0].appendedComponent;
    for (i=0;i<ListComponentType.length;i++){
    	ListComponentType.options[i].selected = true;
    	
    	if(AppendedComponentType.value.search(ListComponentType.options[i].value)==-1)
    	{
    		AppendedComponentType.value = ListComponentType.options[i].value + "-" + AppendedComponentType.value;
    	}
        //alert(AppendedSegment.value);
    }
    document.forms[0].appendedComponent.value=AppendedComponentType.value;
   <%-- document.forms[0].action='AssetInsuranceCollateral.do?event=maker_edit_list_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&fundedShare=<%=fundedShare%>&dueDate=<%=dueDate%>&insuranceCode=<%=insuranceObj.getInsuranceCode()%>'; --%>
   
	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_edit_list_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&dpShare=<%=dpShare%>&dueDate=<%=dueDate%>&insuranceCode=<%=insuranceObj.getInsuranceCode()%>';

	    document.forms[0].submit();
}



function cancelPage(){
	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_edit_cancle_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>';
    document.forms[0].submit();
}

function enable(){
	
	
	if(document.forms[0].insuranceRequired[1].checked){
		document.forms[0].allComponent.disabled = false;
		document.forms[0].insuranceRequired[0].checked="";
		document.forms[0].selectComponent.disabled = false;
		document.forms[0].Button[0].disabled = false;
		document.forms[0].Button[1].disabled = false;
		
	}
	}


function disable(){
	
	
	if(document.forms[0].insuranceRequired[0].checked){
		document.forms[0].allComponent.disabled = true;
		document.forms[0].insuranceRequired[1].checked="";
		document.forms[0].selectComponent.disabled = true;
		document.forms[0].Button[0].disabled = true;
		document.forms[0].Button[1].disabled = true;
		
	}
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
<html:form action="AssetInsuranceCollateral.do">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <html:hidden property="calculatedDP" value="<%=dp %>"/>
<input type="hidden" name="dpCalculateManually" value="<%=dpCalculateManually%>"/>

<html:hidden property="dpShare" value ="<%=dpShare %>"/>

<html:hidden property="dueDate"  value ="<%=dueDate %>"/>

<input type="hidden" name="migrationFlag" value="<%=migrationFlag %>"></input>
<input type="hidden" name="totalLonable" value="<%=totalLonable %>"></input>

  <tr>
      <td><h3>Edit Insurance </h3></td>
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
          
                       
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Insurance Required for</td>
                <td width="30%" >
                <%System.out.println("insuranceForm.getInsuranceRequired():"+insuranceObj.getInsuranceRequired()); 
                if(insuranceObj.getInsuranceRequired()!=null){
                	if(insuranceObj.getInsuranceRequired().equals("All")){
                %>
                
                  <input type="radio" value="All" checked="checked" name="insuranceRequired"  onclick="javascript:disable()">&nbsp;All&nbsp;&nbsp;
                  <input type="radio" value="Component_wise" name="insuranceRequired"  onclick="javascript:enable()">&nbsp;Component wise</input>
                  <%}else if(insuranceObj.getInsuranceRequired().equals("Component_wise")){ %>
                  <input type="radio" value="All"  name="insuranceRequired"  onclick="javascript:disable()">&nbsp;All&nbsp;&nbsp;
                <input type="radio" value="Component_wise" name="insuranceRequired" checked="checked"  onclick="javascript:enable()">&nbsp;Component wise</input>
                <br><html:errors property="insuranceRequiredError"/>
                </td>
                
                <%}} %>
                     <td class="fieldname" width="20%">&nbsp;</td>
               <td width="30%">&nbsp;</td>  
              
              </tr> 
            <% 
            HashMap selectedObjects= new HashMap();
                String select=insuranceObj.getSelectComponent();
                if(select!=null && !"".equals(select)){
                String[] abc=select.split("-");
                
                for(int ab=0;ab <abc.length;ab++){
                selectedObjects.put(abc[ab],abc[ab]);
                }
                }
                %>
     		<tr class="even">
                <td class="fieldname" width="20%">Select Component</td>
               <% if(insuranceObj.getInsuranceRequired()!=null){
                	if(insuranceObj.getInsuranceRequired().equals("All")){
                %>
                <td width="30%"><html:select size="6" multiple="multiple" style="width:300" property="allComponent" disabled="true">
                <%
                
                for(int i=0;i<componentList.size();i++){
                	LabelValueBean bean= (LabelValueBean)componentList.get(i);
                	if(!(selectedObjects.containsKey(bean.getValue().trim())))
		    	{
		    	
		    	%>
				         			    	<option value='<%=bean.getValue()%>'>
				         			    	<%=bean.getLabel() %>
					        											<br>
		    	
		    	<%
		    		
		    		}
                }
                %>
                </html:select>&nbsp;</td>
                <td>
				 <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allComponent,selectComponent, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal" />
											 <br/> <br/> 
				<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 	onclick="moveDualList(selectComponent,allComponent,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
				</td>		               
				<td>
				
				               
				<html:select size="6" multiple="multiple" style="width:300"  property="selectComponent" disabled="true">
				
				<%
                
             
               // System.out.println(" SELECT :  "+abc.length);
                for(int i=0;i<componentList.size();i++){
                	LabelValueBean bean= (LabelValueBean)componentList.get(i);
                	if((selectedObjects.containsKey(bean.getValue().trim())))
		    	{
		    	
		    	%>
				         			    	<option value='<%=bean.getValue()%>'>
				         			    	<%=bean.getLabel() %>
					        											<br>
		    	
		    	<%
		    		
		    		}
                }
                %>
                </html:select>&nbsp;
                <br><html:errors property="selectComponentError"/>
				</td>
				<%}else if(insuranceObj.getInsuranceRequired().equals("Component_wise")){%>
				<td width="30%"><html:select size="6" multiple="multiple" style="width:300" property="allComponent">
                <%
                
                for(int i=0;i<componentList.size();i++){
                	LabelValueBean bean= (LabelValueBean)componentList.get(i);
                	if(!(selectedObjects.containsKey(bean.getValue().trim())))
		    	{
		    	
		    	%>
				         			    	<option value='<%=bean.getValue()%>'>
				         			    	<%=bean.getLabel() %>
					        											<br>
		    	
		    	<%
		    		
		    		}
                }
                %>
                </html:select>&nbsp;
                 </td>
                
                <td>
				 <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allComponent,selectComponent, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal" />
											 <br/> <br/> 
				<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 	onclick="moveDualList(selectComponent,allComponent,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
				<td>
				
				               
				<html:select size="6" multiple="multiple" style="width:300"  property="selectComponent" >
				
				<%
                
             
               // System.out.println(" SELECT :  "+abc.length);
                for(int i=0;i<componentList.size();i++){
                	LabelValueBean bean= (LabelValueBean)componentList.get(i);
                	if((selectedObjects.containsKey(bean.getValue().trim())))
		    	{
		    	
		    	%>
				         			    	<option value='<%=bean.getValue()%>'>
				         			    	<%=bean.getLabel() %>
					        											<br>
		    	
		    	<%
		    		
		    		}
                }
                %>
                </html:select>&nbsp;
                <br><html:errors property="selectComponentError"/>
				</td>
                	<%}} %>
              </tr>
      <tr class="even">
                <td class="fieldname" width="20%">Insurance Policy No.<font color="#FF0000">*</font></td>
                <td width="30%">
                <html:text  property="insurancePolicyNo" size = "40" maxlength="30" value="<%=insuranceObj.getInsurancePolicyNo() %>" />&nbsp;
                 <br><html:errors property="insurancePolicyNoError"/>
                 	<html:errors property="duplicateInsuranceError"/>
                </td>
                <td class="fieldname" width="20%">Cover Note No.</td>
                <td width="30%"><html:text  property="coverNoteNo" maxlength="50" value="<%=insuranceObj.getCoverNoteNo() %>"/>&nbsp;
                 <br><html:errors property="coverNoteNoError"/>
                </td>
              </tr>
              
              <tr class="even"">
                <td class="fieldname" width="20%">Insurance Company Name<font color="#FF0000">*</font></td>
                <td width="30%"><html:select property="insuranceCompany" value="<%=insuranceObj.getInsuranceCompany() %>">
                <option value="">Please Select </option>
                                      <logic:iterate id="ob" name="insCompanyList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>" ><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                                     </html:select>&nbsp;
                                      <br><html:errors property="insuranceCompanyError"/>
               </td>
                <td class="fieldname" width="20%">Insurance Policy Currency<font color="#FF0000">*</font></td>
                <td width="30%"><html:select property="insuranceCurrency" value="<%=insuranceObj.getInsuranceCurrency() %>">
                <option value="">Please Select </option>
                                      <logic:iterate id="ob" name="currencyList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>"><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                                     </html:select>&nbsp;
                                      <br><html:errors property="insuranceCurrencyError"/>
                </td>&nbsp;
                
              </tr> 
              
              <tr class="even">
              <td class="fieldname" width="20%">Insurance Coverage Type<font color="#FF0000">*</font></td>
              <td width="30%" ><html:select property="insuranceCoverge" value="<%=insuranceObj.getInsuranceCoverge() %>" ><!--
                  <integro:common-code 	categoryCode="INSURANCE_TYPE" descWithCode="false" />
         	-->
         	<integro:common-code 	categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
         	</html:select>&nbsp;&nbsp;
         	 <br><html:errors property="insuranceCoverageError"/>
         	
               </td>
               <td class="fieldname" width="20%">&nbsp;</td>
               <td width="30%">&nbsp;</td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%">Policy Amount<font color="#FF0000">*</font></td>
                <td width="30%"><html:text  property="insurancePolicyAmt" maxlength="50" value="<%=UIUtil.formatWithCommaAndDecimal(insuranceObj.getInsurancePolicyAmt()) %>" size="68" styleId="insurancePolicyAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <br><html:errors property="insurancePolicyAmtError"/>
                  <html:errors property="insurancePolicyAmtLengthError"/>
                  
                </td>
                <td class="fieldname" width="20%">Insured Amount<font color="#FF0000">*</font></td>
                <td width="30%"><html:text  property="insuredAmount" maxlength="50" value="<%=UIUtil.formatWithCommaAndDecimal(insuranceObj.getInsuredAmount()) %>" size="68" styleId="insuredAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <br><html:errors property="insuredAmtLengthError"/>
                  <html:errors property="insuredAmtError"/>
                </td>
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
                <td class="fieldname" width="20%">Received Date<font color="#FF0000">*</font></td>
                <td width="30%"><html:text property="receivedDate" maxlength="30" readonly="true" value="<%=receivedDate %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('receivedDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			               <br><html:errors property="receivedDateError"/> 
                </td>
                <td class="fieldname" width="20%">&nbsp;</td>
               <td width="30%">&nbsp;</td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%">Effective Date Of Insurance<font color="#FF0000">*</font></td>
                <td width="30%"><html:text property="effectiveDate" maxlength="30" readonly="true" value="<%=effectiveDate %>" />
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('effectiveDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			         <br><html:errors property="effectiveDateError"/>
                </td>
                <td class="fieldname" width="20%">Insurance Expiry Date<font color="#FF0000">*</font></td>
                <td width="30%"><html:text property="expiryDate" maxlength="30" readonly="true" value="<%=expiryDate %>"/>
              <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('expiryDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;
			          <br><html:errors property="expiryDateError"/>    
                </td>
              </tr>
               <tr class="even">
                <td class="fieldname" width="20%">Insurance Defaulted</td>
                <%if(insuranceObj.getInsuranceDefaulted()!=null){
                	if(insuranceObj.getInsuranceDefaulted().equals("Yes")){
                	
                	%>
                	<td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="insuranceDefaulted" checked="checked"/>&nbsp;No<input type="radio" value="No" name="insuranceDefaulted"/>
                </td>
                <%}else if(insuranceObj.getInsuranceDefaulted().equals("No")){ %>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="insuranceDefaulted" />&nbsp;No<input type="radio" value="No" name="insuranceDefaulted" checked="checked"/>
                </td>
                
                <%} }else{%>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="insuranceDefaulted"/>&nbsp;No<input type="radio" value="No" name="insuranceDefaulted"/>
              
                </td>
                <%} %>
                <td class="fieldname" width="20%">Insurance Premium</td>
                <td width="30%"><html:text property="insurancePremium" maxlength="30" value="<%=insuranceObj.getInsurancePremium() %>"/>
                 <br><html:errors property="insurancePremiumLengthError"/>  
                
                </td>
              </tr>
              
              
              <tr class="even">
                <td class="fieldname" width="20%">Remark </td>
                <td width="70%" colspan="3"><html:text property="remark" maxlength="50"  size="60"  value="<%=insuranceObj.getRemark() %>"/>&nbsp;</td>
               
              </tr>
              
              
                     
		
         
           <html:hidden name="MaintainInsuranceGCForm"  property="parentId"  value="<%=itrxValue.getReferenceID()%>"/> 
<html:hidden name="MaintainInsuranceGCForm" property="isProcessed" value="<%=insuranceObj.getIsProcessed()%>"/>
<html:hidden name="MaintainInsuranceGCForm" property="deprecated" value="N"/>
<html:hidden name="MaintainInsuranceGCForm" property="id" value="<%=String.valueOf(insuranceObj.getId()) %>"/>
 <html:hidden property="appendedComponent"/>
<html:hidden name="MaintainInsuranceGCForm" property="insuranceCode" value="<%=insuranceObj.getInsuranceCode() %>"/>

<html:hidden name="MaintainInsuranceGCForm" property="lastUpdatedBy" value="<%=insuranceObj.getLastUpdatedBy() %>"/>
<html:hidden name="MaintainInsuranceGCForm" property="lastApproveBy" value="<%=insuranceObj.getLastApproveBy() %>"/>
<html:hidden name="MaintainInsuranceGCForm" property="lastUpdatedOnStr" value="<%=insuranceObj.getLastUpdatedOnStr()%>"/>
<html:hidden name="MaintainInsuranceGCForm" property="lastApproveOnStr" value="<%=insuranceObj.getLastApproveOnStr()%>"/>
					</tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>
<br/><br/>
<table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInput" align="center">
<tr class="even">
<td class="fieldname" width="20%">Edited By</td>
<%if(insuranceObj.getLastUpdatedBy()!=null){ %>
<td width="30%"><%=insuranceObj.getLastUpdatedBy() %></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
<td class="fieldname" width="20%">Last Approved By</td>
<%if(insuranceObj.getLastApproveBy()!=null){ %>
<td width="30%"><%=insuranceObj.getLastApproveBy() %></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
</tr>

<tr class="even">
<td class="fieldname" width="20%">Edited On</td>
<%if(insuranceObj.getLastUpdatedOnStr()!=null){ %>
<td width="30%"><%=insuranceObj.getLastUpdatedOnStr() %></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
<td class="fieldname" width="20%">Last Approved On</td>
<%if(insuranceObj.getLastApproveOnStr()!=null){ %>
<td width="30%"><%=insuranceObj.getLastApproveOnStr() %></td>
<%}else{ %>
<td width="30%">-</td>
<%} %>
</tr>
</table>
<%if(request.getParameter("insType")!=null){
	String edit=request.getParameter("insType");
		
}%>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
  
                    <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick="submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                  
<!--  <td colspan="2">-->
<!--  <center>-->
<!--  <a href="javascript:saveForm();"-->
<!--				onmouseout="MM_swapImgRestore()"-->
<!--				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img-->
<!--				src="img/save1.gif" name="ImageSave" width="70" height="20"-->
<!--				border="0" id="ImageSave" /></a>-->
<!--				-->
<!--				</center>-->
<!--				&nbsp;-->
<!--				</td>-->
			
 <td colspan="2">
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
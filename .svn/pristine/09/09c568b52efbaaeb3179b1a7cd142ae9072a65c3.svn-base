<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.math.BigDecimal"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.IInsuranceGCTrxValue,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.cms.ui.collateral.MaintainInsuranceGCForm" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MaintainInsuranceGCForm insuranceForm = (MaintainInsuranceGCForm) request.getAttribute("MaintainInsuranceGCForm");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String dp=(String)request.getAttribute("calculatedDP");
OBInsuranceGC insuranceObj = (OBInsuranceGC) request.getAttribute("insuranceObj");
List insuranceCoverageList= (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
List currencyList= (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.currencyList");
List componentList= (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.componentList");
 
pageContext.setAttribute("insCompanyList",insuranceCoverageList);
pageContext.setAttribute("currencyList",currencyList);
pageContext.setAttribute("componentList",componentList);

String calculatedDP = (String) request.getAttribute("calculatedDP");
//String fundedShare = (String) request.getAttribute("fundedShare");

String dpShare = (String) request.getAttribute("dpShare");

String dueDate = (String) request.getAttribute("dueDate");
String test=(String) request.getAttribute("dpCalculateManually");

String migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
String totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");

String dpCalculateManually=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpCalculateManually");
System.out.println("<<<<<<<maker add insu>>>>>>>>"+dpCalculateManually);
System.out.println("<<<<<<maker request insu>>>>>"+dpCalculateManually);

BigDecimal loanable=new BigDecimal(0);
if(null!=request.getAttribute("loanable"))
	loanable=new BigDecimal(request.getAttribute("loanable").toString());//(String) request.getAttribute("loanable");
System.out.println("<<<<<<maker request insu loanable>>>>>"+loanable);
//BigDecimal loanable=new BigDecimal(request.getAttribute("loanable").toString());//(String) request.getAttribute("loanable");
//System.out.println("<<<<<<maker request insu loanable>>>>>"+loanable);
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

	ListComponentType = document.forms[0].selectComponent;
    
    AppendedComponentType = document.forms[0].appendedComponent;
    for (i=0;i<ListComponentType.length;i++){
    	ListComponentType.options[i].selected = true;
    	
    	if(AppendedComponentType.value.search(ListComponentType.options[i].value)==-1)
    	{
    		AppendedComponentType.value = ListComponentType.options[i].value + "-" + AppendedComponentType.value;
    	}
       // alert(AppendedSegment.value);
    }
    document.forms[0].appendedComponent.value=AppendedComponentType.value;
 	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_create_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>';
    document.forms[0].submit();
}
function cancleForm() {

	
 	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_cancle_create_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>';
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
<html:form action="AssetInsuranceCollateral.do" >
<input type="hidden" name="calculatedDP" value="<%=calculatedDP %>"></input>
<%--  <input type="hidden" name="fundedShare" value="<%=fundedShare %>"></input>--%>
<input type="hidden" name="dpCalculateManually" value="<%=dpCalculateManually%>"/>
<input type="hidden" name="dpShare" value="<%=dpShare %>"></input>
<input type="hidden" name="loanable" value="<%=loanable%>">
<input type="hidden" name="dueDate" value="<%=dueDate %>"></input>

<input type="hidden" name="migrationFlag" value="<%=migrationFlag %>"></input>
<input type="hidden" name="totalLonable" value="<%=totalLonable %>"></input>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

  <thead>
  <tr><td align="right"><font color="red">*</font>Mandatory</td>
  </tr>
  <tr>
      <td><h3>Add New Insurance </h3></td>
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
                <td width="30%">
                <%if(insuranceObj==null ||(insuranceObj!=null && "All".equals(insuranceObj.getInsuranceRequired()))){ %>
                <input type="radio" value="All" checked="checked" name="insuranceRequired" onclick="javascript:disable()">&nbsp;All&nbsp;&nbsp;
                 <input type="radio" value="Component_wise"  name="insuranceRequired" onclick="javascript:enable()">&nbsp;Component wise</input>
               <%}else if(insuranceObj!=null && "Component_wise".equals(insuranceObj.getInsuranceRequired())){ %>
               <input type="radio" value="All"  name="insuranceRequired" >&nbsp;All&nbsp;&nbsp;
                <input type="radio" value="Component_wise" checked="checked" name="insuranceRequired" onclick="javascript:enable()">&nbsp;Component wise</input>
              <%} %>
                <br><html:errors property="insuranceRequiredError"/>
                </td>
                <td class="fieldname" width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr> 
            
     		
               <% 
            HashMap selectedObjects= new HashMap();
               if(insuranceObj!=null){
                String select=insuranceObj.getSelectComponent();
                String[] abc=select.split("-");
                for(int ab=0;ab <abc.length;ab++){
                    selectedObjects.put(abc[ab],abc[ab]);
                    }
               }
               %>
               <%if(insuranceObj== null){%>
               	<tr class="even">
                <td class="fieldname" width="20%">Select Component</td>
                <td width="30%"><html:select size="6" multiple="multiple" style="width:300" property="allComponent" disabled="true">
                <logic:iterate id="ob" name="componentList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      <html:option value="<%=ob.getValue() %>"><%=ob.getLabel()%></html:option>
                        </logic:iterate>
                </html:select>&nbsp;</td>
                <td>
				 <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allComponent,selectComponent, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal" />
											 <br/> <br/> 
				<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 	onclick="moveDualList(selectComponent,allComponent,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
				<td>		               
				<html:select size="6" multiple="multiple" style="width:300"  property="selectComponent" >
                </html:select>&nbsp;
				 <br><html:errors property="selectComponentError"/>
				</td>
              </tr>
               <%}else{ %>
               
                <tr class="even">
                <td class="fieldname" width="20%">Select Component</td>
               <% if(insuranceObj!=null && insuranceObj.getInsuranceRequired()!=null){
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
				<%}else if(insuranceObj!= null &&  insuranceObj.getInsuranceRequired().equals("Component_wise")){%>
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
     <%} %>
              
              <tr class="even">
                <td class="fieldname" width="20%">Insurance Policy No.<font color="#FF0000">*</font></td>
                <td width="30%">
               <% if(insuranceObj== null){%> 
                <html:text  property="insurancePolicyNo" size = "40" maxlength="30"/>&nbsp;
                <%}else{ %>
                 <html:text  property="insurancePolicyNo" size = "40" maxlength="30" value="<%=insuranceObj.getInsurancePolicyNo() %>"/>&nbsp;
                <%} %>
                  <br><html:errors property="insurancePolicyNoError"/>
                  	<html:errors property="duplicateInsuranceError"/>
                </td>
                <td class="fieldname" width="20%">Cover Note No.</td>
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
                <td class="fieldname" width="20%">Insurance Company Name<font color="#FF0000">*</font></td>
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
                <td class="fieldname" width="20%">Insurance Policy Currency<font color="#FF0000">*</font></td>
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
              <td class="fieldname" width="20%">Insurance Coverage Type<font color="#FF0000">*</font></td>
              <td width="30%">
               <% if(insuranceObj== null){%> 
              <html:select property="insuranceCoverge"  >
                  <!--<integro:common-code 	categoryCode="INSURANCE_TYPE" descWithCode="false" />
         	-->
         	<integro:common-code 	categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
         	</html:select>&nbsp;&nbsp;
         	 <%}else{ %>      
         	<html:select property="insuranceCoverge" value="<%=insuranceObj.getInsuranceCoverge() %>" ><!--
                  <integro:common-code 	categoryCode="INSURANCE_TYPE" descWithCode="false" />
         	-->
         	<integro:common-code 	categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
         	</html:select>&nbsp;&nbsp;
         	  <%} %>    
         	 <br><html:errors property="insuranceCoverageError"/>
               </td>
               <td width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%">Policy Amount<font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%> 
                <html:text  property="insurancePolicyAmt" maxlength="50" size="68" styleId="insurancePolicyAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                	 <%}else{ %>      
                 <html:text  property="insurancePolicyAmt" maxlength="50" value="<%=UIUtil.formatWithCommaAndDecimal(insuranceObj.getInsurancePolicyAmt()) %>" size="68" styleId="insurancePolicyAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <%} %>    
                <br><html:errors property="insurancePolicyAmtError"/>
                  <html:errors property="insurancePolicyAmtLengthError"/>
                </td>
                <td class="fieldname" width="20%">Insured Amount<font color="#FF0000">*</font></td>
                <td width="30%">
                  <% if(insuranceObj== null){%> 
                <html:text  property="insuredAmount" maxlength="50" size="70" styleId="insuredAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                	 <%}else{ %>      
               <html:text  property="insuredAmount" maxlength="50" value="<%=UIUtil.formatWithCommaAndDecimal(insuranceObj.getInsuredAmount()) %>" size="70" styleId="insuredAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  <%} %>    
                  <br><html:errors property="insuredAmtLengthError"/>
                  <html:errors property="insuredAmtError"/>
                </td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%">Received Date<font color="#FF0000">*</font></td>
                <td width="30%">
                 <%DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
                 String receivedDate="";
                 String effectiveDate="";
                 String expiryDate="";
                 if(insuranceObj!= null){
                     if(insuranceObj.getReceivedDate()!=null && (!"".equals(insuranceObj.getReceivedDate()))){
                          receivedDate=df.format(insuranceObj.getReceivedDate());
                	    }
                     if(insuranceObj.getEffectiveDate()!=null && (!"".equals(insuranceObj.getEffectiveDate()))){
                          effectiveDate=df.format(insuranceObj.getEffectiveDate());
                	    }
                     if(insuranceObj.getExpiryDate()!=null && (!"".equals(insuranceObj.getExpiryDate()))){
                          expiryDate=df.format(insuranceObj.getExpiryDate());
                        }
              }%>
                  <% if(insuranceObj== null){%>
                <html:text property="receivedDate" maxlength="30" readonly="true" />
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
                <td width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr>
              
              <tr class="even">
                <td class="fieldname" width="20%">Effective Date Of Insurance<font color="#FF0000">*</font></td>
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
                <td class="fieldname" width="20%">Insurance Expiry Date<font color="#FF0000">*</font></td>
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
                <td class="fieldname" width="20%">Insurance Defaulted</td>
                
                  <% if(insuranceObj== null){%>
                <td width="30%">&nbsp;Yes<input type="radio" value="Yes" name="insuranceDefaulted"/>&nbsp;No<input type="radio" value="No" name="insuranceDefaulted"/>
                </td>
                  <%}else{ %>      
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
                  <%} %>
                <td class="fieldname" width="20%">Insurance Premium</td>
                <td width="30%">
                 <% if(insuranceObj== null){%>
                <html:text property="insurancePremium" maxlength="30"/>
                <%}else{ %>
                <html:text property="insurancePremium" maxlength="30" value="<%=insuranceObj.getInsurancePremium() %>"/>
                <%} %>
                  <br><html:errors property="insurancePremiumLengthError"/>  
                </td>
              </tr>
              
              
              <tr class="even">
                <td class="fieldname" width="20%">Remark</td>
                <td width="30%">
                <% if(insuranceObj== null){%>
                <html:text property="remark" maxlength="50"  size="60"/>&nbsp;
                 <%}else{ %>
                <html:text property="remark" maxlength="50"  size="60"  value="<%=insuranceObj.getRemark() %>"/>&nbsp;
                 <%} %>
                </td>
                <td width="20%"></td>
                 <td width="30%"></td>
              </tr>
              
              
              
                     
		
          </tbody>
        </table> </td>
  </tr>
  <input type="hidden" name="insuranceRequired"></input>
  <html:hidden property="appendedComponent"/>
<html:hidden name="MaintainInsuranceGCForm"  property="parentId"  value="<%=itrxValue.getReferenceID()%>"/> 
<html:hidden name="MaintainInsuranceGCForm" property="isProcessed" value="N"/>
<html:hidden name="MaintainInsuranceGCForm" property="deprecated" value="N"/>

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
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
			
			<td colspan="4">
						
							<a href="javascript:cancelPage();"
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
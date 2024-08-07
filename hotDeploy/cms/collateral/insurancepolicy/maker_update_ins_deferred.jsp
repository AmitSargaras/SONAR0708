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
    
    InsurancePolicyForm insuranceObj = (InsurancePolicyForm) request.getAttribute(formStr);
    
    String insuranceStatusRadio = (String)request.getParameter("insuranceStatusRadio");
    String subtypeCode = (String)request.getAttribute("getSubtypeCode");
  /*  List insuranceCoverageList = null;
   	
    if(session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList");
   	}
    else if(session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
   	}
    else if(session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList");
   	}
    
    pageContext.setAttribute("insuranceCoverageList", insuranceCoverageList);  */
    if("PT701".equals(subtypeCode)){
    	List deferCreditApproverList= (List)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.deferCreditApproverList");
    	
    	if(deferCreditApproverList!=null){
         	pageContext.setAttribute("deferCreditApproverList",deferCreditApproverList);
         }
    }else{
    	List deferCreditApproverList= (List)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.deferCreditApproverList");
    	
    	if(deferCreditApproverList!=null){
         	pageContext.setAttribute("deferCreditApproverList",deferCreditApproverList);
         }
    }
  
    //System.out.println("insuranceObj.insuranceObj.getOriginalTargetDate()()------------"+insuranceObj.getOriginalTargetDate());
%>

<%@page import="com.integrosys.cms.ui.collateral.insurancepolicy.InsurancePolicyForm"%>
<%
	String[] style = {"even", "odd"};
	int count = 0;
%>

<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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

	document.forms[0].action='<%=actionNameStr%>?event=maker_update_insdeferred_list';
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
<html:hidden property="insuranceStatus"  value="PENDING_DEFER"/>

<html:hidden property="insuranceCompanyName"/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

  <thead>
  <tr><td align="right"><font color="red">*</font>Mandatory</td>
  </tr>
  <tr>
      <td><h3>Edit Insurance - Deferred </h3></td>
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
                <td class="fieldname" width="20%"><bean:message bundle="message-collateral" key="label.insurance.originaltarget.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <%DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
                 String originalTargetDate="";
                 String dateDeferred=df.format(new Date());
                 String nextDueDate="";
                
					if(insuranceObj!= null){
                	 
                	 if(insuranceObj.getOriginalTargetDate()!=null && (!"".equals(insuranceObj.getOriginalTargetDate()))){
                          originalTargetDate=df.format(df.parse(insuranceObj.getOriginalTargetDate()));
                	    }
                	  if(insuranceObj.getDateDeferred()!=null && (!"".equals(insuranceObj.getDateDeferred()))){
                              dateDeferred=df.format(df.parse(insuranceObj.getDateDeferred()));
                    	    }
                	  if(insuranceObj.getNextDueDate()!=null && (!"".equals(insuranceObj.getNextDueDate()))){
                          nextDueDate=df.format(df.parse(insuranceObj.getNextDueDate()));
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
if(user1.getTeamTypeMembership().getMembershipID()==1006 ||user1.getTeamTypeMembership().getMembershipID()==1001
||user1.getTeamTypeMembership().getMembershipID()==1034){
	isMaker=true;
}else {
	isChecker=true;
}

String event=(String)request.getAttribute("event");

String from_event=(String)request.getAttribute("from_event");

String subType = request.getParameter("subtype");

System.out.println("from_event:"+from_event);
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
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue"%><html>
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
	<%-- document.forms[0].action="AssetAircraftCollateral.do?event=read&collateralID=<%=itrxValue.getReferenceID()%>"; --%>
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
      <td><h3>View Insurance - Pending</h3></td>
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
                <td class="fieldname" width="20%"><bean:message bundle="message-col" key="label.insurance.originaltarget.date" /><font color="#FF0000">*</font></td>
                <td width="30%">
                 <%DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
                 String originalTargetDate="";
                 
                 if(aForm!= null){
                	 
                	 if(aForm.getOriginalTargetDate()!=null && (!"".equals(aForm.getOriginalTargetDate()))){
                          originalTargetDate=df.format(df.parse(aForm.getOriginalTargetDate()));
                	    }
                     
              }%>
                  <integro:empty-if-null value="<%=originalTargetDate %>"/>&nbsp;
                </td>
                <td>&nbsp;&nbsp;</td>
              </tr>
             
           
          
          </tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>
<br/><br/>


<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
 <% if(isMaker){%>
 <td colspan="4">
		
	<%	if(event.equals("maker_view_insurance_pending")){%>		
				<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
							<%	}else if(event.equals("checker_view_insurance_pending") && "read".equals(from_event)){%>		
							<center>
							<a href="javascript:cancelPageMakerView1();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						 
						<%}else if(event.equals("checker_view_insurance_pending")){%>		
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
				<%if(event.equals("checker_view_insurance_pending") && "read".equals(from_event)){ %>
				<center><a href="javascript:cancelPage4();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
				</center>
				<%}else if(event.equals("checker_view_insurance_pending")){ %>
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
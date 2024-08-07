<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.collateral.CommonNatureOfCharge,
                 com.integrosys.cms.ui.collateral.property.*,
                 com.integrosys.cms.app.checklist.bus.*,      
                 com.integrosys.cms.app.collateral.bus.*,        
                 com.integrosys.cms.app.collateral.bus.type.property.*, 
                 com.integrosys.cms.app.common.constant.ICMSConstant,   
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 java.net.URLEncoder,
                 java.util.*"%>
    
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    
    HashMap docCatMap = (HashMap)request.getAttribute("docCatList");
    ArrayList mainBorrowerList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_MAIN_BORROWER);
    ArrayList nonBorrowerList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_NON_BORROWER);
    ArrayList coBorrowerList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_CO_BORROWER);
    ArrayList pledgorList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_PLEDGER);
    ArrayList securitiesList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_SECURITY);
    
    String asOfDate=(String)session.getAttribute("com.integrosys.cms.ui.checklist.audit.AuditCheckListAction.asOfDate");
    if(asOfDate != null ) asOfDate = asOfDate.replace('/', ' ');

    //ICheckListAudit[] ccAuditList = (ICheckListAudit[])map.get(ICMSConstant.DOC_TYPE_CC);
    //ICheckListAudit[] colAuditList = (ICheckListAudit[])map.get(ICMSConstant.DOC_TYPE_SECURITY);
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->


<!-- InstanceEndEditable -->
</head>

<html:form action="AuditCheckList" >

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3>Audit Confirmation List - as at (<%= asOfDate %>) </h3>
    </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
	<thead> 
	  <tr> 
	    <td width="12%">Customer Category</td>
	    <td width="6%">Action</td>
	  </tr>
	</thead>
        <tbody> 
<%	boolean prevRowExists = false;
if (docCatMap!=null && docCatMap.size()>0)
	{
		String value = null;
		String bgColor = "odd";
		

		if (mainBorrowerList!=null && mainBorrowerList.size()>0)
		{
			prevRowExists = true;
%>		        <tr class="odd"> 
		          <td valign="top"><b>Main-Borrower</b></td>
		          <td valign="top"><a href="AuditCheckList.do?event=main_borrower_list">View</a></td>
		        </tr>
<%		}
		if (nonBorrowerList!=null && nonBorrowerList.size()>0)
		{
			if (prevRowExists) //to print the single white row
			{
%>				<tr> 
					<td valign="top">&nbsp;</td>
					<td valign="top">&nbsp;</td>
				</tr>
<%			}
			prevRowExists = true;
%>
			<tr class="odd"> 
				<td valign="top"><b>Non-Borrower</b></td>
				<td valign="top"><a href="AuditCheckList.do?event=non_borrower_list">View</a></td>
			</tr>
<%		}
		if (coBorrowerList!=null && coBorrowerList.size()>0)
		{
			if (prevRowExists) //to print the single white row
			{
%>				<tr> 
					<td valign="top">&nbsp;</td>
					<td valign="top">&nbsp;</td>
				</tr>
<%			}
			prevRowExists = true;
			bgColor = "odd";
%>		        <tr class="<%=bgColor%>"> 
		          <td valign="top"><b>Co-Borrower(s)</b></td>
		          <td valign="top">&nbsp;</td>
		        </tr>
<%			for(int i=0; i<coBorrowerList.size(); i++)
			{
				bgColor = bgColor.equals("odd") ? "even" : "odd";
				String[] data = (String[])coBorrowerList.get(i);
				String encodedCoBorrowerName = URLEncoder.encode(data[1]);
%>			        <tr class="<%=bgColor%>"> 
			          <td valign="top"><%=data[1]%></td>
			          <td valign="top"><a href="AuditCheckList.do?event=co_borrower_list&checklist_id=<%=data[0]%>&co_borrower_legal_id=<%=data[2]%>&co_borrower_name=<%=encodedCoBorrowerName%>">View</a></td>
		        	</tr>
<%			}
		}
		if (pledgorList!=null && pledgorList.size()>0)
		{
			if (prevRowExists) //to print the single white row
			{
%>				<tr> 
					<td valign="top">&nbsp;</td>
					<td valign="top">&nbsp;</td>
				</tr>
<%			}
			prevRowExists = true;
			bgColor = "odd";
%>
		        <tr class="<%=bgColor%>">
		          <td valign="top"><b>Pledgor(s)</b></td>
		          <td valign="top">&nbsp;</td>
		        </tr>
<%			for(int i=0; i<pledgorList.size(); i++)
			{
				bgColor = bgColor.equals("odd") ? "even" : "odd";
				String[] data = (String[])pledgorList.get(i);
				String encodedPledgorName = URLEncoder.encode(data[1]);
				System.out.println("encodedPledgorName="+encodedPledgorName);
%>			        <tr class="<%=bgColor%>"> 
			          <td valign="top"><%=data[1]%></td>
			          <td valign="top"><a href="AuditCheckList.do?event=pledgor_list&checklist_id=<%=data[0]%>&pledgor_legal_id=<%=data[2]%>&pledgor_id=<%=data[3]%>&pledgor_name=<%=encodedPledgorName%>">View</a></td>
		        	</tr>
<%			}
		}
	}if(!prevRowExists){
%>
        <tr class="odd">
                   <td colspan="2">There is no document</td>
                 </tr>
     <%  }
     %>            
	</tbody> 
      </table>
    </td>
    </tr>
  </tbody>
</table>

</html:form>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>

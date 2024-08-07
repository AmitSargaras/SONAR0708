<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.app.checklist.proxy.*,
                 com.integrosys.cms.app.checklist.bus.*,      
                 com.integrosys.cms.app.common.constant.ICMSConstant,   
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.common.IContext,
                 java.net.URLEncoder,
                 java.util.*"%>
    
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    boolean printCheck = true;
    ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limit = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    IContext theContext = (IContext)request.getAttribute("theOBTrxContext");
    
    HashMap docCatMap = (HashMap)request.getAttribute("docCatList");
    ArrayList mainBorrowerList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_MAIN_BORROWER);
    ArrayList nonBorrowerList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_NON_BORROWER);
    ArrayList coBorrowerList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_CO_BORROWER);
    ArrayList pledgorList = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_PLEDGER);
    ArrayList securitiesList4MB = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_SECURITY_MB);
    ArrayList securitiesList4CB = (ArrayList)docCatMap.get(ICMSConstant.CHECKLIST_SECURITY_CB);
    
    ICheckListProxyManager checkListProxyManager = CheckListProxyManagerFactory.getCheckListProxyManager();
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/imageNavigation.js"></script>

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->


<!-- InstanceEndEditable -->
</head>

<html:form action="DocumentCheckList" >

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3>List of Documents Held</h3>
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
<%	if (docCatMap!=null && docCatMap.size()>0)
	{
		long customerID = ICMSConstant.LONG_INVALID_VALUE;
		String bookingLocation = null;
		
		String value = null;
		String bgColor = "odd";
		boolean prevRowExists = false;
		boolean headerPrinted = false;

		if (mainBorrowerList!=null && mainBorrowerList.size()>0)
		{
			String[] data = (String[])mainBorrowerList.get(0); //gets the checklist ID of the single main borrower
/*			
			ICheckList checkList= checkListProxyManager.getCheckListByID(Long.parseLong(data[0]));
			if (checkList!=null)
			{
				customerID = ((ICCCheckListOwner)checkList.getCheckListOwner()).getSubOwnerID();
				if (checkList.getCheckListLocation()!=null)
					bookingLocation = checkList.getCheckListLocation().getCountryCode();
				else
					bookingLocation = null;
*/									
				if (checkListProxyManager.isInSameCountry(theContext, limit, Long.parseLong(data[2]), data[3], "MAIN_BORROWER"))
				{
			
					prevRowExists = true; //sets to true as long as header is printed
%>					<tr class="odd">
						<td valign="top"><b>Main-Borrower</b></td>
						<td valign="top">&nbsp;</td>
					</tr>
					<tr class="even">
						<td valign="top"><%=data[1]%>&nbsp;</td>
						<td valign="top"><a href="DocumentCheckList.do?event=main_borrower_list">View</a></td>
					</tr>
<%				}
//			}
		}
		if (nonBorrowerList!=null && nonBorrowerList.size()>0)
		{
      String[] data = (String[])nonBorrowerList.get(0); //gets the checklist ID of the single non borrower
			if (prevRowExists) //to print the single white row
			{
%>				<tr> 
					<td valign="top">&nbsp;</td>
					<td valign="top">&nbsp;</td>
				</tr>
<%			}
			prevRowExists = true; //sets to true as long as header is printed
%>			<tr class="odd">
				<td valign="top"><b>Non-Borrower</b></td>
				<td valign="top">&nbsp;</td>
			</tr>
			<tr class="even">
				<td valign="top"><%=data[1]%>&nbsp;</td>
				<td valign="top"><a href="DocumentCheckList.do?event=non_borrower_list">View</a></td>
			</tr>
<%		}
		if (coBorrowerList!=null && coBorrowerList.size()>0)
		{
			bgColor = "odd";
			headerPrinted = false;
			for(int i=0; i<coBorrowerList.size(); i++)
			{
				String[] data = (String[])coBorrowerList.get(i);
				String encodedCoBorrowerName = URLEncoder.encode(data[1]);
/*
				ICheckList checkList= checkListProxyManager.getCheckListByID(Long.parseLong(data[0]));
				if (checkList!=null)
				{
					customerID = ((ICCCheckListOwner)checkList.getCheckListOwner()).getSubOwnerID();
					if (checkList.getCheckListLocation()!=null)
						bookingLocation = checkList.getCheckListLocation().getCountryCode();
					else
						bookingLocation = null;
*/									
					if (checkListProxyManager.isInSameCountry(theContext, limit, Long.parseLong(data[3]), data[4], "CO_BORROWER"))
					{
						if (!headerPrinted) //if 1st iteration, print spacer row and header
						{
							headerPrinted = true;
							if (prevRowExists) //to print the single white row
							{
%>								<tr> 
									<td valign="top">&nbsp;</td>
									<td valign="top">&nbsp;</td>
								</tr>
<%							}
							prevRowExists = true; //sets to true as long as header is printed
%>							<tr class="<%=bgColor%>"> 
								<td valign="top"><b>Co-Borrower(s)</b></td>
								<td valign="top">&nbsp;</td>
							</tr>
<%						}
						bgColor = bgColor.equals("odd") ? "even" : "odd";
%>				        <tr class="<%=bgColor%>">
							<td valign="top"><%=data[1]%></td>
							<td valign="top"><a href="DocumentCheckList.do?event=co_borrower_list&checklist_id=<%=data[0]%>">View</a></td>
						</tr>
<%
					}
//				}
			}
		}
		if (pledgorList!=null && pledgorList.size()>0)
		{
			bgColor = "odd";
			headerPrinted = false;
			for(int i=0; i<pledgorList.size(); i++)
			{
				String[] data = (String[])pledgorList.get(i);
				String encodedPledgorName = URLEncoder.encode(data[1]);
/*
				ICheckList checkList= checkListProxyManager.getCheckListByID(Long.parseLong(data[0]));
				if (checkList!=null)
				{
					customerID = ((ICCCheckListOwner)checkList.getCheckListOwner()).getSubOwnerID();
					if (checkList.getCheckListLocation()!=null)
						bookingLocation = checkList.getCheckListLocation().getCountryCode();
					else
						bookingLocation = null;
*/									
					if (checkListProxyManager.isInSameCountry(theContext, limit, Long.parseLong(data[4]), data[5], "PLEDGOR"))
					{
						if (!headerPrinted) //if 1st iteration, print spacer row and header
						{
							headerPrinted = true;
							if (prevRowExists) //to print the single white row
							{
%>							<tr>
									<td valign="top">&nbsp;</td>
									<td valign="top">&nbsp;</td>
								</tr>
<%							}
							prevRowExists = true; //sets to true as long as header is printed
%>						<tr class="<%=bgColor%>">
								<td valign="top"><b>Pledgor(s)</b></td>
								<td valign="top">&nbsp;</td>
							</tr>
<%						}
						bgColor = bgColor.equals("odd") ? "even" : "odd";
%>					<tr class="<%=bgColor%>">
							<td valign="top"><%=data[1]%></td>
							<td valign="top"><a href="DocumentCheckList.do?event=pledgor_list&checklist_id=<%=data[0]%>&pledgor_legal_id='<%=data[2]%>&pledgor_id=<%=data[3]%>&pledgor_name=<%=encodedPledgorName%>">View</a></td>
						</tr>
<%					}
//				}
			}
		}
		if (securitiesList4MB!=null && securitiesList4MB.size()>0)
		{
			bgColor = "odd";
			headerPrinted = false;
			for(int i=0; i<securitiesList4MB.size(); i++)
			{
				String[] data = (String[])securitiesList4MB.get(i);
				String securityID = (data[1]==null || data[1].equals("")) ? "-" : data[1];
				String type = (data[2]==null || data[2].equals("")) ? "-" : data[2];
				String subType = (data[3]==null || data[3].equals("")) ? "-" : data[3];
				String collateralID = (data[4]==null || data[4].equals("")) ? "-" : data[4];
					//checks to ensure collateralID is valid before calling isInSameCountry method
					if (!collateralID.equals("-") && 
						checkListProxyManager.isInSameCountry(theContext, limit, Long.parseLong(collateralID), data[5]))
					{
						if (!headerPrinted) //if 1st iteration, print spacer row and header
						{
							headerPrinted = true;
							if (prevRowExists) //to print the single white row
							{
%>								<tr> 
									<td valign="top">&nbsp;</td>
									<td valign="top">&nbsp;</td>
								</tr>
<%							}
							prevRowExists = true; //sets to true as long as header is printed
%>							<tr class="<%=bgColor%>"> 
								<td valign="top"><b>Securities - Main-Borrower</b></td>
								<td valign="top">&nbsp;</td>
							</tr>
<%						}
						bgColor = bgColor.equals("odd") ? "even" : "odd";
%>						<tr class="<%=bgColor%>"> 
							<td valign="top"><%=type%>/<%=subType%> : <%=securityID%></td>
							<td valign="top"><a href="DocumentCheckList.do?event=securities_list&collateral_id=<%=collateralID%>&checklist_id=<%=data[0]%>">View</a></td>
						</tr>
<%					}
			}
		}
		
if (securitiesList4CB!=null && securitiesList4CB.size()>0)
		{
			bgColor = "odd";
			headerPrinted = false;
			for(int i=0; i<securitiesList4CB.size(); i++)
			{
				String[] data = (String[])securitiesList4CB.get(i);
				String securityID = (data[1]==null || data[1].equals("")) ? "-" : data[1];
				String type = (data[2]==null || data[2].equals("")) ? "-" : data[2];
				String subType = (data[3]==null || data[3].equals("")) ? "-" : data[3];
				String collateralID = (data[4]==null || data[4].equals("")) ? "-" : data[4];
					//checks to ensure collateralID is valid before calling isInSameCountry method
					if (!collateralID.equals("-") && 
						checkListProxyManager.isInSameCountry(theContext, limit, Long.parseLong(collateralID), data[5]))
					{
						if (!headerPrinted) //if 1st iteration, print spacer row and header
						{
							headerPrinted = true;
							if (prevRowExists) //to print the single white row
							{
%>								<tr> 
									<td valign="top">&nbsp;</td>
									<td valign="top">&nbsp;</td>
								</tr>
<%							}
							prevRowExists = true; //sets to true as long as header is printed
%>							<tr class="<%=bgColor%>"> 
								<td valign="top"><b>Securities - Co-Borrower</b></td>
								<td valign="top">&nbsp;</td>
							</tr>
<%						}
						bgColor = bgColor.equals("odd") ? "even" : "odd";
%>						<tr class="<%=bgColor%>"> 
							<td valign="top"><%=type%>/<%=subType%> : <%=securityID%></td>
							<td valign="top"><a href="DocumentCheckList.do?event=securities_list&checklist_id=<%=data[0]%>&collateral_id=<%=collateralID%>">View</a></td>
						</tr>
<%					}
			}
		}
		if (!prevRowExists)
		{  
		  printCheck = false;
%>			<tr class="odd">
				<td colspan="14">No documents held in your Location</td>
			</tr>
<%		}
	}
	else
	{
	  printCheck = false;
%>		<tr class="odd">
		  <td colspan="14">No documents held in your Location</td>
		</tr>
<%	}
%>
	</tbody> 
      </table>
    </td>
    </tr>
  </tbody>
</table>
<%	if (docCatMap!=null && docCatMap.size()>0 && printCheck) { %>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top" >&nbsp;</td>
  </tr>
  <tr> 
    <td valign="top" ><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/printall2.gif',1)" onclick="MM_openBrWindow('DocumentCheckList.do?event=print_list_all','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=450,left=5,top=5')" ><img src="img/printall1.gif" name="Image2" border="0" id="Image2" /></a></td>
  </tr>
  <tr> 
    <td valign="top" >&nbsp;</td>
  </tr>
</table>
<% } %>
</html:form>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>

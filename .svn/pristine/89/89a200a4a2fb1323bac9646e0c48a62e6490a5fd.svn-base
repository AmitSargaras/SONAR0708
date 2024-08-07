<%@ page import="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult,
				com.integrosys.cms.app.customer.bus.*,
				com.integrosys.component.commondata.app.CommonDataSingleton,
				com.integrosys.cms.ui.customer.CategoryCodeConstant,
				java.util.Date,
                 		com.integrosys.cms.app.common.util.CommonUtil,
				com.integrosys.cms.app.limit.bus.ILimitProfile,
				com.integrosys.cms.app.limit.bus.ILimit,
				com.integrosys.cms.app.common.constant.ICMSConstant,
				com.integrosys.cms.ui.common.ForexHelper,
				com.integrosys.base.businfra.currency.Amount,
				com.integrosys.base.businfra.currency.CurrencyCode,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				com.integrosys.cms.ui.common.CountryList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/common/view_outer_limit_bca.jsp,v 1.7 2006/10/27 08:42:38 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.7 $
     * @since $Date: 2006/10/27 08:42:38 $
     * Tag: $Name:  $
     */
%>

<%
	String event = request.getParameter("event");
	String action = request.getParameter("actionName");
	String remarks = request.getParameter("remarks");
	if (remarks == null) {
		remarks = "";
	}
	String isTrack = request.getParameter("isTrack");
	if (isTrack == null || ("null").equals(isTrack)) {
		isTrack = "";
	}
	String isView = request.getParameter("isView");
	if (isView == null || ("null").equals(isView)) {
		isView = "";
	}
	
	String returnEvent = "view_return";
	
	if ("update_view_outer_limit_bca".equals(event)) {
		returnEvent = "update_return";
	} else if ("checker_view_outer_limit_bca".equals(event)) {
		returnEvent = "checker_return";
	}
	
	String returnURL = action +".do?event="+ returnEvent +"&isTrack="+isTrack+"&remarks="+ remarks+"&isView="+isView;
	
	CountryList countryList = CountryList.getInstance();
	
	OBCustomerSearchResult OB = (OBCustomerSearchResult)request.getAttribute("outerLimitBCA");
	ICMSCustomer obCustomer = OB.getCustomer();
	ICMSLegalEntity legal = null;
    String creditGradeLabel = null;
    String creditGradeValue = null;

	String isiccd = null;
	String isicdesc = null;
	
	if (obCustomer != null) {
		legal = obCustomer.getCMSLegalEntity();
	
	    IISICCode isiccode[] = legal.getISICCode();
	    if(isiccode!=null && isiccode.length !=0) {
	        for (int i=0;i <isiccode.length;i++) {
	            if(isiccode[i].getISICType()!=null && isiccode[i].getISICType().equals(CategoryCodeConstant.ISIC_TYPE)) {
		            if(isiccode[i].getISICCode()!=null) {
	    	            isicdesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ISIC_CODE, isiccode[i].getISICCode());
	        	    }
	            	isiccd = isiccode[i].getISICCode();
	           	}
	        }
	    }
	    ICreditGrade creditgrade[] = legal.getCreditGrades();
	    if (creditgrade != null) {
		    for (int i = 0; i < creditgrade.length; i++) {
			    if (creditgrade[i].getCGType().equals(CategoryCodeConstant.CREDIT_GRADE_TYPE_INTERNAL)) {
				    creditGradeLabel = CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_GRADE_TYPE, creditgrade[i].getCGType());
				    creditGradeValue = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CREDIT_GRADE_VALUE, creditgrade[i].getCGCode());
				    break;
			    }
		    }
	    }
	    
	}
    String fam = (String)request.getAttribute("fam");
    String famcode = (String)request.getAttribute("famcode");
    
    
    ILimitProfile obLimitProfile = OB.getLimitProfile();
    Date bflIssueDate = null;
    Date bcaApprovalDate = null;
    String bcaBookingLocation = null;
    if (obLimitProfile != null) {
	    bflIssueDate = obLimitProfile.getBflIndUpdateDate();
	    bcaApprovalDate = obLimitProfile.getApprovalDate();
	    if (obLimitProfile.getOriginatingLocation() != null) {
		    bcaBookingLocation = countryList.getCountryName(obLimitProfile.getOriginatingLocation().getCountryCode());
	    }
    }
		
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->


<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script type="text/javascript" src="js/imageNavigation.js"></script>
<!-- InstanceEndEditable -->
</head>

<body >
<!-- InstanceBeginEditable name="Content" -->
<% if (obCustomer == null) {  // with DAP error msg
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>View Linkage to Different Limit Profile</h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      	<tr class="odd">
      		<td width="20%" class="fieldname">LE ID</td>
      		<td width="30%"><bean:write name="outerLimitBCA" property="legalReference" scope="request"/>&nbsp;</td>
      		<td width="20%" class="fieldname">Legal Name</td>
      		<td width="30%"><bean:write name="outerLimitBCA" property="legalName" scope="request"/></td>
      	</tr>
      	<tr class="even">
      		<td class="fieldname"><bean:message key="label.global.aa"/> <bean:message key="label.ref.no"/></td>
      		<td><bean:write name="outerLimitBCA" property="instructionRefNo" scope="request"/>&nbsp;</td>
      		<td class="fieldname"><bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/></td>
      		<td><integro:empty-if-null value="<%=countryList.getCountryName(OB.getOrigLocCntry())%>"/>&nbsp;</td>
      	</tr>
      </table>
      </td>
    </tr>
  </tbody>
</table>
<table width="460" height="210" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd"> 
      <td style="text-align:center" valign="middle"><table width="400"  height="150"  border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr> 
              <td class="even" style="text-align:center" valign="middle"> 
                <br />
                <table width="300"  border="0" cellpadding="10" cellspacing="0" class="tblInfo">
                  <tr class="even">
                    <td style="border:none;text-align:right;padding-right:10px"><strong><img src="img/noentry.gif" width="50" height="50" /></strong></td>
                    <td style="border:none">
                    	<strong><font size="2">Access Denied.
                    	<br>Customer details cannot be displayed due to the prevalent data protection rules
                    	</font></strong>       	
                    </td>
                  </tr>
                </table>
                <br />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<% }  else { %>
  
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>View Linkage to Different Limit Profile</h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      	<tr class="odd">
      		<td width="20%" class="fieldname">LE ID</td>
      		<td width="30%"><integro:empty-if-null value="<%=legal.getLEReference()%>"/>&nbsp;</td>
      		<td width="20%" class="fieldname">Legal Name</td>
      		<td width="30%"><integro:htmltext value="<%=OB.getLegalName()%>"/></td>
      	</tr>
      	<tr class="even">
      		<td class="fieldname"><bean:message key="label.customer.subprofile.id"/></td>
      		<td><bean:write name="outerLimitBCA" property="customer.customerReference" scope="request"/>&nbsp;</td>
      		<td class="fieldname"><bean:message key="label.customer.subprofile.name"/></td>
      		<td><bean:write name="outerLimitBCA" property="customer.customerName" scope="request"/>&nbsp;</td>      		
        </tr>
        <tr class="odd">
        	<td class="fieldname">Domicile Country</td>
        	<td><integro:empty-if-null value="<%=countryList.getCountryName(obCustomer.getDomicileCountry())%>"/>&nbsp;</td>
        	<td class="fieldname">Referred</td>
        	<td><integro:boolean-display style="yn" value="<%=legal.getBlackListedInd()%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
        	<td class="fieldname">ISIC Code</td>
        	<td><integro:empty-if-null value="<%=isiccd%>"/>&nbsp;</td>
        	<td class="fieldname">ISIC Description</td>
        	<td><integro:empty-if-null value="<%=isicdesc%>"/>&nbsp;</td>
        </tr>
        <tr class="odd">
        	<td class="fieldname">FAM</td>
        	<td><integro:htmltext value="<%=famcode%>"/>&nbsp;<integro:htmltext value="<%=fam%>"/>&nbsp;</td>
        	<td class="fieldname">Customer Category</td>
        	<td><%=obCustomer.getNonBorrowerInd()?"Non Borrower":"Borrower"%>&nbsp;</td>
        </tr>
        <tr class="even">
        	<td class="fieldname">Customer Segment</td>
        	<td><integro:htmltext value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_SEGMENT, legal.getCustomerSegment())%>"/>&nbsp;</td>
        	<td class="fieldname">Customer Legal constitution</td>
        	<td><integro:htmltext value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_LEGAL_CONST, legal.getLegalConstitution())%>"/>&nbsp;</td>        	
        </tr>
        <tr class="odd">
        	<td class="fieldname"><integro:empty-if-null value="<%=creditGradeLabel%>"/>&nbsp;</td>
        	<td><integro:empty-if-null value="<%=creditGradeValue%>"/>&nbsp;</td>
        	<td class="fieldname">Customer BFL Issued Date</td>
        	<td><integro:date object="<%=bflIssueDate%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
        	<td class="fieldname"><bean:message key="label.global.aa"/> <bean:message key="label.ref.no"/></td>
        	<td><integro:empty-if-null value="<%=(obLimitProfile != null)?obLimitProfile.getBCAReference():null%>"/>&nbsp;</td>
        	<td class="fieldname"><bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/></td>
        	<td><integro:empty-if-null value="<%=bcaBookingLocation%>"/>&nbsp;</td>
        </tr>
        <tr class="odd">
        	<td class="fieldname">AA Approval Date</td>
        	<td><integro:date object="<%=bcaApprovalDate%>"/>&nbsp;</td>
        	<td class="fieldname">&nbsp;</td>
        	<td>&nbsp;</td>
        </tr>
      </table>
      </td>
    </tr>
  </tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="5%">S/N</td>
          <td width="20%">Limit ID</td>
          <td width="20%">Limit Booking Location</td>
          <td width="20%">Product Description</td>
          <td width="20%">Outer Limit ID</td>
          <td width="15%">Approved Limit</td>
        </tr>
        </thead>
        <tbody>
<%
	if (obLimitProfile == null || obLimitProfile.getLimits() == null ||
			obLimitProfile.getLimits().length == 0) {
%>
		<tr>
			<td colspan="7">No limit found</td>        update_complete.jsp 
		</tr>        
<%
	} else {	
		double USDappAmt =0;
        CurrencyCode usd= new CurrencyCode(CommonUtil.getBaseCurrency());
        ForexHelper fr = new ForexHelper();
        
		ILimit[] limitArr = obLimitProfile.getLimits();
		for (int i = 0; i < limitArr.length; i++) {
			boolean isInnerLimit = (limitArr[i].getOuterLimitRef() != null &&
	          			!"".equals(limitArr[i].getOuterLimitRef()) &&
	          			!"0".equals(limitArr[i].getOuterLimitRef()));
           	try {
                if(!isInnerLimit) {
                	if(USDappAmt!=ICMSConstant.LONG_INVALID_VALUE) {
            			USDappAmt = USDappAmt + fr.convertAmount(limitArr[i].getApprovedLimitAmount(),usd);
        			}
                }
         	} catch(Exception e) {
	            USDappAmt = ICMSConstant.LONG_INVALID_VALUE;
         	}
	          			
%>
        <tr class="<%=(i%2==0)?"odd":"even"%>">
          <td class="index"><%=i+1%></td>
          <td><integro:empty-if-null value="<%=limitArr[i].getLimitRef()%>"/>&nbsp;</td>
          <td>
          <%	if (limitArr[i].getBookingLocation() != null) {%>
	      <integro:empty-if-null value="<%=countryList.getCountryName(limitArr[i].getBookingLocation().getCountryCode())%>"/>    		
          <%
          		}
          %>
          &nbsp;
          </td>
          <td>
			<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, limitArr[i].getProductDesc().toString())%>"/>          
          &nbsp;
          </td>
          <td>
	          <% if (isInnerLimit) { %>
	          <integro:empty-if-null value="<%=limitArr[i].getOuterLimitRef()%>"/>
	          <% } else { %>-<% } %>&nbsp;
          </td>
          <td class="amount">
          <% if (limitArr[i].getApprovedLimitAmount() != null &&
          			limitArr[i].getApprovedLimitAmount().getCurrencyCode() != null) {
	          	if (isInnerLimit) {
	      %>
          (<integro:currency amount="<%=limitArr[i].getApprovedLimitAmount()%>" />)
          <% 	} else { %>
          <integro:currency amount="<%=limitArr[i].getApprovedLimitAmount()%>" />
          <% 	}	} else { %> - <% } %>
          &nbsp;
          </td>
        </tr>
<% 		} %>
        <tr class="total">
          <td class="total">&nbsp;</td>
          <td class="total">&nbsp;</td>
          <td class="total">&nbsp;</td>
          <td class="total">&nbsp;</td>
          <td class="total">&nbsp;</td>
          <td class="total">
          <% 
          	Amount USapprovedAmount = new Amount(USDappAmt,usd);
            if(USapprovedAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
          %>
          	<integro:currency amount="<%=USapprovedAmount%>"/>
          <% } else { %>
          	Forex Error
          <% } %>&nbsp;
          </td>
        </tr>
<%	} %>        
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<% } %>  

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
		<td align="center"><a href="<%=returnURL%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
	</tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>

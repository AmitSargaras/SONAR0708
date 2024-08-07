<%@ page import="com.integrosys.cms.ui.customer.ProcessDetailsCustomerForm,
                 java.util.Collection,
                 java.util.Vector,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 java.util.Date,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.cms.app.limit.trx.ILimitProfileTrxValue,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.List,
                 java.util.HashMap,
                 java.util.Iterator,
                 com.integrosys.base.techinfra.util.SortUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/chkLimitProfileApRej.jsp,v 1.56 2006/10/30 02:58:55 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.56 $
     * @since $Date: 2006/10/30 02:58:55 $
     * Tag: $Name:  $

     * @author $Author: hmbao $<br>
     * @version $Revision: 1.56 $
     * @since $Date: 2006/10/30 02:58:55 $
     * Tag: $Name:  $
     * insert "STANDARD & POORS" credit grade
     * must display all four credit grades : "INTERNAL", "ORIGINAL", "MOODYS", "STANDARD & POORS"
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

     System.out.println("Entered chlimitprofileApRej.jsp page");
      boolean bInternal = false;
      boolean bOriginal = false;
      boolean bMoody = false;
      boolean bStandard = false;

     ILimitProfileTrxValue iLimitTrxVal = (ILimitProfileTrxValue)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.trxValue");
     ILimitProfile limit = iLimitTrxVal.getStagingLimitProfile();
     ILimitProfile limit1 = iLimitTrxVal.getLimitProfile();
     String secCov ="-";
     String secCov1 ="-";
     String apGrade ="-";
     String apGrade1="-";
     String[] param = {"EffectiveDate", "CGReference"};
     if (limit.getRequiredSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
        secCov = String.valueOf(limit.getRequiredSecurityCoverage());
     }
     if (limit1.getRequiredSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
        secCov1 = String.valueOf(limit1.getRequiredSecurityCoverage());
     }
     if(limit.getApprovingOfficerGrade()!=null)
        apGrade = limit.getApprovingOfficerGrade();
    if(limit1.getApprovingOfficerGrade()!=null)
        apGrade1 = limit1.getApprovingOfficerGrade();
     OBCMSCustomer test = (OBCMSCustomer)request.getAttribute("customerOb");
     ICMSLegalEntity legal = test.getCMSLegalEntity();
     ICreditGrade creditgrade[] = legal.getCreditGrades();
     int noOfCreditGrade=0;
     if(creditgrade!=null){
     if(creditgrade.length>=0)
            noOfCreditGrade=creditgrade.length;
            SortUtil.sortObject(creditgrade, param);
     }
     String cgtype[]=new String[noOfCreditGrade];
     String cgvalue[]=new String[noOfCreditGrade];
     String cgreasonforchng[]=new String[noOfCreditGrade];
     String cgstatus[]=new String[noOfCreditGrade];
     Date creditgradeEffectiveDate[] = new Date[noOfCreditGrade];
     String custCategory =new String();
     String custLegalConst =new String();
     String custSegment =new String();
     if(test!=null)
        {
            if(test.getNonBorrowerInd())
            {
                  custCategory ="Non Borrower";
            }else
                  custCategory="Borrower";
            if(legal!=null)
            {
                  custSegment =CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_SEGMENT, legal.getCustomerSegment());
                  custLegalConst =CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_LEGAL_CONST, legal.getSourceID(), null, legal.getLegalConstitution());
            }

        }
              if(creditgrade!=null && creditgrade.length != 0)
              {
                  for (int i=0;i <creditgrade.length;i++)
                  {
                      if(creditgrade[i]!=null)
                      {
                      if(creditgrade[i].getCGType()!=null)
                        {
                                cgtype[i] = CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_GRADE_TYPE, creditgrade[i].getCGType().toString() );
                                if(creditgrade[i].getCGCode()!=null)
                                  cgvalue[i] = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CREDIT_GRADE_VALUE, creditgrade[i].getCGCode().toString() );
                                if(creditgrade[i].getReasonForChange()!=null)
                                  cgreasonforchng[i] =  creditgrade[i].getReasonForChange();
                                creditgradeEffectiveDate[i] = (creditgrade[i].getLastUpdateDate() != null)?creditgrade[i].getLastUpdateDate():creditgrade[i].getEffectiveDate();
                                //creditgradeEffectiveDate[i] =  creditgrade[i].getEffectiveDate();
                                if(creditgrade[i].getUpdateStatusInd()!=null)
                                cgstatus[i]= creditgrade[i].getUpdateStatusInd();
                                else
                                cgstatus[i]= "";

                        }
                      }
                  }
              }

     ICreditStatus creditstatus[] = legal.getCreditStatus();

     OBLimitProfile limitprofile = (OBLimitProfile)request.getAttribute("limitprofileOb");
     long subpid = test.getCustomerID();
     String subprofid = Long.toString(subpid);
     String limitprofileid = Long.toString(limitprofile.getLimitProfileID());
     String cstype = "-";
     String csvalue = "-";
     String comments = "-";
      if(creditstatus!=null && creditstatus.length != 0)
        {
         if(creditstatus[0].getCSType()!=null)
            cstype = CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_STATUS_TYPE, creditstatus[0].getCSType().toString() );
          if(creditstatus[0].getCSValue()!=null)
            csvalue = CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_STATUS_VALUE, creditstatus[0].getCSValue().toString() );
          if(creditstatus[0].getComments()!=null)
            comments = creditstatus[0].getComments();
       }

     String isiccd = "-";
     String isicdesc="-";
      if(legal!=null)
        {
            IISICCode isiccode[] = legal.getISICCode();
            if(isiccode!=null && isiccode.length !=0) {
                for (int i=0;i <isiccode.length;i++)
                {
                    if(isiccode[i].getISICType()!=null && isiccode[i].getISICType().equals("ISIC"))
                    {
                    if(isiccode[i].getISICCode()!=null)
                        isicdesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ISIC_CODE, isiccode[i].getISICCode().toString() );
                    isiccd = isiccode[i].getISICCode().toString();
                   }

                }
            }
      }

     if(test!=null)
            pageContext.setAttribute("customerOb",test);
       String domicileCountry="";

      //List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
      //List ctryVals = (List)CountryList.getInstance().getCountryValues();
       String approvingOfficerGrade ="-";

         if(limitprofile.getApprovingOfficerGrade()!=null && !limitprofile.getApprovingOfficerGrade().equals(""))
         {
              approvingOfficerGrade =limitprofile.getApprovingOfficerGrade();
         }
    //String fam = (String)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.fam");
    //String famcode = (String)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.famcode");
     %>



<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function gotopage(subprofileID,limitprofileID){
alert("hi");
	 parent.document.location = "CustomerProcess.do?event=editLimitProfile&subprofileID=" +subprofileID+"&limitprofileID="+limitprofileID;
}


function approvePage() {
    document.forms[0].action="CustomerProcess.do?event=approve";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="CustomerProcess.do?event=reject";
    document.forms[0].submit();
}
function cancel(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
}
-->
</script>
<!-- InstanceEndEditable -->


<body onload="MM_preloadImages('img/return2.gif')">
<html:form  action="CustomerProcess.do?event=processcusdetails">
<!-- InstanceBeginEditable name="Content" -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Process Customer Details</h3></td>

     </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
          <% int rowIdx = 0; %>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"  width="20%"><bean:message key="label.customer.id"/></td>
              <td  width="30%"><bean:write name="customerOb" property="CMSLegalEntity.LEReference" scope="request" /></td>
              <td class="fieldname"  width="20%"><bean:message key="label.global.legal.name"/></td>
              <td  width="30%"><bean:write name="customerOb" property="CMSLegalEntity.legalName" scope="request" /></td>
            </tr>
              <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>            
            <tr class=<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.customer.subprofile.id"/></td>
              <td><bean:write name="customerOb" property="customerReference" scope="request" /></td>
              <td class="fieldname">
              <bean:message key="label.customer.subprofile.name"/>
              &nbsp;
              </td>
              <td>
              <bean:write name="customerOb" property="customerName" scope="request" />
              &nbsp;
              </td>
            </tr>
            <% } %>
            <tr class=<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname">Domicile Country</td>
              <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(test.getDomicileCountry())%>"/>&nbsp;</td>
              <td class="fieldname">Referred</td>
              <td><integro:boolean-display style="yn" value="<%=legal.getBlackListedInd()%>"/></td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname">Incorporate Country </td>
              <td>
                <%String cty = null;
                if(!(legal.getLegalRegCountry().equals(null) || legal.getLegalRegCountry().equals(""))){
                  cty = CountryList.getInstance().getCountryName(legal.getLegalRegCountry());
                }
                %>
                <integro:empty-if-null value="<%=cty%>" />&nbsp;</td>
            	<td class="fieldname">ID No. (E.g. Business Reg No., IC No.)</td>
            	<td><bean:write name="customerOb" property="CMSLegalEntity.legalRegNumber"/>&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            		<td class="fieldname">Incorporate Date </td>
                    <td><integro:date object="<%=legal.getIncorporateDate()%>"/>&nbsp;</td>
            		<td class="fieldname">ID Description (Personal, Corporate) </td>
            		<td>
            			 <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ID_TYPE,legal.getIDType())%>" />
            			 &nbsp;
            		</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname">Nature of Business Code</td>
              <td><integro:empty-if-null value="<%=isiccd%>" /></td>
              <td class="fieldname">Relationship Start Date </td>
              <td><integro:date object="<%=legal.getRelationshipStartDate()%>"/>&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            		<td class="fieldname">Nature of Business<!-- (ISIC)--> </td>
                    <td><integro:empty-if-null value="<%=isicdesc%>" />&nbsp;</td>
            		<td class="fieldname">&nbsp;</td>
            		<td>&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            		<td class="fieldname">Market Segment</td>
            		<td>
            				<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_SEGMENT,legal.getCustomerSegment())%>" />
            				&nbsp;
            		</td>
            		<td class="fieldname">&nbsp;</td>
            		<td>&nbsp;</td>
            </tr>            
				  	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				  		<td class="fieldname" width="20%">Business Group</td>
				  		<td width="30%"><bean:write name="customerOb" property="CMSLegalEntity.businessGroup"/>&nbsp;</td>
				  		<td class="fieldname">Business Sector</td>
                        <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.BUSSINESS_SECTOR,legal.getBusinessSector())%>" />&nbsp;</td>
				  	</tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            		<td class="fieldname">Customer Type </td>
            		<td>
            			<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_TYPE,legal.getCustomerType())%>"/>
            			&nbsp;
            		</td>
            		<td class="fieldname">Customer Legal Constitution</td>
            		<td>
            			<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_LEGAL_CONST, legal.getLegalConstitution())%>"/>
            			&nbsp;
            		</td>
            </tr> 
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      
                    <%
                        IContact address[] = test.getCMSLegalEntity().getRegisteredAddress();
                        IContact obContact = null;
                       // IContact obContactOff = null;
                        /*if (address != null) {
                            for (int i = 0; i < address.length; i++) {
                                if (address[i].getContactType() != null &&
                                        address[i].getContactType().equals(ICMSConstant.REGISTERED)) {
                                    obContact = address[i];
                                }
                                if (address[i].getContactType() != null &&
                                        address[i].getContactType().equals(ICMSConstant.OFFICE)) {
                                    obContactOff = address[i];
                                }
                            }
                        }
                        if (obContact == null) {
                            obContact = new OBContact();
                        }
                        if (obContactOff == null) {
                            obContactOff = new OBContact();
                        }*/
                        
                        if (address != null) {				
                		for (int i = 0; i < address.length; i++) {
	                		
	                		if (address[i] != null ) {
	                              obContact =  address[i];
                        
                    %>
                    
           <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td width="20%" class="fieldname">Address Type</td>
                        <td width="30%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ADDRESS_TYPE,obContact.getContactType())%>"/></td>
                        <td width="20%" class="fieldname">&nbsp;</td>
                        <td width="30%">&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Address (line 1)</td>
                        <td><integro:empty-if-null value="<%=obContact.getAddressLine1()%>"/>&nbsp;</td>
                        <td class="fieldname">City</td>
                        <td><integro:empty-if-null value="<%=obContact.getCity()%>"/>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Address (line 2)</td>
                        <td><integro:empty-if-null value="<%=obContact.getAddressLine2()%>"/>&nbsp;</td>
                        <td class="fieldname">State</td>
                        <td><integro:empty-if-null value="<%=obContact.getState()%>"/>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Postal Code</td>
                        <td><integro:empty-if-null value="<%=obContact.getPostalCode()%>"/>&nbsp;</td>
                        <td class="fieldname">Country</td>
                        <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(obContact.getCountryCode())%>"/>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
    
    <tr>
        <td>&nbsp;</td>
    </tr>
     
                    <%		
                			}
                    	} 	
                    } else {
                    
             	%>
 
	
     <% // if(address == null){
	     if (obContact == null) {
             obContact = new OBContact();
         }
	         
     %>
                  
     <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td width="20%" class="fieldname">Address Type</td>
                        <td width="30%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ADDRESS_TYPE,obContact.getContactType())%>"/></td>
                        <td width="20%" class="fieldname">&nbsp;</td>
                        <td width="30%">&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Address (line 1)</td>
                        <td><integro:empty-if-null value="<%=obContact.getAddressLine1()%>"/>&nbsp;</td>
                        <td class="fieldname">City</td>
                        <td><integro:empty-if-null value="<%=obContact.getCity()%>"/>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Address (line 2)</td>
                        <td><integro:empty-if-null value="<%=obContact.getAddressLine2()%>"/>&nbsp;</td>
                        <td class="fieldname">State</td>
                        <td><integro:empty-if-null value="<%=obContact.getState()%>"/>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Postal Code</td>
                        <td><integro:empty-if-null value="<%=obContact.getPostalCode()%>"/>&nbsp;</td>
                        <td class="fieldname">Country</td>
                        <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(obContact.getCountryCode())%>"/>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>      
<%}%>

    <tr>
      <td>&nbsp;</td>
    </tr>
    <% if (limitprofile != null) { %>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
            <%--
             <input type="hidden" name="subprofileID" value="<%=subprofid%>">
              <input type="hidden" name="limitprofileID" value="<%=limitprofileid%>">
             <input type="hidden" name="requiredSecurityCoverage" value="<%=limitprofile.getRequiredSecurityCoverage()%>">
             --%>
              <%
                      boolean apGradeInd;
                      if(apGrade.equals(apGrade1))
                         apGradeInd=true;
                      else
                         apGradeInd=false;
                    boolean secCovInd;
                  if(secCov.equals(secCov1))
                        secCovInd=true;
                    else secCovInd=false;
              %>
               <%
                 String requiredSecurityCoverage= null;
                 String actualSecurityCoverage=null;
                 if (limitprofile.getRequiredSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE &&
                 	limitprofile.getRequiredSecurityCoverage() >= 0) {
                    requiredSecurityCoverage =ConvertFloatToString.getInstance().convertDouble(limitprofile.getRequiredSecurityCoverage());
                 } else {
	                 requiredSecurityCoverage = "100";
                 }
                 if (limitprofile.getActualSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
                    actualSecurityCoverage =ConvertFloatToString.getInstance().convertDouble(limitprofile.getActualSecurityCoverage());
                 }
               %>
              <td class="<%=(secCovInd)?"fieldname":"fieldnamediff"%>">Required BCA Security Coverage (%)</td>
              <td width="30%"><integro:empty-if-null value="<%=requiredSecurityCoverage%>"/></td>
              <td class="fieldname">Actual BCA Security Coverage (%)</td>
              <td width="30%"><integro:empty-if-null value="<%=actualSecurityCoverage%>"/></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>


<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
</thead>
<tbody>
<tr class="odd">
	<td width="20%" class="fieldname">Next Annual Review Date</td>
	<td width="30%">
	    <%if(limitprofile != null && limitprofile.getNextAnnualReviewDate() != null) {%>
		<integro:date object="<%=limitprofile.getNextAnnualReviewDate()%>" />&nbsp;
	     <%} else {%>- <%}%>
	</td>
    <td width="20%" class="fieldname">Extended Review Date</td>
    <td><% if (limitprofile.getExtendedNextReviewDate() == null) { %>
        -
        <% } else { %>
        <integro:date object="<%= limitprofile.getExtendedNextReviewDate() %>" />
        <% } %>
    </td>
</tr>
</tbody>
</table>
<% } %>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
  	<tr>
  		<td>
  			 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
        <tbody>
			  	<%
			  		rowIdx = 0;
			  	%>
			  	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			  		<td class="fieldname">Income Range</td>
			  		<td>
			  			<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.INCOME_RANGE, legal.getIncomeRange())%>"/>
			  			&nbsp;
			  		</td>
			  		<td class="fieldname" width="20%">TFA Amount </td>
                    <td width="30%">
                    <integro:empty-if-null value="<%=legal.getTFAAmount()%>" />&nbsp;</td>
			  	</tr>
			  	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			  		<td class="fieldname">Country of Permanent Residence</td>
			  		<td>
                        <integro:empty-if-null value="<%=CountryList.getInstance().getCountryName( legal.getCountryPR() )%>"/>
			  			&nbsp;
			  		</td>
			  		<td class="fieldname">Old ID No. </td>
                    <td><bean:write name="customerOb" property="CMSLegalEntity.idOldNO"/>&nbsp;</td>
			  	</tr>
  	</tbody></table></td></tr>
  </tbody>
</table>

<%@ include file="/customer/view_credit_rating.jsp"%>

<table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
          <tr class="even">
                  <td class="fieldname">Remarks</td>
                  <td><textarea name="remarks" cols="60" rows="3"></textarea></td>

            </tr>
        <tr class="odd">
                                  <td class="fieldname">Last Action By</td>
                                  <td class="odd"><%=iLimitTrxVal.getUserInfo()%>&nbsp;</td>

                                </tr>
                                <tr class="even">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><integro:wrapper value="<%=iLimitTrxVal.getRemarks()%>"/>&nbsp;</td>

                                </tr>
          </tbody>
          </table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:approvePage();"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:cancel();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>

 </html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
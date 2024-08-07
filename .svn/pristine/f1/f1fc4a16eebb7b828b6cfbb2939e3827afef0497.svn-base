<%@ page import="com.integrosys.cms.ui.customer.ProcessDetailsCustomerForm,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.*,
                 com.integrosys.cms.ui.common.ApprovingOfficerList,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.techinfra.util.SortUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/EditLimitProfile.jsp,v 1.58 2006/10/27 08:43:04 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.58 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $

     * @author $Author: hmbao $<br>
     * @version $Revision: 1.58 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $
     * insert "STANDARD & POOR" credit grade
     * must display all four credit grades : "INTERNAL", "ORIGINAL", "MOODY'S", "STANDARD & POOR"
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
        ProcessDetailsCustomerForm aForm = (ProcessDetailsCustomerForm) request.getAttribute("ProcessDetailsCustomerForm");
        boolean bInternal = false;
        boolean bOriginal = false;
        boolean bMoody = false;
        boolean bStandard = false;

        OBCMSCustomer obCMSCustomer = (OBCMSCustomer)request.getAttribute("customerOb");
        OBLimitProfile limitprofile = (OBLimitProfile)request.getAttribute("limitprofileOBJ");
        
        String limitprofileID = aForm.getLimitprofileID();
        
        String sscStatus = (String)request.getAttribute("sscStatus");
        ICMSLegalEntity legal = obCMSCustomer.getCMSLegalEntity();
        ICreditGrade creditgrade[] = legal.getCreditGrades();
        int noOfCreditGrade=0;
        String[] param = {"EffectiveDate", "CGReference"};
        if(creditgrade!=null){
        if(creditgrade.length>=0)
            noOfCreditGrade=creditgrade.length;
            SortUtil.sortObject(creditgrade, param);
        }
        String cgtype[]=new String[noOfCreditGrade];
        String cgvalue[]=new String[noOfCreditGrade];
        String cgreasonforchng[]=new String[noOfCreditGrade];
        Date creditgradeEffectiveDate[] = new Date[noOfCreditGrade];
        String cgstatus[]=new String[noOfCreditGrade];
        String custCategory =new String();
        String custLegalConst =new String();
        String custSegment =new String();

        if(obCMSCustomer!=null)
        {
            if(obCMSCustomer.getNonBorrowerInd())
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
//                            creditgradeEffectiveDate[i] =  creditgrade[i].getEffectiveDate();
                            if(creditgrade[i].getUpdateStatusInd()!=null)
                            cgstatus[i]= creditgrade[i].getUpdateStatusInd();
                            else
                            cgstatus[i]= "";

                    }
                  }
              }
          }

        ICreditStatus creditstatus[] = legal.getCreditStatus();
        String cstype = "-";
        String csvalue = "-";
        String comments = "-";
        String isiccd="-";
        String isicdesc ="-";
        if(creditstatus!=null && creditstatus.length != 0)
        {
          if(creditstatus[0].getCSType()!=null)
            cstype = CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_STATUS_TYPE, creditstatus[0].getCSType().toString() );
          if(creditstatus[0].getCSValue()!=null)
            csvalue = CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_STATUS_VALUE, creditstatus[0].getCSValue().toString() );
          if(creditstatus[0].getComments()!=null)
            comments = creditstatus[0].getComments();

        }

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
         if(obCMSCustomer!=null)
            pageContext.setAttribute("customerOb",obCMSCustomer);
        HashMap map = new HashMap();
        map = ApprovingOfficerList.getInstance().getApprovingOfficerList();
        pageContext.setAttribute("Map",map);
        String domicileCountry="";
        //List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
        //List ctryVals = (List)CountryList.getInstance().getCountryValues();
        //String fam = (String)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.fam");
        //String famcode = (String)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.famcode");
%>


<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function coverageWarning()
{
    var newCoverage = document.getElementById('requiredSecurityCoverage').value;
    if (newCoverage == null || newCoverage.length == 0 || newCoverage == 0) {
        if (!confirm ("Note: Required Security Coverage is '0'/blank.")) {
            document.getElementById('requiredSecurityCoverage').select();
            document.getElementById('requiredSecurityCoverage').focus();
            return false;
        }
    }
    return true;
}

  function goPageIndex(ind) {
        document.forms["NewUserSearchForm"].startIndex.value=ind;
        document.forms["NewUserSearchForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["NewUserSearchForm"].userName.value=ind;
        document.forms["NewUserSearchForm"].startIndex.value=0;
        document.forms["NewUserSearchForm"].submit();
    }

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

function submitPage() {
    var sscStatus = '<%= sscStatus %>';
    if ( (sscStatus != null && sscStatus == 'N.A.') || coverageWarning()) {
        document.forms[0].action="CustomerProcess.do?event=updateLimitProfile";
        document.forms[0].submit();
    }
}
function cancel(customerID,limitProfileID){
	 parent.document.location = "CustomerProcess.do?event=processcusdetails&sub_profile_id="+customerID;
}
-->	
</script>
<!-- InstanceEndEditable -->


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
      <td colspan="2"> 

<%@ include file="/customer/common_edit_limit_profile.jsp"%>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80">&nbsp;</td>
    <td width="70">&nbsp;</td>
  </tr>
  <tr>      
    <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a></td>
    <td><a href="javascript:cancel('<%=obCMSCustomer.getCustomerID()%>','<%=limitprofileID%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image5" width="70" height="20" border="0" id="Image5" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

 </html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
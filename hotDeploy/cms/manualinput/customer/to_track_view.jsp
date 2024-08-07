<%@ page import="java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,                 
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,                 
                 com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%  
	ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm)request.getAttribute("ManualInputCustomerInfoForm");
                 
    if( form != null ) {
    	DefaultLogger.debug(this,  "form :"+form);
        DefaultLogger.debug(this,  "getSubProfileId :"+form.getSubProfileId()+"<<<<<<" );        
       /* DefaultLogger.debug(this,  "getCifId :"+form.getLegalId());
        DefaultLogger.debug(this,  "getCustomerNameShort :"+form.getCustomerNameShort());
        DefaultLogger.debug(this,  "getCustomerNameLong :"+form.getCustomerNameLong());
        DefaultLogger.debug(this,  "getLegalName :"+form.getLegalName()); */
        
    }else {
        DefaultLogger.debug(this, "@@@Debug::: ManualInputCustomerInfoForm is NULL");
    }

%>



<%@page import="com.integrosys.cms.ui.common.CountryList"%><html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">

function returnPage() {
    document.forms[0].action = "ToDo.do"
    document.forms[0].event.value = "totrack";
    document.forms[0].submit();
}


</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ManualInputCustomer.do">
<body>
<input type="hidden" name="event">
<!-- InstanceBeginEditable name="Content" -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>            
		


<!-- added-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.customer.id"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="cifId"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.global.legal.name"/></td>
              <td><bean:write name="ManualInputCustomerInfoForm" property="legalName"/></td>
            </tr>

            <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.customer.subprofile.id"/></td>
              <td width="30%">&nbsp;</td>
              <td class="fieldname"><bean:message key="label.customer.name"/></td>
              <td><bean:write name="ManualInputCustomerInfoForm" property="customerNameShort"/>&nbsp;</td>
            </tr>
            <% } %>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.domicilecty"/>&nbsp;</td>
              
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="domicileCountry"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.referred"/></td>
              <td><bean:write name="ManualInputCustomerInfoForm" property="blacklisted"/>&nbsp; </td>
            </tr>

            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.incorporate.cuntry"/></td>
              <td width="30%">
                <%/*String cty = null;
                if(!(legal.getLegalRegCountry().equals(null) || legal.getLegalRegCountry().equals(""))){
                  cty = CountryList.getInstance().getCountryName(legal.getLegalRegCountry());
                }*/
                %>
                <bean:write name="ManualInputCustomerInfoForm" property="incorporatedCountry"/>&nbsp;
                </td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.id.no"/></td>
              <td><bean:write name="ManualInputCustomerInfoForm" property="CIFId"/></td>
            </tr>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.incorporate.date"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="incorporationDate"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.id.description"/></td>
              <td>
<!--              <integro:empty-if-null value="<%--=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ID_TYPE,legal.getIDType())--%>" />-->
              &nbsp;--</td>
            </tr>

            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.isic.code"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="isicCode"/>      
              </td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.relationship.start.date"/></td>
              <td><bean:write name="ManualInputCustomerInfoForm" property="relationshipStartDate"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.nature.business"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="businessGroup"/>
              </td>
            
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.segment"/></td>
              <td width="30%">
                <bean:write name="ManualInputCustomerInfoForm" property="customerSegment"/>&nbsp;</td>              
            </tr>

            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.business.group"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="businessGroup"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.business.sector"/></td>
              <td>
              <bean:write name="ManualInputCustomerInfoForm" property="businessSector"/>&nbsp;
              </td>
            </tr>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.type"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="customerType"/>&nbsp;</td>
              <td  class="fieldname"><bean:message key="label.manualinput.customer.legal.constitution"/></td>
              <td> <bean:write name="ManualInputCustomerInfoForm" property="legalConstitution"/>&nbsp;</td>
            </tr>
          </tbody>
        </table>
      
    <tr>
      <td>&nbsp;</td>
    </tr>

    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <tbody>                   
                    <tr class="odd">
                        <td class="fieldname" width="20%">
                            <bean:message key="label.manualinput.customer.address.type"/></td>
                        <td width="30%">Registered Address</td>
                        <td class="fieldname">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line1"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="address1"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.city"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="city"/>&nbsp;</td>
                    </tr>

                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line2"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="address2"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.state"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="state"/>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.postal.code"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="postcode"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.global.country"/></td>
                        <td>
                            <bean:write name="ManualInputCustomerInfoForm" property="country"/>&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>

                    <tr class="odd">
                        <td class="fieldname" width="20%">
                            <bean:message key="label.manualinput.customer.address.type"/></td>
                        <td width="30%">Office Address</td>
                        <td class="fieldname">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line1"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="officeAddress1"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.city"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="officeCity"/>&nbsp;</td>
                    </tr>

                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line2"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="officeAddress2"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.state"/>
                        </td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="officeState"/>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.postal.code"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="officePostCode"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.global.country"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="officeCountry"/>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>

    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.required.sec.coverage"/></td>
              <td width="30%">--</td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.actual.sec.coverage"/></td>
              <td>--</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.next.annual.review.date"/></td>
              <td width="30%">-&nbsp;</td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.extended.review.date"/>&nbsp;</td>
              <td>--</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>

  </tbody>
</table>

<table class="tblFormSection" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.income.range"/></td>
              <td width="30%">
              <bean:write name="ManualInputCustomerInfoForm" property="incomeRange"/> &nbsp;           
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.tfa.amount"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="tfaAmount"/>&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.ctypermanent.residence"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="countryPermanent"/>&nbsp;</td>
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.old.idno"/></td>
              <td width="30%"><bean:write name="ManualInputCustomerInfoForm" property="oldIdNo"/>&nbsp;</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

<!--added-->

      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" valign="baseline" align="center"> <a href="javascript:returnPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
<html:hidden property="legalConstitution"/>
<html:hidden property="CIFId"/>
<html:hidden property="customerNameShort"/>
<html:hidden property="domicileCountry"/>
<html:hidden property="blacklisted"/>
<html:hidden property="source"/>
<html:hidden property="cifId"/>
<html:hidden property="address1"/>
<html:hidden property="address2"/>
<html:hidden property="officeAddress1"/>
<html:hidden property="officeAddress2"/>
<html:hidden property="state"/>
<html:hidden property="city"/>
<html:hidden property="officeState"/>
<html:hidden property="officeCity"/>
<html:hidden property="officePostcode"/>
<html:hidden property="postcode"/>
</body>
</html:form>

<!-- InstanceEnd -->
</html>

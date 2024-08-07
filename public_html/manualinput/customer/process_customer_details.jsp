<%@ page import="java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	ManualInputCustomerInfoForm aform = (ManualInputCustomerInfoForm)request.getAttribute("ManualInputCustomerInfoForm");
	//ICMSCustomerTrxValue trx = (ICMSCustomerTrxValue)session.getAttribute("com.integrosys.cms.app.customer.trx.ICMSCustomerTrxValue");
	ICMSCustomerTrxValue trx = (ICMSCustomerTrxValue)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ICMSCustomerTrxValue");
	pageContext.setAttribute("OBCMSCustomer",aform);
	              
    if( trx != null ) {
        DefaultLogger.debug(this,  "trx "+trx);
      
    }else {
        DefaultLogger.debug(this, "trx is  NULL in request");
    }

    HashMap hm = new HashMap();
%>


<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.app.customer.trx.ICMSCustomerTrxValue"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
    document.forms[0].action = "ManualInputCustomer.do?event=list_customers";
    document.forms[0].submit();
}


function savecreate() 
{
	document.forms[0].action = "ManualInputCustomer.do";
    document.forms[0].event.value="create_customer";
    document.forms[0].submit();
}

function saveedit() 
{
	document.forms[0].action = "ManualInputCustomer.do";
    document.forms[0].event.value="edit_customer";
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
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.manualinput.customer.title"/>&nbsp;Edit</h3></td>            
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.customer.id"/></td>
              <td width="30%">
        	<bean:write name="ManualInputCustomerInfoForm" property="cifId"/>&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.global.legal.name"/></td>
              <td><html:text name="ManualInputCustomerInfoForm" property="customerNameShort" ></html:text></td>
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
              <td><html:text name="ManualInputCustomerInfoForm" property="legalConstitution" value="<%=aform.getLegalConstitution() %>"></html:text>
               
<!--              <bean:write name="ManualInputCustomerInfoForm" property="legalConstitution"/>&nbsp;-->
              
              </td>
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
                    <tr class="odd">
                        <td class="fieldname" width="20%">
                            <bean:message key="label.manualinput.customer.address.type"/></td>
                        <td width="30%">Registered Address </td>
                        <td class="fieldname">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line1"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="address1"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.city"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="city"/>&nbsp;</td>
                    </tr>

                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line2"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="address2"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.state"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="state"/>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.postal.code"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="postcode"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.global.country"/></td>
                        <td><bean:write name="ManualInputCustomerInfoForm" property="country"/>&nbsp;</td>
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
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeAddress1"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.city"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeCity"/>&nbsp;</td>
                    </tr>

                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line2"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeAddress2"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.state"/>
                        </td><td><html:text name="ManualInputCustomerInfoForm" property="officeState"/>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.postal.code"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officePostCode"/>&nbsp;</td>
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
              <bean:write name="ManualInputCustomerInfoForm" property="incomeRange"/> &nbsp;</td>           
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
    <tr>
      <td>&nbsp;</td>
    </tr>
    
	  	<tr>
			<td>
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblInfo">
				<tbody>
					<tr>
						<td class="fieldname">Remarks</td>
						<td class="odd"><textarea name="remarks" rows="4"
							style="width: 90%"></textarea></td>
					</tr>	
				</tbody>
			</table>
			</td>
		</tr>

<%--@ include file="/customer/view_credit_rating.jsp"--%>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>      
      <td align="center">
         <%if(trx.getFromState().equals("PENDING_CREATE")){ %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:savecreate()"/></a>
     		<%}else{ %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveedit()"/></a>
     		<%} %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage()"/></a>	        	
      </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<html:hidden property="legalConstitution"/>
<html:hidden property="CIFId"/>
<html:hidden property="legalName"/>
<html:hidden property="cifId"/>
<html:hidden property="subProfileId"/>
<html:hidden property="customerNameShort"/>
<html:hidden property="domicileCountry"/>
<html:hidden property="blacklisted"/>
<html:hidden property="source"/>
<html:hidden property="address1"/>
<html:hidden property="address2"/>
<html:hidden property="officeAddress1"/>
<html:hidden property="officeAddress2"/>
<html:hidden property="state"/>
<html:hidden property="city"/>
<html:hidden property="officeState"/>
<html:hidden property="officeCity"/>
<html:hidden property="officeEmail"/>
<html:hidden property="officeTelephoneNo"/>
<html:hidden property="email"/>
<html:hidden property="telephoneNo"/>
<html:hidden property="country"/>
<html:hidden property="officeCountry"/>
<html:hidden property="officePostcode"/>
<html:hidden property="postcode"/>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>

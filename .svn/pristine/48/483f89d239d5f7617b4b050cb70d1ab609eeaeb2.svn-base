<%@ page import="java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
                 
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<script language="JavaScript" type="text/JavaScript">

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

  function returnPage() {
	    document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value = "list_customers";
	    document.forms[0].submit();
	}
	
function createNewCustomer() 
{	
	document.forms[0].action = "ManualInputCustomer.do?legalSource=ARBS";
    document.forms[0].event.value = "create_customer";
    document.forms[0].submit();
    
    //alert(document.getElementById("customerNameShort").value);
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
            <td width="60%"><h3><bean:message key="label.manualinput.customer.title"/>&nbsp;Create New Customer</h3><br></td>            
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
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="cifId" value=""/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.global.legal.name"/></td>
              <td><html:text property="legalName" value=""></html:text></td>
            </tr>
            
            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.customer.subprofile.id"/></td>
              <td width="30%">--&nbsp;</td>
              <td class="fieldname"><bean:message key="label.customer.name"/></td>
              <td><html:text name="ManualInputCustomerInfoForm" property="customerNameShort" value=""/>&nbsp;</td>
            </tr>
            
            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.domicilecty"/>&nbsp;</td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="domicileCountry" value=""/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.referred"/></td>
              <td><html:text name="ManualInputCustomerInfoForm" property="blacklisted" value=""/>&nbsp; </td>
            </tr>

            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.incorporate.cuntry"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="incorporatedCountry" value=""/>&nbsp;</td>
<!--              <td class="fieldname"><bean:message key="label.manualinput.customer.id.no"/></td>-->
<!--              <td>&nbsp;-->
<!--              <html:text name="ManualInputCustomerInfoForm" property="CIFId" value=""/>-->
<!--              </td>-->
              
              <td class="fieldname">Source Id</td>
              <td><html:text name="ManualInputCustomerInfoForm" property="source" value=""/></td>
              
            </tr>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.incorporate.date"/></td>
              <td width="30%">              
<!--              <html:text property="incorporationDate" style="width:90px" size="15" maxlength="11" readonly="true" />-->
<!--              <img src="img/calendara.gif" name="Image721" border="0" id="Image2" onclick="return showCalendar('incorporationDate', 'dd/mm/y');"-->
<!--                   onmouseover="MM_swapImage('Image721','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>-->
                   --</td>                                     
              <td class="fieldname"><bean:message key="label.manualinput.customer.id.description"/></td>
              <td><html:text name="ManualInputCustomerInfoForm" property="legalId" value=""/>&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.isic.code"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="isicCode" value=""/></td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.relationship.start.date"/></td>
<!--              <td><html:text property="relationshipStartDate" style="width:90px" size="15" maxlength="11" readonly="true" />-->
<!--              <img src="img/calendara.gif" name="Image721" border="0" id="Image2" onclick="return showCalendar('relationshipStartDate', 'dd/mm/y');"-->
<!--                   onmouseover="MM_swapImage('Image721','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>-->
               <td>--</td>
            </tr>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.nature.business"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="businessGroup" value=""/></td>
            
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.segment"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="customerSegment" value=""/>&nbsp;</td>              
            </tr>

            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.business.group"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="businessGroup" value=""/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.manualinput.customer.business.sector"/></td>
              <td><html:text name="ManualInputCustomerInfoForm" property="businessSector" value=""/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.type"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="customerType" value=""/>&nbsp;</td>
              <td  class="fieldname"><bean:message key="label.manualinput.customer.legal.constitution"/></td>
              <td><html:text name="ManualInputCustomerInfoForm" property="legalConstitution" value=""></html:text>              
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
                    <tr class="even">
                        <td class="fieldname" width="20%">
                            <bean:message key="label.manualinput.customer.address.type"/></td>
                        <td width="30%">Registered Address</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line1"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="address1" value=""/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.city"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="city" value=""/>&nbsp;</td>
                    </tr>

                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line2"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="address2" value=""/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.state"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="state" value=""/>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.postal.code"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="postcode" value=""/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.global.country"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="country" value="" maxlength="2"/>&nbsp;</td>
                    </tr>
                    
                    <tr class="even">
                        <td class="fieldname">Telephone Number</td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="telephoneNo" value=""/>&nbsp;</td>
                        <td class="fieldname">E-mail Id</td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="email" value=""/>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname" width="20%">
                            <bean:message key="label.manualinput.customer.address.type"/></td>
                        <td width="30%" colspan="3">Office Address</td>                        
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line1"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeAddress1" value=""/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.city"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeCity" value=""/>&nbsp;</td>
                    </tr>

                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.address.line2"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeAddress2" value=""/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.manualinput.customer.state"/>
                        </td><td><html:text name="ManualInputCustomerInfoForm" property="officeState" value=""/>&nbsp;</td>
                    </tr>

                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.manualinput.customer.postal.code"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officePostcode" value=""/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.global.country"/></td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeCountry" maxlength="2" value=""/>&nbsp;</td>
                    </tr>
                    
                    <tr class="even">
                        <td class="fieldname">Telephone Number</td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeTelephoneNo" value=""/>&nbsp;</td>
                        <td class="fieldname">E-mail Id</td>
                        <td><html:text name="ManualInputCustomerInfoForm" property="officeEmail" value=""/>&nbsp;</td>
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
            <tr class="even">
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
              <td width="30%">--&nbsp;</td>
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
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="incomeRange" value=""/> &nbsp;</td>           
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.tfa.amount"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="tfaAmount" value=""/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.ctypermanent.residence"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="countryPermanent" value=""/>&nbsp;</td>
              <td class="fieldname" width="20%"><bean:message key="label.manualinput.customer.old.idno"/></td>
              <td width="30%"><html:text name="ManualInputCustomerInfoForm" property="oldIdNo" value=""/>&nbsp;</td>
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

      <td>&nbsp;</td>
    </tr>

<%--@ include file="/customer/view_credit_rating.jsp"--%>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>      
      <td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/submit1.gif',1)">
     		<img src="img/submit1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:createNewCustomer()"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage()"/></a>	        	
      </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<html:hidden property="legalConstitution"/>
<html:hidden property="CIFId" value="1"/>
<html:hidden property="legalName"/>
<html:hidden property="cifId"/>
<html:hidden property="customerNameShort"/>
<html:hidden property="domicileCountry"/>
<html:hidden property="blacklisted"/>
<html:hidden property="source"/>
<!--<html:hidden property="incorporationDate"/>-->
<!--<html:hidden property="relationshipStartDate"/>-->
<html:hidden property="cifId"/>
<html:hidden property="address1"/>
<html:hidden property="address2"/>
<html:hidden property="state"/>
<html:hidden property="city"/>
<html:hidden property="email"/>
<html:hidden property="telephoneNo"/>
<html:hidden property="officeAddress1"/>
<html:hidden property="officeAddress2"/>
<html:hidden property="officeState"/>
<html:hidden property="officeCity"/>
<html:hidden property="officeEmail"/>
<html:hidden property="officeTelephoneNo"/>
<html:hidden property="legalId"/>
<html:hidden property="country"/>
<html:hidden property="officeCountry"/>
<html:hidden property="officePostcode"/>
<html:hidden property="postcode"/>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>

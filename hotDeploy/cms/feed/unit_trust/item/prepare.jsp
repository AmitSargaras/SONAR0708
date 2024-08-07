<%@ page import="com.integrosys.cms.ui.feed.unittrust.item.UnitTrustItemAction,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.Collection,
                 com.integrosys.base.businfra.currency.ICurrency,
                 java.util.Enumeration,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Iterator,
                 com.integrosys.cms.ui.feed.unittrust.item.UnitTrustItemAction,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.feed.trx.unittrust.IUnitTrustFeedGroupTrxValue,
                 com.integrosys.cms.app.feed.bus.unittrust.IUnitTrustFeedGroup" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    
    <!-- InstanceBeginEditable name="CssStyle" -->
    
	<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>

    <%

        CurrencyList currencyList = CurrencyList.getInstance();
        Collection currencyLabels = currencyList.getCurrencyLabels();
        Collection currencyValues = currencyList.getCountryValues();
        pageContext.setAttribute("currencyLabels", currencyLabels);
        pageContext.setAttribute("currencyValues", currencyValues);

        // Get the unit trust feed group trx value from session.
        IUnitTrustFeedGroupTrxValue feedGroupTrxValue = (IUnitTrustFeedGroupTrxValue) session.getAttribute("com.integrosys.cms.ui.feed.unittrust.UnitTrustAction.unitTrustFeedGroupTrxValue");
        IUnitTrustFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingUnitTrustFeedGroup();
		String isEdit = (String) session.getAttribute("com.integrosys.cms.ui.feed.unittrust.UnitTrustAction.isEdit");
		boolean isActionEdit = isEdit!=null && isEdit.equals("true") ? true : false;
        CountryList countryList = CountryList.getInstance();
        String countryName = countryList.getCountryName(stagingFeedGroup.getSubType());
		int rowIdx=1;
	%>

	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calDriver.js"></script>
	<script type="text/javascript" src="js/dateext.js"></script>
	<script type="text/javascript" src="js/imageNavigation.js"></script>
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

function submitForm() {
document.forms[0].submit();
}

function cancelForm() {
    document.forms[0].event.value = "<%=UnitTrustItemAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}

//-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>

<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><h3><bean:message key="label.feed.unit.trust"/> - <%=countryName%> - 
				<% if (!isActionEdit) { %>	<bean:message key="label.new"/> <% } 
				else { %> <bean:message key="label.edit"/> <% } %>
			</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>

        <html:form action="feed_unit_trust_item.do">
        <input type="hidden" name="event" value="<%=UnitTrustItemAction.EVENT_SAVE%>"/>

        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead></thead> <tbody>
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname"><bean:message key="label.feed.name"/>&nbsp;<span class="mandatory">*</span></td>
                        <td><html:text property="name" size="50" maxlength="50"/>
                            <html:errors property="name"/></td>
                    </tr>
                    <!--<tr class="even">
                        <td class="fieldname">Fund Code&nbsp;<span class="mandatory">*</span></td>
                        <td><html:text property="fundCode" size="13" maxlength="12"/>
                            <html:errors property="fundCode"/></td>
                    </tr>-->
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname"><bean:message key="label.feed.isin.code"/></td>
                        <td><html:text property="isinCode" size="13" maxlength="12"/>
                            <html:errors property="isinCode"/></td>
                    </tr>
					
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname"><bean:message key="label.feed.ric"/>&nbsp;<span class="mandatory">*</span></td>
                        <td><html:text property="ric" size="21" maxlength="20"/>
                            <html:errors property="ric"/></td>
                    </tr>
					
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="29%"><bean:message key="label.feed.currency.code"/>&nbsp;<span class="mandatory">*</span></td>
                        <td width="71%">
                            <html:select property="currencyCode">
                            	<integro:currency-list/>
                                <!--<html:options name="currencyValues" labelName="currencyLabels"/>-->
                            </html:select>
                            <html:errors property="currencyCode"/></td>
                    </tr>
					
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="29%">
							<bean:message key="label.feed.existing.bid.offer.nav.pricing"/>&nbsp;<span class="mandatory">*</span></td>
                        <td width="71%" class="currency">
                            <html:text property="unitPrice" size="10" maxlength="11" readonly="<%=isActionEdit? true : false%>"/>
                            <html:errors property="unitPrice"/></td>
                    </tr>
					
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="29%"><bean:message key="label.feed.investment.product.code"/></td>
                        <td width="71%">
                            <html:text property="productCode" size="21" maxlength="20"/>
                            <html:errors property="productCode"/></td>
                    </tr>
					
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="29%"><bean:message key="label.feed.fund.manager.code"/></td>
                        <td width="71%">
                            <html:text property="fundManagerCode" size="21" maxlength="20"/>
                            <html:errors property="fundManagerCode"/></td>
                    </tr>
					
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="29%"><bean:message key="label.feed.fund.manager.name"/></td>
                        <td width="71%">
                            <html:text property="fundManagerName" size="50" maxlength="50"/>
                            <html:errors property="fundManagerName"/></td>
                    </tr>

		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="29%"><bean:message key="label.feed.fund.size"/></td>
                        <td width="71%">
                            <html:text property="fundSize" size="30" maxlength="30"/>
                            <html:errors property="fundSize"/></td>
                    </tr>

		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="29%"><bean:message key="label.feed.fund.size.update.date"/></td>
                        <td width="71%">
							<html:text property="fundSizeUpdateDate" readonly="true" size="15" maxlength="11"/>
							<img src="img/calendara.gif" name="ImageCal1" border="0" alt="" id="ImageCal1"
								onclick="showCalendar('fundSizeUpdateDate', 'dd/mm/y')" onmouseover="MM_swapImage('ImageCal1','','img/calendarb.gif',1)"
								onmouseout="MM_swapImgRestore()"/>&nbsp;</td>
                            <html:errors property="fundSizeUpdateDate"/></td>
                    </tr>

		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="29%"><bean:message key="label.feed.date.launched"/></td>
                        <td width="71%">
							<html:text property="dateLaunched" readonly="true" size="15" maxlength="11"/>
							<img src="img/calendara.gif" name="ImageCal2" border="0" alt="" id="ImageCal2"
								onclick="showCalendar('dateLaunched', 'dd/mm/y')" onmouseover="MM_swapImage('ImageCal2','','img/calendarb.gif',1)"
								onmouseout="MM_swapImgRestore()"/>&nbsp;</td>
                            <html:errors property="dateLaunched"/></td>
                    </tr>

                </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="91">&nbsp;</td>
        <td width="59">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
            <img src="img/ok1.gif" name="Image1" width="60" height="22" border="0" id="Image1"/></a></td>
        <td><a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2"/></a></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

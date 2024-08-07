<%@ page import="com.integrosys.cms.app.collateral.trx.parameter.ICollateralParameterTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.collateral.bus.ICollateralParameter,
                 java.util.Arrays,
                 com.integrosys.cms.ui.srp.country.SRPCountryConstants,
                 com.integrosys.cms.ui.srp.country.SRPCountryAction,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Collection,
                 java.util.HashMap,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    String event = request.getParameter("event");

    ICollateralParameterTrxValue obTrxValue = (ICollateralParameterTrxValue) session.getAttribute("com.integrosys.cms.ui.srp.country.SRPCountryAction.CollateralParameterTrxValue");
    if (obTrxValue == null) {
        out.println("Expected session parameter 'CollateralParameterTrxValue' is missing.");
        return;
    }
    ICollateralParameter[]  parametersArray = null;
    if (SRPCountryAction.EVENT_VIEW.equals(event)) {
        parametersArray = obTrxValue.getCollateralParameters();
    } else {
        parametersArray = obTrxValue.getStagingCollateralParameters();
    }
    HashMap countryMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.srp.country.SRPCountryAction.countries.map");
    HashMap frequencyMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.srp.country.SRPCountryAction.timefrequencies.map");

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

    <script language="JavaScript" type="text/JavaScript">
        <!--
        function closeEditRejected() {
            document.forms[0].submit();
        }

        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body>
<html:form action="<%=SRPCountryConstants.ACTION_URL%>">
    <input type="hidden" name="event" value="maker_cncl_reject_edit"/>

    <!-- InstanceBeginEditable name="Content" -->
    <br>
    
    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
		    <tr>
		      <td>&nbsp;</td>
		    </tr>        	
            <tr>
                <td><h3>SRP - Country Specific Parameters - 
                        <%=obTrxValue.getCollateralParameters()[0] != null ? countryMap.get(obTrxValue.getCollateralParameters()[0].getCountryIsoCode()) : " "%>
                        -
                        <%=obTrxValue.getCollateralParameters()[0] != null ? obTrxValue.getCollateralParameters()[0].getTypeName() : " "%>
                </h3></td>
            </tr>
            <tr><td><hr/></td></tr>
        </thead>
        <tbody>
            <tr>
                <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                    <thead>
                        <tr class="tblInfo">
                            <td width="8%">S/N</td>
                            <td width="45%">Description</td>
                            <td width="9%">Max %</td>
                            <td width="10%">Cty SRP %</td>
                            <td width="28%">Valuation Frequency</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < parametersArray.length; i++) {
                                ICollateralParameter parameter = parametersArray[i];
                                String  ctySRP = ConvertFloatToString.getInstance().convertDouble(parameter.getThresholdPercent()) ;
                                ctySRP = ("-1".equals(ctySRP) ? "" : ctySRP);
                        %>
                        <tr class='<%=(i%2==0?"even":"odd")%>'>
                            <td class="index"><%=(i + 1)%></td>
                            <td><integro:empty-if-null value="<%=parameter.getSubTypeDesc()%>"/>&nbsp;</td>
                            <td><%=ConvertFloatToString.getInstance().convertDouble(parameter.getMaxValue())%></td>
                            <td style="text-align:right;padding-right:5px">
                                <%=ctySRP%>&nbsp;
                            </td>
                            <td style="text-align:right;padding-right:5px">
                                <%=parameter.getValuationFrequency()%>
                                &nbsp;<integro:empty-if-null value="<%=frequencyMap.get(parameter.getValuationFrequencyUnit())%>" />
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table></td>
            </tr>
        </tbody>
    </table>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  		<tr><td colspan="2">&nbsp;</td></tr>
  		<tr><td colspan="2">&nbsp;</td></tr>  		
        <tr>
            <%if ("to_track".equals(event)) {%>
            <td width="100%" valign="baseline" align="center">
                <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image0','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image0" border="0" id="Image0"/></a>
            </td>
            <%} else if ("srpcountry_maker_close".equals(event)) {%>
            <td width="50%" valign="baseline" align="center">
                <a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()"
                   onmouseover="MM_swapImage('Image1','','img/close2a.gif',1)">
                    <img src="img/close1a.gif" name="Image1" width="70" height="20" border="0" id="Image1"/></a>
            </td>
            <td width="50%" valign="baseline" align="center">
                <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
                    <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
            </td>
            <%} else { %>
            <td width="100%" valign="baseline" align="center">
                <a href="<%=SRPCountryConstants.ACTION_URL%>?event=view_prepare_srpcountry" onmouseout="MM_swapImgRestore()"
                   onmouseover="MM_swapImage('Image3','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image3" border="0" id="Image3"/></a>
            </td>
            <%}%>
        </tr>
  		<tr><td colspan="2">&nbsp;</td></tr>
  		<tr><td colspan="2">&nbsp;</td></tr>
  		<tr><td colspan="2">&nbsp;</td></tr>  		  		        
    </table>
    <!-- InstanceEndEditable -->
</html:form>
</body>

<!-- InstanceEnd --></html>

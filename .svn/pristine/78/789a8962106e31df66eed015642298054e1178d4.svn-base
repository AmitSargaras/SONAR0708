<%@ page import="com.integrosys.cms.app.creditriskparam.bus.sectorlimit.ISubSectorLimitParameter,
				 com.integrosys.cms.app.creditriskparam.trx.sectorlimit.ISectorLimitParameterTrxValue,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.subsectorlimit.SubSectorLimitAction,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.app.creditriskparam.trx.sectorlimit.OBSectorLimitParameterTrxValue" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	String event = request.getParameter("event");
	ISubSectorLimitParameter obj = (ISubSectorLimitParameter)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction"+"."+"subSectorLimitObj");

	if (obj != null && obj.getEcoSectorList() != null && obj.getEcoSectorList().size() > 0) {
		pageContext.setAttribute("ecoSectorList", obj.getEcoSectorList());
	}
	
	String indexID = request.getParameter("indexID");

%>

<bean:define id="formObj" name="SubSectorLimitForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.sectorlimit.subsectorlimit.SubSectorLimitForm"/>

<html>
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Sector Limit Parameter</title>
    <!-- InstanceEndEditable -->
     <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="CssStyle" -->
  <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" title="winter"/>
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="javascript">
    <!--
    /*function viewEcoItem(idx) {
        document.forms[0].event.value = '<%= SubSectorLimitAction.EVENT_VIEW_SUBITEM%>';
        document.forms[0].indexID.value = idx;
        document.forms[0].submit();
    }*/
    -->
</script>
</head>

<body>
<html:form action="SectorLimitParam.do">
    <input type="hidden" name="event" value=""/>
    <input type="hidden" name="indexID"/>
	<input type="hidden" name="groupId" value="<%=request.getAttribute("groupId") %>"/>

    <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3>
                    <bean:message key="label.view"/> 
                    <bean:message key="title.sectorlimit.detail"/>
					</h3>					
                </td>
            </tr>
            <tr>
                <td colspan="2"><hr/></td>
            </tr>
		</thead>
		<tbody>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                            <tr class="odd">
                                <td width="40%" class="fieldname">
                                	<bean:message key="label.sectorlimit.sub.sector.desc"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
                                <td width="60%"><%=formObj.getSubSectorCode()%>
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname">
									<bean:message key="label.sector.code.value"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
								<td><bean:write name="SectorLimitForm" property="secCode"/>&nbsp;</td>
							</tr>
                            <tr class="odd">
                                <td class="fieldname">
                                	<bean:message key="label.sectorlimit.aBank.percentage"/>
								</td>
                                <td><bean:write name="SectorLimitForm" property="limitPercentage"/>&nbsp;</td>
                            </tr>
                            <tr class="even">
                                <td class="fieldname">
                                	<bean:message key="label.sectorlimit.convBank.percentage"/>
								</td>
                                <td><bean:write name="SectorLimitForm" property="conventionalBankPercentage"/>&nbsp;</td>
                            </tr>
							<tr class="odd">
                                <td class="fieldname">
                                	<bean:message key="label.sectorlimit.islamicBank.percentage"/>
								</td>
                                <td><bean:write name="SectorLimitForm" property="islamicBankPercentage"/>&nbsp;</td>
                            </tr>
							<tr class="even">
                                <td class="fieldname">
                                	<bean:message key="label.sectorlimit.invBank.percentage"/>
								</td>
                                <td><bean:write name="SectorLimitForm" property="investmentBankPercentage"/>&nbsp;</td>
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

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.sectorlimit.econ.sector.lmt"/></h3></td>
      <td valign="bottom">
      </td>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
               <td width="5%"><bean:message key="label.global.sn"/></td>
              <td width="25%"><bean:message key="label.sectorlimit.econ.sector"/></td>
              <td width="15%"><bean:message key="label.sectorlimit.aBank.percentage"/></td>
              <td width="15%"><bean:message key="label.sectorlimit.convBank.percentage"/></td>
			  <td width="15%"><bean:message key="label.sectorlimit.islamicBank.percentage"/></td>
			  <td width="15%"><bean:message key="label.sectorlimit.invBank.percentage"/></td>
            </tr>
          </thead>
            <tbody>
                <logic:present name="ecoSectorList" scope="page">
                    <logic:iterate name="ecoSectorList" id="element" indexId="ind" type="com.integrosys.cms.app.creditriskparam.bus.sectorlimit.IEcoSectorLimitParameter">
						<tr class="<%=ind.intValue()%2==0?"odd":"even" %>">
							<td class="index"><%= ind.intValue() + 1 %></td>
							<td><integro:empty-if-null value="<%=element.getLoanPurposeCode()%>"/>&nbsp;</td>
                            <td><integro:empty-if-null value="<%=element.getSectorCode()%>"/>&nbsp;</td>
							<td><integro:empty-if-null value="<%=String.valueOf(element.getLimitPercentage())%>"/>&nbsp;</td>
							<td><integro:empty-if-null value="<%=String.valueOf(element.getConventionalBankPercentage())%>"/>&nbsp;</td>
							<td><integro:empty-if-null value="<%=String.valueOf(element.getIslamicBankPercentage())%>"/>&nbsp;</td>
							<td><integro:empty-if-null value="<%=String.valueOf(element.getInvestmentBankPercentage())%>"/>&nbsp;</td>
						</tr>
					</logic:iterate>
				</logic:present>		
                <logic:notPresent name="ecoSectorList" scope="page">
                    <tr class="odd">
                        <td colspan="7"><bean:message key="label.global.not.found"/></td>
                    </tr>
                </logic:notPresent>

            </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
	    <td><a href="javascript:history.go(-1);" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Return" border="0"></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
</body>
</html>
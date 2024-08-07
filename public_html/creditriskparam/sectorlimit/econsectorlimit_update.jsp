<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 com.integrosys.cms.app.creditriskparam.bus.sectorlimit.IEcoSectorLimitParameter,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.subsectorlimit.SubSectorLimitAction,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.econsectorlimit.EconSectorLimitAction,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction,
				 java.util.List,
				 java.util.ArrayList,
				 java.util.Map,
				 java.util.Collection,
				 java.util.Iterator,
				 org.apache.struts.util.LabelValueBean,
				 java.util.Collections,
				 java.util.Comparator" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%

	class AlphabeticComparator implements Comparator {
    	public int compare(Object o1, Object o2) {
        LabelValueBean s1 = (LabelValueBean) o1;
        LabelValueBean s2 = (LabelValueBean) o2;
        return s1.getLabel().compareTo(s2.getLabel());
    	}
	}

	String indexId = request.getParameter("ecoIndexId");
	boolean isAdd = indexId.equals(String.valueOf(ICMSConstant.INT_INVALID_VALUE));
	IEcoSectorLimitParameter obj = (IEcoSectorLimitParameter)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction"+"."+"econSectorLimitObj");

	String event = (String) request.getAttribute("event");
	
	CommonCodeList ecoSec = CommonCodeList.getInstance(ICMSConstant.CATEGORY_CODE_ECONOMIC_SECTOR);
	
	List ecoSecList = new ArrayList();
	Map ecoSecMap = ecoSec.getLabelValueMap();
	Collection keys = ecoSec.getCommonCodeValues();

	for (Iterator i = keys.iterator(); i.hasNext();) {
	    	Object o = i.next();
	    	LabelValueBean bean = new LabelValueBean((String) o + " - " + (String)ecoSecMap.get(o), (String) o + " - "  + ecoSecMap.get(o) );
	    	ecoSecList.add(bean);
	}
	    
	Collections.sort(ecoSecList, new AlphabeticComparator());   
	pageContext.setAttribute("ecoSecList", ecoSecList);
	
%>
<bean:define id="formObj" name="EconSectorLimitForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.sectorlimit.econsectorlimit.EconSectorLimitForm"/>
<html>
<head>
  <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" title="winter"/>

	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calDriver.js"></script>
	
	<script language="javascript">
	<!--
		function submitForm(idx) {

		document.forms[0].secCode.disabled = false;

		if (idx == 1)
			document.forms[0].event.value = '<%=EconSectorLimitAction.EVENT_CREATE%>';
		else if (idx == 2)
			document.forms[0].event.value = '<%=EconSectorLimitAction.EVENT_UPDATE%>';
		else
			document.forms[0].event.value = '<%=SubSectorLimitAction.EVENT_RETURN%>';
				
		document.forms[0].submit();  
	}

	function changeOption(selectObj)
	{
		var selectIndex = selectObj[selectObj.selectedIndex];

		if (selectObj.selectedIndex > 0) {

		var splitResult = selectIndex.firstChild.nodeValue.split(" ");
			
		document.forms[0].secCode.value = splitResult[0]; 
		}
	}
	
	-->
	</script>
</head>
<body>
<html:form action="EconSectorLimitParam.do">
<input type="hidden" name="ecoIndexId" value="<%=request.getParameter("ecoIndexId") %>"/>
<input type="hidden" name="subIndexId" value="<%=request.getParameter("subIndexId") %>"/>
<input type="hidden" name="event"/>
<input type="hidden" name="sectorLimitId" />

    <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3>
                    <% if( isAdd ) {%>
                    	<bean:message key="label.add"/>
                    <% } else { %>
                    	<bean:message key="label.edit"/>
                    <% } %>
					<bean:message key="label.sectorlimit.econ.sector"/>
					</h3>
                </td>
            </tr>
            <tr>
                <td><hr /></td>
            </tr>
            <tr>
                <td>
                <html:errors property="duplicateEntryError"/>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                            <tr class="odd">
                                <td width="40%" class="fieldname">
                                	<bean:message key="label.sectorlimit.economic.sector.desc"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
                                <td width="60%">
		         				 <html:select property="econSectorCode" onchange="javascript:changeOption(this)">
		            				<option value=""><bean:message key="label.please.select"/></option>
		            				<html:options collection="ecoSecList" property="value" labelProperty="label"/>
		         				 </html:select>
                                    &nbsp; <br/><html:errors property="econSectorCode"/>
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.sector.code.value"/>&nbsp;<font color="#0000FF">*</font></td>
								<td>
							    <html:text property="secCode" maxlength="18" size="20" disabled="true"/>
                                    &nbsp;<html:errors property="secCode"/>
								</td>
							</tr>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.sectorlimit.aBank.percentage"/></td>
                                <td><html:text property="limitPercentage" maxlength="6" size="20"/> %
                                    &nbsp;<html:errors property="limitPercentage"/></td>
                            </tr>
                            <tr class="even">
                                <td class="fieldname"><bean:message key="label.sectorlimit.convBank.percentage"/></td>
                                <td><html:text property="conventionalBankPercentage" maxlength="6" size="20"/> %
                                    &nbsp;<html:errors property="conventionalBankPercentage"/></td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.sectorlimit.islamicBank.percentage"/></td>
                                <td><html:text property="islamicBankPercentage" maxlength="6" size="20"/> %
                                    &nbsp;<html:errors property="islamicBankPercentage"/></td>
                            </tr>
							<tr class="even">
                                <td class="fieldname"><bean:message key="label.sectorlimit.invBank.percentage"/></td>
                                <td><html:text property="investmentBankPercentage" maxlength="6" size="20"/> %
                                    &nbsp;<html:errors property="investmentBankPercentage"/></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
        <% if (isAdd) { %>
            <td><a href="javascript:submitForm(1)"><img src="img/ok1.gif" border="0" /></a></td>
		<% } else { %>
            <td><a href="javascript:submitForm(2)"><img src="img/save1.gif" border="0" /></a></td>
		<% } %>
			<td><a href="javascript:submitForm(3)"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>

        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
  </table>

</html:form>
</body>
</html>
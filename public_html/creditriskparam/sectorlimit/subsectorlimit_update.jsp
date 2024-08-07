<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 java.util.List,
				 com.integrosys.cms.app.creditriskparam.bus.sectorlimit.ISubSectorLimitParameter,
				 com.integrosys.cms.app.creditriskparam.bus.sectorlimit.OBSubSectorLimitParameter,
				 com.integrosys.cms.app.creditriskparam.bus.sectorlimit.IEcoSectorLimitParameter,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.econsectorlimit.EconSectorLimitAction,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.subsectorlimit.SubSectorLimitAction" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	String indexId = request.getParameter("subIndexId");

    boolean isAdd = indexId.equals(String.valueOf(ICMSConstant.INT_INVALID_VALUE));
	
	String fromEvent = (String)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction"+"."+"fromEvent");
	String event = (String) request.getAttribute("event");
	
	ISubSectorLimitParameter subObj = null;
	if(SubSectorLimitAction.EVENT_PREPARE.equals(event)){
		subObj = new OBSubSectorLimitParameter();
	}else{	
	 subObj = (ISubSectorLimitParameter)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction"+"."+"subSectorLimitObj");
	}
	
	boolean isValue = (subObj!= null && subObj.getEcoSectorList() != null && subObj.getEcoSectorList().size() > 0 );
    if (isValue) {
    	pageContext.setAttribute("ecoSectorList", subObj.getEcoSectorList());	
	}

%>
<bean:define id="formObj" name="SubSectorLimitForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.sectorlimit.subsectorlimit.SubSectorLimitForm"/>
<html>
<head>
   <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" title="winter"/>

	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calDriver.js"></script>
	<script language="javascript">
	<!--
	function submitForm(idx) {
		
			if (idx == 1){
				document.forms[0].event.value = '<%=SubSectorLimitAction.EVENT_CREATE%>';
			}else if (idx == 2){
				document.forms[0].event.value = '<%=SubSectorLimitAction.EVENT_UPDATE%>';
			}else{
				document.forms[0].event.value = '<%=SectorLimitAction.EVENT_RETURN%>';
			}
			document.forms[0].ecoIndexId.value = '<%=ICMSConstant.INT_INVALID_VALUE%>';
			document.forms[0].submit();  
	}

    function addNew(addNo) {

    	   if(addNo == 1){
    		document.forms[0].event.value = '<%= SubSectorLimitAction.EVENT_ADD_ITEMS%>';
            document.forms[0].ecoIndexId.value = '<%=ICMSConstant.INT_INVALID_VALUE%>';
            document.forms[0].submit(); 
    	   }else{
    		   document.forms[0].event.value = '<%= SubSectorLimitAction.EVENT_ADD_ITEM%>';
    		   document.forms[0].ecoIndexId.value = '<%=ICMSConstant.INT_INVALID_VALUE%>';
               document.forms[0].submit();
    	   }         
  
    }

    function editItem(idx) {
        document.forms[0].event.value = '<%= SubSectorLimitAction.EVENT_EDIT_ECO_ITEM%>';
        document.forms[0].ecoIndexId.value = idx;
        document.forms[0].submit();
    }

    function deleteList() {

        document.forms[0].event.value = '<%= SubSectorLimitAction.EVENT_DELETE_ECO_ITEM%>';
        document.forms[0].ecoIndexId.value = '<%=ICMSConstant.INT_INVALID_VALUE%>';
        document.forms[0].submit();
    }

	-->
	</script>
</head>
<body>
<html:form action="SubSectorLimitParam.do">
	<input type="hidden" name="ecoIndexId"/>
	<input type="hidden" name="subIndexId" value="<%=request.getParameter("subIndexId") %>"/>
    <input type="hidden" name="sectorLimitId" />
	<input type="hidden" name="event"/>
	
    <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>

	    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3>
                    <% if( isAdd || ((fromEvent != null && fromEvent.equals(SubSectorLimitAction.EVENT_PREPARE)))) {%>
                    	<bean:message key="label.add"/>
                    <% } else { %>
                    	<bean:message key="label.edit"/>
                    <% } %>
					<bean:message key="label.sectorlimit.sub.sector"/>
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
                                	<bean:message key="label.sectorlimit.sub.sector.desc"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
                                <td width="60%">
                                       <html:text property="subSectorCode" maxlength="150" size="50"/>
                                       &nbsp;<html:errors property="subSectorCode"/>
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.sector.code.value"/>&nbsp;<font color="#0000FF">*</font></td>
								<td><html:text property="secCode" maxlength="10" size="20"/>
                                <html:errors property="secCode"/></td>
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
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	  <thead>
	    <tr>
	      <td> <h3><bean:message key="label.sectorlimit.econ.sector"/></h3></td>
	      <td valign="bottom">
	        <table border="0" align="right" cellpadding="0" cellspacing="2">
	          <tr>
	            <td valign="baseline" align="center">
                    <% if(isValue){ %>
                    	<input type="button" value="<bean:message key="label.add.new"/>" class="btnNormal" onclick="javascript:addNew(1)"/>
                    <% }else{%>
                        <input type="button" value="<bean:message key="label.add.new"/>" class="btnNormal" onclick="javascript:addNew(2)"/>
                    <%} %>
					&nbsp;
					<input type="button" value="<bean:message key="label.remove"/>" class="btnNormal" onclick="javascript:deleteList()"/>
	            </td>
	          </tr>
	        </table>  
	      </td>
	    </tr>
	    <tr>
	      <td colspan="2"><hr /> </td>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <td colspan="2">
	       <html:errors property="chkDeletes"/>
	        <table width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
	          <thead>
	            <tr>
	              <td width="5%"><bean:message key="label.global.sn"/></td>
	              <td width="35%"><bean:message key="label.sectorlimit.econ.sector"/></td>
	              <td width="15%"><bean:message key="label.sectorlimit.aBank.percentage"/></td>
	              <td width="15%"><bean:message key="label.sectorlimit.convBank.percentage"/></td>
				  <td width="15%"><bean:message key="label.sectorlimit.islamicBank.percentage"/></td>
				  <td width="15%"><bean:message key="label.sectorlimit.invBank.percentage"/></td>
	              <td width="15%"><bean:message key="label.global.action"/></td>
				  <td width="15%"><bean:message key="label.select"/></td>
	            </tr>
	          </thead>
	            <tbody>
                
                <logic:present name="ecoSectorList" scope="page">
	                    <logic:iterate name="ecoSectorList" id="element" indexId="ind" type="com.integrosys.cms.app.creditriskparam.bus.sectorlimit.IEcoSectorLimitParameter">
                         <tr class="<%=ind.intValue()%2==0?"odd":"even"%>">
								<td class="index"><%= ind.intValue() + 1 %></td>
								<td><integro:empty-if-null value="<%=element.getLoanPurposeCode()%>"/>&nbsp;</td>
	                            <td><integro:empty-if-null value="<%=element.getLimitPercentage()%>"/></td>
                            	<td><integro:empty-if-null value="<%=element.getConventionalBankPercentage()%>"/></td>
								<td><integro:empty-if-null value="<%=element.getIslamicBankPercentage()%>"/></td>
								<td><integro:empty-if-null value="<%=element.getInvestmentBankPercentage()%>"/></td>
								<td><a href="javascript:editItem('<%=ind.intValue()%>')"><bean:message key="label.edit"/></a></td>
								<td><html:multibox property="deleteEcoItems" value="<%=ind.toString()%>"/></td>						
						</tr>
						</logic:iterate>
					</logic:present>		
	                <logic:notPresent name="ecoSectorList" scope="page">
	                    <tr class="odd">
	                        <td colspan="8"><bean:message key="label.global.not.found"/></td>
	                    </tr>
	                </logic:notPresent>
	            </tbody>
	        </table>
	      </td>
	    </tr>
	    <tr>
	         <td>&nbsp;</td>
	    </tr>
	  </tbody>
	</table>

  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
        <% if (isAdd || (fromEvent != null && fromEvent.equals(SubSectorLimitAction.EVENT_PREPARE))) { %>
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
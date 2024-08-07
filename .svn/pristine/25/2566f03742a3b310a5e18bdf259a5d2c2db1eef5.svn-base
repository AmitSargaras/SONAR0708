<%@ page import="com.integrosys.cms.app.creditriskparam.bus.sectorlimit.IMainSectorLimitParameter,
				 com.integrosys.cms.app.creditriskparam.trx.sectorlimit.ISectorLimitParameterTrxValue,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 org.apache.struts.util.LabelValueBean, 
				 java.util.List,
				 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
				 com.integrosys.cms.app.creditriskparam.trx.sectorlimit.OBSectorLimitParameterTrxValue" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	ISectorLimitParameterTrxValue trxValue = (ISectorLimitParameterTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction"+"."+"sectorLimitTrxObj");

    String remarks = (String)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction.remarks");

	boolean isCreate = 
		(trxValue == null || 
		trxValue.getActualMainSectorLimitParameter() == null);
	
	String fromEvent = (String)request.getAttribute("fromEvent");
	
	IMainSectorLimitParameter obj = (IMainSectorLimitParameter)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction"+"."+"mainSectorLimitObj");

	IMainSectorLimitParameter actualObj = trxValue == null ? null : trxValue.getActualMainSectorLimitParameter();
	
	String event = (String) request.getAttribute("event");
	
	if (obj!= null && obj.getSubSectorList() != null && obj.getSubSectorList().size() > 0) {	
		pageContext.setAttribute("subSectorList", obj.getSubSectorList());
	}

%>

<bean:define id="formObj" name="SectorLimitForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitForm"/>


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
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="js/itgUtilities.js"></script>
    <script type="text/javascript" src="js/ajaxDropdown.js"></script>


<script language="javascript">
    <!--
    function performSubmit() {
        document.forms[0].event.value = '<%=SectorLimitAction.EVENT_SUBMIT%>';
		document.forms[0].submit();
    }

    function cancelSubmit(idx){
        if (idx == 1) 
 			document.forms[0].event.value = '<%=SectorLimitAction.EVENT_LIST%>';
 		else if (idx == 2)	{
 	 		document.forms[0].event.value = '<%=SectorLimitAction.EVENT_VIEW%>';
 	 		document.forms[0].sectorLimitId.value = '<%=(actualObj!=null)?String.valueOf(actualObj.getId()):""%>';
 		} 
		document.forms[0].submit();
    }

    function addNew() {
        document.forms[0].event.value = '<%= SectorLimitAction.EVENT_ADD_ITEM%>';
        document.forms[0].subIndexId.value = '<%=ICMSConstant.INT_INVALID_VALUE%>';
        document.forms[0].submit();             
    }

    function editItem(idx) {
        document.forms[0].event.value = '<%= SectorLimitAction.EVENT_EDIT_ITEM%>';
        document.forms[0].subIndexId.value = idx;
        document.forms[0].submit();
    }

    function deleteList() {

        document.forms[0].event.value = '<%= SectorLimitAction.EVENT_DELETE_ITEM%>';
        document.forms[0].submit();
    }

    -->
</script>
</head>
<body>
<html:form action="SectorLimitParam.do">
    <input type="hidden" name="event" value=""/>
	<input type="hidden" name="sectorLimitId" />
	<input type="hidden" name="subIndexId"/>
	<input type="hidden" name="fromEvent" value="<%=request.getParameter("event") %>"/>
	
    <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3>
                    <% if( isCreate ) {%>
                    	<bean:message key="label.add"/>
                    <% } else { %>
                    	<bean:message key="label.edit"/>
                    <% } %>
					<bean:message key="title.sectorlimit.detail"/>
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
                                	<bean:message key="label.sectorlimit.main.sector.desc"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
                                <td width="60%">
									<html:text property="sectorCode" maxlength="150" size="50"/> 
                                     &nbsp;<html:errors property="sectorCode"/>
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.sector.code.value"/>&nbsp;<font color="#0000FF">*</font></td>
								<td>
									<html:text property="secCode" maxlength="10" size="20"/>
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
    


<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.sectorlimit.sub.sector.lmt"/></h3></td>
      <td valign="bottom">
        <table border="0" align="right" cellpadding="0" cellspacing="2">
          <tr>
            <td valign="baseline" align="center">
				<input type="button" value="<bean:message key="label.add.new"/>" class="btnNormal" onclick="javascript:addNew()"/>
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
              <td width="35%"><bean:message key="label.sectorlimit.sub.sector"/></td>
              <td width="15%"><bean:message key="label.sectorlimit.aBank.percentage"/></td>
              <td width="15%"><bean:message key="label.sectorlimit.convBank.percentage"/></td>
			  <td width="15%"><bean:message key="label.sectorlimit.islamicBank.percentage"/></td>
			  <td width="15%"><bean:message key="label.sectorlimit.invBank.percentage"/></td>
              <td width="15%"><bean:message key="label.global.action"/></td>
			  <td width="15%"><bean:message key="label.select"/></td>
            </tr>
          </thead>
            <tbody>
				<logic:present name="subSectorList" scope="page">
                    <logic:iterate name="subSectorList" id="element" indexId="ind" type="com.integrosys.cms.app.creditriskparam.bus.sectorlimit.ISubSectorLimitParameter">
						<tr class="<%=ind.intValue()%2==0?"odd":"even" %>">
							<td class="index"><%= ind.intValue() + 1 %></td>
							<td><integro:empty-if-null value="<%=element.getLoanPurposeCode()%>"/>&nbsp;</td>
                            <td><integro:empty-if-null value="<%=element.getLimitPercentage()%>"/></td>
                            <td><integro:empty-if-null value="<%=element.getConventionalBankPercentage()%>"/></td>
							<td><integro:empty-if-null value="<%=element.getIslamicBankPercentage()%>"/></td>
							<td><integro:empty-if-null value="<%=element.getInvestmentBankPercentage()%>"/></td>
                            <td><a href="javascript:editItem('<%=ind.intValue()%>')"><bean:message key="label.edit"/></a></td>
							<td><html:multibox property="deleteItems" value="<%=ind.toString()%>"/></td>							
						</tr>
					</logic:iterate>
				</logic:present>		
                <logic:notPresent name="subSectorList" scope="page">
                    <tr class="odd">
                        <td colspan="8"><bean:message key="label.global.not.found"/></td>
                    </tr>
                </logic:notPresent>
                

            </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>
<%
  if (trxValue != null && !ICMSConstant.STATE_ACTIVE.equals(trxValue.getStatus())) {
	//String remarks = trxValue.getRemarks();
	if (!SectorLimitAction.EVENT_PREPARE_UPDATE.equals(request.getParameter("event")) &&
			!SectorLimitAction.EVENT_MAKER_PROCESS.equals(request.getParameter("event"))) {
		String oldremarks = request.getParameter("remarks");
	}

%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
<tbody>

     <tr>
       <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
           <tbody>
             <tr>
			    <td class="fieldname"><bean:message key="label.remarks"/></td>
	            <td class="odd">
	            <html:textarea property="remarks" rows="3" cols="150" value="<%=remarks%>" />&nbsp;
	            <html:errors property="remarks"/><html:hidden property="remarks" value="" />
	            </td>
             </tr>
             <tr>
               <td class="fieldname">Last Action By</td>
               <td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
             </tr>
             <tr class="odd">
               <td class="fieldname">Last Remarks Made</td>
               <td><%=trxValue.getRemarks()%>&nbsp;</td>
			  
             </tr>
           </tbody>
         </table></td>
     </tr>
	
  </tbody>
</table>    
<% } %>
    <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
		<tr>
      <td colspan="2">&nbsp;<html:errors property="<%=ICMSUIConstant.SECTORLIMIT_DUPLICATE_SECTOR%>"/></td>
    </tr>
        <tr>
            <td><a href="javascript:performSubmit()" onmouseout="MM_swapImgRestore()"><img src="img/submit1.gif" border="0" /></a></td>
		 <% if (request.getParameter("trxId") == null && ((trxValue == null) || !trxValue.getOpDesc().equals("CHECKER_REJECT"))) { %>
        	<% if (isCreate) { %>
     		<td><a href="javascript:cancelSubmit(1)"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
			<% } else { %>
			<td><a href="javascript:cancelSubmit(2)"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
		<% }} else { %>
			<td><a href="ToDo.do"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
		<% } %>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</html:form>
</body>

</html>
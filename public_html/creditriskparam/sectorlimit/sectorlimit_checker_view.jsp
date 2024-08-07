<%@ page import="com.integrosys.cms.app.creditriskparam.bus.sectorlimit.IMainSectorLimitParameter,
				 com.integrosys.cms.app.creditriskparam.trx.sectorlimit.ISectorLimitParameterTrxValue,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
				 com.integrosys.cms.app.creditriskparam.bus.sectorlimit.ISubSectorLimitParameter,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 java.util.List,
				 java.util.Arrays,
				 com.integrosys.base.businfra.currency.Amount,
				 java.util.Comparator,
				 java.util.Collections" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    ISectorLimitParameterTrxValue trxValue = (ISectorLimitParameterTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction"+"."+"sectorLimitTrxObj");
    
    String event = request.getParameter("event");
    
    if( trxValue ==null ) {
        out.println("Expected session parameter 'ISectorLimitParameterTrxValue' is missing.");
        return;
    }
    
	IMainSectorLimitParameter actualObj = trxValue.getActualMainSectorLimitParameter();
	
	IMainSectorLimitParameter stagingObj = trxValue.getStagingMainSectorLimitParameter();
	
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
    <script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="javascript">
    <!--
    function approve() {
        document.forms[0].event.value = "<%=SectorLimitAction.EVENT_APPROVE%>";
        document.forms[0].submit();
    }
    
    function reject() {
        document.forms[0].event.value = "<%=SectorLimitAction.EVENT_REJECT%>";
        document.forms[0].submit();
    }

    function viewSubItem(idx){
    	document.forms[0].event.value = '<%=SectorLimitAction.EVENT_CHECKER_PROCESS_SUBITEM%>';
        document.forms[0].indexId.value = idx;
        document.forms[0].submit();
    }
    -->
</script>
</head>

<body>
<html:form action="SectorLimitParam.do">
 <input type="hidden" name="event" value=""/>
<input type="hidden" name="indexId" value="<%=request.getParameter("indexId") %>"/>

  <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3><bean:message key="title.sectorlimit.process.sector"/>
					</h3>
                </td>
            </tr>
            <tr>
                <td><hr /></td>
            </tr>
		</thead>
		<tbody>
            <tr>
                <td>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                             <tr class="odd">
                                <td width="40%" class="<%=CompareOBUtil.compOB(stagingObj, actualObj, "loanPurposeCode")?"fieldname":"fieldnamediff"%>">
                                	<bean:message key="label.sectorlimit.main.sector.desc"/>&nbsp;<font color="#0000FF">*</font>
								</td>
                                <td width="60%"><integro:empty-if-null value="<%=stagingObj.getLoanPurposeCode()%>"/>&nbsp;
                                </td>
                            </tr>
							<tr class="even">
								<td class="<%=CompareOBUtil.compOB(stagingObj, actualObj, "sectorCode")?"fieldname":"fieldnamediff"%>"><bean:message key="label.sector.code.value"/>&nbsp;<font color="#0000FF">*</font></td>
								<td><integro:empty-if-null value="<%=stagingObj.getSectorCode()%>"/>&nbsp;</td>
							</tr>
                            <tr class="odd">
                                <td class="<%=CompareOBUtil.compOB(stagingObj, actualObj, "limitPercentage")?"fieldname":"fieldnamediff"%>"><bean:message key="label.sectorlimit.aBank.percentage"/></td>
								<td><integro:empty-if-null value="<%=stagingObj.getLimitPercentage()%>"/></td>
                            </tr>
                            <tr class="even">
                                <td class="<%=CompareOBUtil.compOB(stagingObj, actualObj, "conventionalBankPercentage")?"fieldname":"fieldnamediff"%>"><bean:message key="label.sectorlimit.convBank.percentage"/></td>
                                <td><integro:empty-if-null value="<%=stagingObj.getConventionalBankPercentage()%>"/></td>
                            </tr>
                            <tr class="odd">
                                <td class="<%=CompareOBUtil.compOB(stagingObj, actualObj, "islamicBankPercentage")?"fieldname":"fieldnamediff"%>"><bean:message key="label.sectorlimit.islamicBank.percentage"/></td>
                                <td><integro:empty-if-null value="<%=stagingObj.getIslamicBankPercentage()%>"/></td>
                            </tr>
							<tr class="even">
                                <td class="<%=CompareOBUtil.compOB(stagingObj, actualObj, "investmentBankPercentage")?"fieldname":"fieldnamediff"%>"><bean:message key="label.sectorlimit.invBank.percentage"/></td>
                                <td><integro:empty-if-null value="<%=stagingObj.getInvestmentBankPercentage()%>"/></td>
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

	<%
		List res = CompareOBUtil.compOBArray(stagingObj.getSubSectorList().toArray(), 
						actualObj != null ? actualObj.getSubSectorList().toArray() : null);
	
		if (res != null && res.size() > 0) {
	
			Collections.sort(res, new Comparator() {
				public int compare (Object o1, Object o2) {
	
					return ((ISubSectorLimitParameter)((CompareResult)o1).getObj()).getLoanPurposeCode().compareTo
						(((ISubSectorLimitParameter)((CompareResult)o2).getObj()).getLoanPurposeCode());
				}		
			});
	
			pageContext.setAttribute("subSectorList", res);
		}
	%>
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	  <thead>
	    <tr>
	      <td><h3><bean:message key="label.sectorlimit.sub.sector.lmt"/></h3></td>
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
	              <td width="35%"><bean:message key="label.sectorlimit.sub.sector"/></td>
	              <td width="15%"><bean:message key="label.sectorlimit.aBank.percentage"/></td>
	              <td width="15%"><bean:message key="label.sectorlimit.convBank.percentage"/></td>
				  <td width="15%"><bean:message key="label.sectorlimit.islamicBank.percentage"/></td>
				  <td width="15%"><bean:message key="label.sectorlimit.invBank.percentage"/></td>
                  <td width="15%"><bean:message key="label.global.action"/></td>
	            </tr>
	          </thead>
	            <tbody>
					
	                <logic:present name="subSectorList" scope="page">
	                    <logic:iterate name="subSectorList" id="element" indexId="ind" type="com.integrosys.base.techinfra.diff.CompareResult">
							<%
								ISubSectorLimitParameter obj = (ISubSectorLimitParameter)element.getObj();
							%>
							<tr class="<%=ind.intValue()%2==0?"odd":"even" %>">
								<td class="<bean:write name="element" property="key" />"><%= ind.intValue() + 1 %></td>
								<td><integro:empty-if-null value="<%=obj.getLoanPurposeCode()%>"/>&nbsp;</td>
								<td><integro:empty-if-null value="<%=obj.getLimitPercentage()%>"/></td>
	                            <td><integro:empty-if-null value="<%=obj.getConventionalBankPercentage()%>"/></td>
								<td><integro:empty-if-null value="<%=obj.getIslamicBankPercentage()%>"/></td>
								<td><integro:empty-if-null value="<%=obj.getInvestmentBankPercentage()%>"/></td>
                                <td><a href="javascript:viewSubItem('<%=obj.getSectorCode()%>')"><bean:message key="label.view"/></a></td>
							</tr>
						</logic:iterate>
					</logic:present>		
	                <logic:notPresent name="subSectorList" scope="page">
	                    <tr class="odd">
	                        <td colspan="7"><bean:message key="label.global.not.found"/></td>
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
	
	<%
		String remarks = trxValue.getRemarks();
		if (!SectorLimitAction.EVENT_CHECKER_PROCESS.equals(request.getParameter("event"))) {
			remarks = request.getParameter("remarks");
		}
	%>
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
	<tbody>
	     <tr>
	       <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	           <tbody>
	             <tr class="odd">
	               <td class="fieldname" width="20%">Remarks</td>
	               <td width="80%" class="odd"><html:textarea property="remarks" rows="3" cols="150"/>&nbsp;
	               <html:errors property="remarks"/>
	               </td>
	             </tr>
	             <tr class="even">
	               <td class="fieldname">Last Action By</td>
	               <td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
	             </tr>
	             <tr class="odd">
	               <td class="fieldname">Last Remarks Made</td>
	               <td><integro:wrapper value="<%=trxValue.getRemarks()%>"/>&nbsp;</td>
	             </tr>
	           </tbody>
	         </table></td>
	     </tr>
	
	  </tbody>
	</table>
	
	<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
			
	    </tr>
	    <tr>
	        <td><a href="#" onclick="approve()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80"
	                                                                                                                                               height="20" border="0" id="Image8"/></a></td>
	        <td><a href="#" onclick="reject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70"
	                                                                                                                                             height="20" border="0" id="Image9"/></a></td>
	        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10"/></a>
	        </td>
	    </tr>
	    <tr>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
	    </tr>
	</table>


</html:form>
</body>
</html>
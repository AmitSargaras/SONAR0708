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
    String event = request.getParameter("event");
    ISectorLimitParameterTrxValue trxValue = (ISectorLimitParameterTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction"+"."+"sectorLimitTrxObj");
    
    if( trxValue ==null ) {
        out.println("Expected session parameter 'ISectorLimitParameterTrxValue' is missing.");
        return;
    }
    
    IMainSectorLimitParameter sectorObj = null;
    boolean isTrack = false;
    boolean isDelete = false;
    boolean isClose = false;
    if(trxValue != null){
	   
	   if(event.equalsIgnoreCase(SectorLimitAction.EVENT_TRACK)) {
		   isTrack = true;
	       	if (trxValue.getStatus().equals(ICMSConstant.STATE_CLOSED)) {
	       		sectorObj = trxValue.getActualMainSectorLimitParameter();
	       		
	       		if (sectorObj == null)
	       			sectorObj = trxValue.getStagingMainSectorLimitParameter();
	       		
	       		if(sectorObj.getSubSectorList() != null && sectorObj.getSubSectorList().size() > 0){
	       	    pageContext.setAttribute("subSectorList", sectorObj.getSubSectorList());
	       		}
	       		
	       	} else {
	       		sectorObj = trxValue.getStagingMainSectorLimitParameter();
	       		if(sectorObj.getSubSectorList() != null && sectorObj.getSubSectorList().size() > 0){
	       	    pageContext.setAttribute("subSectorList", sectorObj.getSubSectorList());
	       		}
	        }
       }
	   
	   if(event.equalsIgnoreCase(SectorLimitAction.EVENT_PREPARE_CLOSE)){
		    isClose = true;
		    sectorObj = trxValue.getStagingMainSectorLimitParameter();
     		if(sectorObj.getSubSectorList() != null && sectorObj.getSubSectorList().size() > 0){
     	    pageContext.setAttribute("subSectorList", sectorObj.getSubSectorList());
     		}
	   }
	   
	   if(event.equals(SectorLimitAction.EVENT_PREPARE_DELETE)){
		    isDelete = true;
		    sectorObj = trxValue.getActualMainSectorLimitParameter();
    		if(sectorObj.getSubSectorList() != null && sectorObj.getSubSectorList().size() > 0){
    	    pageContext.setAttribute("subSectorList", sectorObj.getSubSectorList()); 
    		}
	   }
	   
	  
    }
    
    String remarks = (String)session.getAttribute("com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction.remarks");
	
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
    function viewSubItem(idx){
        document.forms[0].event.value = '<%= SectorLimitAction.EVENT_VIEW_SUBITEM%>';
        document.forms[0].indexId.value = idx;
        document.forms[0].submit();
    }

    function submitPage (idx) {
    	if (idx == 0) {
            document.forms[0].event.value='<%=SectorLimitAction.EVENT_CLOSE%>';
    	}else if( idx == 1){
    		document.forms[0].event.value='<%=SectorLimitAction.EVENT_DELETE%>';
    	}else if(idx == 2){
    		document.forms[0].event.value='<%=SectorLimitAction.EVENT_LIST%>';
    	}
    	document.forms[0].submit();

    }
    -->
</script>
</head>

<body>
<html:form action="SectorLimitParam.do">
    <input type="hidden" name="event" value=""/>
    <input type="hidden" name="indexId" value="<%=request.getParameter("indexId") %>"/>
    <input type="hidden" name="fromEvent" value="<%=request.getParameter("event")%>"/>
    <input type="hidden" name="sectorLimitId" value="<%=request.getParameter("sectorLimitId") %>"/>
  <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3><bean:message key="title.sectorlimit"/>
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
                                <td width="40%" class="fieldname">
                                	<bean:message key="label.sectorlimit.main.sector.desc"/>&nbsp;<font color="#0000FF">*</font>
								</td>
                                <td width="60%"><integro:empty-if-null value="<%= sectorObj.getLoanPurposeCode()%>"/>&nbsp;
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.sector.code.value"/>&nbsp;<font color="#0000FF">*</font></td>
								<td><integro:empty-if-null value="<%= sectorObj.getSectorCode()%>"/>&nbsp;</td>
							</tr>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.sectorlimit.aBank.percentage"/></td>
								<td><integro:empty-if-null value="<%=sectorObj.getLimitPercentage()%>"/></td>
                            </tr>
                            <tr class="even">
                                <td class="fieldname"><bean:message key="label.sectorlimit.convBank.percentage"/></td>
                                <td><integro:empty-if-null value="<%=sectorObj.getConventionalBankPercentage()%>"/></td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.sectorlimit.islamicBank.percentage"/></td>
                                <td><integro:empty-if-null value="<%=sectorObj.getIslamicBankPercentage()%>"/></td>
                            </tr>
							<tr class="even">
                                <td class="fieldname"><bean:message key="label.sectorlimit.invBank.percentage"/></td>
                                <td><integro:empty-if-null value="<%=sectorObj.getInvestmentBankPercentage()%>"/></td>
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
                    <logic:iterate name="subSectorList" id="element" indexId="ind" type="com.integrosys.cms.app.creditriskparam.bus.sectorlimit.ISubSectorLimitParameter">
						<tr class="<%=ind.intValue()%2==0?"odd":"even" %>">
							<td class="index"><%= ind.intValue() + 1 %></td>
							<td><integro:empty-if-null value="<%=element.getLoanPurposeCode()%>"/>&nbsp;</td>
							<td><integro:empty-if-null value="<%=element.getLimitPercentage()%>"/>&nbsp;</td>
							<td><integro:empty-if-null value="<%=element.getConventionalBankPercentage()%>"/>&nbsp;</td>
							<td><integro:empty-if-null value="<%=element.getIslamicBankPercentage()%>"/>&nbsp;</td>
							<td><integro:empty-if-null value="<%=element.getInvestmentBankPercentage()%>"/>&nbsp;</td>
                            <td><a href="javascript:viewSubItem('<%=ind.intValue()%>')"><bean:message key="label.view"/></a></td>
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
	if (SectorLimitAction.EVENT_MAKER_PROCESS_DELETE.equals(event) || SectorLimitAction.EVENT_PREPARE_CLOSE.equals(event) ) {
		String oldRemarks = trxValue.getRemarks();
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
<tbody>
     <tr>
       <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
           <tbody>
             <tr>
               <td class="fieldname" width="20%">Remarks</td>
               <td width="80%" class="odd"><html:textarea property="remarks" rows="3" cols="150" value="<%=remarks%>"/>&nbsp;
               <html:errors property="remarks"/>
               </td>
             </tr>
             <tr>
               <td class="fieldname">Last Action By</td>
               <td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
             </tr>
             <tr class="odd">
               <td class="fieldname">Last Remarks Made</td>
               <td><integro:wrapper value="<%=trxValue.getRemarks()%>" lineLength="90"/>&nbsp;</td>
             </tr>
           </tbody>
         </table></td>
     </tr>

  </tbody>
</table>    
<% } %>

	<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
			
	    </tr>
	    <tr>
        <% 
          if (isTrack) 
          { 
        %>
            <td><a href='ToDo.do?event=totrack' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)"><img src="img/return1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
           <td>&nbsp;</td>
        <% 
          } else if(isDelete){ 
        %>
            <td><a href="javascript:submitPage(1)"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image8" border="0" id="Image8" /></a></td>
			<td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/return2.gif',1)"><img src="img/return1.gif" name="Image8" width="80" height="20" border="0" id="Image8"/></a></td>
       <%  
          }
          else 
          { 
        %>
           <td><a href="javascript:submitPage(0)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
           <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
        <% 
          } 
        %>
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
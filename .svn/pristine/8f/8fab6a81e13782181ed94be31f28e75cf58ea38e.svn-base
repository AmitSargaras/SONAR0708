<!--Modified by Pratheepa for CR148-->
<%@ page import="com.integrosys.cms.ui.tat.TatsForm,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.cms.app.limit.bus.*,
                 java.util.*,
                 com.integrosys.cms.ui.bfl.BflHelper,
                 com.integrosys.base.techinfra.util.*"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/bfl/send_draft_bfl.jsp,v 1.22 2006/10/27 08:10:27 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.22 $
     * @since $Date: 2006/10/27 08:10:27 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html>
<head>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>





<script language="JavaScript" type="text/JavaScript">
<!--

function gotopage(URL) {
	document.forms[0].action=URL;
    document.forms[0].submit();
}



//-->

</script>

</head>

<body onload="MM_preloadImages('img/cancel2.gif')">
	<html:form  action="Bfl.do?event=confirm_send_draft_bfl">


    <%
    	HashMap rs = null;
    	String event_from = (String)request.getAttribute("event");
    	if(event_from.equals("send_draft_bfl"))
    		rs = (HashMap) request.getAttribute("infoMap");
    	else
         	rs = (HashMap) request.getAttribute("infoMap_send_draft_bfl");
        String infoReq =(String) rs.get("infoReq");
        String event =(String) request.getAttribute("event");
        Date tatStamp = (Date) rs.get("tatStamp");
        ArrayList resList = (ArrayList)rs.get("tatList");
        
        	
        ITATEntry[] tatEntryList = (ITATEntry[])resList.toArray(new ITATEntry[0]);
        
        tatEntryList = BflHelper.sortTatEntryList(tatEntryList,event_from);
        
        
        
        
        
	
	
        
    %>
        <% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>

<!--	bernard - the following block was not closed properly! commented it to fix display problem at View Issue Draft BFL-->
<!-- 	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  

		<tr id="envCanvas">
  	
			<td width="100%" valign="top" id="envCanvasContent">         
				<table id="window" border="0" cellpadding="0" cellspacing="0">
	  	
		
					<tr id="winCanvas">
						<td>
			 
							<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
              
								<tr > 
									<td colspan="3" valign="top" style="height:100%;width:100%;">
										<div id="contentCanvas" style="height:100%;width:100%;"> -->
                    
                    
	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
		<thead>
			<tr>
				<td> 
					<h3><bean:message key="label.bfl.send.draft.status"/><br /></h3>
				</td>
			</tr>
			<tr>
				<td><hr /></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td> 
					<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
						<thead> 
							<tr> 
								<td width="4%"><bean:message key="label.global.sn"/></td>
								<td width="25%"><bean:message key="label.bfl.last.send.draft.date"/></td>
								<td width="71%"><bean:message key="label.remarks"/></td>
							</tr>
						</thead> 
						<tbody> 
<%							int row = 0;
							String rowClass="";
							if (tatEntryList != null && tatEntryList.length > 0)
							{
								for (int ii=0; ii<tatEntryList.length; ii++)
								{
									row++;
									if(row%2!=0){
										rowClass="odd";
									}else{
										rowClass="even";
									}                                    
%>
									<tr class="<%=rowClass%>"> 
										<td class="index" width="4%" ><%=row%></td>
										<td width="25%" ><%=DateUtil.formatDate("dd MMM yyyy HH:mm:ss",tatEntryList[ii].getTATStamp())%></td>
										<td width="71%" ><integro:htmltext value="<%=tatEntryList[ii].getRemarks()%>" /></td>
									</tr>                            
<%								}
							}
							else
							{
%>
								<tr class="<%=rowClass%>">
									<td align="right" colspan="3"><bean:message key="label.bfl.no.send.draft.none"/></td>
								</tr>
<%							}
%>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
<%	if(event==null || !event.equals("view_bfl")) 
	{
%>
		<br>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		<tr>
			<td width="54" class="fieldname"><bean:message key="label.remarks"/></td>
			<td width="141">
				<html:textarea property="tatRemarks" rows="5" cols="100" />
			</td>                        
		</tr>                      
		</table>
		<html:errors property="tatRemarks"/>
		<h5 align="center">
			<bean:message key="label.bfl.send.draft.msg"/>
		</h5>

		<table width="140" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="79">&nbsp;</td>
				<td width="71">&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" name="Submit" value="Update Time Stamp" style="width:120px"  class="btnNormal" onclick="gotopage('Bfl.do?event=confirm_send_draft_bfl')"/></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
<%	}
%>
	</html:form>
</body>
</html>

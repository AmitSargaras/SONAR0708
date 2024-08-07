<!--Modified by Pratheepa for CR234-->
<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckList,
                 com.integrosys.cms.app.recurrent.bus.IConvenant,
                 com.integrosys.cms.ui.common.FrequencyList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ include file="/collateral/locale.jsp"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recurrent/recurrent_list_view.jsp,v 1.28 2006/10/27 08:19:27 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.28 $
* Date: $Date: 2006/10/27 08:19:27 $
* Tag: $Name:  $
*/
%>
<%
    IRecurrentCheckListTrxValue checkListTrxVal =(IRecurrentCheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListAction.checkListTrxVal");
    IRecurrentCheckList recChkLst = (IRecurrentCheckList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListAction.recChkLst");

    String remarks = "";
    String lastActionBy = "";

    if(recChkLst!=null)
        pageContext.setAttribute("recChkLst",recChkLst);

    int row = 0;
//    String status = "";

    if(checkListTrxVal!=null){
//        status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }

    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    boolean isTrack = false;
    boolean isClose = false;
    String event = request.getParameter("event");

    if("to_track".equals(event) || "true".equals(request.getParameter("isTrack"))){
        isTrack = true;
    }
    if("close_checklist_item".equals(event) || "true".equals(request.getParameter("isClose"))){
        isClose = true;
    }
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}


function viewRecurrent(ind) {
	document.forms[0].index.value=ind;
	<% if (isTrack) { %>
	document.forms[0].event.value="view_recurrent_item_to_track";
	<% } else { %>
	document.forms[0].event.value="view_recurrent_item";
	<% } %>
	document.forms[0].submit();
}

<%-- cr 26 --%>
function viewCovenant(ind) {
	document.forms[0].index.value=ind;
	<% if (isTrack) { %>
	document.forms[0].event.value="view_covenant_item_to_track";
	<% } else { %>
	document.forms[0].event.value="view_covenant_item";
	<% } %>
	document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<html:form action="RecurrentCheckList" >
<input type="hidden" name="event" />
<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />
<input type="hidden" name="custTypeTrxID" value="<%=request.getParameter("custTypeTrxID")%>"/>
<input type="hidden" name="isTrack" value="<%=isTrack%>"/>
<input type="hidden" name="isClose" value="<%=isClose%>"/>
<input type="hidden" name="isRead" value="<%=!isTrack && !isClose%>"/>
<html:hidden property="limitProfileId" />
<html:hidden property="subProfileId" />
<!-- InstanceBeginEditable name="Content" -->
<%-- <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="title.maintain.cov.condition.checklist"/></h3></td>
      <td align="right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="5%"><bean:message key="title.sequence.number"/></td>
              <td width="20%"><bean:message key="label.checklist.covenant.condition"/></td>
              <td width="5%"><bean:message key="label.checklist.one.off"/></td>
              <td width="10%"><bean:message key="title.item.type"/></td>
              <td width="10%"><bean:message key="label.checklist.frequency"/></td>
              <td width="10%"><bean:message key="label.checklist.trigger.end.date"/></td>
              <td width="10%"><bean:message key="label.checklist.grace.period"/></td>
              <td width="10%"><bean:message key="label.checklist.due.date"/></td>
              <td width="10%"><bean:message key="label.checklist.last.trigger.entry"/></td>
              <td width="10%"><bean:message key="label.checklist.action"/></td>
            </tr>
          </thead>
          <tbody>
            <logic:present name="recChkLst" property="convenantList">
                <logic:empty name="recChkLst" property="convenantList">
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.error.no.document"/></td>
                    </tr>
                </logic:empty>
                <logic:notEmpty name="recChkLst" property="convenantList">
                    <%if (recChkLst.getConvenantList().length > 0) {%>
                    <logic:iterate id="OB1" name="recChkLst" property="convenantList" type="com.integrosys.cms.app.recurrent.bus.IConvenant">
		<%
				String rowClass="";
				row++;
				if(row%2!=0){
					 rowClass="odd";
				}
				else{
					 rowClass="even";
				}
            // cr26
            String freUnit1 = "";
            boolean fee1 = OB1.getFee();
	boolean riskTrigger1 = OB1.getRiskTrigger();
	String itemType = null;
	if(fee1)
		itemType = "Fee";
	else if(riskTrigger1)
		itemType = "Risk Trigger";
	else
		itemType = "Covenant";

            freUnit1 = OB1.getFrequencyUnit();
            FrequencyList list1 = FrequencyList.getInstance();
            freUnit1 = list1.getFrequencyValue(freUnit1);
            if(freUnit1==null){freUnit1="";}
            String gracePeriodUnit1 = list1.getFrequencyValue(OB1.getGracePeriodUnit());
			      if (gracePeriodUnit1 == null) {
				      gracePeriodUnit1 = "";
			      }
			// cr26
			%>
			<bean:define id="itemType1" value="<%=itemType%>" />
		<tr class="<%=rowClass%>">
              <td class="index" ><%=row%></td>
              <td>
				<% if (!OB1.getIsParameterizedDesc()) { %>
					<%=OB1.getDescription()%>
				<% } else { %>
					<integro:common-code categoryCode="COVENANT_CONDITION" entryCode="<%=OB1.getDescription()%>" display="true" descWithCode="false"/>
				<% } %>&nbsp;</td>
              cr 26
              <td><integro:boolean-display value="<%=OB1.getIsOneOffInd()%>" style="yn" />&nbsp;</td>
               <td><bean:write name="itemType1" />&nbsp;</td>
               <%  if(!OB1.getIsOneOffInd() && OB1.getFrequency()!=Integer.MIN_VALUE) { %>
              <td><%=OB1.getFrequency()%>&nbsp;<%=freUnit1%>&nbsp;</td>
        <%  } else { %>
              <td style="text-align:center">-</td>
        <%  } %>
              <td style="text-align:center"><integro:date object="<%=OB1.getInitialDocEndDate()%>"/>&nbsp;</td>
        <%  if(OB1.getGracePeriod()!=Integer.MIN_VALUE) { %>
              <td><%=OB1.getGracePeriod()%>&nbsp;<%=gracePeriodUnit1%>&nbsp;</td>
        <%  }
	          else {
        %>
              <td style="text-align:center">-</td>
        <%  } %>
              <td style="text-align:center"><integro:date object="<%=OB1.getInitialDueDate()%>"/>&nbsp;</td>
              <td style="text-align:center"><integro:date object="<%=OB1.getLastDocEntryDate()%>" />&nbsp;</td>
              <td style="text-align:center"><a href="javascript:viewCovenant('<%=row-1%>')">View</a></td>
              cr 26
            </tr>
                    </logic:iterate>                        
                    <%} else {%>
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.error.no.document"/></td>
                    </tr>
                    <%}%>
                </logic:notEmpty>
            </logic:present>
            <logic:notPresent name="recChkLst" property="convenantList">
                <tr class="odd">
                    <td colspan="10"><bean:message key="label.error.no.document"/></td>
                </tr>
            </logic:notPresent>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table> --%>
<% row = 0; %>
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td height="34"><h3><bean:message key="title.maintain.rec.doc.checklist"/></h3></td>
      <td align="right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="5%"><bean:message key="title.sequence.number"/></td>
              <td width="28%"><bean:message key="label.checklist.doc.description"/></td>
              <%-- <td width="5%"><bean:message key="label.checklist.one.off"/></td> --%>
              <td width="10%"><bean:message key="label.checklist.frequency"/></td>
              <td width="10%"><bean:message key="label.checklist.doc.end.date"/></td>
              <%-- <td width="10%"><bean:message key="label.checklist.grace.period"/></td> --%>
              <td width="10%"><bean:message key="label.checklist.doc.due.date"/></td>
              <td width="10%"><bean:message key="label.checklist.last.doc.entry.date"/></td>
              <%-- <td width="7%"><bean:message key="label.checklist.chaser.reminder"/></td> --%>
              <td width="5%"><bean:message key="label.checklist.action"/></td>
            </tr>
          </thead>
          <tbody>
		<logic:present name="recChkLst" property="checkListItemList" >
			<logic:iterate id="OB" name="recChkLst"  property="checkListItemList" type="com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem"  >
				<%
				if(OB.getDocType()==null){
            String rowClass="";
            row++;
            if(row%2!=0){
               rowClass="odd";
            }
            else{
               rowClass="even";
            }
            String freUnit = "";
            freUnit = OB.getFrequencyUnit();
            FrequencyList list = FrequencyList.getInstance();
            freUnit = list.getFrequencyValue(freUnit);
            if(freUnit==null){freUnit="";}
            String gracePeriodUnit = list.getFrequencyValue(OB.getGracePeriodUnit());
			      if (gracePeriodUnit == null) {
				      gracePeriodUnit = "";
			      }
        %>
						<tr class="<%=rowClass%>">
              <td class="index" ><%=row%></td>
              <td><bean:write name="OB" property="item.itemDesc" />&nbsp;</td>
              <%-- <td><integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;</td> --%>
        <%  if(!OB.getIsOneOffInd() && OB.getFrequency()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
        <%  }
	          else {
        %>
              <td style="text-align:center">-</td>
        <%  } %>
             <%--  <td style="text-align:center"><integro:date object="<%=OB.getInitialDocEndDate()%>"/>&nbsp;</td>
        <%  if(OB.getGracePeriod()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
        <%  }
            else {
        %>
              <td style="text-align:center">-</td>
        <%  } %> --%>
              <td style="text-align:center"><integro:date object="<%=OB.getInitialDueDate()%>"/>&nbsp;</td>
              <td style="text-align:center"><integro:date object="<%=OB.getLastDocEntryDate()%>"/>&nbsp;</td>
              <%-- <td style="text-align:center"><integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;</td> --%>
              <td style="text-align:center"><a href="javascript:viewRecurrent('<%=row-1%>')">View</a></td>
            </tr>
            <%}else{
            	row++;
            } %>
			</logic:iterate>
			<%if(row>0) {%>
				<td colspan="10"><bean:message key="label.error.no.document"/></td>
			<%} %>
		</logic:present>
		<logic:notPresent name="recChkLst" property="checkListItemList" >
            <tr class="odd">
              <td colspan="10"><bean:message key="label.error.no.document"/></td>
            </tr>
		</logic:notPresent>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>
<%if(isClose) {%>
<p/>
<p/>
<p/>
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr class="even">
					  <td class="fieldname"><bean:message key="label.checklist.last.action.by"/></td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname"><bean:message key="label.checklist.last.remarks.made"/></td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
        </table>
<% } %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">
    <%if(isTrack){%>
      <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else if (isClose) {%>
      <a href="RecurrentCheckList.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;
    </td>
    <td width="100" valign="baseline" align="center">
			<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <% }%>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
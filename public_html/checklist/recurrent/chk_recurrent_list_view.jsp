<!--Modified by Pratheepa for CR234-->
<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckList,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 java.util.Arrays,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.recurrent.bus.IConvenant,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.app.recurrent.bus.ConvenantComparator,
                 com.integrosys.cms.ui.common.FrequencyList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ include file="/collateral/locale.jsp"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recurrent/chk_recurrent_list_view.jsp,v 1.28 2006/10/27 08:19:27 hmbao Exp $
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
    String lastActionBy = checkListTrxVal.getUserInfo();
    String remarks = checkListTrxVal.getRemarks();

    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";


    int row = 0;
    String status = "";
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
    }

    IRecurrentCheckListItem arrayActual[] = null;
    IRecurrentCheckListItem arrayStaging[] = null;
    if(checkListTrxVal.getCheckList()==null) {
        arrayActual = null;
    } else {
        arrayActual = checkListTrxVal.getCheckList().getCheckListItemList();    
    }
    
    if(checkListTrxVal.getStagingCheckList()!=null)
        arrayStaging = checkListTrxVal.getStagingCheckList().getCheckListItemList();    
 
    List res = null;
    if ((arrayStaging == null) && (arrayActual == null))
    {
    	res = new ArrayList();
    }
    else
    {    
        res = CompareOBUtil.compOBArray(arrayStaging,arrayActual);
    }
    ArrayList list = new ArrayList(res);
    pageContext.setAttribute("checkLists",list);

    IConvenant staConvenant[] = checkListTrxVal.getStagingCheckList().getConvenantList();
    IConvenant actConvenant[] = null;
    if(checkListTrxVal.getCheckList()!=null){
        actConvenant = checkListTrxVal.getCheckList().getConvenantList();
    }
	
    List resCovenant = null;
    if ((staConvenant == null) && (actConvenant == null))
    {
    	resCovenant = new ArrayList();
    }
    else
    {
    	resCovenant = CompareOBUtil.compOBArray(staConvenant,actConvenant);
    }
    
    
    if(resCovenant!=null && resCovenant.size()>0){
     	CompareResult[] resultList = (CompareResult[])resCovenant.toArray(new CompareResult[0]);
	Arrays.sort(resultList, new ConvenantComparator());
	resCovenant = new ArrayList(Arrays.asList(resultList));
    }
    
    
    
    
    
    
    
    ArrayList list1 = new ArrayList(resCovenant);
    pageContext.setAttribute("covenants",list1);
    FrequencyList freList = FrequencyList.getInstance();
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

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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
//-->

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="approve_checklist_item";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="reject_checklist_item";
    document.forms[0].submit();
}

function goViewCovenant(itemRef) {
    url = "RecurrentCheckList.do?event=chk_view_covenant&itemRef="+itemRef;
    window.location.href = url;
}

function goViewRecurrent(itemRef) {
    url = "RecurrentCheckList.do?event=chk_view_recurrent&itemRef="+itemRef;
    window.location.href = url;
}


</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif','img/approve2.gif','img/reject2.gif')">
<html:form action="RecurrentCheckList" >
<input type="hidden" name="event" />

<!-- InstanceBeginEditable name="Content" -->
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="title.maintain.cov.condition.checklist"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="5%"><bean:message key="title.sequence.number"/></td>
              <td width="30%"><bean:message key="label.checklist.covenant.condition"/></td>
              <td width="10%"><bean:message key="label.checklist.one.off"/></td>
              <!-- <td width="5%">Risk Trigger</td> -->
             <!-- <td width="5%">Fee</td> -->
<!--             <td width="10%">Item Type </td>-->
              <td width="10%"><bean:message key="label.checklist.frequency"/></td>
              <td width="10%"><bean:message key="label.checklist.trigger.end.date"/></td>
              <td width="10%"><bean:message key="label.checklist.grace.period"/></td>
              <td width="10%"><bean:message key="label.checklist.last.trigger.entry"/></td>
              <td width="10%"><bean:message key="label.checklist.due.date"/></td>
<%--              <td width="7%">Chaser / Reminder</td>--%>
              <td width="10%"><bean:message key="label.checklist.action"/></td>
            </tr>
          </thead>
          <tbody>
		<logic:present name="covenants" >
		   <logic:iterate id="compResult1" name="covenants"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
		<%
            IConvenant OB1 = (IConvenant)compResult1.getObj();
			String rowClass="";
			row++;
			if(row%2!=0){
			   rowClass="odd";
			}else{
			   rowClass="even";
			}
            String freUnit1 = "";
            String graceUnit1 = "";
            // cr 26 
            freUnit1 = freList.getFrequencyValue(((IConvenant)compResult1.getObj()).getFrequencyUnit());
            graceUnit1 = freList.getFrequencyValue(((IConvenant)compResult1.getObj()).getGracePeriodUnit());
            if(freUnit1==null) freUnit1="";
            if(graceUnit1==null) graceUnit1="";
            
            
            	boolean fee1 = OB1.getFee();
		boolean riskTrigger1 = OB1.getRiskTrigger();
		String itemType = null;
		if(fee1)
			itemType = "Fee";
		else if(riskTrigger1)
			itemType = "Risk Trigger";
		else
			itemType = "Covenant";
            	System.out.println("ItemType:" +itemType);

    	   %>
	    <bean:define id="itemType1" value="<%=itemType%>" />
            <tr class="<%=rowClass%>">
              <td class='<bean:write name="compResult1" property="key" />' ><%=row%></td>
              <td>&nbsp;
				<% if (!OB1.getIsParameterizedDesc()) { %>
					<bean:write name="compResult1" property="obj.description" />
				<% } else { %>
					<integro:common-code categoryCode="COVENANT_CONDITION" entryCode="<%=OB1.getDescription()%>" display="true" descWithCode="false"/>
				<% } %>
					</td>
			  <%--// cr 26--%>
              <td><integro:boolean-display value="<%=OB1.getIsOneOffInd()%>" style="yn"/></td>
              <!-- <td><integro:boolean-display value="<%=OB1.getRiskTrigger()%>" style="yn"/></td> -->
              <!-- <td><integro:boolean-display value="<%=OB1.getFee()%>" style="yn"/></td> -->
        <%  if (!OB1.getIsOneOffInd() && OB1.getFrequency()!=Integer.MIN_VALUE) { %>
              <td><%=OB1.getFrequency()%>&nbsp;<%=freUnit1%>&nbsp;</td>
	      <%  }
	          else {
	      %>
	            <td style="text-align:center">-</td>
	      <%  } %>
              <td style="text-align:center"><integro:date object="<%=OB1.getInitialDocEndDate()%>"/>&nbsp;</td>
        <%  if (OB1.getGracePeriod()!=Integer.MIN_VALUE) {%>
              <td><%= OB1.getGracePeriod()%>&nbsp;<%=graceUnit1%>&nbsp;</td>
        <%  }
	          else {
        %>
              <td style="text-align:center">-</td>
        <%  } %>
              <td style="text-align:center"><integro:date object="<%=OB1.getLastDocEntryDate()%>"/>&nbsp;</td>
              <td style="text-align:center"><integro:date object="<%=OB1.getInitialDueDate()%>"/>&nbsp;</td>
<%--              <td style="text-align:center">< integro : boolean-display value="< %=OB1.getChaseReminderInd()% >" style="yn"/>&nbsp;</td>
--%>			  <%--// cr 26--%> <!-- -->
              <td style="text-align:center">
              <a href="#" onclick="goViewCovenant('<%=OB1.getConvenantRef()%>')" >View</a>
                </a></td>
            </tr>
        </logic:iterate>
        </logic:present>
<logic:notPresent name="covenants" >
            <tr class="odd">
              <td colspan="10"><bean:message key="label.error.no.document"/></td>
            </tr>
</logic:notPresent>

          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<% row=0; %>
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td height="34"> <h3><bean:message key="title.maintain.rec.doc.checklist.process"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="5%"><bean:message key="title.sequence.number"/></td>
              <td width="23%"><bean:message key="label.checklist.doc.description"/></td>
              <td width="5%"><bean:message key="label.checklist.one.off"/></td>
              <td width="14%"><bean:message key="label.checklist.frequency"/></td>
              <td width="10%"><bean:message key="label.checklist.doc.end.date"/></td>
              <td width="10%"><bean:message key="label.checklist.grace.period"/></td>
              <td width="10%"><bean:message key="label.checklist.doc.due.date"/></td>
              <td width="10%"><bean:message key="label.checklist.last.doc.entry.date"/></td>
              <td width="7%"><bean:message key="label.checklist.chaser.reminder"/></td>
              <td width="5%"><bean:message key="label.checklist.action"/></td>
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkLists" >
		   <logic:iterate id="compResult" name="checkLists"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
		<%
            IRecurrentCheckListItem OB = (IRecurrentCheckListItem)compResult.getObj();
			String rowClass="";
			row++;
			if(row%2!=0){
			   rowClass="odd";
			}else{
			   rowClass="even";
			}
            String freUnit = "";
            String graceUnit = "";
            freUnit = freList.getFrequencyValue(((IRecurrentCheckListItem)compResult.getObj()).getFrequencyUnit());
            graceUnit = freList.getFrequencyValue(((IRecurrentCheckListItem)compResult.getObj()).getGracePeriodUnit());
            if(freUnit==null) freUnit="";
            if(graceUnit==null) graceUnit="";
    	   %>

            <tr class="<%=rowClass%>">
              <td class='<bean:write name="compResult" property="key" />' ><%=row%></td>
              <td><bean:write name="compResult" property="obj.item.itemDesc" />&nbsp;</td>
              <td><integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/></td>
        <%  if (!OB.getIsOneOffInd() && OB.getFrequency()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
	      <%  }
	          else {
	      %>
	            <td style="text-align:center">-</td>
	      <%  } %>
              <td style="text-align:center"><integro:date object="<%=OB.getInitialDocEndDate()%>"/>&nbsp;</td>
        <%  if (OB.getGracePeriod()!=Integer.MIN_VALUE) {%>
              <td><%= OB.getGracePeriod()%>&nbsp;<%=graceUnit%>&nbsp;</td>
        <%  }
	          else {
        %>
              <td style="text-align:center">-</td>
        <%  } %>
              <td style="text-align:center"><integro:date object="<%=OB.getInitialDueDate()%>"/>&nbsp;</td>
              <td style="text-align:center"><integro:date object="<%=OB.getLastDocEntryDate()%>"/>&nbsp;</td>
              <td style="text-align:center"><integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;</td>
              <td style="text-align:center"><a href="#" onclick="goViewRecurrent('<%=OB.getCheckListItemRef()%>')">View</a></td>
            </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="checkLists" >
            <tr class="odd">
              <td colspan="10"><bean:message key="label.error.no.document"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname"><bean:message key="label.checklist.remarks"/></td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="70"></textarea></td>
					</tr>
					<tr>
					  <td class="fieldname"><bean:message key="label.checklist.last.action.by"/></td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname"><bean:message key="label.checklist.last.remarks.made"/></td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td width="70">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageApprove','','img/approve2.gif',1)" onclick="approve()" ><img src="img/approve1.gif" name="ImageApprove"  border="0" id="ImageApprove" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageReject','','img/reject2.gif',1)" onclick="reject()" ><img src="img/reject1.gif" name="ImageReject"  border="0" id="ImageReject" /></a></td>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel" border="0" id="ImageCancel" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

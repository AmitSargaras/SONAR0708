<%@ page import="com.integrosys.cms.ui.checklist.ccreceipt.*,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/ccreceipt/view_item.jsp,v 1.18 2006/10/27 08:16:49 hmbao Exp $
*
* Purpose: Update CC Receipt
* Description: Type - Checklist
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.18 $
* Date: $Date: 2006/10/27 08:16:49 $
* Tag: $Name:  $
*/
%>
<%
    CCReceiptForm aForm = (CCReceiptForm)request.getAttribute("CCReceiptForm");

    ICheckListItem itemOb = (ICheckListItem)request.getAttribute("itemOb");
	int bb = 0;
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
<script>

function saveForm() {
	document.forms["CCReceiptForm"].event.value="view_ok";
	document.forms["CCReceiptForm"].submit();
}

function returnPage(num) {
    document.forms[0].event.value = "view_return";
    document.forms[0].submit();
}

</script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>
<!-- InstanceEndEditable --></head>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CCReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />

<input type="hidden" name="flag" value="<%=request.getParameter("flag")%>" />
<input type="hidden" name="previous" value="<%=request.getParameter("previous")%>"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <!--<tr>
      <td><h3>Update Constitutional/Contractual Doc Receipt </h3></td>
    </tr>-->
    <tr>
      <td>
      <h3><bean:message key="title.ccdoc.doc.receipt.viewdetail"/></h3>
    </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
          <%
	         String aa = "odd" ;
          %>
            <tr class=<%=aa%> >
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.code"/></td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docCode" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          %>
            </tr>
            <tr class=<%=aa%> >
                <td class="fieldname"><bean:message key="label.document.docnumber"/></td>
                <td>&nbsp;<bean:write name="CCReceiptForm" property="docNo"/></td>
                <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          	%>
            </tr>
            <tr class=<%=aa%> >
              <td class="fieldname"><bean:message key="label.document.description"/></td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docDesc" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          %>
            </tr>
<!--
            <tr class="even">
              <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docRef" /></td>
            </tr> 
-->
            <tr class=<%=aa%> >
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.formNo"/></td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="formNo" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          %>
            </tr>
            <tr class=<%=aa%> >
              <td class="fieldname"><bean:message key="label.document.docdate"/></td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docDate" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          %>
            </tr>
            <tr class=<%=aa%> >
              <td class="fieldname"><bean:message key="label.document.docexpirydate"/></td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docExpDate" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          %>
            </tr>
<!--
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="identifyDate" /></td>
            </tr>
-->
			<%
              /*
              boolean received = false;
              if (itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_RECEIVED)  ||
            		  itemOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_RECEIVED)) {
            	  received = true;
              } */
            %>
            <%// if(received){ %>
             <!-- <tr class=<%//=aa%> >
	              <td class="fieldname">Date Received</td>
	              <td>&nbsp;<bean:write name="CCReceiptForm" property="receivedDate" /></td>
	          <%// bb++;
	            // if(bb%2!=0){aa = "even"; } else{aa = "odd";}
	          %>
              </tr>-->
            <%//}%>
			<%  /*
                boolean waived = false;
              if (itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_WAIVED)  ||
            		  itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER) ||
            		  itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_WAIVER_REQ) ||
            		  itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER_REQ)) {
            	  waived = true;
              } */
            %>
            <%//if(waived){ %>
            <!--  <tr class=<%//=aa%> >
	              <td class="fieldname">Date Waived</td>
	              <td>&nbsp;<bean:write name="CCReceiptForm" property="waivedDate" /></td>
	              <% //bb++;
	             //if(bb%2!=0){aa = "even"; }else{aa = "odd";}
	          %>
              </tr> -->
            <%//} %>
            <%  /*
            	boolean complete = false ;
	            if (itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_COMPLETED)  ||
	            		itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_COMPLETED_REQ) ||
	            		itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_COMPLETE) ||
	            		itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_COMPLETED_REQ)) {
	            	complete = true;
	            }*/
            %>
            <%//if(complete){ %>
	           <!-- <tr class=<%=aa%> >
	              <td class="fieldname">Date Completed</td>
	              <td>&nbsp;<bean:write name="CCReceiptForm" property="completedDate" /></td>
	              <% //bb++;
	             //if(bb%2!=0){aa = "even"; }else{aa = "odd";}
	          %>
              </tr>-->
			<% //}%>
            
            <% /*
            	boolean lodged = false ;
	            if (itemOb.getItemStatus().equals(ICMSConstant.STATE_LODGED)||
	            	itemOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_LODGE)) {
	            	lodged = true;
	            }*/
            %>
            <%//if(lodged){ %>
	           <!-- <tr class=<%=aa%> >
	              <td class="fieldname">Date lodged</td>
	              <td>&nbsp;<bean:write name="CCReceiptForm" property="lodgedDate" /></td>
	              <% // bb++;
	             //if(bb%2!=0){aa = "even"; }else{aa = "odd";}
	          %>
              </tr>-->
			<% //}%>
            
            <%	/*
            	boolean tempUplift = false ;
	            if (itemOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT)||
	            		itemOb.getItemStatus().equals(ICMSConstant.STATE_TEMP_UPLIFTED)	
	            		) {
	            	tempUplift = true;
	            }*/
            %>
            <%//if(tempUplift){ %>
		     <!--<tr class=<%//=aa%> >
		              <td class="fieldname">Date Temp Uplifted</td>
		              <td>&nbsp;<bean:write name="CCReceiptForm" property="tempUpliftedDate" /></td>
		     <% //bb++;
	            //if(bb%2!=0){aa = "even"; }else{aa = "odd";}
	          %>
	             </tr>-->
	          <!--<tr class=<%//=aa%> >
              <td class="fieldname">Expected Date Of Return</td>
              <td>&nbsp;
                <bean:write name="CCReceiptForm" property="expectedReturnDate" />
              </td>
             <% //bb++;
	            // if(bb%2!=0){aa = "even"; } else{aa = "odd";}
	          %>
            </tr>-->
			<%// }%>
			
			<%	/*
            	boolean permUplift = false ;
	            if (itemOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT)||
	            		itemOb.getItemStatus().equals(ICMSConstant.STATE_PERM_UPLIFTED)	
	            		) {
	            	permUplift = true;
	            }*/
            %>
            <%//if(permUplift){ %>
	          <!--<tr class=<%//=aa%> >
	              <td class="fieldname">Date Temp Uplifted</td>
	              <td>&nbsp;<bean:write name="CCReceiptForm" property="permUpliftedDate" /></td>
	              <% //bb++;
	             //if(bb%2!=0){aa = "even"; }else{aa = "odd";}
	          %>
              </tr>-->
			<%// }%>
            
            <%/*
              boolean isdeferred = false;
              if (itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_DEFERRED)  ||
                      itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFERRAL) ||
                      itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_DEFER_REQ) ||
                      itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFER_REQ)) {
                  isdeferred = true; */
            %><!--
            <tr class=<%//=aa%> >
              <td class="fieldname">Date Deferred</td>
              <td>&nbsp;
                <bean:write name="CCReceiptForm" property="deferDate" />
              </td>
              <% //bb++;
	             //if(bb%2!=0){aa = "even"; }else{aa = "odd";}
	          %>
            </tr>-->
            <!-- <tr class=<%//=aa%> >
              <td class="fieldname">Expected Date Of Return</td>
              <td>&nbsp;
                <bean:write name="CCReceiptForm" property="expectedReturnDate" />
              </td>
             <% //bb++;
	            //if(bb%2!=0){aa = "even"; } else{aa = "odd";}
	          %>
            </tr>-->
                <%// } %>

            <tr class=<%=aa%> >
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.actionparty"/></td>
              <td>&nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=aForm.getActionParty()%>" display="true" descWithCode="false"/></td>
             <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          %>
            </tr>
<%-- start here for cr-17 
            <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >
                 <html:radio property="shared" disabled="true" value="true" />Yes
                 <html:radio property="shared" disabled="true" value="false"  />No
              </td>
              </tr>
--%>
            </tbody>
        </table>
<%--
        <jsp:include page="/checklist/ccreceipt/ViewShareCheckList.jsp" />
--%>
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
            <tbody>
            <tr class=<%=aa%> >
              <td class="fieldname"><bean:message key="label.remarks"/></td>
              <td>
                <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80" />&nbsp;
              </td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          %>
            </tr>
            </tbody>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="middle">
              <a href="#" onClick="returnPage()" ><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
            </td>           
          </tr>
        </table>
        <%-- End here for cr-17 --%>
    </tr>
  </tbody>
</table>
</html:form>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.securityenvelope.SecEnvelopeForm,
                 com.integrosys.cms.app.securityenvelope.bus.OBSecEnvelope,
                 com.integrosys.cms.app.securityenvelope.bus.ISecEnvelopeItem,
                 com.integrosys.cms.app.securityenvelope.trx.ISecEnvelopeTrxValue,
                 com.integrosys.base.techinfra.diff.CompareResult"
%>

<%
/**
 * Title: CLIMS 
 * Description: For Checker to view Property Index parameter
 * Copyright: Integro Technologies Sdn Bhd 
 * Author: Erene Wong
 * Date: Feb 3, 2010
 */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ISecEnvelopeTrxValue trxVal = (ISecEnvelopeTrxValue)session.getAttribute("com.integrosys.cms.ui.securityenvelope.SecEnvelopeAction.ISecEnvelopeTrxValue");
	OBSecEnvelope iProp = (OBSecEnvelope) trxVal.getStagingSecEnvelope();
	pageContext.setAttribute("obj", iProp);
    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    OBSecEnvelope stageOb = (OBSecEnvelope)trxVal.getStagingSecEnvelope();
    OBSecEnvelope ob = (OBSecEnvelope)trxVal.getSecEnvelope();
    
    DefaultLogger.debug("trace code - ob is ", ob);
    
    String approveEvent=null;
    String rejectEvent=null;
    
    String event = request.getParameter("event");
    if(event.equals("checker_process_create") || event.equals("checker_confirm_approve_create") || event.equals("checker_confirm_reject_create")){
        approveEvent="checker_confirm_approve_create";
        rejectEvent="checker_confirm_reject_create";

    } else if(event.equals("checker_process_edit") || event.equals("checker_confirm_approve_edit") || event.equals("checker_confirm_reject_edit")){
        approveEvent="checker_confirm_approve_edit";
        rejectEvent="checker_confirm_reject_edit";
        
    }
    
    SecEnvelopeForm secEnvelopeByLocForm = (SecEnvelopeForm)request.getAttribute("SecEnvelopeForm");
%>

<html>
<head>

    <style>
        .fixedSelectLength {
            width: 276px;
            COLOR: #000000;
        }

        .btnHighlight {
            border: 1px solid Purple;
            background-color: #FAF0E6;
            text-align: center;
            width: 85px;
        }
    </style>

    <script language="JavaScript" type="text/JavaScript">

        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p,i,x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() { //v3.0
            var i,j = 0,x,a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }

        function approve() {
            document.forms[0].event.value = '<%=approveEvent%>';
    document.forms[0].submit();
}

function reject(){
    document.forms[0].event.value='<%=rejectEvent%>';
    document.forms[0].submit();
}

</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="MaintainSecurityEnvelope.do">
<input type="hidden" name="event" value=""/> 
  
<bean:define id="formObj" name="SecEnvelopeForm" scope="request" type="com.integrosys.cms.ui.securityenvelope.SecEnvelopeForm"/>
  
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.process"/>&nbsp;<bean:message key="title.security.envelope.custodian"/>    
      </h3></td>
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>

   	  <tr>
   	 	<td>
              &nbsp;&nbsp;
         </td>
         <td>
              &nbsp;&nbsp;
         </td>
             
   	 </tr>
	   <tr>
		 <td colspan="2">
	      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
	        <thead>
		        <tr>
		            <td width="4%"><bean:message key="label.global.sn"/></td>
                    <td width="21%"><bean:message key="label.security.envelope.address"/></td>
                    <td width="21%"><bean:message key="label.security.envelope.cabinet"/></td>
                    <td width="21%"><bean:message key="label.security.envelope.drawer"/></td>
                    <td width="21%"><bean:message key="label.security.envelope.barcode"/></td>
		        </tr>
	        </thead>
	        <tbody>
	               <% if(secEnvelopeByLocForm.getSecEnvelopeItemList() != null){%>
			        <logic:present name="SecEnvelopeForm" property="secEnvelopeItemList" scope="request">
	                <bean:define id="itemSize" value="<%= String.valueOf(formObj.getSecEnvelopeItemList().size()) %>"/>
	                   <logic:notEqual name="itemSize" value="0">
	                      <logic:iterate id="item" indexId="itemInd" name="SecEnvelopeForm"
							property="secEnvelopeItemList" scope="request" type="java.lang.Object">
	                    <%     String headerClass = "index";
			                   ISecEnvelopeItem itemList = null;
			                   if (item instanceof CompareResult) {
			                    itemList = (ISecEnvelopeItem) ((CompareResult) item).getObj();
			                    headerClass = ((CompareResult) item).getKey();
			                   } else {
			                    itemList = (ISecEnvelopeItem) item;
			                   }			                   
			            %>
                        <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                        <td class="<%=headerClass%>">
	                        <%= itemInd.intValue() + 1 %>
	                        </td>
						    <td>
                            <integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode="<%=itemList.getSecEnvelopeItemAddr()%>" display="true" descWithCode="false"/>
                            </td>
	                        <td>
                            <integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode="<%=itemList.getSecEnvelopeItemCab()%>" display="true" descWithCode="false"/>
	                        </td>
                            <td>
                            <integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode="<%=itemList.getSecEnvelopeItemDrw()%>" display="true" descWithCode="false"/>
	                        </td>
						    <td>
	                        &nbsp;<integro:empty-if-null value="<%=itemList.getSecEnvelopeItemBarcode()%>"/>
	                        </td>
	                    </tr>
	                        </logic:iterate>
	                    </logic:notEqual>
	                   <logic:equal name="itemSize" value="0">
	                    <tr class="odd">
                            <td colspan="5"><bean:message key="label.security.envelope.norecord"/></td>
	                    </tr>
	                   </logic:equal>
	              </logic:present>
	              <%}else{%>
	              <logic:notPresent name="SecEnvelopeForm" property="secEnvelopeItemList" scope="request">
	                            <tr class="odd">
	                                <td colspan="5"><bean:message key="label.security.envelope.norecord"/></td>   
	                            </tr>
	              </logic:notPresent>	
	              <%}%>
	      </tbody>
	    </table>
	    </td>
     </tr>
  </tbody>
</table>
	  
<p/>
<p/>
<p/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
    <tr>
      <td class="fieldname"><bean:message key="label.remarks"/></td>
      <td class="odd"><html:textarea property="remarks" rows="4" cols="80"/><br><html:errors property="remarks"/></td>
    </tr>
    <tr>
      <td class="fieldname"><bean:message key="label.last.action.by"/></td>
      <td class="even">&nbsp;<%=lastActionBy%></td>
    </tr>
    <tr class="odd">
      <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
      <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
    </tr>
  </tbody>
</table>
  
<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
	  <tr>
	    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	  </tr>
	  <tr>
	    <td valign="baseline" align="center">&nbsp;</td>
	  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>

<!-- InstanceEnd --></html>

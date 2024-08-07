<%
/**
 * Title: CLIMS 
 * Description: For Maker to update existing Security Envelope
 * Copyright: Integro Technologies Sdn Bhd 
 * Author: Erene Wong
 * Date: Feb 11, 2010
 */
%>

<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                com.integrosys.cms.ui.securityenvelope.SecEnvelopeForm,
				com.integrosys.cms.app.limit.bus.ILimitProfile,
                com.integrosys.base.uiinfra.common.ICommonEventConstant,
                com.integrosys.cms.ui.common.constant.IGlobalConstant"
%>
<%@ page import="com.integrosys.cms.app.securityenvelope.trx.ISecEnvelopeTrxValue" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ISecEnvelopeTrxValue secEnvelopeTrxValue = (ISecEnvelopeTrxValue)request.getAttribute("ISecEnvelopeTrxValue");
    String event = request.getParameter("event");
    ILimitProfile limitprofile =(ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    SecEnvelopeForm secEnvelopeByLocForm = (SecEnvelopeForm)request.getAttribute("SecEnvelopeForm");
    secEnvelopeByLocForm.setSecLspLmtProfileId(String.valueOf(limitprofile.getLimitProfileID()));
    String fromEvent = (String)request.getAttribute("fromEvent");
%>


<html><body onLoad="MM_preloadImages('img/submit2.gif')" >


<head>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}

.fixedSelectLength {
    width: 276px;
}

.btnHighlight {
	border : 1px solid Purple;
	background-color : #FAF0E6;
	text-align : center;
    width : 85px;
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
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

function addOption(original,selection)
{
    var i=0,j=0,or_length=original.length,index=0;
    var newitem=true;
    var newItemCount = 0;

    for (i=0;i<or_length;i++)
    {
        if (original.options[i].selected)
        {
            for (j=0;j<selection.length;j++)
            {
                if (original.options[i].value==selection.options[j].value)
                {
                    newitem=false;
                    break;
                }
            }

            if (newitem)
            {
                var op = new Option(original.options[i].text, original.options[i].value);
                if(selection.length == 1 && selection.options[0].value == "")
                {
                    selection.options[0] = op;
                }
                else
                    selection.options[selection.length] = op;

                newItemCount ++ ;
            }
        }
    }
	delOption(original);
}

function delOption(selection)
{
    var length=selection.length, i=0, index=0;
    for(i=(length-1);i>=0;i--)
    {
        if (selection.options[i].selected)
        {
            selection.options[i].selected=false;
            selection.options[i]=null;
        }
    }
}

<%
if(fromEvent.equals("edit") || fromEvent.equals("edit_itemdetail")){
%>
    function submitPage () {
      document.forms[0].event.value = "maker_confirm_edit";
      document.forms[0].fromEvent.value = "edit";
	  document.forms[0].submit();
    }

    function goToPage() {
        document.forms[0].event.value = "edit_items";
        document.forms[0].fromEvent.value = "edit";
        document.forms[0].submit();
    }

    function edit_itemdetail(secEnvelopeItemId) {
        document.forms[0].event.value = "edit_itemdetail";
        document.forms[0].fromEvent.value="edit_itemdetail";
        document.forms[0].secEnvelopeItemId.value=secEnvelopeItemId;
        document.forms[0].submit();
    }

    function deleteItem(){
        document.forms[0].event.value = "delete_edit_items";
        document.forms[0].fromEvent.value = "edit";
        document.forms[0].submit();
    }
<%
} else if (fromEvent.equals("add") || fromEvent.equals("create_itemdetail")){
%>
  function submitPage () {
      document.forms[0].event.value = "maker_confirm_create";
      document.forms[0].fromEvent.value = "add";
	  document.forms[0].submit();
    }
                                                                                
    function goToPage() {
        document.forms[0].event.value = "create_items";
        document.forms[0].fromEvent.value = "add";
        document.forms[0].submit();
    }

    function create_itemdetail(indId) {
        document.forms[0].event.value = "create_itemdetail";
        document.forms[0].fromEvent.value="create_itemdetail";
        document.forms[0].indId.value=indId;
        document.forms[0].submit();
    }

    function deleteItem(){
        document.forms[0].event.value = "delete_items";
        document.forms[0].fromEvent.value = "add";
        document.forms[0].submit();
    }
<%
}
%>
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<html:form action="MaintainSecurityEnvelope.do">
<input type="hidden" name="event"/>
<input type="hidden" name="fromEvent"/>
<input type="hidden" name="secEnvelopeItemId"/>
<input type="hidden" name="indId"/>    
<input type="hidden" name="secLspLmtProfileId" value="<%=String.valueOf(limitprofile.getLimitProfileID())%>"/>

<bean:define id="formObj" name="SecEnvelopeForm" scope="request" type="com.integrosys.cms.ui.securityenvelope.SecEnvelopeForm"/>

<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>

<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
       <td colspan="2">
        <html:errors property="envDocItemExist"/>
       </td>
   	</tr>
    <tr>
      <td> <h3><bean:message key="title.security.envelope.custodian"/></h3></td>
        <td valign="bottom"  align="right" >
               <input type="button" value="Add Row" class="btnNormal" onclick="goToPage()"/>
				&nbsp;&nbsp;
		       <input class="btnNormal" type="button" name="btnDelXRef" value="Delete" onclick="javascript:deleteItem()"/>
        </td> 
    </tr>
    <tr>
      <td colspan="2"><hr/></td>                      
    </tr>
  </thead>

   <tr>
      <td colspan="2"></td>
   </tr>

   	 
   	 <tr>
		<td align="center" colspan="2">

		<html:errors property="itemEmptyError"/>
		<br>
		
		<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">

      
      <tr>
         <td colspan="2">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
               <thead>
                     <% if((secEnvelopeByLocForm.getSecEnvelopeItemList() != null) && formObj.getSecEnvelopeItemList().size() > 0){ %>
                    <tr>
                        <td width="4%"><bean:message key="label.global.sn"/></td>
                        <td width="21%"><bean:message key="label.security.envelope.address"/></td>
                        <td width="21%"><bean:message key="label.security.envelope.cabinet"/></td>
                        <td width="21%"><bean:message key="label.security.envelope.drawer"/></td>
                        <td width="21%"><bean:message key="label.security.envelope.barcode"/></td>
                        <td width="12%"><bean:message key="label.global.action"/></td>
                        <td width="12%"><bean:message key="label.select"/></td>
                    </tr>
                    <%}
                       else{
                    %>
                    <tr>
                        <td width="4%"><bean:message key="label.global.sn"/></td>
                        <td width="21%"><bean:message key="label.security.envelope.address"/></td>
                        <td width="21%"><bean:message key="label.security.envelope.cabinet"/></td>
                        <td width="21%"><bean:message key="label.security.envelope.drawer"/></td>
                        <td width="21%"><bean:message key="label.security.envelope.barcode"/></td>
                    </tr>
                    <% }%>
                </thead>
                    
				    <tbody>		
				        <% if(secEnvelopeByLocForm.getSecEnvelopeItemList() != null){%>
				<logic:present name="SecEnvelopeForm" property="deletedItemList" scope="request">
	               <bean:define id="itemSize" value="<%= String.valueOf(formObj.getSecEnvelopeItemList().size()) %>"/>
	                   <logic:notEqual name="itemSize" value="0">
	                      <logic:iterate id="item" indexId="itemInd" name="SecEnvelopeForm"
									property="secEnvelopeItemList" scope="request" type="com.integrosys.cms.app.securityenvelope.bus.ISecEnvelopeItem">
   
	                    <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                    <td class="index">
	                        <%= itemInd.intValue() + 1 %>
                        </td>
	                    <td>
                            <integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode="<%=item.getSecEnvelopeItemAddr()%>" display="true" descWithCode="false"/>
                        </td>
	                    <td>
                            <integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode="<%=item.getSecEnvelopeItemCab()%>" display="true" descWithCode="false"/>
	                    </td>
                        <td>
                            <integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode="<%=item.getSecEnvelopeItemDrw()%>" display="true" descWithCode="false"/>
	                    </td>
						<td>
	                        &nbsp;<integro:empty-if-null value="<%=item.getSecEnvelopeItemBarcode()%>"/>
	                    </td>
                        <td align="center">
                        <%if (fromEvent.equals("add") || (fromEvent.equals("create_itemdetail"))){%>
	                        <a href="#" onClick="create_itemdetail('<%=itemInd.intValue()%>')"><bean:message key="label.edit"/></a>
	                    <%} else{ %>
                            <a href="#" onClick="edit_itemdetail('<%=String.valueOf(item.getSecEnvelopeItemId())%>')"><bean:message key="label.edit"/></a>
                        <%}%>
                        </td>
	                                       <td style="text-align:center">
	                                            <html:multibox property="deletedItemList" value="<%= itemInd.toString() %>"/>
	                                            &nbsp;
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
       
       </table>
       
       </td>
       </tr>  
    
       <tr>
         <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)" onClick="submitPage()" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>&nbsp;&nbsp;
        <a href="MaintainSecurityEnvelope.do?event=sec_envelope_list&customerID=<%=limitprofile.getCustomerID()%>&lspLmtProfileId=<%=limitprofile.getLimitProfileID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">&nbsp;</td>
      </tr>
</table> 
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

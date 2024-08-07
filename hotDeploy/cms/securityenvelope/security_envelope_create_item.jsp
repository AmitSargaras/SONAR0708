<%@ page import="com.integrosys.cms.ui.securityenvelope.SecEnvelopeItemForm"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$                                                    
*
* Describe this JSP.
* Purpose: For Maker to create new Security Envelope
* Description: create the new set of Security Envelope
*
* @author $Author$
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String event = request.getParameter("event");
    String formActionName = "MaintainSecurityEnvelope.do";

    SecEnvelopeItemForm secEnvelopeItemForm = (SecEnvelopeItemForm)request.getAttribute("SecEnvelopeItemForm");
    String secEnvelopeItemId = (String)request.getAttribute("secEnvelopeItemId");
    String indId = (String)request.getAttribute("indId");
    String fromEvent = secEnvelopeItemForm.getFromEvent();
%>


<html>
<head>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

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

function addOption(original,selection,searchItem)
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

function Login(oSelect)
{
var oDiv = document.getElementById('form2b'), data = oSelect.options[oSelect.selectedIndex].value;

if (data == "" || data == "1")
oDiv.style.display = 'none';
else
oDiv.style.display = 'block';

}
	
function performSubmit()
{
		if(document.forms[0].fromEvent.value == 'add'){
		    document.forms[0].event.value = "confirm_create_items";	   
	    }
        else if(document.forms[0].fromEvent.value == 'create_itemdetail'){
			document.forms[0].event.value = "create_itemdetail";
		}
	    else if(document.forms[0].fromEvent.value == 'edit'){
			document.forms[0].event.value = "edit_items";
		}
        else if(document.forms[0].fromEvent.value == 'edit_itemdetail'){
			document.forms[0].event.value = "edit_itemdetail";
		}
	    else if(document.forms[0].fromEvent.value == 'resubmit_edit'){
		    document.forms[0].event.value = "resubmit_edit_items";
		}
        else if(document.forms[0].fromEvent.value='resubmit_edit_itemdetail'){
            document.forms[0].event.value = "resubmit_edit_itemdetail";                    
        }
		    document.forms[0].submit();
}

function cancelSubmit()
{
   		if(document.forms[0].fromEvent.value == 'add'){
		    document.forms[0].event.value = "cancel_create_items";	   
	    }
        else if(document.forms[0].fromEvent.value == 'create_itemdetail'){
			document.forms[0].event.value = "cancel_create_itemdetail";
		}
	    else if(document.forms[0].fromEvent.value == 'edit'){
			document.forms[0].event.value = "cancel_edit_items";
		}
        else if(document.forms[0].fromEvent.value == 'edit_itemdetail'){
			document.forms[0].event.value = "cancel_edit_itemdetail";
		}
	    else if(document.forms[0].fromEvent.value == 'resubmit_edit'){
		    document.forms[0].event.value = "cancel_resubmit_edit_items";
		}
        else if(document.forms[0].fromEvent.value='resubmit_edit_itemdetail'){
            document.forms[0].event.value = "cancel_resubmit_edit_itemdetail";                    
        }
		document.forms[0].submit();
}
	 
function killEnter(evt)
{
    if(evt.keyCode == 13 || evt.which == 13)
	{
	    return false;
	}
	    return true;
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="MaintainSecurityEnvelopeItem.do">
    
<input type="hidden" name="event" value="create"/>
<html:hidden property="fromEvent"/>  
<html:hidden property="secEnvelopeItemId" value="<%=secEnvelopeItemId%>"/>
<html:hidden property="indId" value="<%=indId%>"/>    
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>

    <table width="80%" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><h3>
              <%
               if (fromEvent.equals("add") || fromEvent.equals("edit") || fromEvent.equals("resubmit_edit")){
              %>
                <bean:message key="label.add.new"/>
              <%
              }else{
              %>
                <bean:message key="label.edit"/>
              <%}%>
              <bean:message key="title.security.envelope.custodian"/>
          </h3></td>
        </tr>
        <tr>
            <td><hr></td>
        </tr>
        <tr>
            <td>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                <thead>
                <tr>
                        <td width="4%"><bean:message key="label.global.sn"/></td>
                        <td width="21%"><bean:message key="title.security.envelope.custodian"/></td>
                        <td width="21%"><bean:message key="label.global.action"/></td>
                </tr>
                </thead>

                <tbody>

                <tr class="odd">
                    <td width="4%" class="index">1</td>
                    <td width="36%"><bean:message key="label.security.envelope.address"/>&nbsp;<font color="#0000FF">*</font></td>
                    <td width="60%" colspan="3">
                        <html:select name="SecEnvelopeItemForm" property="secEnvelopeItemAddr"  >
                        <option value=""><bean:message key="label.please.select"/></option>
                        <html:options name="secEnvelopeItemAddrValue" labelName="secEnvelopeItemAddrLabel"/>
                        </html:select>
                        <html:errors property="addressError" />
                    </td>
                </tr>

                <tr class="even">
                    <td class="index">2</td>
                    <td><bean:message key="label.security.envelope.cabinet"/></td>
                    <td colspan="3">
                        <html:select name="SecEnvelopeItemForm" property="secEnvelopeItemCab"  >
                        <option value=""><bean:message key="label.please.select"/></option>
                        <html:options name="secEnvelopeItemCabValue" labelName="secEnvelopeItemCabLabel"/>
                        </html:select>
                    </td>
                </tr>

                <tr class="odd">
                    <td class="index">3</td>
                    <td><bean:message key="label.security.envelope.drawer"/></td>
                    <td colspan="3">
                        <html:select name="SecEnvelopeItemForm" property="secEnvelopeItemDrw"  >
                        <option value=""><bean:message key="label.please.select"/></option>
                        <html:options name="secEnvelopeItemDrwValue" labelName="secEnvelopeItemDrwLabel" />
                        </html:select>
                    </td>
                </tr>

                <tr class="even">
                    <td class="index">4</td>
                    <td><bean:message key="label.security.envelope.barcode"/>&nbsp;<font color="#0000FF">*</font></td>
                    <td colspan="3">
                        <%
                        if (fromEvent.equals("add") || fromEvent.equals("edit") || fromEvent.equals("resubmit_edit")){
                        %>
                            <html:text property="secEnvelopeItemBarcode" maxlength="100"/>
                        <%
                        }else{
                        %>
                            <bean:write name="SecEnvelopeItemForm"  property="secEnvelopeItemBarcode"/>
                            <html:hidden property="secEnvelopeItemBarcode"/>
                        <%
                        }
                        %>
                        <html:errors property="barCodeError" />
                    </td>
                </tr>
            
            </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>



    <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td><a href="javascript:performSubmit()"><img src="img/ok1.gif" border="0" /></a></td>
            <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
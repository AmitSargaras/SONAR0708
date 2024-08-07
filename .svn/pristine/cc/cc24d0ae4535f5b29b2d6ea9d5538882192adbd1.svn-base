<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.ui.secglobal.SecurityGlobalForm,
                 java.util.Collection,java.util.Iterator,java.util.List,java.util.ArrayList,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.cms.ui.common.CommonCodeList,"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/chk_global_doc_view.jsp,v 1.14 2006/10/27 08:13:10 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.14 $
 * @since $Date: 2006/10/27 08:13:10 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    OBDocumentItemTrxValue trxVal = (OBDocumentItemTrxValue) session.getAttribute("com.integrosys.cms.ui.secglobal.SecurityGlobalAction.docTrxObj");
    SecurityGlobalForm secGlobalForm = (SecurityGlobalForm)request.getAttribute("SecurityGlobalForm");
	
    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";


    OBDocumentItem stageOb = (com.integrosys.cms.app.chktemplate.bus.OBDocumentItem) trxVal.getStagingDocumentItem();
    OBDocumentItem ob = (OBDocumentItem) trxVal.getDocumentItem();
    SecurityGlobalForm aForm = (SecurityGlobalForm) request.getAttribute("SecurityGlobalForm");
    boolean isDocCodePresent = false;
    if (aForm != null) {
        String docCode = aForm.getItemCode();
        if (docCode != null && docCode.length() > 0) {
            isDocCodePresent = true;
        }
    }
    
	Boolean docCodeNonUnique = (Boolean) request.getAttribute("docCodeNonUnique");
	if (docCodeNonUnique == null) {
		docCodeNonUnique = Boolean.FALSE;
	}
	
	//CommonCodeList commonCode = CommonCodeList.getInstance("APPLICATION_TYPE");
	
  //  List appCodeID   = (List) commonCode.getCommonCodeValues();
   // List appCodeValue   = (List) commonCode.getCommonCodeLabels();
    
   // Collection appListing = (Collection)request.getAttribute("appCodeValue");
    
   // List savedAppCodeValue = new ArrayList();
    //Iterator iter = appListing.iterator();
   // while(iter.hasNext())
  //  {
  //  	com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem docAppItem = (com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem) iter.next();
   // 	savedAppCodeValue.add(docAppItem.getAppType());
  //  }
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->


<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
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

function loadPage() {
	window.opener.refreshContent();
	window.close();
}

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="approve_doc";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="reject_doc";
    document.forms[0].submit();
}
function cancelPage(){
	
    document.forms[0].action="ToDo.do?event=prepare";
    
    document.forms[0].submit();
}
function submitForm(event) {
		document.forms[0].action="SecurityGlobal.do?event=maker_save_update";
	    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="SecurityGlobal.do">
	<input type="hidden" name="event" />
	<html:hidden property="docVersion"  value="0"/>
<html:hidden property="isPreApprove" value="N" />
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global  Document Template - View</h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
          <% if(isDocCodePresent) { %>
            <tr class="even">
              <td class="fieldname">Document Code&nbsp;<font color="#0000FF">* </font></td>
              <td>
                <bean:write name="SecurityGlobalForm" scope="request" property="itemCode" />
                <html:hidden name="SecurityGlobalForm" property="itemCode"/>
                <br /><html:errors property="itemCode" />
              </td>
            </tr>
                <% } %>
            <tr class="odd">
              <td class="fieldname">Document Description&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="itemDesc" size="50" maxlength="500" /><html:errors property="itemDesc" /></td>
            </tr>
<!--             <tr class="even">-->
<!--				<td class="fieldname">Document Version&nbsp;<font color="#0000FF">* </font></td>-->
<!--				<td><html:text property="docVersion" size="50" maxlength="7" />-->
<!--				<html:errors property="docVersion" /></td>-->
<!--			</tr>-->
            <tr class="odd">
              <td class="fieldname">Expiry Date</td>
              <td><html:text property="expDate" size="12" maxlength="12" />
                <img src="img/calendara.gif"  name="Image32" border="0" id="Image32" onclick="return showCalendar('expDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />
                <html:errors property="expDate" />
              </td>
            </tr>
<!--            <tr class="even">-->
<!--				<td class="fieldname">Pre-Approval Document</td>-->
<!--				<td><html:radio name="SecurityGlobalForm" property="isPreApprove" value="Y" />Yes -->
<!--				<html:radio name="SecurityGlobalForm" property="isPreApprove" value="N" />No</td>-->
<!--			</tr>-->
			
		
			
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<p/>
<p/>
<p/>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="80"></textarea></td>
					</tr>
					<tr>
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
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
  
                   <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_update_save_process')"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                   
   
<!--			<td colspan="2"><a href="javascript:saveForm();"-->
<!--				onmouseout="MM_swapImgRestore()"-->
<!--				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img-->
<!--				src="img/save1.gif" name="ImageSave" width="70" height="20"-->
<!--				border="0" id="ImageSave" /></a>-->
<!--				&nbsp;&nbsp;-->
<!--				-->
<!--				</td>-->
			<td colspan="2">
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;&nbsp;
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

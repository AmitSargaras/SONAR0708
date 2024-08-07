<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.checklist.bus.*,      
                 com.integrosys.cms.ui.checklist.document.DocumentCheckListAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,   
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.*,
                 java.net.URLEncoder,
                 com.integrosys.cms.ui.checklist.DocumentHeldListHelper"%>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.IDocumentHeld" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.IDocumentHeldItem" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    ICMSCustomer cust = (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

    long checkListID = ICMSConstant.LONG_INVALID_VALUE;
    String checkListIDStr = "";

    String event = request.getParameter("event");

    HashMap docsHeldMap = (HashMap) request.getAttribute("docsHeldMap");
    List docList = (List) docsHeldMap.get(ICMSConstant.CHECKLIST_PLEDGER);
    com.integrosys.cms.app.chktemplate.bus.IDocumentHeld docHeld = (docList == null || docList.size() == 0) ? null : (IDocumentHeld) docList.get(0);
    if (docHeld != null) {
        checkListID = docHeld.getCheckListID();
        checkListIDStr = String.valueOf(checkListID);
    }

    ArrayList secPledgedList = (ArrayList) docHeld.getPledgorSecurityPledged();
    if (secPledgedList != null) {
        System.out.println("> pledgor_doc_list.jsp: No. of securities pledged=" + secPledgedList.size());
    }

    Calendar calendar = Calendar.getInstance();
    Date currentDate = calendar.getTime();
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

function MM_openBrWindow(theURL,winName,features) { //v2.0  
  window.open(theURL,winName,features);
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body style="width:100%;overflow:auto;">
<html:form action="DocumentCheckList" >

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tr > 
    <td colspan="2"> 
      <h3>List of Documents Held (printed on <%=DateUtil.formatDate("d MMM yyyy",currentDate)%>)</h3>
    </td>
  </tr>
  <tr> 
    <td colspan="2"> 
      <hr />
    </td>
  </tr>
  </table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tr class="odd"> 
    <td width="24%" class="fieldname">Customer Name</td>
    <td><%=cust.getCustomerName()%></td>
  </tr>
  <tr class="even">
    <td class="fieldname"><bean:message key="label.customer.id"/></td>
    <td><%=cust.getCMSLegalEntity().getLEReference()%></td>
  </tr>
  <tr class="odd"> 
    <td class="fieldname"><bean:message key="label.customer.subprofile.id"/></td>
    <td><%=cust.getCustomerReference()%></td>
  </tr>
</table>
&nbsp;
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tr class="odd"> 
    <td width="24%" class="fieldname">Pledgor Name</td>
    <td><integro:empty-if-null value="<%=docHeld.getLegalName()%>"/>&nbsp;</td>
  </tr>
  <tr class="even"> 
    <td class="fieldname"><bean:message key="label.customer.id"/></td>
    <td><%=docHeld.getLegalID() != ICMSConstant.LONG_INVALID_VALUE?String.valueOf(docHeld.getLegalID()):"-"%>&nbsp;</td>
  </tr>
  <tr class="odd"> 
    <td class="fieldname">Pledgor ID</td>
    <td><%=docHeld.getPledgorID() != ICMSConstant.LONG_INVALID_VALUE?String.valueOf(docHeld.getPledgorID()):"-"%>&nbsp;</td>
  </tr>
</table>
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
  <tr> 
    <td> 
      <h3> Securities Pledged</h3>
    </td>
  </tr>
  <tr> 
    <td> 
      <hr />
    </td>
  </tr>
  <tr> 
    <td valign="top" > 
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead> 
        <tr> 
          <td width="12%">Security ID</td>
          <td width="88%">Security Type / Sub-Type</td>
        </tr>
        </thead>
        <tbody> 
<%	if (secPledgedList!=null && secPledgedList.size()>0)
	{
		String bgColor = "even";
		String securityID = null;
		String type = null;
		String subType = null;

		for(int i=0; i<secPledgedList.size(); i++)
		{
			bgColor = bgColor.equals("odd") ? "even" : "odd";
			String[] data = (String[])secPledgedList.get(i);
			securityID = (data[0]==null || data[0].equals("")) ? "-" : data[0];
			type = (data[1]==null || data[1].equals("")) ? "-" : data[1];
			subType = (data[2]==null || data[2].equals("")) ? "-" : data[2];
%>	        	<tr class="odd"> 
	          	   <td valign="top" width="12%" ><%=securityID%></td>
	          	   <td valign="top" width="88%" ><%=type%> / <%=subType%></td>
	        	</tr>
<%		}
	}
	else
	{
%>		<tr class="odd">
		  <td colspan="10">No securities found.</td>
		</tr>
<%	}
%>
        </tbody> 
      </table>
    </td>
  </tr>
  <thead> </thead> <tbody> </tbody> 
</table>
<br>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead> 
  <tr> 
    <td> 
      <h3> Constitutional / Contractual Documents - Pledgor</h3>
    </td>
  </tr>
  <tr> 
    <td>
      <hr />
    </td>
  </tr>
  </thead> <tbody> 
  <tr> 
    <td valign="top" > 
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead> 
        <tr> 
          <td width="3%">S/N</td>
          <td width="6%">Master Doc Code <br>(Doc No)</td>
          <td width="4%">Doc Code <br>(Doc No)</td>
          <td width="27%">Doc Description</td>
          <td width="3%">In-Vault</td>
          <td width="4%">Ext Cust</td>
          <td width="7%">Doc <br>Status</td>
          <td width="8%">Cust <br>Status</td>
          <td width="13%">Doc Date</td>
          <td width="13%">Doc Expiry</td>
        </tr>
        </thead> <tbody> 

<% IDocumentHeldItem[] docHeldItems = null;
    if (docHeld != null)
        docHeldItems = docHeld.getDocHeldItems();

    if (docHeldItems != null && docHeldItems.length > 0) {
        // sort the list before displaying
        docHeldItems = DocumentHeldListHelper.sortByParentPrefix(docHeldItems);

        String bgColor = "even";
        for (int i = 0; i < docHeldItems.length; i++) {
            bgColor = bgColor.equals("odd") ? "even" : "odd";
            Date docDate = docHeldItems[i].getDocDate();
            Date docExpiry = docHeldItems[i].getDocExpiry();
%>
			<tr class="<%=bgColor%>">
				<td valitn="top" width="3%" class="index" rowspan="4"><%=i + 1%></td>
				<td valign="top" width="6%" ><integro:empty-if-null value="<%=docHeldItems[i].getParentDocItemDocCode()%>"/><br>
				<%=(docHeldItems[i].getParentDocItemRefID() == 0 || docHeldItems[i].getParentDocItemRefID() == ICMSConstant.LONG_INVALID_VALUE)?"":"("+String.valueOf(docHeldItems[i].getParentDocItemRefID())+")"%></td>
				<td valign="top" width="4%" ><integro:empty-if-null value="<%=docHeldItems[i].getDocCode()%>"/><br>(<%=docHeldItems[i].getDocNo()%>)</td>
				<td valign="top" width="27%" ><integro:empty-if-null value="<%=docHeldItems[i].getDocDesc()%>"/>&nbsp;</td>
				<td valign="top" width="3%" >
				<% if (docHeldItems[i].isInVault() != null) { %>
					<integro:boolean-display value="<%=docHeldItems[i].isInVault().booleanValue()%>" style="yn" />
				<% } else { %>No<% } %>				
				</td>
				<td valign="top" width="4%" >
				<% if (docHeldItems[i].isExtCust() != null) { %>
					<integro:boolean-display value="<%=docHeldItems[i].isExtCust().booleanValue()%>" style="yn" />
				<% } else { %>No<% } %>								
				</td>
				<td valign="top" width="7%" ><integro:empty-if-null value="<%=docHeldItems[i].getDocStatus()%>"/>&nbsp;</td>
				<td valign="top" width="8%" ><integro:empty-if-null value="<%=docHeldItems[i].getCustStatus()%>"/>&nbsp;</td>
				<td valign="top" width="13%" ><integro:date object="<%=docHeldItems[i].getDocDate()%>"/>&nbsp;</td>
				<td valign="top" width="13%" ><integro:date object="<%=docHeldItems[i].getDocExpiry()%>"/>&nbsp;</td>
			</tr>
		    <tr class="<%=bgColor%>">    
		    <td colspan="2" class="fieldname">Narration</td>
		    <td colspan="7"><integro:htmltext lineLength="70" value="<%=docHeldItems[i].getNarration()%>"/>&nbsp;</td>
		    </tr>
            <tr class="<%=bgColor%>">
            <td colspan="1" class="fieldname">Shared Indicator</td>
            <td colspan="1" class="fieldname">Shared with <bean:message key="label.customer.id"/> / LE Name / Checklist ID</td>
            <td colspan="7">
                <%  String shareDetailsSummary = docHeldItems[i].getShareDetailsSummary();
                  shareDetailsSummary = (shareDetailsSummary == null) ? null : shareDetailsSummary.replace(',', '\n');
                %>
              <integro:htmltext value="<%=shareDetailsSummary%>"/>
            </td>
            </tr>
            <tr class="<%=bgColor%>">
            <td colspan="1" class="fieldname"><integro:boolean-display value="<%=docHeldItems[i].isShared()%>" style="yn"/></td>
            <td colspan="1" class="fieldname">&nbsp;</td>
            <td colspan="7">&nbsp;</td>
            </tr>
<%        	} //end of for loop
	}
	else
	{
%>		<tr class="odd">
		  <td colspan="10">No document(s) found.</td>
		</tr>
<%	}
%>        
        </tbody> 
      </table>
    </td>
  </tr>
  </tbody> 
</table>
<p> 
  <!-- InstanceBeginEditable name="Content" -->
</p>

<%
	if (DocumentCheckListAction.EVENT_LIST_PLEDGOR.equals(event)) {
%>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top" >&nbsp;</td>
  </tr>
  <tr> 
	<td valign="top" ><a href="DocumentCheckList.do?event=list"   onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
    <td valign="top" ><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/print2.gif',1)" onclick="MM_openBrWindow('DocumentCheckList.do?event=print_pledgor_list&checklist_id=<%=checkListIDStr%>','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=450,left=5,top=5')" ><img src="img/print1.gif" name="Image2" border="0" id="Image2" /></a></td>
  </tr>
  <tr> 
    <td valign="top" >&nbsp;</td>
  </tr>
</table>
<% } else {
//CMSSP-781 : To add the footer note in the List of Documents held report (for all categories of documents)
 %>
	<tr>
	<td colspan="14"><center>The report includes only the lodged documents and excludes "Pending", "Perm Uplifted" and  "Deleted", "Received" documents. </center> <br></td>
	</tr>
<center><b>END OF DOCUMENT</b></center>
<% } %>
</html:form>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>

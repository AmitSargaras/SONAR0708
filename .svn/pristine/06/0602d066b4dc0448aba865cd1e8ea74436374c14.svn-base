<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.collateral.CommonNatureOfCharge,
                 com.integrosys.cms.ui.collateral.property.*,
                 com.integrosys.cms.app.checklist.bus.*,      
                 com.integrosys.cms.app.collateral.bus.*,        
                 com.integrosys.cms.app.collateral.bus.type.property.*, 
                 com.integrosys.cms.app.common.constant.ICMSConstant,   
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.ui.checklist.audit.AuditUtil,
                 java.util.HashMap"%>
    
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

    HashMap map = (HashMap)request.getAttribute("newAuditList");
    //ICheckListAudit[] ccAuditList = (ICheckListAudit[])map.get(ICMSConstant.DOC_TYPE_CC);
    ICheckListAudit[] ccAuditList = (ICheckListAudit[])map.get(ICMSConstant.CHECKLIST_MAIN_BORROWER);
    ICheckListAudit[] colAuditList = (ICheckListAudit[])map.get(ICMSConstant.DOC_TYPE_SECURITY);
    String asOfDate=(String)session.getAttribute("com.integrosys.cms.ui.checklist.audit.AuditCheckListAction.asOfDate");
    String asOfDateParam=asOfDate;
    if(asOfDate != null ) asOfDate = asOfDate.replace('/', ' ');
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

<html:form action="AuditCheckList" >
<!-- InstanceBeginEditable name="Content" --> 
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td> 
      <h3>Audit Confirmation List (as of <%= asOfDate %> ) </h3>        
      </td>
    </tr>
    <tr> 
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td> 
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tr class="odd"> 
	      <td width="24%" class="fieldname">Customer Type</td>
	      <td>Main Borrower</td>
          </tr>
          <tr class="even"> 
            <td width="24%" class="fieldname">Customer Name</td>
            <td><%= cust.getCustomerName()%></td>
          </tr>
          <tr class="odd"> 
            <td class="fieldname">LE ID</td>
            <td><%= cust.getCMSLegalEntity().getLEReference()%></td>
          </tr>
      </table>
      &nbsp;
      
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead> 
  <tr> 
    <td> 
      <h3> Constitutional / Contractual Documents</h3>
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
          <td width="60%">Document Description</td>
          <td width="19%">Document Date</td>
        </tr>
        </thead> <tbody> 

<%  if ((ccAuditList != null) && (ccAuditList.length > 0))
    {
%>        
<%      for (int ii=0; ii<ccAuditList.length; ii++)
        {
            IAuditItem[] itemList = ccAuditList[ii].getAuditItemList();
            if (itemList != null)
            {
                for (int jj=0; jj<itemList.length; jj++)
                {
        
%>  <tr class="odd">                
      <td valign="top" width="60%" >
             <%= itemList[jj].getDescription()%>
          </td>           
          <td valign="top" width="19%" >
           <% if(itemList[jj].getDocumentDate()!=null){ %>
            	<%=DateUtil.formatDate("dd/MMM/yyyy",itemList[jj].getDocumentDate())%>
           <%}else{%>
           	 - 
           <%}%>
          </td>
          </tr>
<%              }
            }
%>      
<%      }
    }
    else
    {
%>          <tr class="odd">
              <td colspan="2">There is no document</td>
            </tr>
<%  }
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

<%  if (!cust.getNonBorrowerInd())
    { 
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10">
  <thead>
    <tr> 
      <td> 
      <h3> Security Documents</h3>
    </td>
    </tr>
    <tr> 
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td valign="top" > 
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead> 
        <tr> 
          <td width="3%">S/N</td>
          <td width="8%">Security ID</td>
          <td width="11%">Security Type</td>
          <td width="13%">Particulars of Security</td>
          <td width="17%">Particulars of Charge</td>
          <td width="20%">Pledgor(s)</td>
          <td width="35%">Document Description</td>
          <td width="13%">Document Date</td>
        </tr>
        </thead> 
  <tbody> 
  <%    
    String rowClass="";
    row = 0;
    
                        
                        
    if ((colAuditList != null) && (colAuditList.length > 0))
    {
        for (int ii=0; ii<colAuditList.length; ii++)
        {
            row++;
            if(row%2!=0){
               rowClass="odd";
            }else{
               rowClass="even";
            }
            //Get Pledor Info
            ICollateralPledgor[] pledgor = colAuditList[ii].getCollateral().getPledgors();
            
            //Get Collateral and Charge Info
            String colDesc = "-";String chargeInfo = "-";
            HashMap pSecurityInfo = AuditUtil.getSecurityInfo(colAuditList[ii]);
            if(pSecurityInfo != null){
            	if(pSecurityInfo.get("COLDESC") !=  null) 
            		colDesc = (String) pSecurityInfo.get("COLDESC");
            	if(pSecurityInfo.get("CHARGE") !=  null) 
            		chargeInfo   = (String)pSecurityInfo.get("CHARGE");
            }
            IAuditItem[] itemList = colAuditList[ii].getAuditItemList();
            // get the number of item to decide the row span
            int noRowSpan = (itemList != null)?itemList.length:0; 
            
            // if item list is not null and length > 0, loop thru it to display the info.
            if (itemList != null && itemList.length > 0) {
                for (int jj=0; jj<itemList.length; jj++)
                { %>
    <tr class="<%= rowClass%>">                 
<%	                if (jj == 0) { // only display the security information for one time
%>

        <td  class="index" valign="top" width="3%" rowspan="<%=noRowSpan%>"><%= row%></td>
        <td valign="top" width="8%" rowspan="<%=noRowSpan%>"><%= colAuditList[ii].getCollateralRef()%></td>
        <td valign="top" width="11%" rowspan="<%=noRowSpan%>"><%= colAuditList[ii].getCollateralType().getTypeName()%> / <%= colAuditList[ii].getCollateralSubType().getSubTypeName()%></td>
        <td valign="top" width="13%" rowspan="<%=noRowSpan%>"><%= colDesc %>
<!-- collateral description -->
        </td>
        <td valign="top" width="17%" rowspan="<%=noRowSpan%>"><%= chargeInfo %>
<!-- chargeb info -->        
        </td>          
<!-- Pledgors -->
<td valign="top" width="20%" rowspan="<%=noRowSpan%>">
<%
if (pledgor != null) {
     if (pledgor.length == 0) { %> -
     <%}else {
		for (int pp = 0; pp < pledgor.length; pp++) { %>
			<%=pledgor[pp].getPledgorName()%><br /><br />
     <% }}} %>
     </td>
<!-- Pledgors -->
<%
	} // end of display of security information
	
	// starting of display multiple document description and date
%>           
<td valign="top" width="35%" > 
                  <%= itemList[jj].getDescription()%>             
          </td>
          <td valign="top" style="text-align:center" width="13%" > 
          
           <% if(itemList[jj].getDocumentDate()!=null){ %>
            	<%=DateUtil.formatDate("dd/MMM/yyyy",itemList[jj].getDocumentDate())%>
           <%}else{%>
           	 - 
           <%}%>
          </td>
<%              } %>
</tr>
<%
            } else {
	            // item list is null, so only display the security information.
%>
    <tr class="<%= rowClass%>"> 
        <td  class="index" valign="top" width="3%" rowspan="<%=noRowSpan%>"><%= row%></td>
        <td valign="top" width="8%" rowspan="<%=noRowSpan%>"><%= colAuditList[ii].getCollateralRef()%></td>
        <td valign="top" width="11%" rowspan="<%=noRowSpan%>"><%= colAuditList[ii].getCollateralType().getTypeName()%> / <%= colAuditList[ii].getCollateralSubType().getSubTypeName()%></td>
        <td valign="top" width="13%" rowspan="<%=noRowSpan%>"><%= colDesc %>
<!-- collateral description -->
        </td>
        <td valign="top" width="17%" rowspan="<%=noRowSpan%>"><%= chargeInfo %>
<!-- chargeb info -->        
        </td>
          
            <p>
            
<!-- Pledgors -->
<td valign="top" width="20%" rowspan="<%=noRowSpan%>">
<%

if (pledgor != null) {
     if (pledgor.length == 0) { %> -
     <%}else {
		for (int pp = 0; pp < pledgor.length; pp++) { %>
			<%=pledgor[pp].getPledgorName()%><br /><br />
     <% }}} %>
     </td>
<!-- Pledgors -->
<td valign="top" colspan="2">&nbsp;</td>
<% }       }
    }
    else
    {
%>          <tr class="odd">
              <td colspan="8">There is no document</td>
            </tr>
<%  } %>
        </tbody> 
      </table>
    </td>
    </tr>
  </tbody>
</table>      
<%  }%>
  
  
  <p> 
  <!-- InstanceBeginEditable name="Content" -->
</p>
  
    </td>
    </tr>
  </tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
  <td> 
  	<a href="AuditCheckList.do?event=print_doc&asOfDate=<%= asOfDateParam %>"   onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
  </td>
    <td>   
        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/print2.gif',1)" onclick="MM_openBrWindow('AuditCheckList.do?event=print_main_borrower_list','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=450,left=5,top=5')" ><img src="img/print1.gif" name="Image2" border="0" id="Image2" /></a>        
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>

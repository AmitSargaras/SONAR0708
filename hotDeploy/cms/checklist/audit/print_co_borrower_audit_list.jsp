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
                 java.net.URLEncoder,
                 java.util.*"%>
    
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

    long checkListID = ICMSConstant.LONG_INVALID_VALUE;
    String checkListIDStr = (String)request.getAttribute("checklist_id");
    if(checkListIDStr != null)
    	checkListID = Long.parseLong(checkListIDStr);
    //System.out.println("$$$$$$$$$$$$$$checkListID" + checkListID);    	
    String coBorrowerLegalID = (String)request.getAttribute("co_borrower_legal_id");
    String coBorrowerName = (String)request.getAttribute("co_borrower_name");
    String encodedCoBorrowerName = URLEncoder.encode(coBorrowerName);

   HashMap map = (HashMap)request.getAttribute("coBorrowerAuditMap");
   ICheckListAudit[] ccAuditList = (ICheckListAudit[])map.get(ICMSConstant.CHECKLIST_CO_BORROWER);

   String asOfDate=(String)session.getAttribute("com.integrosys.cms.ui.checklist.audit.AuditCheckListAction.asOfDate");
   String asOfDateParam=asOfDate;
   if(asOfDate != null ) asOfDate = asOfDate.replace('/', ' ');
    
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
<body style="width:100%;overflow:auto;" >
<html:form action="AuditCheckList" >
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tr > 
    <td colspan="2"> 
      <h3>Audit Confirmation List (as of <%= asOfDate %> ) </h3> 
    </td>
  </tr>
  <tr> 
    <td colspan="2"> 
      <hr />
    </td>
  </tr>
  </table>

&nbsp;
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tr class="odd"> 
      <td width="24%" class="fieldname">Customer Type</td>
      <td>Co-Borrower</td>
  </tr>
  <tr class="even"> 
    <td width="24%" class="fieldname">Customer Name</td>
    <td><%=(coBorrowerName==null || coBorrowerName.equals("")) ? "-" : coBorrowerName%></td>
  </tr>
  <tr class="odd"> 
    <td class="fieldname">LE ID</td>
    <td><%=(coBorrowerLegalID==null || coBorrowerLegalID.equals("0")) ? "-" : coBorrowerLegalID%></td>
  </tr>
</table>
<br>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

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
         {boolean ccExists = false;
     %>        
     <%      for (int ii=0; ii<ccAuditList.length; ii++)
             {   
                 IAuditItem[] itemList = ccAuditList[ii].getAuditItemList();
                 //System.out.println("$$$$$$$$$$$$$$ccAuditList[ii].getCheckListID()" + ccAuditList[ii].getCheckListID());
		 if(ccAuditList[ii].getCheckListID() == checkListID){                 
                 ccExists = true;
                 if (itemList != null)
                 {
                     for (int jj=0; jj<itemList.length; jj++)
                     {                    	
             
     %>  	<tr class="odd">                
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
                }
     %>      
     <%      }
     		if(!ccExists){%>
     		<tr class="odd">
		                   <td colspan="2">There is no document</td>
                 </tr>
     		<%}
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


<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top" >&nbsp;</td>
  </tr>
  <tr> 
   
  </tr>
  <tr> 
    <td valign="top" >&nbsp;</td>
  </tr>
</table>

</html:form>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>

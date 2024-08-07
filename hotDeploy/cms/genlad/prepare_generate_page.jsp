<%@ page import="com.integrosys.cms.app.ddn.trx.IDDNTrxValue,
                 com.integrosys.cms.app.ddn.bus.*,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.ddn.bus.IDDNCustomerDetail,
                 com.integrosys.cms.ui.genddn.GenerateDDNForm,
                 com.integrosys.cms.app.ddn.bus.DDNCollateralInfo,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,                 
				 com.integrosys.cms.app.common.util.*,
                 java.util.*"%>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.IDocumentHeld" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.ICheckListProxyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory" %>
<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckList" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateral" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.OBDocumentHeld" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	List checkListFacility= new ArrayList();
	List checkListSecurity= new ArrayList();
	ICheckList[] checkLists = (ICheckList[] ) session.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.checkLists");
	if(checkLists!=null){
    for(int a=0;a<checkLists.length;a++){
    ICheckList checkList=checkLists[a];
    if(checkList!=null){
    if(checkList.getCheckListType().equals("F")){
    	
    	checkListFacility.add(checkList);
    }
    if(checkList.getCheckListType().equals("S")){
    	
    	checkListSecurity.add(checkList);
    }
    }
    }
    /*if(checkList.getCheckListType().equals("F")){
    	List checkListFacility= new ArrayList();
    	checkListFacility.add(checkList);
    }*/
	 
    }

    int row = 0;

  
    
    boolean toTrack = false;
    boolean viewOnly = false;
    String event = request.getParameter("event");
    String isTrack = request.getParameter("isTrack");
    String isView = request.getParameter("isView");
    
    if (isTrack != null && isTrack != "" && isTrack != "null") {
	    toTrack = Boolean.valueOf(isTrack).booleanValue();
    } else if("to_track".equals(event)){
        toTrack = true;
    }
    
    if (isView != null && isView != "" && isView != "null") {
	    viewOnly =Boolean.valueOf(isView).booleanValue();
    } else if ("view_generate_ddn".equals(event) || "view_remarks".equals(event)) {
	    viewOnly = true;
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

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
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

function submitPage() {
	
	document.forms[0].action="GenerateLAD.do?event=generate_lad";
    document.forms[0].submit();
}
function cancelPage(){
	
    document.forms[0].action="GenerateLAD.do?event=display&operation=LADDUE";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/calendarb.gif','img/cancel2.gif')">
<html:form action="GenerateLAD" >
<input type="hidden" name="event" />
<%--<input type="hidden" name="outerLimitID"/>--%>
<%--<input type="hidden" name="limitID"/>--%>
<%--<input type="hidden" name="outerLimitProfileID"/>--%>
<input type="hidden" name="actionName" value="GenerateLAD"/>
<input type="hidden" name="isTrack" value="<%=toTrack%>"/>
<input type="hidden" name="isView" value="<%=viewOnly%>"/>
<!-- InstanceBeginEditable name="Content" -->
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Generate LAD</h3></td>
    </tr>
   <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h5>&nbsp;</h5></td>
    </tr>
  </thead>
  <tbody>
   <tr >
    									
						</tr>
  </tbody>
</table>
	
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td><h3>Facility Documents</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<%--FACILITY--%>
<%
    boolean hasFacilityCheckList = false;
    for (int x = 0; x < checkListFacility.size(); x++) {//Main Borrower, Co-Borrower....
             hasFacilityCheckList = true;

    		ICheckList docHeld = (ICheckList) checkListFacility.get(x);
            //checking on the document...any of this document belong to this checklistID?
           
          
            %>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
                                <tr class="even">
                                    <td class="fieldname" width="20%">Checklist ID</td>
                                    <td width="30%"><%=docHeld.getCheckListID()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Status</td>
                                    <td width="30%">
                                        <%        
                                        String checkListStatus = (PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus()) == null) ?
                                                docHeld.getCheckListStatus() : PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus());
                                        %>
                                        <integro:empty-if-null value="<%=checkListStatus%>"/>&nbsp;
                                    </td>
                                    
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Type</td>
                                    <td width="30%">
                                        Facility&nbsp;
                                    </td>
                                    
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td>
                        <table width="90%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                            <thead>
                                <tr>
                                    <td><h3>Documents Requested For</h3></td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr/>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%--Inject the deferred item here--%>
                                <%
                                //boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
                                //if (hasDeferredItem) {
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
<!--                                                        <td width="12%">Doc Number</td>-->
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
<!--                                                        <td width="5%">Date Defer</td>-->
														<td width="5%">Document Expiry</td>
<!--                                                        <td width="5%">Expected Date of Return</td>-->
<!--                                                        <td width="5%">Doc Status</td>-->
<!--                                                        <td width="15%">Action Party</td>-->
<!--														<td width="8%">Credit Approver</td>-->
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ICheckListItem[] curLadList = (ICheckListItem[]) docHeld.getCheckListItemList();
                                                    int _row = 0;
                                                    for (int z = 0; z < curLadList.length; z++) {
                                                        ICheckListItem item = (ICheckListItem) curLadList[z];
                                                        if(item.getExpiryDate()!=null){
															if(!(item.getItemStatus().equals("WAIVED"))){
                                                       String rowClass = "";
                                                        _row++;
                                                        if (_row % 2 != 0) {
                                                            rowClass = "odd";
                                                        } else {
                                                            rowClass = "even";
                                                        }
                                                             
                                                        %>
                                                        <tr class="<%=rowClass%>">
                                                            <td class="index"><%=_row%></td>
<!--                                                            <td><%=item.getCheckListItemRef()%>&nbsp;<input type="hidden" name="docNumber" value="<%=item.getCheckListItemRef()%>"/></td>-->
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
<!--                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>-->
                                                            <td><integro:date object="<%=item.getExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getExpiryDate()%>"/></td>
<!--                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>-->
<!--                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>-->
<!--                                                            <td><integro:empty-if-null value="<%=item.getActionParty()%>"/>&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>-->
                                                        </tr>
                                                        <%
															} 
                                                        }
															
                                                    }
                                                    %>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <%
                                //} else {
                                    %>
                                    <%--
                                    <tr class="odd">
                                        <td>There is no deferred document.</td>
                                    </tr>
                                    --%>
                                    <%
                                //}
                                %>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
            </table>
            <%
            
        
    }

    if (!hasFacilityCheckList) {
        %>
        <table width="90%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no Facility checklist.</td>
            </tr>
        </table>
        <%
    }
%>            
            <%--Security--%>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td><h3>Security Checklist</h3></td>
                </tr>
                <tr>
                    <td>
                        <hr/>
                    </td>
                </tr>
            </table>
           <%--FACILITY--%>
<%
    boolean hasSecurityCheckList = false;
System.out.println("###########checkListSecurity.size()###########"+checkListSecurity.size());
    for (int xSec = 0; xSec < checkListSecurity.size(); xSec++) {//Main Borrower, Co-Borrower....
             hasSecurityCheckList = true;

    		ICheckList docHeldSec = (ICheckList) checkListSecurity.get(xSec);
           // System.out.println("Total Document facility : " + docHeldSec.getCheckListID());
            //checking on the document...any of this document belong to this checklistID?
           
          
            %>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
                                <tr class="even">
                                    <td class="fieldname" width="20%">Checklist ID</td>
                                    <td width="30%"><%=docHeldSec.getCheckListID()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Status</td>
                                    <td width="30%">
                                        <%        
                                        String checkListStatusSec = (PropertyManager.getValue("chklist.status." + docHeldSec.getCheckListStatus()) == null) ?
                                        		docHeldSec.getCheckListStatus() : PropertyManager.getValue("chklist.status." + docHeldSec.getCheckListStatus());
                                        %>
                                        <integro:empty-if-null value="<%=checkListStatusSec%>"/>&nbsp;
                                    </td>
                                    
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Type</td>
                                    <td width="30%">
                                        Security&nbsp;
                                    </td>
                                    
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td>
                        <table width="90%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                            <thead>
                                <tr>
                                    <td><h3>Documents Requested For</h3></td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr/>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%--Inject the deferred item here--%>
                                <%
                                //boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
                                //if (hasDeferredItem) {
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
<!--                                                        <td width="12%">Doc Number</td>-->
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Document Expiry</td>
<!--                                                        <td width="5%">Date Defer</td>-->
<!--                                                        <td width="5%">Expected Date of Return</td>-->
<!--                                                        <td width="5%">Doc Status</td>-->
<!--                                                        <td width="15%">Action Party</td>-->
<!--														<td width="8%">Credit Approver</td>-->
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ICheckListItem[] curList = (ICheckListItem[]) docHeldSec.getCheckListItemList();
                                                    int _rowSec = 0;
                                                    for (int zSec = 0; zSec < curList.length; zSec++) {
                                                        ICheckListItem itemSec = (ICheckListItem) curList[zSec];
                                                        if(itemSec.getExpiryDate()!=null){
                                                        if(!(itemSec.getItemStatus().equals("WAIVED"))){
                                                       String rowClassSec = "";
                                                        _rowSec++;
                                                        if (_rowSec % 2 != 0) {
                                                            rowClassSec = "odd";
                                                        } else {
                                                            rowClassSec = "even";
                                                        }
                                                             
                                                        %>
                                                        <tr class="<%=rowClassSec%>">
                                                            <td class="index"><%=_rowSec%></td>
<!--                                                            <td><%=itemSec.getCheckListItemRef()%>&nbsp;<input type="hidden" name="docNumber" value="<%=itemSec.getCheckListItemRef()%>"/></td>-->
                                                            <td><%=itemSec.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=itemSec.getItemCode()%>"/></td>
                                                            <td><%=itemSec.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=itemSec.getItemDesc()%>"/></td>
                                                           <td><integro:date object="<%=itemSec.getExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=itemSec.getExpiryDate()%>"/></td>
<!--                                                            <td><integro:date object="<%=itemSec.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=itemSec.getDeferExpiryDate()%>"/></td>-->
<!--                                                            <td><integro:date object="<%=itemSec.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=itemSec.getExpectedReturnDate()%>"/></td>-->
<!--                                                            <td><%=itemSec.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=itemSec.getItemStatus()%>"/></td>-->
<!--                                                            <td><integro:empty-if-null value="<%=itemSec.getActionParty()%>"/>&nbsp;<input type="hidden" name="actionParty" value="<%=itemSec.getActionParty()%>"/></td>-->
                                                        </tr>
                                                        <%
                                                        }
                                                    }
                                                        
                                                    }
                                                    %>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <%
                                //} else {
                                    %>
                                    <%--
                                    <tr class="odd">
                                        <td>There is no deferred document.</td>
                                    </tr>
                                    --%>
                                    <%
                                //}
                                %>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
            </table>
            <%
            
        
    }

    if (!hasSecurityCheckList) {
        %>
        <table width="90%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no Security checklist.</td>
            </tr>
        </table>
        <%
    }
%>     
                      
     
  

<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80">&nbsp;</td>
  </tr>
  <tr>
   
   
    <td><a href="#" onmouseout="MM_swapImgRestore()" onclick="submitPage();" onmouseover="MM_swapImage('Image4411','','img/generate1.gif',1)"><img src="img/generate1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
   
<!--    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>-->
   
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

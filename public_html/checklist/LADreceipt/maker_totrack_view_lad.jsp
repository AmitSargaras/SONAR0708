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
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID) 
||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
|| ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
|| ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID);
String custTypeTrxID = (String) request.getAttribute("custTypeTrxID");
	String operation=request.getParameter("operation");
System.out.println("operation"+operation);
	List checkListFacility= new ArrayList();
	List checkListSecurity= new ArrayList();
	TreeMap ladItems1= new TreeMap();
	ArrayList ladItems= new ArrayList();
	ILAD ilad = (ILAD)request.getAttribute("lad");
	 List listLADSubItem  = (List)request.getAttribute("listLADSubItem");
	String checklistId=(String)request.getAttribute("checklistId");
//	long checklistId= Long.parseLong(achecklistId);
	/*if(ilad !=null){
	ILADItem[] items=ilad.getIladItem();
    for(int a=0;a<items.length;a++){
    	ILADItem item=items[a];
    if(item.getCategory().equals("F")){
    	
    	checkListFacility.add(item);
    }
    if(item.getCategory().equals("S")){
    	
    	checkListSecurity.add(item);
    }
    }
    if(checkList.getCheckListType().equals("F")){
    	List checkListFacility= new ArrayList();
    	checkListFacility.add(checkList);
    }
	 
    }*/

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

	boolean canView=false;
    if(!isUserCpcMaker){
    	canView=true;
    }
	%>





<%@page import="com.integrosys.cms.app.lad.bus.ILAD"%>
<%@page import="com.integrosys.cms.app.lad.bus.ILADItem"%>
<%@page import="com.integrosys.cms.app.lad.bus.ILADSubItem"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function viewDiffOuterLimitBca(outerLimitID, limitID, outerLimitProfileID) {
	document.forms[0].event.value="view_outer_limit_bca";
	document.forms[0].outerLimitID.value=outerLimitID;
	document.forms[0].limitID.value=limitID;
	document.forms[0].outerLimitProfileID.value=outerLimitProfileID;
	document.forms[0].submit();
}
function submitPage() {
	 var value=document.getElementById("10").value;
	document.forms[0].action="GenerateLAD.do?event=generate_lad&ladName="+value;
    document.forms[0].submit();
}
function cancelPage(){
	
    document.forms[0].action="GenerateLAD.do?event=display&operation=<%=operation%>";
    document.forms[0].submit();
}

function closePage() {
	document.forms[0].action="LADReceipt.do?event=maker_return_to_track";
	document.forms[0].submit();
}
function returnPage() {
	document.forms[0].action="LADReceipt.do?event=checker_return_to_track&&custTypeTrxID=<%=custTypeTrxID%>";
	document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/calendarb.gif','img/cancel2.gif')">
<html:form action="GenerateDDN" >
<input type="hidden" name="event" />
<%--<input type="hidden" name="outerLimitID"/>--%>
<%--<input type="hidden" name="limitID"/>--%>
<%--<input type="hidden" name="outerLimitProfileID"/>--%>
<input type="hidden" name="actionName" value="GenerateDDN"/>
<input type="hidden" name="isTrack" value="<%=toTrack%>"/>
<input type="hidden" name="isView" value="<%=viewOnly%>"/>
<!-- InstanceBeginEditable name="Content" -->
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;<h3>View LAD</h3></td>
    </tr>
   
  </thead>
  <tbody>
   <tr >
    									
						</tr>
  </tbody>
</table>
<table width="90%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
<tr>
             <td class="fieldname" width="20%">
             Lad Name
             </td>           
			<td  valign="bottom" >
			<%=ilad.getLad_name() %>
			</td>
	</tr>									
	</table>	
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td><h3>Lad Documents</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<%--FACILITY--%>
<%
    //boolean hasFacilityCheckList = false;
/*if(ilad !=null){
	ILADItem[] items=ilad.getIladItem();
    for (int x = 0; x < items.length; x++) {//Main Borrower, Co-Borrower....
            //if (!hasFacilityCheckList) hasFacilityCheckList = true;

    		ILADItem docHeld = (ILADItem) items[x];
    		ILADSubItem[] curDeferredList=docHeld.getIladSubItem();
    		 for (int ab = 0; ab < curDeferredList.length; ab++) {
    			 ILADSubItem item = (ILADSubItem) curDeferredList[ab];
    			 ladItems1.put(item.getExpiry_date(),item);
    		 }
    		 ladItems=new ArrayList(ladItems1.values());
    		 
    		 
    		
    }
}*/

    		
    		//checking on the document...any of this document belong to this checklistID?
           
          
            %>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                
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
                                                        <td width="8%">Doc Type</td>
                                                        <td width="8%">Type</td>  
                                                        <td width="20%">Doc Description</td>  
                                                        <td width="5%">Doc Version</td>  
                                                        <td width="15%">Doc Date</td> 
                                                        <td width="14%">Doc Amount</td>  
                                                        <td width="15%">Doc Expiry</td>  
                                                        <td width="10%">View Image</td>                                   
                                                        
														
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    //ILADSubItem[] curDeferredList = (ILADSubItem[]) docHeld.getIladSubItem();
                                                    String docType="";
                                                    int _row = 0;
                                                    if(listLADSubItem!=null){
                                                    
                                                    for (int z = 0; z < listLADSubItem.size(); z++) {
                                                    	ILADSubItem item = (ILADSubItem) listLADSubItem.get(z);

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
                                                             <td width="8%">
															<%
															if(item.getCategory().equals("F")){
																docType="FACILITY_DOC";
															%>
															Facility	
															<%}else if (item.getCategory().equals("S")){ 
															docType="SECURITY_DOC";%>
															Security
															
															<%}else{ %>
															Others
															<%} %>
															&nbsp;</td>
															<%if(null==item.getType()) {%>
															<td width="8%">-&nbsp;</td>
															<%}else{ %>
                                                             <td width="8%"><%=item.getType() %>&nbsp;</td>
                                                             <%} %>
                                                            <td width="20%"><%=item.getDoc_description()%>&nbsp;</td>
                                                            <td width="5%">V-<%=item.getDocChklistVersion()%>&nbsp;</td>
                                                            <td width="15%"><integro:date object="<%=item.getDoc_date()%>"/>&nbsp;</td>
                                                            <td width="14%"><% if(null !=item.getDocChklistAmt() && ! "".equals(item.getDocChklistAmt())){%> <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(item.getDocChklistAmt()))%>" />
              
             												 <% } else { %> &nbsp; - &nbsp; <% } %></td>
                                                            
                                                            <td width="15%"><integro:date object="<%=item.getExpiry_date()%>"/>&nbsp;</td>
                                                            <%if("checker_totrack_view_lad".equals(event)){ %>
                                                            <td width="10%"><a href="LADReceipt.do?event=view_attach_image_reject&id=<%=String.valueOf(item.getChklistDocId())%>&docType=<%=docType %>&docIdLAD=<%=String.valueOf(item.getChklistDocItemId()) %>&checklistId=<%=checklistId %>">View Images &nbsp;</a></td>
                                                            <%}else if("prepare_totrack_view_lad".equals(event)){ %>
                                                            <td width="10%"><a href="LADReceipt.do?event=mkr_view_totrack_img&id=<%=String.valueOf(item.getChklistDocId())%>&docType=<%=docType %>&docIdLAD=<%=String.valueOf(item.getChklistDocItemId()) %>&checklistId=<%=checklistId %>">View Images &nbsp;</a></td>
                                                            <%}else{ %>
                                                            <td width="10%"><a href="LADReceipt.do?event=view_attach_image_process&id=<%=String.valueOf(item.getChklistDocId())%>&docType=<%=docType %>&docIdLAD=<%=String.valueOf(item.getChklistDocItemId()) %>&checklistId=<%=checklistId %>">View Images &nbsp;</a></td>
                                                            <%} %>
                                                        </tr>
                                                        <%
                                                    }
                                }
                                                    %>
                                                    
                                                    <% if(_row==0){%>
            <tr class="odd">
              <td colspan="16">There are no documents linked</td>
            </tr>
<% }%>
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
           
          
                      
     
  

<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80">&nbsp;</td>
  </tr>
  <tr>
   
   
<!--    <td><a href="#" onmouseout="MM_swapImgRestore()" onclick="submitPage();" onmouseover="MM_swapImage('Image4411','','img/generate1.gif',1)"><img src="img/generate1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>-->
   
  <p align="center">
 <%   if (canView) { %>
                <a href="#" onclick="returnPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a>
             <% } else { %>
               <a href="javascript:closePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
	<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
</a>
             <% } %>

</p>
   
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

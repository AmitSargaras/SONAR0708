<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                  com.integrosys.cms.app.checklist.bus.*,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.common.CheckListItemActionList,
                 com.integrosys.cms.ui.common.DeletedCheckListItemActionList,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 java.util.ArrayList,java.util.HashMap,
                 java.util.Date,
                 com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.checkList");
   // System.out.println("::::::::::::::checkList::::::::::::::::::"+checkList);

	Date docDueDate=(Date)request.getAttribute("docDueDate");
//System.out.println("docDueDate"+docDueDate);
     
    String remarks = "";
    String lastActionBy = "";
    if(checkList!=null) {
        pageContext.setAttribute("checkList",checkList);
    }
    int row = 0;
    int itemIndex = 0;
    String status = "";
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";


    String cName = "";
    String entryEvent = request.getParameter("event");//+++
    if (entryEvent== null ) entryEvent ="";

    String secType = "";
    String secSubType = "";
    
	//CR-380 starts
	//No mapper class could be created,So setting property manually
	if(checkList.getLegalFirm() != null && !checkList.getLegalFirm().equals("")){
//		aForm.setLegalFirm(checkList.getLegalFirm() );
	}
	//CR-380 ends

    ICheckListItem[] checkListItems = checkList.getCheckListItemList();
 //System.out.println("abc");
    boolean toTrack = false;
        String previous = request.getParameter("previous");
    if (previous == null || previous.length() == 0) {
	    previous = request.getParameter("event");
    }
    if("to_track".equals(previous)){//OFFICE
        toTrack = true;
    }
	String flag= "";
	flag = (String)request.getAttribute("flag");
    if(flag==null) {
        flag = request.getParameter("flag");
        if (flag == null) {
            flag = "";
        }
    }
%>




<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.app.creditApproval.bus.ICreditApproval"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListForm"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  // getlag();
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

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function submitForm(){

	formObj = document.forms["UpdatePariPassuCheckListForm"];
    formObj.event.value = "submit";
	formObj.submit();
}

function saveForm() {
	formObj = document.forms["UpdatePariPassuCheckListForm"];
    formObj.event.value = "save";
	formObj.submit();
}

function goView(itemRef, checkListID){
    formObj = document.forms["UpdatePariPassuCheckListForm"];
    formObj.event.value="view_receipt";
    formObj.itemRef.value = itemRef;
    formObj.checkListID.value = checkListID;
    formObj.submit();
}

function view(itemRef) {
    formObj = document.forms["UpdatePariPassuCheckListForm"];
    formObj.event.value="view_receipt";
    formObj.itemRef.value = itemRef;
    formObj.submit();
}
function callSubmit(selObj,ind) {
formObj = document.forms["UpdatePariPassuCheckListForm"];
    temp = selObj.options[selObj.selectedIndex].value;
              


    
   
        formObj.event.value = selObj.options[selObj.selectedIndex].value;
		formObj.index.value = ind;
        formObj.actionTypeName.value = selObj.options[selObj.selectedIndex].value;
        if ((formObj.event.value == "CAVEAT_PRINT_REMINDER") ||
            (formObj.event.value == "VAL_PRINT_REMINDER")) {
            var obj = document.getElementById("<%= org.apache.struts.taglib.html.Constants.TOKEN_KEY %>");
            obj.value = "";
        }
		formObj.submit();
 


    }

//-->
</script>



<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="UpdatePariPassuCheckListAction" >

<input type="hidden" name="event" />
<input type="hidden" name="commentIndexID"/>
<%-- for check boxes--%>
<input type="hidden" name="mandatoryRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />
<input type="hidden" name="checkListItemRef" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />
<input type="hidden" name="expressCompletionIndex" />
<input type="hidden" name="actionTypeName" />
<input type="hidden" name="itemRef" />
<html:hidden property="limitProfileID" />
<html:hidden property="checkListID" /> <!-- +++ -->
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName" />
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />
<input type="hidden" name="<%=org.apache.struts.taglib.html.Constants.TOKEN_KEY%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>Update Pari Passu Check List</h3>

      </td>
    </tr>
   
  </thead>
  <tbody>
    
    
    <tr>
      <td>

		 </td>
	  </tr>
	 
    
<html:hidden property="valuerFirmPanelFlag"  name="CAMReceiptForm" value="-"  />
	  <tr>
	  	<td>&nbsp;</td>
	  </tr> 
	  

<html:hidden property="insurerFirmPanelFlag"  name="CAMReceiptForm" value="-" />
	  <tr>
	  	<td>&nbsp;</td>
	  </tr> 

    <%
        //String applicationType = checkList.getApplicationType();
   // DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>> checklist.applicationType=" + applicationType);
        String expressProcessAppTypeList = PropertyManager.getValue("chklist.expressprocessing.applicationtype");
        boolean expressProcess = false;
        //DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>> checklist.applicationType=" + expressProcessAppTypeList);
       // if (expressProcessAppTypeList!=null ) {
          //  expressProcess = true;    

    %>
<!--    <tr>-->
<!--      <td valign="bottom">-->
<!--          <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0">-->
<!--          <tr>-->
<!--            <td>&nbsp; </td>-->
<!--          </tr>-->
<!--          <tr>-->
<!--              <td width="98%" valign="baseline" align="right">-->
<!--                <input type="button" name="Submit" value="Complete" class="btnNormal" onclick="expressComplete()"/>-->
<!--              </td>-->
<!--          </tr>-->
<!--          </table>-->
<!--      </td>-->
<!--    </tr>-->
    <%
      //  }
    %>
    
    <tr>
      <td>&nbsp; </td>
    </tr>
      <td>  <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
            	<td width="2%">S/N</td>
				<td width="10%">Branch Name</td>            	
            	<td width="10%">Bank Name</td>
            	<td width="10%">Doc Status</td>
            	<td width="13%">Due Date</td>
            	<td width="13%">Expiry Date</td>
        		<td width="13%">Received Date</td>
        		<td width="13%">Waiver Date</td>
        		<td width="13%">Deferred Date</td>
                <td width="10%">Action</td>

            </tr>
          </thead>
          <tbody>
		<logic:present name="checkList" property="checkListItemList" >
		   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >

   <%
		itemIndex++;
		pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
   %>
<logic:equal name="toDisplayCheckListItem" value="true">

		<%
            String rowClass = "";
            row++;
            if (row % 2 != 0) {
                rowClass = "odd";
            } else {
                rowClass = "even";
            }
                        ArrayList a1 = null;
            ArrayList a2 = null;
            if (ICMSConstant.STATE_DELETED.equals(checkList.getCheckListStatus())) {
                DeletedCheckListItemActionList delActList = DeletedCheckListItemActionList.getInstance(OB);
                a1 = new ArrayList(delActList.getOperationLabels());
                a2 = new ArrayList(delActList.getOperationValues());
            } else {
                CheckListItemActionList actList = CheckListItemActionList.getInstance(secType, "PARIPASSU", OB);
                a1 = new ArrayList(actList.getOperationLabels());
                a2 = new ArrayList(actList.getOperationValues());
            }
            if (a1 != null)
                pageContext.setAttribute("actionLabels", a1);
            if (a2 != null)
                pageContext.setAttribute("actionValues", a2);
                   %>
			<tr class="<%=rowClass%>">

              <td class="index" ><%=row%></td>
             <td><integro:empty-if-null value="<%=OB.getItem().getItemCode()%>"/></td>
		   <td><%=OB.getItem().getItemDesc()%></td>
		   		   <td><%=OB.getItemStatus() %></td>
		   		    <td><%=DateUtil.formatDate("dd-MM-yyyy",OB.getEffectiveDate()) %></td>
		   		      <td><%=DateUtil.formatDate("dd-MM-yyyy",OB.getExpiryDate()) %></td>
 		<td><integro:date simpleDateFormat="dd-MM-yyyy" object="<%=OB.getReceivedDate() %>"></integro:date></td>
 		<td><integro:date simpleDateFormat="dd-MM-yyyy" object="<%= OB.getWaivedDate() %>"></integro:date></td>
 		<td><integro:date simpleDateFormat="dd-MM-yyyy" object="<%= OB.getDeferExpiryDate()%>"></integro:date></td>
<%-- 
              <td style="text-align:center">
              <%  if (!isShareDocViewable){   %>
              <input type="button" name="Submit" value="Undo" onclick="undo('<%=OB.getCheckListItemRef()%>')" class="btnNormal"/>
              <%} %>&nbsp;
              </td>
--%>  <td>
              <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING)) { --%>
              <%  if ("view".equals(request.getParameter("event"))) {
                    String checkListID = request.getParameter("checkListID");
              %>
                <a href="#" onClick="goView('<%=OB.getCheckListItemRef()%>', '<%=checkListID%>')">View</a>
              <% } else { %>
                <a href="#" onClick="view('<%=OB.getCheckListItemRef()%>')">View</a>
              <%-- } } else { --%>
                &nbsp;
              <% } %>
              </td>
                <% if(expressProcess) {
                        if((ICMSConstant.STATE_AWAITING.equals(OB.getItemStatus())
                        || ICMSConstant.STATE_RECEIVED.equals(OB.getItemStatus())
                        || ICMSConstant.STATE_ITEM_RENEWED.equals(OB.getItemStatus()))) { %>
                <td style="text-align:center">
                        <input type="checkbox" name="expressCheck" value="<%=itemIndex-1%>"/>
                </td>
                    <% } else { %>
                <td>&nbsp;</td>
              <% } }%>
            </tr>
</logic:equal>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">

            </tr>
<% }%>
          </tbody>
        </table></td>
  </tbody>
</table>




<!-- End OFFICE HISTORY -->

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
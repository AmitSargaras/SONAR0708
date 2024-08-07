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
        ArrayList allCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.allCreditApproverList");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.checkList");
    //System.out.println("::::::::::::::checkList::::::::::::::::::"+checkList);

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



%>
<%
String actionStr1 = "com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");	 
	 if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
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

<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
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
      <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >
		    <thead>
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" style="text-align:center">Legal Firm Handling the Case</td>-->
<!--		    </tr>-->
		    </thead> <tbody>
		    </br>
		    </br>
		     <tr class="odd">
                <td class="fieldname">Checklist Id</td>
                <td><%= checkList.getCheckListID()%>
                </td>
                </tr>
<tr class="even">
  
                <td class="fieldname">Checklist Type</td>
                <td><%=checkList.getCheckListType() %></td>
               
            </tr>
           <tr class="odd">
                <td class="fieldname">Checklist Status</td>
                <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) == null) ?
                        checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
                </td>
            </tr>
<html:hidden property="lawFirmPanelFlag"  name="CAMReceiptForm" value="-" />
		    </tbody>
		  </table>
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
        		<td width="13%">Credit Approver</td>
	            <td width="13%">Action</td>
              

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
 		<td> &nbsp;            <% for(int i=0; i<allCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){
            	%>	 
            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
            	<% 
            	 }
            	
            	 }
             }%></td>
		   		    <td>
			              <% String tempScr = "callSubmit(this,'"+(itemIndex-1)+"')"; %>
			                  <html:select property="actionType" onchange='<%=tempScr%>' >
			                                  	<option value="" >Please Select </option>
	<%		
	if(OB.getItemStatus().trim().equalsIgnoreCase("PENDING_RECEIVED")){%>
    <option value="VIEW_AWAITING" >VIEW</option>
<!--				<option value="RECEIVE" >RECEIVE</option>-->
	<option value="UPDATE" >UPDATE</option>
	
<!--				<option value="DEFER" >DEFER</option>-->
	
    
    <%}else{
	for (int i=0; i<a2.size(); i++)
					{
						String optionVal = (String)a2.get(i);
						//System.out.println("OB.getItemStatus() : "+ OB.getItemStatus());
						//System.out.println("optionVal ::::::::::::::::::::::::::: "+ optionVal);
						if (optionVal!=null)
						{
                            if (ICMSConstant.STATE_TEMP_UPLIFTED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal))
                            {%>
                                    <option value="<%=optionVal%>"><%=ICMSConstant.ACTION_RELODGE_CUSTODIAN_DOC %></option>
                            <%}
                            else if (ICMSConstant.STATE_PERM_UPLIFTED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal))
                            {%>
                            <option value="<%=optionVal%>"><%=ICMSConstant.ACTION_RELODGE_CUSTODIAN_DOC %></option>
                    		<%}
                            else if (ICMSConstant.STATE_ITEM_COMPLETED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal) && (OB.getIsInVaultInd() == false))
                            {
                            	//Documents that are not in vault are not allowed to be perform any cross modules
                            }
                            else if (optionVal.equalsIgnoreCase("VIEW_AWAITING") ||optionVal.equalsIgnoreCase("REDEEM"))
                            {
                            	//Documents that are not in vault are not allowed to be perform any cross modules
                            }
							//do not display DELETE option if checklist item is a parent
							else if (!optionVal.equals(ICMSConstant.ACTION_ITEM_DELETE)
								|| (optionVal.equals(ICMSConstant.ACTION_ITEM_DELETE) ))
							{	if(optionVal.trim().equals("COMPLETE")){
								
							}else{
							//System.out.print("::::optionVal::::"+optionVal+":::::::(String)a1.get(i)::::::::"+(String)a1.get(i));
%>								<option value="<%=optionVal%>"><%=(String)a1.get(i)%></option>
<%					}		}
						}
					}
	}

%>
                  </html:select>
              </td>
<%-- 
              <td style="text-align:center">
              <%  if (!isShareDocViewable){   %>
              <input type="button" name="Submit" value="Undo" onclick="undo('<%=OB.getCheckListItemRef()%>')" class="btnNormal"/>
              <%} %>&nbsp;
              </td>
--%>
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

<%if (ICMSConstant.STATE_REJECTED.equals(status)) { %>
    <p/><p/> <p/>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
            <tr>
                <td class="fieldname">Remarks</td>
                <td class="odd"><textarea name="remarks" rows="4" cols="100" onkeyup="limitTextInput(this,250,'Remarks')"></textarea></td>
            </tr>
            <tr>
                <td class="fieldname">Last Action By</td>
                <td class="even">&nbsp;<%=lastActionBy%></td>
            </tr>
            <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><integro:wrapper value="<%=remarks%>"/>&nbsp;</td>
            </tr>
        </tbody>
    </table>
<% } %>
<br></br>
 <jsp:include page="view_audit_details.jsp"></jsp:include>

<!-- End OFFICE HISTORY -->
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="75">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="#" onClick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image12" width="75" height="22" border="0" id="Image12" /></a></td>
<td><a href="#" onClick="saveForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2"  border="0" id="Image2" /></a></td>
     <%if (ICMSConstant.STATE_REJECTED.equals(status) || ICMSConstant.STATE_DRAFT.equals(status)) { %>
            <td width="100" valign="baseline" align="center">
                <a href="ToDo.do" onmouseout="MM_swapImgRestore()"  onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
                    <img src="img/cancel1.gif"  name="Image1" border="0" id="Image1"/></a>
            </td>
        <%} else {%>
            &nbsp;
        <%}%>

  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptForm"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="java.util.Iterator"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/ccreceipt/update_sharechecklist.jsp,v 1.7 2006/11/06 08:56:06 hmbao Exp $
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.7 $
* Date: $Date: 2006/11/06 08:56:06 $
* Tag: $Name:  $
*/
%>


<jsp:include page="/checklist/previous_event_include.jsp" />

<%
    CCReceiptForm aForm = (CCReceiptForm)request.getAttribute("CCReceiptForm");
    int visibleRecs= ((aForm.getSno() == null || aForm.getSno().length ==0) ? 0 : aForm.getSno().length);  //set for "add new"
    boolean hideLayer = (aForm.getSno()!= null && aForm.getSno().length > 0);
    //DefaultLogger.debug(this, ">>>>>>>>>>>>> no of records: " +visibleRecs + " | " + ((aForm.getSno() == null || aForm.getSno().length ==0) ? 0 : aForm.getSno().length));
    //DefaultLogger.debug(this, ">>>>>>>>>> hideLayer: " + hideLayer);
    //HashMap invalidCheckListMap = (HashMap)request.getAttribute("invalidCheckListMap");
    //String ERR_NOT_FOUND = "NOT FOUND";
    //String  ERR_SHARE_TO_ITSELF = "CANNOT SHARE WITH ITSELF";
 %>

<Script language="JavaScript" type="text/JavaScript">
<!--
var counter =<% out.println(visibleRecs); %>;
var iAdd=1;
function addShareCheckList() {

     var result = true;
     hideLayer(1);

   if (result){
		var input="";
		var td = "";
		var row = document.createElement("TR");
        var rowClass = (counter%2 !=0 ) ? "even" : "odd";
        row.className= rowClass  ;

		var tbody = document.getElementById('mainTb').getElementsByTagName("TBODY")[0];
		tbody.width="100%";

		td = document.createElement("TD");
        td.className="index"
		td.valign="top";
		td.align="left";


	// add S/N
       td.innerHTML= counter+1;
       style="width:5" ;
    row.appendChild(td);

    // Add textBox for share document checkList
        td = document.createElement("TD");
        var strDoc1 = "<input type='hidden' name='docShareId' value=0 >";
            strDoc1 = strDoc1 + "<input type='hidden' name='docShareIdRef' value=0 >";
            strDoc1 = strDoc1 + "<input type='hidden' name='leID' >";
            strDoc1 = strDoc1 + "<input type='hidden' name='leName' >";
//            strDoc1 = strDoc1 + "<input type='hidden' name='isDeletedInd' >";
            strDoc1 = strDoc1 + "<input type='hidden' name='profileId' value=0>";
            strDoc1 = strDoc1 + "<input type='hidden' name='subProfileId' value=0>";
            strDoc1 = strDoc1 + "<input type='hidden' name='pledgorDtlId' value=0>";
            strDoc1 = strDoc1 + "<input type='hidden' name='collateralId' value=0>";
            strDoc1 = strDoc1 + "<input type='hidden' name='sno' value= " + (counter+1) + " >";
            strDoc1 = strDoc1 + "<input type='hidden' name='existingChkListId'  value='Add' >";
            strDoc1 = strDoc1 + "<input type='textbox' name='checkListId' size=19 maxlength=19 >";
        td.innerHTML =   strDoc1 ;
	row.appendChild(td);


    // Add labels for LE ID
        td = document.createElement("TD");
        td.innerHTML="&nbsp;" ;
	row.appendChild(td);


    // Add LE Name here
        td = document.createElement("TD");
        td.innerHTML="&nbsp;" ;
	row.appendChild(td);


    // Add textBox for share document checkList
        td = document.createElement("TD");
        td.innerHTML="<input type='textbox' name='details' size=30 maxlength=1600 onkeyup=limitTextInput(this,1600,'Details') >";
	row.appendChild(td);

    // Add Hidden/ checkbox  to check delete
        td = document.createElement("TD");
        td.innerHTML=  "<input type='checkbox' name='deleteCheckListId'  value= " + (counter) + " >" ;
	row.appendChild(td);

  tbody.appendChild(row);
 // alert(tbody.innerHTML);
  counter++;
  iAdd++;
 }
} //end of function


function updateShareCheckList() {
    document.forms["CCReceiptForm"].event.value="refresh_share_checklist";
    document.forms["CCReceiptForm"].submit();
 }

function hideLayer(noOfRows) {
    if (noOfRows > 0 && !<%=hideLayer%>){
        div1.style.visibility='hidden'
        document.all['div1'].style.display = "none";
   }
}
function verifyDocEffDateChanged() {
    if (document.forms["SecurityReceiptForm"].isPolicy.value == "true") {
	if (document.forms["SecurityReceiptForm"].docEffDate.value != document.forms["SecurityReceiptForm"].docOldEffDate.value) {
	    document.forms["SecurityReceiptForm"].isEffDateChanged.value = "true";
	}
    }
}

//-->
</Script>
<!-- InstanceEndEditable -->

<br>
   <!--start table for  to  show  lable Shared Document  CheckLists-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
           <tr>
               <td colspan=2 valign="middle" align="left">
                   <b>Shared Document  Checklist(s)</b><html:errors property="noChecklist" /></td>
                <td colspan=4 valign="middle" align="right">
                  <p align=right>
                      <input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addShareCheckList()"/>
                      <input type="button" name="Submit2" value="Refresh" class="btnNormal" onclick="updateShareCheckList()"/>
                   </p>
                </td>
           </tr>
 </table>
 <!--start  for  to  show  document Share List-->
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="mainTb" class="tblInput">
       <thead>
           <tr>
           <td class="fieldname" width="05%" align="left" >S/N</td>
           <td class="fieldname" width="18%" align="left" >ChecklistID&nbsp;<font color="#0000FF">*</font></td>
           <td class="fieldname" width="10%" align="left" >LE ID</td>
           <td class="fieldname" width="35%" align="left">LE Name</td>
           <td class="fieldname" width="35%" align="left">Details</td>
           <td class="fieldname" style="width:5"   align="left">Delete</td>
           </tr>
       </thead>
       <tbody>
       <%
       String[]   sno =  aForm.getSno();
       if (sno != null && sno.length > 0 ){
            hideLayer = true;
            String[]   docShareId =  aForm.getDocShareId();
            String[]   docShareIdRef =  aForm.getDocShareIdRef();
           // String[]   isDeletedInd =  aForm.getIsDeletedInd();
            String[]   checkListId =  aForm.getCheckListId();
            String[]   profileId =  aForm.getProfileId();
            String[]   subProfileId =  aForm.getSubProfileId();
            String[]   pledgorDtlId =  aForm.getPledgorDtlId();
            String[]   collateralId =  aForm.getCollateralId();
            String[]   details =  aForm.getDetails();
            String[]   leID  =  aForm.getLeID();
            String[]   leName  =  aForm.getLeName();

           visibleRecs= 0;         //reset for display
           for (int index = 0; index < sno.length; index++ ){
               String  deleteValue = index +"";
               String rowClass = (index%2 !=0 ) ? "even" : "odd";
               String leIDValue = (leID[index] != null)  ? leID[index] : "";
               String leNameValue = (leName[index] != null)  ? leName[index] : "";
               /*if  (invalidCheckListMap != null && invalidCheckListMap.get(String.valueOf(index)) != null){
                      leIDValue="";
                      leNameValue ="";
               }*/
               String errCheckListId = "errCheckListId"+index;
              // String isDeletedIndValue  = isDeletedInd[index];
                  DefaultLogger.debug(this, ">>>>>>>>>>>> checkListID: " + checkListId);
                         %>
       <tr class="<%=rowClass%>">
           <td class="index" ><%=visibleRecs+1%></td>
           <td valign="top">
                <html:hidden name="CCReceiptForm"  property="sno"  value= "<%=sno[index]%>" />
                <html:text name="CCReceiptForm"  property="checkListId" size="19" maxlength="19" value="<%=checkListId[index] %>" />
                <html:errors property="<%=errCheckListId %>" />
                           <%-- if  (invalidCheckListMap != null && invalidCheckListMap.get(String.valueOf(index)) != null){
                    if (invalidCheckListMap.get(String.valueOf(index)).equals(ERR_SHARE_TO_ITSELF)){ %>
                        <bean:message key="error.checklistId.ownChecklist" />
                           <% }else{ %>
                        <bean:message key="error.ccChecklistId.notFound" />
                           <% }} --%>
            </td>
            <td valign="top"><integro:empty-if-null value="<%=leIDValue %>"/>&nbsp;</td>
            <td valign="top"><integro:empty-if-null value="<%=leNameValue %>"/>&nbsp;</td>
            <td valign="top"><html:text name="CCReceiptForm"  property="details" size="30" maxlength="1600" value="<%=details[index] %>" onkeyup="limitTextInput(this,1600,'Details')"/></td>
            <td valign="top">
                <html:hidden name="CCReceiptForm"  property="leID"    value="<%=leIDValue %>"/>
                <html:hidden name="CCReceiptForm"  property="leName"    value="<%=leNameValue %>"/>
                <html:hidden name="CCReceiptForm"  property="profileId"    value="<%=profileId[index] %>"/>
                <html:hidden name="CCReceiptForm"  property="subProfileId" value="<%=subProfileId[index] %>"/>
                <html:hidden name="CCReceiptForm"  property="pledgorDtlId" value="<%=pledgorDtlId[index] %>"/>
                <html:hidden name="CCReceiptForm"  property="collateralId" value="<%=collateralId[index] %>"/>
                <%--// <html:hidden name="CCReceiptForm"  property="isDeletedInd" value="<%=isDeletedInd[index] %>"/>--%>
                <html:hidden name="CCReceiptForm"  property="docShareId" value="<%=docShareId[index] %>"/>
                <html:hidden name="CCReceiptForm"  property="docShareIdRef" value="<%=docShareIdRef[index] %>"/>
             <html:checkbox  name="CCReceiptForm"  property="deleteCheckListId" value= "<%=deleteValue %>" />
        </td>
</tr>
<%         visibleRecs++;
               }
           }
%>
 </tbody>
</table>
<!--End  for  to  show  document Share List-->
 <!--Start  table for  if there are no records-->
<%
    if(!hideLayer) {
%>
 <table id="div1" width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
     <tr >
          <td align="center"  ><p align=center>There is no share checklist</p></td>
       </tr>
 </table>
<%
    }
%>

<br>

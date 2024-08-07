<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/secreceipt/update_sharechecklist.jsp,v 1.6 2006/10/09 09:23:26 pratheepa Exp $
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author: pratheepa $<br>
* @version $Revision: 1.6 $
* Date: $Date: 2006/10/09 09:23:26 $
* Tag: $Name:  $
*/
%>
<%
    SecurityReceiptForm aForm = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm");
    int visibleRecs= ((aForm.getSno() == null || aForm.getSno().length ==0) ? 0 : aForm.getSno().length);  //set for "add new"
    boolean hideLayer = (aForm.getSno()!= null && aForm.getSno().length > 0);
%>
<Script language="JavaScript" type="text/JavaScript">
<!--
var counter =<% out.println(visibleRecs); %>;
//var iAdd=1;
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
       style="width:5"
    row.appendChild(td);

    // Add textBox for share document checkList
        td = document.createElement("TD");
        var strDoc1 = "<input type='hidden' name='docShareId' value=0 >";
            strDoc1 = strDoc1 + "<input type='hidden' name='docShareIdRef' value=0 >";
            strDoc1 = strDoc1 + "<input type='hidden' name='securityDtlId' >";
            strDoc1 = strDoc1 + "<input type='hidden' name='securityType' >";
            strDoc1 = strDoc1 + "<input type='hidden' name='securitySubType' >";
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


    // Add labels for securityDtlId
        td = document.createElement("TD");
        td.innerHTML="&nbsp;" ;
	row.appendChild(td);


   // Add labels for securityType
        td = document.createElement("TD");
        td.innerHTML="&nbsp;" ;
	row.appendChild(td);

  // Add labels for securitySubType
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
  //alert(tbody.innerHTML);
  counter++;
  //iAdd++;
 }
} //end of function


function updateShareCheckList() {
        //for "complete" action of "Insurance Policy - Property - Industrial"
        if (!(document.forms["SecurityReceiptForm"].docEffDate == null ||
            document.forms["SecurityReceiptForm"].docEffDate == undefined)) {
		        verifyDocEffDateChanged();
        }

        document.forms["SecurityReceiptForm"].event.value="refresh_share_checklist";
        document.forms["SecurityReceiptForm"].submit();
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
 -->
</Script>

<jsp:include page="/checklist/previous_event_include.jsp" />
 <%-- start here for cr-17 --%>
      <br>
    <!--start table for  to  show  lable Shared Document  CheckLists-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
            <tr>
               <td colspan=2 valign="middle" align="left">
                   <b>Shared Document  Checklist(s)</b><html:errors property="noChecklist" /></td>
                <td colspan=4 valign="middle" align="right">
                  <p align=right> <input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addShareCheckList()"/>
                   <input type="button" name="Submit2" value="Refresh" class="btnNormal" onclick="updateShareCheckList()"/>
                   </p>
                </td>
            </tr>
      </table>
      <!--End table for  to  show  lable Shared Document  CheckLists-->
       <!--start  for  to  show  document Share List-->
       <table width="100%" border="0" cellspacing="0" cellpadding="0" id="mainTb" class="tblInput">
              <thead>
                    <tr>
                       <td class="fieldname" width="01%"  align="left">S/N</td>
                       <td class="fieldname" width="8%"  align="left">ChecklistID&nbsp;<font color="#0000FF">*</font></td>
                       <td class="fieldname" width="10%"  align="left">Security ID</td>
                       <td class="fieldname" width="12%"  align="left">Security Type</td>
                       <td class="fieldname" width="18%"  align="left">Security Sub Type</td>
                       <td class="fieldname" width="25%"  align="left">Details</td>
                       <td class="fieldname" width="26%"  align="left">Delete</td>
                    </tr>
               </thead>
                <tbody>
           <%
                String[]   sno =  aForm.getSno();
                if (sno != null && sno.length > 0 ){
                     hideLayer = true;
                     String[]   docShareId =  aForm.getDocShareId();
                     String[]   docShareIdRef =  aForm.getDocShareIdRef();
//                         String[]   isDeletedInd =  aForm.getIsDeletedInd();
                     String[]   checkListId =  aForm.getCheckListId();
                     String[]   profileId =  aForm.getProfileId();
                     String[]   subProfileId =  aForm.getSubProfileId();
                     String[]   pledgorDtlId =  aForm.getPledgorDtlId();
                     String[]   collateralId =  aForm.getCollateralId();
                     String[]   details =  aForm.getDetails();
                     String[]   securityDtlId  =  aForm.getSecurityDtlId();
                     String[]   securityType  =  aForm.getSecurityType();
                     String[]   securitySubType  =  aForm.getSecuritySubType();

                    visibleRecs= 0;         //reset for display
                    for (int index = 0; index < sno.length; index++ ){
                        String  deleteValue = index +"";
                        //String  deleteValue = index +"";
                        String rowClass = (index%2 !=0 ) ? "even" : "odd";
                        String errCheckListId = "errCheckListId"+index;
                        String errLinkedToSecurity = "errLinkedToSecurity"+index;
                        System.out.println("errLinkedToSecurity" +index +":" +errLinkedToSecurity);
//                            String isDeletedIndValue  = isDeletedInd[index];
                         %>

                <tr class="<%=rowClass%>">
                    <td class="index"><%=visibleRecs+1%></td>
                    <td valign="top">
                         <html:text name="SecurityReceiptForm"  property="checkListId" size="19" maxlength="19" value="<%=checkListId[index] %>" />
                         <html:errors property="<%=errCheckListId %>" />
                        
                     </td>
                     <td valign="top">&nbsp;<integro:empty-if-null value="<%=securityDtlId[index]%>"/></td>
                     <td valign="top">&nbsp;<integro:empty-if-null value="<%=securityType[index]%>"/></td>
                     <td valign="top">&nbsp;<integro:empty-if-null value="<%=securitySubType[index]%>"/></td>
                     <td valign="top"><html:text name="SecurityReceiptForm"  property="details" size="30" maxlength="1600" value="<%=details[index] %>" onkeyup="limitTextInput(this,1600,'Details')"/></td>
                     <td valign="top">
                         <html:hidden name="SecurityReceiptForm"  property="sno"  value= "<%=sno[index]%>" />
                         <html:hidden name="SecurityReceiptForm"  property="securityDtlId"    value="<%=securityDtlId[index] %>"/>
                         <html:hidden name="SecurityReceiptForm"  property="securityType"     value="<%=securityType[index] %>"/>
                         <html:hidden name="SecurityReceiptForm"  property="securitySubType"  value="<%=securitySubType[index] %>"/>
                         <html:hidden name="SecurityReceiptForm"  property="profileId"    value="<%=profileId[index] %>"/>
                         <html:hidden name="SecurityReceiptForm"  property="subProfileId" value="<%=subProfileId[index] %>"/>
                         <html:hidden name="SecurityReceiptForm"  property="pledgorDtlId" value="<%=pledgorDtlId[index] %>"/>
                         <html:hidden name="SecurityReceiptForm"  property="collateralId" value="<%=collateralId[index] %>"/>
                         <%--<html:hidden name="SecurityReceiptForm"  property="isDeletedInd" value="<%=isDeletedInd[index] %>"/>--%>
                         <html:hidden name="SecurityReceiptForm"  property="docShareId" value="<%=docShareId[index] %>"/>
                         <html:hidden name="SecurityReceiptForm"  property="docShareIdRef" value="<%=docShareIdRef[index] %>"/>
                      <html:checkbox  name="SecurityReceiptForm"  property="deleteCheckListId" value= "<%=deleteValue %>" />
                      <html:hidden  name="SecurityReceiptForm"  property="existingChkListId" value= "<%=deleteValue %>" />
                       <br><html:errors property="<%=errLinkedToSecurity%>" />
                 </td>
             </tr>
           <%         visibleRecs++;
                        }
                    }

           %>
             </tbody>
      </table>
    <!--Start table for  if there is no  share document  -->
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

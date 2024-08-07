<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.reassignment.ReassignmentConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.checklist.CheckListAction,
				 com.integrosys.cms.app.common.util.*,
				 java.util.*,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.checklist.bus.IShareDoc,
                 com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptAction.checkListTrxVal");
	ICheckListItem stageOb = (ICheckListItem)request.getAttribute("stagingOb");
	ICheckListItem ob = (ICheckListItem)request.getAttribute("actualOb");
    String previous = request.getParameter("previous");
    

    /*if(checkListTrxVal.getStagingCheckList()!= null){
          ICheckListItem array1[]  = checkListTrxVal.getStagingCheckList().getCheckListItemList();
          if  (array1 != null) {
                 for (int i = 0; i <  array1.length; i++) {
                     IShareDoc[] iShareDoc = array1[i].getShareCheckList();
                     if  (iShareDoc != null) {
                       // System.out.println("Staging Share CheckList " +iShareDoc.length );
                        for (int j = 0; j <  iShareDoc.length; j++) {
                         //   System.out.println("IShareDoc pK " +iShareDoc[j].getDocShareId());
                        }
                     }
                 }
            }
      }*/

    // cr 36
    /*Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();
    GregorianCalendar cal = new GregorianCalendar();
    cal.setTime(bcaApprovedDate);*/
    
    int bb = 0;
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

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>
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

function submitPage() {
    document.forms[0].event.value = "chk_view_return";
//    document.forms[0].custTypeTrxID.value = trxID;

   document.forms[0].submit()
}

//-->
</script>
<!-- InstanceEndEditable --></head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/return2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<html:form action="CCReceipt.do">
<input type="hidden" name="previous" value="<%=previous%>"/>
<input type="hidden" name="event"/>

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />

<!-- InstanceBeginEditable name="Content" -->
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Constitutional/Contractual Doc Receipt </h3></td>
    </tr>
    <tr>
      <td> <h3> View Doc Description </h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
          <%
	         String aa = "odd" ;
          %>
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"itemCode")? "fieldname":"fieldnamediff"%>">Code</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docCode" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; }else{aa = "odd";} 
	          %>
            </tr>
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"checkListItemRef")? "fieldname":"fieldnamediff"%>">Doc No</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docNo" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"itemDesc")? "fieldname":"fieldnamediff"%>">Description</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docDesc" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
            <!--
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"docRef")? "fieldname":"fieldnamediff"%>">Doc Ref
              <%if(CompareOBUtil.compOB(stageOb,ob,"docRef")==false){%>
              &nbsp;<font color="#00AAFF">* </font></td>
              <%}%>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docRef" /></td>
            </tr>
             -->
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"formNo")? "fieldname":"fieldnamediff"%>">Form No</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="formNo" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"docDate")? "fieldname":"fieldnamediff"%>">Doc Date</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docDate" /></td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expiryDate")? "fieldname":"fieldnamediff"%>">Doc Expiry Date</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docExpDate" /></td>
               <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
            <!--
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"identifyDate")? "fieldname":"fieldnamediff"%>">Identify Date</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="identifyDate" /></td>
            </tr>
            -->
            <%
                boolean received = false;
              if (stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_RECEIVED)  ||
                      stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_RECEIVED)) {
            	  received = true;
              }
            %>
            <%if(received){ %>
              <tr class=<%=aa%> >
	              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"receivedDate")? "fieldname":"fieldnamediff"%>">Date Received</td>
	              <td>&nbsp;<bean:write name="CCReceiptForm" property="receivedDate" /></td>
	          <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
              </tr>
            <%} %>
            <%
                boolean waived = false;
              if (stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_WAIVED)  ||
                      stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER) ||
                      stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_WAIVER_REQ) ||
                      stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER_REQ)) {
            	  waived = true;
              }
            %>
            <%if(waived){ %>
              <tr class=<%=aa%> >
	              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"waivedDate")? "fieldname":"fieldnamediff"%>">Date Waived</td>
	              <td>&nbsp;<bean:write name="CCReceiptForm" property="waivedDate" /></td>
	          <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
              </tr>
            <%} %>
            
            <%
            	boolean complete = false ;
	            if (stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_COMPLETED)  ||
	                    stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_COMPLETED_REQ) ||
	                    stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_COMPLETE) ||
	                    stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_COMPLETED_REQ)) {
	            	complete = true;
	            }
            %>
            <%if(complete){ %>
	            <tr class=<%=aa%> >
		              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"completedDate")? "fieldname":"fieldnamediff"%>">Date Completed</td>
		              <td>&nbsp;<bean:write name="CCReceiptForm" property="completedDate" /></td>
		       <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
	            </tr>
			<% }%>
			
			<%	
            	boolean lodged = false ;
	            if (stageOb.getItemStatus().equals(ICMSConstant.STATE_LODGED)||
	            	stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_LODGE) ||
                    stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_RELODGE)) {
	            	lodged = true;
	            }
            %>
            <%if(lodged){ %>
	            <tr class=<%=aa%> >
		              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"lodgedDate")? "fieldname":"fieldnamediff"%>">Date Lodged</td>
		              <td>&nbsp;<bean:write name="CCReceiptForm" property="lodgedDate" /></td>
		       <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
	            </tr>
			<% }%>
			
			<%	
            	boolean tempUplift = false ;
	            if (stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT)||
	            	stageOb.getItemStatus().equals(ICMSConstant.STATE_TEMP_UPLIFTED)	
	            		) {
	            	tempUplift = true;
	            }
            %>
            <%if(tempUplift){ %>
	            <tr class=<%=aa%> >
		              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"tempUpliftedDate")? "fieldname":"fieldnamediff"%>">Date Temp Uplifted</td>
		              <td>&nbsp;<bean:write name="CCReceiptForm" property="tempUpliftedDate" /></td>
	            <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          	%>
	            </tr>
	            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expectedReturnDate")? "fieldname":"fieldnamediff"%>">Expected Date Of Return</td>
              <td>&nbsp;
                <bean:write name="CCReceiptForm" property="expectedReturnDate" />
              </td>
             <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
			<% }%>
			
			<%	
            	boolean permUplift = false ;
	            if (stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT)||
	            	stageOb.getItemStatus().equals(ICMSConstant.STATE_PERM_UPLIFTED)	
	            		) {
	            	permUplift = true;
	            }
            %>
            <%if(permUplift){ %>
	            <tr class=<%=aa%> >
		              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"permUpliftedDate")? "fieldname":"fieldnamediff"%>">Date Temp Uplifted</td>
		              <td>&nbsp;<bean:write name="CCReceiptForm" property="permUpliftedDate" /></td>
		        <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          	%>
	            </tr>
			<% }%>
            <%
                boolean isdeferred = false;
              if (stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_DEFERRED)  ||
                      stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFERRAL) ||
                      stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_DEFER_REQ) ||
                      stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFER_REQ)) {
                  isdeferred = true;
            %>
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferExpiryDate")? "fieldname":"fieldnamediff"%>">Date Deferred
              <%if(isdeferred){%>
              &nbsp;
              <%}%>
              <td>&nbsp;
                <bean:write name="CCReceiptForm" property="deferDate" />
              </td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
            <%-- // cr 36 --%>
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expectedReturnDate")? "fieldname":"fieldnamediff"%>">Expected Date Of Return</td>
              <td>&nbsp;
                <bean:write name="CCReceiptForm" property="expectedReturnDate" />
              </td>
             <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
<%--            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferExtendedDate") || CompareOBUtil.compOB(stageOb,ob,"deferExpiryDate") ? "fieldname":"fieldnamediff"%>">DDN valid for </td>
              <td >
            	  <% if (bcaApprovedDate == null) { %>
	                 &nbsp;
	              <% } else {
		               Date d1 = null;
	                   if (stageOb.getDeferExtendedDate() != null) {
	                     d1 = stageOb.getDeferExtendedDate();
                       } else {
 	                     d1 = stageOb.getDeferExpiryDate();
                       }
 	                   Date d2 = cal.getTime();
 	                   if (d1.before(d2)) {
		          %>
		             &nbsp;         
	              <%   } else { %>
		              <%= CommonUtil.dateDiff(d1, d2, Calendar.DATE)%> days
	              <%
                       }
                     }
                  %>
              </td>
              </tr>
--%>              
                <% } %>
            <tr class=<%=aa%> >
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"actionParty")? "fieldname":"fieldnamediff"%>">Action Party</td>
              <td>&nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=stageOb.getActionParty()%>" display="true" descWithCode="false"/>
              <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>

            <tr class=<%=aa%> >
            <td style="width:150" class="<%=CompareOBUtil.compOB(stageOb,ob,"remarks")? "fieldname":"fieldnamediff"%>">Remarks</td>
              <td>&nbsp;<integro:htmltext value="<%=stageOb.getRemarks()%>" lineLength="80" /> </td>
              <% bb++;
	             if(bb%2!=0){aa = "even"; } else{aa = "odd";} 
	          %>
            </tr>
<%-- 
             <tr class="even">               
               <td class="<%=CompareOBUtil.compOB(stageOb,ob,"Shared")? "fieldname":"fieldnamediff"%>">Shared</td>
               <td >
                   <html:radio property="shared" disabled="true" value="true" />Yes
                   <html:radio property="shared" disabled="true" value="false"  />No
                </td>
               </tr>
--%>
          </tbody>
        </table>
<%--        for cr-17
        <jsp:include page="/checklist/ccreceipt/CheckerViewShareCheckList.jsp" />

         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="<%=isdeferred?"even":"odd"%>">
            <td style="width:150" class="<%=CompareOBUtil.compOB(stageOb,ob,"remarks")? "fieldname":"fieldnamediff"%>">Remarks</td>
              <td>  <integro:htmltext value="<%=stageOb.getRemarks()%>" lineLength="80" /> </td>
            </tr>
          </tbody>
        </table>
--%>        
    </td>
    </tr>
  </tbody>
</table>


<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <%
      if (previous != null && previous.equals(ReassignmentConstant.TASK_EVENT)) {
  %>
    <td width="75" valign="baseline" align="center"><a href="#" onclick="submitPage('<%=checkListTrxVal.getTransactionID()%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a></td>
  <% } else
      if (request.getParameter("event") != null && "view_receipt".equals(request.getParameter("event"))) {
          String checkListID = request.getParameter("checkListID");
          String legalID = request.getParameter("legalID");
          String custCategory = request.getParameter("custCategory");
          String limitBkgLoc = request.getParameter("limitBkgLoc");
          String legalConstitution = request.getParameter("legalConstitution");
          String limitProfileID = request.getParameter("limitProfileID");
  %>
 <td width="75" valign="baseline" align="center"><a href="CCReceipt.do?event=view&checkListID=<%=checkListID%>&legalID=<%=legalID%>&custCategory=<%=custCategory%>&limitBkgLoc=<%=limitBkgLoc%>&legalConstitution=<%=legalConstitution%>&limitProfileID=<%=limitProfileID%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a></td>
 <% } else { %>
 <td width="75" valign="baseline" align="center"><a href="#" onclick="submitPage('<%=checkListTrxVal.getTransactionID()%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a></td>
 <% } %>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

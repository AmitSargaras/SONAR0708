<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header:
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.22 $
 * @since $Date: 2006/10/27 08:42:56 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.bus.IBookingLocation,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.custodian.bus.CCCustodianInfo,
                 com.integrosys.cms.ui.common.CountryList,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
				 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.app.custodian.trx.ICustodianTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.custodian.bus.ICustodianDoc,
                 com.integrosys.cms.app.custodian.bus.ICustodianDocItem,
                 com.integrosys.cms.app.custodian.bus.OBCustodianDocItem,
                 java.util.*,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.custodian.CustodianAction,
                 com.integrosys.cms.app.custodian.bus.*"%>

 <%
    String customerCategory= (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.customerCategory");
    ICustodianTrxValue iCustTrxVal = (ICustodianTrxValue)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.custodianTrxVal");
    String checkListStatus = (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.checkListStatus");
    ICustodianDoc actualCustDoc   = (ICustodianDoc)iCustTrxVal.getCustodianDoc();
    ICustodianDoc stageCustDoc = iCustTrxVal.getStagingCustodianDoc();
	ArrayList actualDocItems = null;
    if (actualCustDoc != null)
        actualDocItems = actualCustDoc.getCustodianDocItems();

    ICustodianDocItem[] stageArr = null;
    if (stageCustDoc != null && stageCustDoc.getCustodianDocItems()!=null)
        stageArr = (ICustodianDocItem[])stageCustDoc.getCustodianDocItems().toArray(new OBCustodianDocItem[0]);
    ICustodianDocItem[] actualArr = null;
    if (actualCustDoc != null && actualCustDoc.getCustodianDocItems()!=null)
        actualArr = (ICustodianDocItem[])actualCustDoc.getCustodianDocItems().toArray(new OBCustodianDocItem[0]);

    if (stageCustDoc != null || actualCustDoc != null ) {
        List res = CompareOBUtil.compOBArray( stageArr, actualArr);
        CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
        Arrays.sort(resultList, new Comparator()
        {
            public int compare(Object o1, Object o2)
            {
                long int1 = 0;
                if (((CompareResult)o1).getObj() != null)
                    int1 = ((ICustodianDocItem)((CompareResult)o1).getObj()).getCheckListItemRefID();
                long int2 = 0;
                if (((CompareResult)o2).getObj() != null)
                    int2 = ((ICustodianDocItem)((CompareResult)o2).getObj()).getCheckListItemRefID();
                if (int1 - int2 > 0)
                    return 1;
                if (int1 - int2 < 0)
                    return -1;
                return 0;
            }
        });
        pageContext.setAttribute("custDocList",Arrays.asList(resultList));
    }
//    String approveEvent = null;
//    String rejectEvent = "reject_custodian_checker";
    String screenLabel = "Process ";
    String forId = "";
    if (stageCustDoc != null)
        forId = stageCustDoc.getDocType();
    else if (actualCustDoc != null)
        forId = actualCustDoc.getDocType();
    if(forId.equals(ICMSConstant.DOC_TYPE_SECURITY)){
        screenLabel+="Security Doc ";
    }else if(forId.equals(ICMSConstant.DOC_TYPE_CC)){
        screenLabel+="Constitutional / Contractual Doc ";
    }
    String instructionLoc = (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.instructionBkLoc");
    ILimitProfile limitprofile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String bookingLoc = null;
    String displayBCALoc = (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.displayBCALoc");
    if (limitprofile != null){
        if (limitprofile.getOriginatingLocation() != null){
            bookingLoc = limitprofile.getOriginatingLocation().getCountryCode();
            displayBCALoc = "true";
        }
        else{
            displayBCALoc = "false";
        }
    }else{
        displayBCALoc = "false";
    }
    int sno=0;
    String revRemarks = stageCustDoc.getReversalRemarks();
    if (request.getAttribute("reversalRemarks") != null &&
        !(((String)request.getAttribute("reversalRemarks")).equals(revRemarks)))
        revRemarks = (String)request.getAttribute("reversalRemarks");

 %>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/validation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function approvePage() {
    document.forms[0].action="custodian.do?event=<%=CustodianAction.EVENT_APPROVE_DOC_CHECKER%>";
    var strRem = document.forms[0].reversalRemarks.value;
    if (strRem == null || strRem.length <= 1600)
        document.forms[0].submit();
    else {
        alert('The Reversal Remarks Field is limited to 1600 characters');
        document.forms[0].reversalRemarks.focus();
    }
}
function rejectPage() {
    document.forms[0].action="custodian.do?event=<%=CustodianAction.EVENT_REJECT_DOC_CHECKER%>";
    var strRem = document.forms[0].reversalRemarks.value;
    if (strRem == null || strRem.length <= 1600)
        document.forms[0].submit();
    else {
        alert('The Reversal Remarks Field is limited to 1600 characters');
        document.forms[0].reversalRemarks.focus();
    }
}
function cancel(){
    document.forms[0].action="ToDo.do?";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action='custodian.do?'>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=screenLabel%></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
       <td>
        <html:errors property="barCodeErrorExist"/>
        <html:errors property="envBarCodeErrorNotExist"/>
       </td>
   	</tr>
  </thead>
  <tbody>
      <%
          if (displayBCALoc.equals("true") && !bookingLoc.equals(instructionLoc)) {
      %>
      <tr>
      <td>
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <tr class="odd">
          <td width="20%" class="index"><bean:message key="label.security.docitem.BCABookingLoc"/></td>
          <td width="80%">
          <integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(bookingLoc)%>"/>&nbsp;
          </td>
          </tr>
      </table>
      </td>
      </tr>
      <tr><td colspan="2">&nbsp;</td></tr>
      <% } %>
<%
    String strDocType = "";
    if (stageCustDoc != null)
        strDocType = stageCustDoc.getDocType();
    else if (actualCustDoc != null)
        strDocType = actualCustDoc.getDocType();
    if (ICMSConstant.DOC_TYPE_CC.equals(strDocType)){
        String ownerType = "";
        if (stageCustDoc != null)
            ownerType = stageCustDoc.getDocSubType();
        else if (actualCustDoc != null)
            ownerType = actualCustDoc.getDocSubType();
        CCCustodianInfo ccowner = null;
        if (stageCustDoc != null)
            ccowner = (CCCustodianInfo)stageCustDoc.getCCCustodianInfo();
        else if (actualCustDoc != null)
            ccowner = (CCCustodianInfo)actualCustDoc.getCCCustodianInfo();
        if (ccowner != null)
        {
%>  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.customer.category"/></td>
              <td> <integro:empty-if-null value="<%=ownerType%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.legalid"/></td>
              <td>
<%				if (ccowner.getLegalReference()!= null){
%>					<integro:empty-if-null value="<%= ccowner.getLegalReference()%>"/>
<%				}else{
%>					-
<%				}%>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.legalname"/></td>
              <td> <integro:empty-if-null value="<%= ccowner.getLegalName()%>"/>&nbsp;</td>
            </tr>
<%          if (ICMSConstant.CHECKLIST_PLEDGER.equals(ownerType))
            {
%>          <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.pledgorId"/></td>
              <td> <integro:empty-if-null value="<%= ccowner.getOwnerReference()%>"/>&nbsp;</td>
            </tr>
<%         }%>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
<%}}else if (ICMSConstant.DOC_TYPE_SECURITY.equals(strDocType))
    {
        //CollateralCustodianInfo colowner = stagingDocItem.getCollateralCustodianInfo();
        CollateralCustodianInfo colowner = null;
        if (stageCustDoc != null)
            colowner = stageCustDoc.getCollateralCustodianInfo();
        else if (actualCustDoc != null)
            colowner = actualCustDoc.getCollateralCustodianInfo();
        if (colowner != null)
        {
%>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.security.docitem.securitytype"/></td>
              <td width="30%"> <integro:empty-if-null value="<%= colowner.getCollateralType().getTypeName()%>"/>&nbsp;</td>
              <td class="fieldname" width="20%"><bean:message key="label.security.docitem.securitysubtype"/></td>
              <td width="30%"> <integro:empty-if-null value="<%= colowner.getCollateralSubType().getSubTypeName()%>"/> &nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.document.securityID"/></td>
              <td> <integro:empty-if-null value="<%= colowner.getCollateralReference()%>"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.security.docitem.customercategory"/></td>
              <td><integro:empty-if-null value="<%=customerCategory%>"/>&nbsp;</td>
            </tr>
			<tr class="odd">
              <td class="fieldname"><bean:message key="label.security.docitem.checkliststatus"/></td>
               <td ><%=checkListStatus%></td>
			  <td class="fieldname">&nbsp;</td>
			  <td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp; </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
<%      }
    }%>
    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%"><bean:message key="label.global.sn"/></td>
              <td><bean:message key="label.document.master.doccode"/> (<bean:message key="label.document.docno"/>)</td>
              <td><bean:message key="label.document.doccode"/><br>(<bean:message key="label.document.docno"/>)</td>
              <td width="47%"><bean:message key="label.document.description"/></td>
              <td width="20%"><bean:message key="label.document.status"/></td>
              <td width="16%"><bean:message key="label.document.transactiondate"/></td>
              <td width="16%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
          <tbody>

            <%int counter = -1;%>
            <logic:present name="custDocList" >
            <logic:iterate id="compResult" name="custDocList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
            <%  ICustodianDocItem ob = (ICustodianDocItem)compResult.getObj();
                counter++;

            String docNo = String.valueOf(ob.getCheckListItemRefID());//ob.getDocRef();
		    docNo = (docNo==null || docNo.equals("") ||
            docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;

		    long parentDocNoLong = ICMSConstant.LONG_INVALID_VALUE;

            //try..................
            if (ob.getCheckListItem() != null) {
                parentDocNoLong = ob.getCheckListItem().getParentCheckListItemRef();
            }
            //end try..

            String parentDocNo = String.valueOf(parentDocNoLong);
		    parentDocNo = (parentDocNo==null || parentDocNo.equals("") ||
                    parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>("+parentDocNo+")";
            //if current checklist item is linked (i.e. has a parent), get the master doc code
			String parentDocCode = "&nbsp;";
			if (parentDocNoLong!=0 && parentDocNoLong!=ICMSConstant.LONG_INVALID_VALUE)
			{
				ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
				parentDocCode = parentCheckListItem.getItem().getItemCode();
			}
			//ob is stagingItem
			OBCustodianDocItem item = null;
			OBCustodianDocItem actualItem = null;
			if (actualDocItems != null){
                for (Iterator iterator = actualDocItems.iterator(); iterator.hasNext();) {
                     item = (OBCustodianDocItem) iterator.next();
                     if (item != null &&
                        item.getCheckListItemRefID() == ob.getCheckListItemRefID())
                        actualItem = item;
                }
            }

            String displayStatus = "";
            try{
                if (actualItem == null)
                    displayStatus = ob.getDisplayStatus(ICMSConstant.STATE_RECEIVED, ob.getStatus());
                else
                    displayStatus = ob.getDisplayStatus(actualItem.getStatus(),ob.getStatus());
            } catch (Exception e){ displayStatus = ob.getStatus();}
            if (displayStatus == null)
                displayStatus = ob.getStatus();

            String opcode = null;
            if (ob.getStatus() != null)
            {
                if (ICMSConstant.STATE_PENDING_LODGE.equals(ob.getStatus()))
                    opcode = ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE;
                else if (ICMSConstant.STATE_PENDING_RELODGE.equals(ob.getStatus()))
                    opcode = ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE;
                else if (ICMSConstant.STATE_PENDING_TEMP_UPLIFT.equals(ob.getStatus()))
                    opcode = ICMSUIConstant.CUSTODIAN_OP_CODE_TEMPUPLIFT;
                else if (ICMSConstant.STATE_PENDING_PERM_UPLIFT.equals(ob.getStatus()))
                    opcode = ICMSUIConstant.CUSTODIAN_OP_CODE_PERMUPLIFT;
                else
                    opcode = ICMSUIConstant.CUSTODIAN_OP_CODE_VIEW;
            }

            //DefaultLogger.debug(this, "actualItem.getStatus() = "+ actualItem.getStatus() + "  ob.getStatus() = " + ob.getStatus() + " displayStatus =" + displayStatus);
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
        <% if (displayStatus != null && displayStatus.equals(ICMSConstant.STATE_RECEIVED)){ %>
          <td width="3%" class="index"><%=counter + 1%></td>
        <%}else{%>
          <td width="3%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
        <%}%>
          <td><integro:empty-if-null value="<%=parentDocCode%>"/><integro:empty-if-null value="<%=parentDocNo%>"/>&nbsp;</td>
          <td><%=ob.getDocNo()!=null?ob.getDocNo():"&nbsp;"%><br>(<integro:empty-if-null value="<%=docNo%>"/>)&nbsp;</td>
          <td><integro:empty-if-null value="<%=ob.getDocDescription()%>"/>&nbsp;</td>
          <td style="text-align:center">
              <%if (displayStatus != null && displayStatus.equals(ICMSConstant.STATE_ITEM_RECEIVED)){%>
                <%=ICMSConstant.STATE_ITEM_AWAITING%>
              <%}else{%>
              <integro:empty-if-null value="<%=displayStatus%>"/><%}%>&nbsp;</td>
          <td>
            <%
              // CMS-2183 : to show item last updated date instead of trx date
              // CMS-2114 : take into consideration cpc cust status last update date
              Date itmTrxDate = ob.getDisplayTrxDate();
              if(itmTrxDate != null){
	        %>
              <integro:date object="<%=itmTrxDate%>" />
            <%} else {%>- <%}%>
          </td>
          <td style="text-align:center">
            <a href="custodian.do?event=read_custodian_doc_checker&custodianDocItemID=<%=ob.getCustodianDocItemID()%>&checkListItemRef=<%=ob.getCheckListItemRefID()%>&forId=cc&opcode=<%=opcode%>">View</a>
          </td>
        </tr>
          </logic:iterate>
          </logic:present>
      </tbody>
    </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
        <tr>
        <td>&nbsp;</td>
        </tr>
        </Table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
            <tbody>
            <%//CR-34  %>
            <tr class="odd">
            <%if(stageCustDoc!=null) { %>
              <td class="<%=CompareOBUtil.compOB(stageCustDoc,actualCustDoc,"reversalRemarks")? "fieldname":"fieldnamediff"%>">Reversal Remarks</td>
            <%}else {%>
              <td class="fieldname"><bean:message key="label.document.reversal.remark"/></td>
            <%}%>
              <td ><textarea name="reversalRemarks" rows="4" cols="100" onkeyup="limitTextInput(this.form.reversalRemarks, 1600, 'Reversal Remarks');"><% if (revRemarks != null && !revRemarks.equals("")){%><%=revRemarks%><%}%></textarea></td>

            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.document.reversal.remarkupdby"/></td>
              <td ><%if (stageCustDoc.getReversalRmkUpdatedUserInfo() != null && !stageCustDoc.getReversalRmkUpdatedUserInfo().equals("")){%>
              <%=stageCustDoc.getReversalRmkUpdatedUserInfo()%>&nbsp;
              <%}else{%>
              -
              <%}%>&nbsp;</td>
            </tr>
            <%//CR-34%>
              <tr class="odd">
                <td class="fieldname"><bean:message key="label.remarks"/></td>
                <td><textarea name="remarks"  cols="100" rows="3"></textarea></td>
              </tr>
              <tr class="even">
                <td class="fieldname"><bean:message key="label.last.action.by"/></td>
                <td><integro:empty-if-null value="<%=iCustTrxVal.getUserInfo()%>"/>&nbsp;</td>
              </tr>
              <tr class="odd">
                <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                <td><integro:empty-if-null value="<%=iCustTrxVal.getRemarks()%>"/>&nbsp;</td>
              </tr>
            </tbody>
        </table>

        <table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
	       <td valign="baseline" align="center">&nbsp;</td>
	       <td valign="baseline" align="center">&nbsp;</td>
        </tr>
        <tr>
	       <td width="100" valign="baseline" align="center"> <a href="javascript:approvePage();"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2211','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image2211"  border="0" id="Image2211" /></a></td>
	       <td width="100" valign="baseline" align="center"> <a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
	       <td width="100" valign="baseline" align="center"> <a href="javascript:cancel();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
        </tr>
        <tr>
	       <td valign="baseline" align="center">&nbsp;</td>
	       <td valign="baseline" align="center">&nbsp;</td>
        </tr>
        </table>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue,
                 com.integrosys.cms.ui.liquidation.LiquidationAction,
                 com.integrosys.cms.ui.liquidation.LiquidationHelper,
                 java.util.Collection,
                 com.integrosys.cms.app.liquidation.bus.*,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Iterator,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Comparator,
				 java.util.Arrays,
				 com.integrosys.base.uiinfra.mapper.MapperUtil,
				 java.util.Locale,
				 com.integrosys.base.uiinfra.common.Constants,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/liquidation/liquidation_checker_edit.jsp,v 1 2007/02/10 Lini Exp $
*
* Describe this JSP.
* Purpose: For Checker to approve and reject Maintain Liquidation
* Description: approve and reject the Maintain Liquidation that is changed by Maker
*
* @author $Author: Lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/10 $
* Tag: $Name$
*/
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

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

function approvePage() {
    document.forms[0].action = "Liquidation.do?event=checker_approve_edit_liquidation";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action = "Liquidation.do?event=checker_reject_edit_liquidation";
    document.forms[0].submit();
}

function callSubmit(selObj,ind) {
    temp = selObj.options[selObj.selectedIndex].value;
    if(temp=="") {
        return false;
    }else{
        document.forms[0].event.value = selObj.options[selObj.selectedIndex].value;
		document.forms[0].index.value = ind;
        document.forms[0].actionTypeName.value = selObj.options[selObj.selectedIndex].value;
		document.forms[0].submit();
    }
}

function todo() {
	document.forms[0].action = "ToDo.do?event=prepare&isMenu=Y";
	document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<%
	Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    String event = request.getParameter("event");

    OBLiquidationTrxValue obTrxValue = null;
    Object trxObjFromSession = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    Collection nplInfo = (Collection)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.nplInfo");
    if (nplInfo != null)
        pageContext.setAttribute("nplInfo",nplInfo);


    if( trxObjFromSession ==null ) {
        out.println("Expected session parameter 'LiquidationTrxValue' is missing.");
        return;
    }

    obTrxValue = (OBLiquidationTrxValue)trxObjFromSession;

    boolean entries_editable = false;
    boolean isRejected = false;
    // check whether the currentStatus is REJECTED
    isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );//true;

    // Entries are editable only if the record is ACTIVE.
    if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) ||
        (obTrxValue != null &&ICMSConstant.STATE_ND.equals(obTrxValue.getStatus())) ||
        isRejected ||
        event.equals(LiquidationAction.EVENT_LIST)) {
        entries_editable = true;
    }
    if (event.equals("to_track"))
        entries_editable = false;

    //TODO change this
    ILiquidation liquidation = null;
//    if (liquidation != null)
        liquidation = obTrxValue.getLiquidation();
    ILiquidation stagingLiquidation = null;
//    if (liquidation != null)
        stagingLiquidation = obTrxValue.getStagingLiquidation();
    OBRecoveryExpense[] expArray = null ;
    OBRecoveryExpense[] stagingExpArray = null ;
    OBRecoveryIncome[] incArray = null ;
    OBRecovery[] recArray = null ;
    OBRecoveryIncome[] stagingIncArray = null ;
    OBRecovery[] stagingRecArray = null ;
    Collection expense = null;
    Collection income = null;
//    Collection recovery = null;

    if (liquidation != null)
    {
        if (liquidation.getRecoveryExpense() != null){
            expArray = (OBRecoveryExpense[])liquidation.getRecoveryExpense().toArray(new OBRecoveryExpense[0]);
            expense = liquidation.getRecoveryExpense();
        }

        if (liquidation.getRecovery() != null){
            recArray = (OBRecovery[])liquidation.getRecovery().toArray(new OBRecovery[0]);
        }
    }

    if (stagingLiquidation != null)
    {
    	
        if (stagingLiquidation.getRecoveryExpense() != null){
            stagingExpArray = (OBRecoveryExpense[])stagingLiquidation.getRecoveryExpense().toArray(new OBRecoveryExpense[0]);
            if (stagingExpArray != null)
                pageContext.setAttribute("expense",stagingExpArray);
        }

        if (stagingLiquidation.getRecovery() != null){
            stagingRecArray = (OBRecovery[])stagingLiquidation.getRecovery().toArray(new OBRecovery[0]);
            if (stagingRecArray != null)
                pageContext.setAttribute("recovery", stagingRecArray);
        }
    }


%>

<html:form action="Liquidation.do">

<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:hidden property="event" value=""/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index"/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3><bean:message key="label.liquidation.npl.npl.info"/></h3></td>
  </tr>
  <tr>
    <td>
    <hr />
    </td>
  </tr>
  </thead>
  <tbody>
  <%// Begin of NPL table%>
<tr>
      <td colspan="2">
          <table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
            <tbody>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="npl">
                    <thead>
                      <tr>
                        <td class="fieldname" width="1%" >S/N</td>
                        <td class="fieldname" width="27%"><bean:message key="label.liquidation.npl.account.no"/> </td>
                        <td class="fieldname" width="19%"><bean:message key="label.liquidation.npl.npldate"/></td>
                        <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.nplstatus"/></td>
                        <td class="fieldname" width="33%"><bean:message key="label.global.action"/></td>
                      </tr>
                    </thead>
                    <tbody>
                        <% int rowIdx = 0;%>
                        <logic:present name="nplInfo" >
                        <logic:iterate id="obNPL" name="nplInfo"  type= "com.integrosys.cms.app.liquidation.bus.OBNPLInfo">
                      <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index"><%=rowIdx%></td>
                        <td><integro:empty-if-null value="<%=obNPL.getAccountNo()%>"/>&nbsp;</td>
                        <td><integro:date object="<%=obNPL.getNplDate()%>" />&nbsp;</td>
                        <td><%=obNPL.getStatus()%>&nbsp;</td>
                        <td style="text-align:center">
                          <select name="actionTypeName" onchange="callSubmit(this,'<%=obNPL.getNplID()%>')">
                            <option>Please Select</option>
                            <option value="<%=LiquidationAction.EV_VIEW_NPL_INFO%>">View</option>
                         </select>
                        </td>
                      </tr>
                        </logic:iterate>
                        </logic:present>
                   <% if (nplInfo == null || nplInfo.size() == 0) {%>
                      <tr class="odd">
                          <td colspan="5"><bean:message key="label.no.records.found"/></td>
                      </tr>
                    <%}%>
                    </tbody>
                </table>
              </td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <%// End of NPL table%>
      <!-- Begin Section -->

      <tr>
        <td colspan=3 width="75%">
            <h3><bean:message key="label.liquidation.npl.recovery.expense.details"/></h3>
        </td>
      </tr>
      <tr>
        <td colspan=3><hr/></td>
      </tr>
      <tr>
        <td colspan=3>
        <!-- Maker table-->

          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
                        <thead>
                          <tr>
                            <td class="fieldname" width="1%" >S/N</td>
                            <td class="fieldname" width="27%"><bean:message key="label.liquidation.npl.expense.type"/></td>
                            <td class="fieldname" width="19%"><bean:message key="label.liquidation.npl.date.of.expense"/></td>
                            <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.amount"/></td>
                            <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.settled"/></td>
                            <td class="fieldname" width="20%"><bean:message key="label.global.action"/></td>
                          </tr>
                        </thead>
                        <tbody>
                     <%
                        if (stagingExpArray != null) {
                        	List res = CompareOBUtil.compOBArray(stagingExpArray, expArray);
                        	CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
                        	
                            Arrays.sort(resultList, new Comparator() {
                                public int compare(Object o1, Object o2) {
                                    long long1 = ((OBRecoveryExpense)((CompareResult)o1).getObj()).getRefID();
                                    long long2 = ((OBRecoveryExpense)((CompareResult)o2).getObj()).getRefID();
                                    return (int)(long2 - long1);
                                }});
                            
                            ArrayList expenseList = new ArrayList(Arrays.asList(resultList));
                            pageContext.setAttribute("expenseList",expenseList);
                      %>
                      <logic:present name="expenseList" >
		   			  <logic:iterate id="compResult" name="expenseList"  type="com.integrosys.base.techinfra.diff.CompareResult" indexId="indexId"  >
		   			  <%  OBRecoveryExpense expenseTemp = (OBRecoveryExpense) compResult.getObj();
		   			  	  int index = indexId.intValue();
			   			  String expenseAmount = "-";
	                		
	                	  if (expenseTemp.getExpenseAmount() != null) {
	                	  	expenseAmount = expenseTemp.getExpenseAmtCurrency();
	                		expenseAmount += " " + MapperUtil.mapDoubleToString(expenseTemp.getExpenseAmount().getAmount(), 3, locale);
	                	  }
           			  %>
                      <tr class='<%=(index%2==0?"even":"odd")%>' >
                        <td class='<bean:write name="compResult" property="key" />'><%=(index+1)%></td>
                        <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_LIQ_EXPENSE_TYPE,expenseTemp.getExpenseType())%>"/>&nbsp;</td>
                        <td><integro:date object="<%=expenseTemp.getDateOfExpense()%>" />&nbsp;</td>
                        <td><integro:empty-if-null value="<%=expenseAmount%>"/>&nbsp; </td>
                        <td>&nbsp;<%=(expenseTemp.getSettled() == null) ? "No" : ((expenseTemp.getSettled().equals("Y")) ? "Yes" : "No") %></td>
                        <td style="text-align:center">
                          <select name="actionTypeName" onchange="callSubmit(this,'<%=index%>')">
                            <option>Please Select</option>
                            <option value="<%=LiquidationAction.EV_VIEW_RECOVERY_EXPENSE%>">View</option>
                         </select>
                        </td>
                      </tr>
                        </logic:iterate>
                    	</logic:present>
                       <%}%>
                        <% if ((stagingExpArray == null || stagingExpArray.length == 0) &&
                        		(expArray == null || expArray.length == 0)) {%>
                      <tr class="odd">
                          <td colspan="6"><bean:message key="label.no.records.found"/></td>
                      </tr>
                    <%}%>
                        </tbody>
                    </table>
         </td>
      </tr>
      
      <tr>
        <td>&nbsp;</td>
      </tr>
      <% DefaultLogger.debug(this,">>>Debug:::011"); %>
      <tr>
        <td colspan="3" width="75%">
            <h3><bean:message key="label.liquidation.npl.recovery.details"/></h3>
        </td>
      </tr>
      <tr>
        <td colspan=3><hr/></td>
      </tr>

      <tr>
        <td colspan="3">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
              <tr class="even">
                <td class="fieldname" width="1%" >S/N</td>
                <td class="fieldname" width="27%"><bean:message key="label.liquidation.npl.recovery.type"/></td>
                <!-- <td class="fieldname" width="19%"><bean:message key="label.liquidation.npl.recovery.date"/></td -->
                <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.total.amount.recovered"/></td>
                <td class="fieldname" width="20%"><bean:message key="label.global.action"/></td>
              </tr>
            </thead>
            <tbody>
            <%  DefaultLogger.debug(this, " >>>DEBUG:::008 number of  stagingRecArray elements are : "+stagingRecArray.length );
	            Amount totalIncome = null;
	            Amount grandTotalIncome = null;
	            
                if (stagingRecArray != null) {
                	List res = CompareOBUtil.compOBArray(stagingRecArray, recArray);
                	CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
                	
                	// sort result
                    Arrays.sort(resultList, new Comparator() {
                        public int compare(Object o1, Object o2) {
                            long long1 = ((OBRecovery)((CompareResult)o1).getObj()).getRefID();
                            long long2 = ((OBRecovery)((CompareResult)o2).getObj()).getRefID();
                            return (int)(long2 - long1);
                        }});
                    
                    ArrayList recoveryList = new ArrayList(Arrays.asList(resultList));
                    pageContext.setAttribute("recoveryList",recoveryList);
            %>
                     <logic:present name="recoveryList" >
		   			  <logic:iterate id="compResult" name="recoveryList"  type="com.integrosys.base.techinfra.diff.CompareResult" indexId="indexId"  >
		   			  <%  OBRecovery recoveryTemp = (OBRecovery) compResult.getObj();
		   			  	  int index = indexId.intValue();
           			  
                	    
                    totalIncome = null;
                    if (recoveryTemp.getRecoveryIncome() != null)
                        for (Iterator iterator = recoveryTemp.getRecoveryIncome().iterator(); iterator.hasNext();) {
                            OBRecoveryIncome oincome = (OBRecoveryIncome) iterator.next();
                            if (grandTotalIncome != null && oincome.getTotalAmountRecovered() != null)
                                grandTotalIncome.addToThis(oincome.getTotalAmountRecovered());
                            else if (grandTotalIncome == null )
                            	grandTotalIncome = new Amount (oincome.getTotalAmountRecovered().getAmount(), oincome.getTotalAmountRecovered().getCurrencyCode());
                            
                            if (totalIncome != null && oincome.getTotalAmountRecovered() != null)
                            	totalIncome.addToThis(oincome.getTotalAmountRecovered());
                            else if (totalIncome == null )
                                totalIncome = new Amount (oincome.getTotalAmountRecovered().getAmount(), oincome.getTotalAmountRecovered().getCurrencyCode());
                            
                        }
                        System.out.println("totalIncome = " + totalIncome);                    
                    
                    //DefaultLogger.debug(this, ">>>Debug::: FROM JSP - Liquidation liquidation_checker_edit.jsp : parameterDifferenceFound ? = " + differenceFound );
            %>

		                <tr class='<%=(index%2==0?"even":"odd")%>' >
		                  <td class='<bean:write name="compResult" property="key" />'><%=(index+1)%></td>
		                  <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_LIQ_RECOVERY_TYPE,recoveryTemp.getRecoveryType())%>"/>&nbsp;</td>
		                  <td align="right"><integro:currency amount="<%=totalIncome%>"/>&nbsp;</td>
		                  <td style="text-align:center">
		                    <select name="actionTypeName" onchange="callSubmit(this,'<%=index%>')">
		                      <option>Please Select</option>
		                      <option value="<%=LiquidationAction.EV_VIEW_RECOVERY%>">View</option>
		                    </select>
		                  </td>
		                </tr>
                	</logic:iterate>
                	</logic:present>
                <%}%>

            <% if (stagingRecArray == null || stagingRecArray.length == 0) {%>
              <tr class="odd">
                <td colspan="5"><bean:message key="label.no.records.found"/></td>
              </tr>
            <%}%>
              <tr class="even">
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;<integro:currency amount="<%=grandTotalIncome%>"/></td>
                <td class="total">&nbsp;</td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>

          <!-- End Section -->


      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>
      <%
          System.out.println("before Remarks section");
        String paramUID = "";
        String paramRemarks = "";
        if (obTrxValue != null){
            paramUID = obTrxValue.getUserInfo();
            paramRemarks = obTrxValue.getRemarks();
        }
        if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
          paramRemarks=" ";
        }
      %>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr>
              <td width="43%" class="fieldname">Remarks</td>
              <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
            </tr>
            <tr>
              <td class="fieldname">Last Action By</td>
              <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Last Remarks Made</td>
              <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>
<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:todo()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</body>

</html:form>
<!-- InstanceEnd --></html>

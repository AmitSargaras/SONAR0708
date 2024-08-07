<%@ page import="java.util.HashMap,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.common.CurrencyList, 
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.creditriskparam.trx.internallimit.IInternalLimitParameterTrxValue,
                 com.integrosys.cms.app.creditriskparam.trx.internallimit.OBInternalLimitParameterTrxValue,
                 com.integrosys.cms.ui.creditriskparam.internallimit.list.InternalLmtParameterForm,
                 com.integrosys.cms.ui.creditriskparam.internallimit.list.InternalLmtParamAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.text.DecimalFormat,
                 java.text.NumberFormat,
                 java.util.List,
                 com.integrosys.cms.app.creditriskparam.bus.internallimit.IInternalLimitParameter,
                 com.integrosys.cms.app.creditriskparam.bus.internallimit.OBInternalLimitParameter,
                 com.integrosys.cms.ui.creditriskparam.internallimit.list.InternalLmtParameterMapper,
                 com.integrosys.cms.ui.common.InternalLimitParamBankEntityList"%>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
    List  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.creditriskparam.internallimit.InternalLimitAction.internalLmtParamTrxValue");
    DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP.....>" + obj );
    InternalLmtParameterForm aForm = (InternalLmtParameterForm) request.getAttribute("InternalLmtParameterForm");
    DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP got aForm:::::" + aForm);
    
    OBInternalLimitParameterTrxValue obTrxValue = null;
    DefaultLogger.debug(this, "@@@Debug:::obTrxValue:::" + obTrxValue);
    
    String event = request.getParameter("event");
    DefaultLogger.debug(this, "@@@Debug:::event:::" + event);
    
    boolean entries_editable = false;
    boolean isRejected = false;
    
		int sno = 0;

    //CurrencyList currencyList = CurrencyList.getInstance();
   // HashMap currenciesMap = currencyList.getCurrencyList();
    
    if( obj!=null ) {
    	DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.OBInternalLimitParameterTrxValue");
        obTrxValue = (OBInternalLimitParameterTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( request.getParameter("event").equalsIgnoreCase("maker_prepare_close") || request.getParameter("event").equalsIgnoreCase("to_track")) {
           parametersArray = obTrxValue.getStagingILPList();
           DefaultLogger.debug(this, "@@@Debug:::getStagingILPList:::" + parametersArray);
        } else {
           parametersArray = obTrxValue.getActualILPList();
           DefaultLogger.debug(this, "@@@Debug:::getActualILPList:::" + parametersArray);
        }
        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.size());
        }
    }  
    
    InternalLimitParamBankEntityList iLPBankEntityList = InternalLimitParamBankEntityList.getInstance();
  
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script language="JavaScript" src="js/itgCheckForm.js"></script>
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

function goToPage() {
    document.forms[0].action = "InternalLimitList.do?event=maker_edit_internallimit";
    document.forms[0].submit();
}

function closeEditRejected() {
    document.forms[0].action = "InternalLimitList.do?event=maker_close_internalLmt_confirm";
    document.forms[0].submit();
}

//-->
</script>
</head>

<html:form action="InternalLimitList.do">
<input type="hidden" name="event" value="internal_limit_list"/>
	
<body>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
      	<table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
		    <tr>
		      <td>&nbsp;</td>
		    </tr>
          <tr>
      		<td width="60%"><h3><bean:message key="title.internallimit.list"/></h3></td>
      		<% 
      			if(event.equals("internal_limit_list")){
	      			%>
            <td width="40%" valign="baseline" align="right"> <input type="button" value=" Edit " class="btnNormal" onclick="goToPage()"/>
            </td>
            <%}%>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="4%"><bean:message key="label.global.sno"/></td>
              <td width="28%"><bean:message key="label.group.description"/></td>
              <td width="17%"><bean:message key="label.crp.capital.fund.amt"/></td>
              <td width="17%"><bean:message key="label.crp.total.loan.adv.amt"/></td>
              <td width="17%"><bean:message key="label.crp.gp5.limit.percentage"/></td>
              <td width="17%"><bean:message key="label.crp.internal.limit.percentage"/></td>
            </tr>
          </thead>
          <tbody>
          <%
             if(parametersArray != null){
	             for(sno=0; sno<parametersArray.size(); sno++){
          %>
          
          <%
		       		String rowClass="";
		       		//sno++;
		      		if(sno%2!=0){
		           		rowClass="odd";
		       		}else{
		           		rowClass="even";
		       		}
		       		
		       		//NumberFormat formatter = new DecimalFormat("##");
		       		NumberFormat formatter = new DecimalFormat("#,###,###");
   		    %>
            <tr class="<%=rowClass%>">
                <td class="index"><%=sno+1%></td>
                <td><integro:empty-if-null value="<%=iLPBankEntityList.getILPBankEntityName(((OBInternalLimitParameter)parametersArray.get(sno)).getDescriptionCode())%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=((OBInternalLimitParameter)parametersArray.get(sno)).getCapitalFundAmountCurrencyCode()%>"/>&nbsp;
                		<integro:empty-if-null value="<%=formatter.format(((OBInternalLimitParameter)parametersArray.get(sno)).getCapitalFundAmount())%>"/>&nbsp;
                </td>
                <td><integro:empty-if-null value="<%=((OBInternalLimitParameter)parametersArray.get(sno)).getTotalLoanAdvanceAmountCurrencyCode()%>"/>&nbsp;
                    <integro:empty-if-null value="<%=formatter.format(((OBInternalLimitParameter)parametersArray.get(sno)).getTotalLoanAdvanceAmount())%>"/>&nbsp;
                </td>
                <td><integro:empty-if-null value="<%=String.valueOf(((OBInternalLimitParameter)parametersArray.get(sno)).getGp5LimitPercentage())%>"/>&nbsp;%</td>
                <td><integro:empty-if-null value="<%=String.valueOf(((OBInternalLimitParameter)parametersArray.get(sno)).getInternalLimitPercentage())%>"/>&nbsp;%</td>
            </tr>
          <%
              }
            }
          %>         
          
				    <%if(sno == 0) { %>
							<tr class="odd">
								<td colspan="6" ><bean:message key="label.global.not.found"/></td>
							</tr>
						<% }%>
               	
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

<%
 if("maker_prepare_close".equals(event)){
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
  
  			<tr class="even">
  			        <td class="fieldname"><bean:message key="label.last.action.by"/></td>
               	<td><%=obTrxValue.getUserInfo()%>&nbsp;</td>
        </tr>
        <tr class="odd">
                <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                <td><integro:wrapper value="<%=obTrxValue.getRemarks()%>"/>&nbsp;</td>
        </tr>

  </tbody>
</table>
<%
	}
%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <%if("to_track".equals(event)){%>
	   <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}else if("maker_prepare_close".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}%>

  </tr>
</table>


</body>
</html:form>
</html>
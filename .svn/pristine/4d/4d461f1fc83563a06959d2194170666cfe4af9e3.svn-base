<%@ page import="java.util.HashMap,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.common.CurrencyList, 
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.creditriskparam.trx.internalcreditrating.IInternalCreditRatingTrxValue,
                 com.integrosys.cms.app.creditriskparam.trx.internalcreditrating.OBInternalCreditRatingTrxValue,
                 com.integrosys.cms.ui.creditriskparam.internalcreditrating.InternalCreditRatingForm,
                 com.integrosys.cms.ui.creditriskparam.internalcreditrating.InternalCreditRatingAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.text.DecimalFormat,
                 java.text.NumberFormat,
                 com.integrosys.cms.app.creditriskparam.bus.internalcreditrating.IInternalCreditRating,
                 com.integrosys.cms.app.creditriskparam.bus.internalcreditrating.OBInternalCreditRating,
                 com.integrosys.cms.ui.creditriskparam.internalcreditrating.InternalCreditRatingMapper"%>
                 
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    InternalCreditRatingForm actionForm = (InternalCreditRatingForm) request.getAttribute("InternalCreditRatingForm");
     DefaultLogger.debug(this, "@@@Debug1::::::::" + actionForm);
    IInternalCreditRatingTrxValue trxVal = (IInternalCreditRatingTrxValue) session.getAttribute("com.integrosys.cms.ui.creditriskparam.internalcreditrating.InternalCreditRatingAction.internalCreditRatingTrxObj");
    
    if( trxVal != null ) {
        IInternalCreditRatingTrxValue obTrxValue = (OBInternalCreditRatingTrxValue)trxVal;		
	  }	

    DefaultLogger.debug(this, "@@@Debug2::::::::" + actionForm);
    
     String from_event = "maker_prepare_close";
     boolean isProcess = false;
     boolean isTrack = false;
     String forward_event = (String)request.getParameter("event");
     DefaultLogger.debug(this, "Debug3::::"+ forward_event);
     if ("to_track".equals(forward_event)) 
     {
        from_event = "to_track";
        isTrack = true;
     }
    
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
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

function submitPage()
{
        document.forms[0].event.value = "maker_close_internalCreditrating_confirm";
        document.forms[0].submit();
}

//-->
</script>
</head>
<body>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">
<!-- Content -->

<html:form action="InternalCreditRatingParam.do">
<input type="hidden" name="event" value="" />
<input type="hidden" name="fromEvent" value=""/>

<bean:define id="formObj" name="InternalCreditRatingForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.internalcreditrating.InternalCreditRatingForm"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
     
    <thead>
        <tr>
            <td height="60"><h3><bean:message key="title.crp.list.internal.credit.rating.name"/></h3></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2"><hr/>
            </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
					          <thead>
					            <tr class="tblInfo">
					              <td width="4%"><bean:message key="label.global.sno"/></td>
					              <td width="31%"><bean:message key="label.crp.internal.credit.rating.grade"/></td>
					              <td width="45%"><bean:message key="label.crp.internal.credit.rating.limit.amt"/></td>
					            </tr>
                    </thead>
                    <tbody>
                        <% NumberFormat formatter = new DecimalFormat("#,###,###"); %>
                        <bean:define id="itemSize" value="<%= String.valueOf(formObj.getInternalCreditRatingItemList().size()) %>"/>
                        <logic:notEqual name="itemSize" value="0">
	                          <logic:iterate id="item" indexId="itemInd" name="InternalCreditRatingForm" 
																property="internalCreditRatingItemList" scope="request" type="java.lang.Object">
																	
															<%
	                                String headerClass = "index";
	                                IInternalCreditRating creditRatingItem = null;
                                        if (item instanceof CompareResult) {
                                            creditRatingItem = (IInternalCreditRating) ((CompareResult) item).getObj();
                                            headerClass = ((CompareResult) item).getKey();
                                        } else {
                                            creditRatingItem = (IInternalCreditRating) item;
                                        } 
                              %>
										
                                <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
                                    <td class="<%=headerClass%>" valign="top"><%=itemInd.intValue() + 1 %>
                                    </td>
                                    <td>&nbsp;<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.INTERNAL_CREDIT_GRADE,(creditRatingItem.getIntCredRatCode()))%>"/>
                                    </td>
                                    <td>&nbsp;<integro:empty-if-null value="<%=String.valueOf(formatter.format(creditRatingItem.getIntCredRatLmtAmt()))%>"/> 
																		</td>
                                </tr>
                            </logic:iterate>
                        </logic:notEqual>
                        <logic:equal name="itemSize" value="0">
	                                <tr class="odd">
	                                    <td colspan="8"><bean:message key="label.no.records.found"/></td>
	                                </tr>
	                     </logic:equal> 

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
    if (!isTrack) {
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
  			<tr class="odd">
  			        <td class="fieldname"><bean:message key="label.last.action.by"/></td>
               	<td><%=trxVal.getUserInfo()%>&nbsp;</td>
        </tr>
        <tr class="even">
                <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                <td><integro:wrapper value="<%=trxVal.getRemarks()%>"/>&nbsp;</td>
        </tr>
  </tbody>
</table>
<%
   }
%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
  
    <% if (isTrack) { %>
       <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
       <td>&nbsp;</td>
    <% } else { %>
       <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
       <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } %>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
</td>
</tr>
<!-- End Content -->

<!-- General Purpose Bar -->

<tr>
    <td height="25">

    </td>
</tr>

</table>

</body>
</html>
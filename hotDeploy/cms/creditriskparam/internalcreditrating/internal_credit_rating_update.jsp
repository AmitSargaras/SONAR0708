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
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%

boolean isRejected = false;

    InternalCreditRatingForm actionForm = (InternalCreditRatingForm) request.getAttribute("InternalCreditRatingForm");
     DefaultLogger.debug(this, "@@@Debug1::::::::" + actionForm);
    IInternalCreditRatingTrxValue trxVal = (IInternalCreditRatingTrxValue) session.getAttribute("com.integrosys.cms.ui.creditriskparam.internalcreditrating.InternalCreditRatingAction.internalCreditRatingTrxObj");
     DefaultLogger.debug(this, "@@@Debug2::::::::" + trxVal);
     
     String fromEvent = request.getParameter("fromEvent");
     DefaultLogger.debug(this, "@@@Debug3::::::::" + fromEvent);
     
    String status = "";
    if( trxVal != null ) {
        IInternalCreditRatingTrxValue obTrxValue = (OBInternalCreditRatingTrxValue)trxVal;
		    status = obTrxValue.getStatus();
	}	
     
    
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
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

function addNew() {
    //document.forms[0].action = 
   // document.forms[0].submit();
    
    document.forms[0].fromEvent.value = 'update';
    document.forms[0].indexID.value = '';
    document.forms[0].action = "InternalCreditRatingParam.do?event=maker_create_item";
    document.forms[0].submit();
}

    
function remove() {
     document.forms[0].event.value = "maker_delete_item"
     document.forms[0].submit();
}


function updateItem(ind){
		
        document.forms[0].fromEvent.value = 'update';
        document.forms[0].indexID.value = ind;
        document.forms[0].event.value = "maker_edit_item";
        document.forms[0].submit();
}

function submitPage(){  				
		document.forms[0].event.value = "maker_submit_internalCreditrating";	
		document.forms[0].submit();		
}
    
function cancel(){  				
		document.forms[0].action = "Welcome.do?event=prepare";
    document.forms[0].submit();
}

//-->
</script>
</head>

<html:form action="InternalCreditRatingParam.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="fromEvent" value=""/>
<input type="hidden" name="indexID" value=""/>
    
<bean:define id="formObj" name="InternalCreditRatingForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.internalcreditrating.InternalCreditRatingForm"/>
<body>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="80%" valign="bottom">
      	<table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
		    <tr>
		      <td>&nbsp;</td>
		    </tr>
          <tr>
		      		<td width="60%"><h3><bean:message key="title.crp.list.internal.credit.rating.name"/></h3></td>
		      		
		      		<td align="right" valign="baseline">
		                  <input type="button" value="Add New" class="btnNormal" onclick="addNew()"/>
		                  &nbsp;
		                  <input type="button" value="Remove" class="btnNormal" onclick="remove()"/>
		                  
		          </td>
		          
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
      <td><html:errors property="deleteItems"/>
      	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="4%"><bean:message key="label.global.sno"/></td>
              <td width="33%"><bean:message key="label.crp.internal.credit.rating.grade"/></td>
              <td width="23%"><bean:message key="label.crp.internal.credit.rating.limit.amt"/></td>
              <td width="20%"><bean:message key="label.global.action"/></td>
              <td width="20%"><bean:message key="label.global.delete"/></td>
            </tr>
          </thead>
          <tbody>
          							<bean:define id="itemSize" value="<%= String.valueOf(formObj.getInternalCreditRatingItemList().size()) %>"/>
          							     <%DefaultLogger.debug(this, "@@@Debug3::::::::" + formObj.getInternalCreditRatingItemList().size());
          							       NumberFormat formatter = new DecimalFormat("#,###,###");
          							     %>
	                            <logic:notEqual name="itemSize" value="0">
	                                <logic:iterate id="item" indexId="itemInd" name="InternalCreditRatingForm" 
																			property="internalCreditRatingItemList" scope="request" 
																			type="com.integrosys.cms.app.creditriskparam.bus.internalcreditrating.IInternalCreditRating">
	                                    
	                                    <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                                        <td class="index">
	                                            <%= itemInd.intValue() + 1 %>
	                                        </td>                                        
	                                        <td>
	                                           <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.INTERNAL_CREDIT_GRADE, item.getIntCredRatCode())%>"/>  
	                                        </td>
	                                        <td>
	                                            &nbsp;<integro:empty-if-null value="<%=item.getIntCredRatLmtAmtCurCode() %>"/>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf(formatter.format(item.getIntCredRatLmtAmt())) %>"/>
	                                        </td>	
	                                        <td style="text-align:center">
	                                            <a href="javascript:updateItem('<%= itemInd.intValue() %>')">Edit</a>
	                                        </td>
	                                        <td style="text-align:center">
	                                            <html:multibox property="deletedItemList" value="<%= itemInd.toString() %>"/>
	                                            &nbsp;
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
    <tr><td><html:errors property="internalCreditRatingList"/></td></tr>
  </tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	    <tr><td>&nbsp;</td></tr>
	    <% if ( status.equals( ICMSConstant.STATE_REJECTED_CREATE ) || 
				      status.equals( ICMSConstant.STATE_REJECTED_UPDATE ) || 
				      status.equals( ICMSConstant.STATE_REJECTED_DELETE ) ) { %>
	        <tr>
	            <td colspan="2">
	                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	                    <tbody>
	                        <tr>
	                            <td class="fieldname"><bean:message key="label.remarks"/></td>
	                            <td class="odd">
	                                <html:textarea property="remarks" rows="3" cols="120"/>&nbsp;
	                                <br/>
	                                <html:errors property="remarks"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="fieldname"><bean:message key="label.last.action.by"/></td>
	                            <td class="even"><%=trxVal.getUserInfo()%>&nbsp;</td>
	                        </tr>
	                        <tr class="odd">
	                            <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
	                            <td><integro:wrapper value="<%=trxVal.getRemarks()%>"/>&nbsp;</td>
	                        </tr>
	                    </tbody>
	                </table>
	            </td>
	        </tr>
	    <% } %>
	</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="50%" valign="baseline align="center"><a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a>
        
      <% if ( status.equals( ICMSConstant.STATE_REJECTED_CREATE ) 
           || status.equals( ICMSConstant.STATE_REJECTED_UPDATE )) { %>
			<td width="50%" valign="baseline" align="center"> <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
			<% }else{ %>
			<td width="50%" valign="baseline" align="center"> <a href="javascript:cancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
			<% } %>
        </tr>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</body>
</html:form>
</html>
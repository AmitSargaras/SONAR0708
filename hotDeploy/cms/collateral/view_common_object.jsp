<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
String systemDate= df.format(new Date());
String valDate="";
String nextDate="";
if(newCollateral.getValuationDate()!=null){ 
	valDate=(String)df.format(newCollateral.getValuationDate());
}
if(newCollateral.getNextValDate()!=null){
	nextDate=(String)df.format(newCollateral.getNextValDate());
}
Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
if(iCol.getCollateralCode()!=null){
collCode = iCol.getCollateralCode();
}

%>


<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.base.techinfra.util.DateUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="java.util.*"%><html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<script language="JavaScript" type="text/JavaScript">
    function MM_swapImgRestore() { //v3.0
      var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
    }

    function MM_jumpMenu(targ,selObj,restore){ //v3.0
  	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  	  if (restore) selObj.selectedIndex=0;
  	 
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
</script>
<style type="text/css">
.hiddenDiv {display: none;}.visibleDiv {display: block;	border: 1px grey solid;}.style1 {color: #FF0000}.style5 {color: #FF0000}.style11 {color: #FF0000}</style>
</head>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >

<tbody>
<tr>&nbsp;</tr>

<tr>
    <td colspan="2" align="center">
        <table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
         <%if(!"PropCommGeneralForm".equals(formName)){ %>
	        <tr >   
	        
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"valuationAmount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					Valuation Amount <font color="red">*</font>&nbsp;</td>
					<%if(newCollateral.getValuationAmount()!=null){ %>
	            <td class="even" width="30%">
	            <integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),newCollateral.getValuationAmount())%>" />       
	          </td>
	          <%}else{ %>
	          <td class="even" width="30%">-&nbsp;</td>
	          <%} %>
	          
				<%
			    if("COL0000139".equalsIgnoreCase(collCode))
			    {
					%>
	            	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"valuationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					 CAM Start Date<font color="red">*</font>&nbsp;</td>
					<%
    			}else{
   			    	%>	 
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"valuationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					 Date of Valuation<font color="red">*</font>&nbsp;</td>
					<%
				}
    			%>	 
					 <%if(newCollateral.getValuationDate()!=null && !newCollateral.getValuationDate().equals("")){ %>
	            <td class="even" width="30%"><%=valDate %>&nbsp;
											</td>
				<%}else{ %>
				<td class="even" width="30%">-&nbsp;</td>
				<%} %>
	        </tr>
	        <%} %>
	        <tr >
	        
 
			   <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"commonRevalFreq")?"fieldname":"fieldnamediff"):"fieldname"%>">
			   Revaluation Frequency<font color="red">*</font>&nbsp;</td>
			   <%if(newCollateral.getCommonRevalFreq()!=null && newCollateral.getCommonRevalFreq()!=null){ %>
	           <td class="odd" width="30%">
	        <integro:common-code-single entryCode="<%=newCollateral.getCommonRevalFreq()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
	               </td>
	               <%}else{ %>
	               <td class="odd" width="30%">-&nbsp;</td>
	               <%} %>
			
	          	<%
			    if("COL0000139".equalsIgnoreCase(collCode))
			    {
					%>
	            	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextValDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					CAM Expiry Date<font color="red">*</font>&nbsp;</td>
					<%
    			}else{
   			    	%>	 
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextValDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					Next Valuation Date<font color="red">*</font>&nbsp;</td>
					<%
				}
    			%>
					
					 <%if(newCollateral.getNextValDate()!=null && !newCollateral.getNextValDate().equals("")){ %>
	            <td class="odd" width="30%"><%=nextDate %>&nbsp;
											</td>
				<%}else{ %>
				<td class="odd" width="30%">-&nbsp;</td>
				<%} %>
	             
	        </tr>
			

	        <tr >
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"typeOfChange")?"fieldname":"fieldnamediff"):"fieldname"%>">
					Type Of Charge<font color="red">*</font>&nbsp;</td>
	            <td  class="even" width="30%"><integro:common-code-single entryCode="<%=newCollateral.getTypeOfChange()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.CommonCode_TYPE_CHARGE%>" descWithCode="false" />
	                </td>
	             <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"otherBankCharge")?"fieldname":"fieldnamediff"):"fieldname"%>">
					% of First Charge by Other Bank<font color="red">*</font>&nbsp;</td>
					<%if(newCollateral.getOtherBankCharge()!=null && !newCollateral.getOtherBankCharge().equals("")){ %>
	            <td class="even" width="30%"><%=newCollateral.getOtherBankCharge() %>&nbsp;
											</td>
				<%}else{ %>
				<td class="even" width="30%">-&nbsp;</td>
				<%} %>
	                           
	        </tr>
        
       
        </tbody>
		</table>
	</td>
</tr>
</tbody>
</table>
</html>
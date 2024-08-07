<%@ page import="java.util.HashMap,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.component.common.constant.ICompConstant,
                 java.util.Collection,
                 java.util.List,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.creditriskparam.trx.internallimit.IInternalLimitParameterTrxValue,
                 com.integrosys.cms.app.creditriskparam.trx.internallimit.OBInternalLimitParameterTrxValue,
                 com.integrosys.cms.ui.creditriskparam.internallimit.list.InternalLmtParameterForm,
                 com.integrosys.cms.ui.creditriskparam.internallimit.list.InternalLmtParamAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.creditriskparam.bus.internallimit.IInternalLimitParameter,
                 com.integrosys.cms.app.creditriskparam.bus.internallimit.OBInternalLimitParameter,
                 com.integrosys.cms.ui.creditriskparam.internallimit.list.InternalLmtParameterMapper,
                 java.text.DecimalFormat,
                 java.text.NumberFormat,
                 com.integrosys.cms.ui.common.InternalLimitParamBankEntityList"%>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/systemparameters/assetlife/assetlife_maker_edit.jsp
*
* Describe this JSP.
* Purpose: For Maker to edit Internal Limit Parameters
* Description: changing the Internal Limit Parameters's value
*
* @author $Author: GraceTeh$<br>
* @version $Revision: 1$
* Date: $Date: 29/05/2008$
* Tag: $Name$
*/
%>

<%
    List  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.creditriskparam.internallimit.InternalLimitAction.internalLmtParamTrxValue");
    DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP.....>" + obj );
    InternalLmtParameterForm aForm = (InternalLmtParameterForm) request.getAttribute("InternalLmtParameterForm");
    DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP got aForm:::::" + aForm);
    
    DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP got aForm:::::" + aForm.getInternalLmtDesc());
   
    OBInternalLimitParameterTrxValue obTrxValue = null;
    DefaultLogger.debug(this, "@@@Debug:::obTrxValue:::" + obTrxValue);
    
    String event = request.getParameter("event");
    DefaultLogger.debug(this, "@@@Debug:::event:::" + event);
    
    boolean entries_editable = false;
    boolean isRejected = false;
		int sno = 0;
    double num;

    if( obj!=null ) {
    	DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.OBInternalLimitParameterTrxValue");
        obTrxValue = (OBInternalLimitParameterTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " + obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

       if("maker_edit_internalLmt_reject".equals(event))
       {
	         parametersArray =  obTrxValue.getStagingILPList();
	         
       }
	     else{
           parametersArray = obTrxValue.getActualILPList();
       }
    
        if( parametersArray!=null ) 
        {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.size());
        }
    } 
    else{
	    DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'OBInternalLimitParameterTrxValue' ");
    } 
    
     String regex = "[-]*[0-9]+(\\.[0-9]*)?$";
     
     InternalLimitParamBankEntityList iLPBankEntityList = InternalLimitParamBankEntityList.getInstance();
    
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
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

	 if("maker_edit_internallimit" == "<%=event%>" || "maker_edit_internalLmt_confirm" == "<%=event%>"){
    document.forms[0].action= "InternalLimitList.do?event=maker_edit_internalLmt_confirm";
    }else{
	    document.forms[0].action= "InternalLimitList.do?event=maker_resubmit_edit_internalLmt_confirm&trxID="+<%=obTrxValue.getTransactionID()%>;
    }
   
    document.forms[0].submit();
}

function gotoPreparePage() {
    document.forms[0].action="InternalLimitList.do?event=internal_limit_list";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action="InternalLimitList.do">
<input type="hidden" name="event"/>
<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3><bean:message key="title.internallimit.list"/></h3></td>
  </tr>
  <tr>
    <td>
    <hr />
    </td>

  </tr>
  </thead>
  <tbody>
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
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
		      		if(sno%2!=0){
		           		rowClass="odd";
		       		}else{
		           		rowClass="even";
		       		}
		       		
		       		NumberFormat formatter = new DecimalFormat("##");
              NumberFormat format = new DecimalFormat("#,###,###");
   		    %>
            
            <tr class="<%=rowClass%>">
                <td class="index"><%=sno+1%></td>
                <html:hidden property="internalLmtDesc" value="<%=((OBInternalLimitParameter)parametersArray.get(sno)).getDescriptionCode()%>"/>
                <td><integro:empty-if-null value="<%=iLPBankEntityList.getILPBankEntityName(((OBInternalLimitParameter)parametersArray.get(sno)).getDescriptionCode())%>"/>&nbsp;</td>
                
                <html:hidden property="capitalFundAmtCurrencyCode" value="<%=((OBInternalLimitParameter)parametersArray.get(sno)).getCapitalFundAmountCurrencyCode()%>"/>
                <td><integro:empty-if-null value="<%=((OBInternalLimitParameter)parametersArray.get(sno)).getCapitalFundAmountCurrencyCode()%>"/>&nbsp;
                		
		                <%if(aForm.getCapitalFundAmt()!=null){
		                
		               		 if(!(aForm.getCapitalFundAmt()[sno]).trim().equals("") && (aForm.getCapitalFundAmt()[sno]).matches(regex) && Double.parseDouble(aForm.getCapitalFundAmt()[sno])==(((OBInternalLimitParameter)parametersArray.get(sno)).getCapitalFundAmount())){
			                  
			                  %>
		                 				<html:text property="capitalFundAmt" value="<%=formatter.format(Double.parseDouble(aForm.getCapitalFundAmt()[sno]))%>" size="15" />&nbsp;
		                	<%
	                	     }else
	                	     { 
		                	     %>
		                	     <html:text property="capitalFundAmt" value="<%=aForm.getCapitalFundAmt()[sno]%>" size="15" />&nbsp;
		                	    
		                	     <%
	                	     }
	                	   }
		                   else{
		                %>	
		                <html:text property="capitalFundAmt" value="<%=formatter.format(((OBInternalLimitParameter)parametersArray.get(sno)).getCapitalFundAmount())%>" size="15" />&nbsp;
		                <%}%>
                <% String modifiedCapitalFundAmount = "capitalFundAmt" + sno; %>
                		<html:errors property="<%=modifiedCapitalFundAmount%>"/>
                </td>

                <html:hidden property="totalLoanAdvAmtCurrencyCode" value="<%=((OBInternalLimitParameter)parametersArray.get(sno)).getTotalLoanAdvanceAmountCurrencyCode()%>"/>
                <td><integro:empty-if-null value="<%=((OBInternalLimitParameter)parametersArray.get(sno)).getTotalLoanAdvanceAmountCurrencyCode()%>"/>&nbsp;
                
                <%if(aForm.getTotalLoanAdvAmt()!=null){
			                  if(!(aForm.getTotalLoanAdvAmt()[sno]).trim().equals("") && (aForm.getTotalLoanAdvAmt()[sno]).matches(regex) && Double.parseDouble(aForm.getTotalLoanAdvAmt()[sno])==(((OBInternalLimitParameter)parametersArray.get(sno)).getTotalLoanAdvanceAmount())){
			                          
			                  %>
		                 	     <input type="hidden" name="totalLoanAdvAmt" value="<%=formatter.format(Double.parseDouble(aForm.getTotalLoanAdvAmt()[sno]))%>"/>	
		                 	     <%=format.format(Double.parseDouble(aForm.getTotalLoanAdvAmt()[sno]))%>&nbsp;
		                	<%
	                	     }else
	                	     {
		                	     %>
                             <input type="hidden" name="totalLoanAdvAmt" value="<%=aForm.getTotalLoanAdvAmt()[sno]%>"/>	
                             <%=aForm.getTotalLoanAdvAmt()[sno]%>    &nbsp;
		                	      
		                	     <%
	                	     }
	                	   }
		                   else{
		                %>	

		                <input type="hidden" name="totalLoanAdvAmt" value="<%=formatter.format(((OBInternalLimitParameter)parametersArray.get(sno)).getTotalLoanAdvanceAmount())%>"/>	
		                <%=format.format(((OBInternalLimitParameter)parametersArray.get(sno)).getTotalLoanAdvanceAmount())%>&nbsp;
		                <%}%>
                    <%String modifiedTotalLoanAdvAmt = "totalLoanAdvAmt" + sno; %>
                    <!--html:errors property="<%=modifiedTotalLoanAdvAmt%>"/-->
                </td>
                
                <td>
                <%if(aForm.getGp5LmtPercentage()!=null){%>
		                
		                <html:text property="gp5LmtPercentage" value="<%=aForm.getGp5LmtPercentage()[sno]%>" size="15" />&nbsp;
		                	<%}
		                else{
		                %>	
		                <html:text property="gp5LmtPercentage" value="<%=String.valueOf(((OBInternalLimitParameter)parametersArray.get(sno)).getGp5LimitPercentage())%>" size="15" />&nbsp;%
		                <%}%>
                     
                    <% String modifiedGp5LmtPercentage = "gp5LmtPercentage" + sno; %>
                    <html:errors property="<%=modifiedGp5LmtPercentage%>"/>
                </td>
                
                <td>
                 <%if(aForm.getInternalLmtPercentage()!=null){%>
		                
		                <html:text property="internalLmtPercentage" value="<%=aForm.getInternalLmtPercentage()[sno]%>" size="15" />&nbsp;
		                	<%}
		                else{
		                %>	
		                <html:text property="internalLmtPercentage" value="<%=String.valueOf(((OBInternalLimitParameter)parametersArray.get(sno)).getInternalLimitPercentage())%>" size="15" />&nbsp;%
		                <%}%>
                
                     <% String modifiedInternalLmtPercentage = "internalLmtPercentage" + sno; %>
                    <html:errors property="<%=modifiedInternalLmtPercentage%>"/>
                </td>
                
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
    <tr>
      <td>
       <%if(isRejected ) {
        String paramUID = obTrxValue.getUserInfo();
        String paramRemarks = obTrxValue.getRemarks();
		    if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
    			paramRemarks=" ";
		    }%>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			    <tbody>
				    <tr>
		        	<td width="43%" class="fieldname"><bean:message key="label.remarks"/></td>
			        <td width="57%" class="odd">
			            <html:textarea property="remarks" rows="3" cols="120"/>&nbsp;
									<html:errors property="remarks"/>
							</td>
		    	  </tr>
			      <tr>
		      	    <td class="fieldname"><bean:message key="label.last.action.by"/></td>
			        <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
		          </tr>
		          <tr class="odd">
		            <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
		            <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
		          </tr>
		        </tbody>
			    </table>
        <%}%>
      </td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
         <td width="50%" valign="baseline align="center"><a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a>
         
         <td width="50%" valign="baseline" align="center"> <a href='<%=isRejected?"ToDo.do":"javascript:gotoPreparePage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>

  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>


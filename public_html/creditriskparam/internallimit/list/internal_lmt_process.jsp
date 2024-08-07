<%@ page import="com.integrosys.cms.app.creditriskparam.trx.internallimit.IInternalLimitParameterTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Arrays,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Collection,
                 java.util.HashMap,
                 java.text.DecimalFormat,
                 java.text.NumberFormat,
                 com.integrosys.cms.app.creditriskparam.trx.internallimit.OBInternalLimitParameterTrxValue,
                 com.integrosys.cms.app.creditriskparam.bus.internallimit.OBInternalLimitParameter,
                 com.integrosys.cms.app.creditriskparam.bus.internallimit.IInternalLimitParameter,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.InternalLimitParamBankEntityList"%>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    String event = request.getParameter("event");
    DefaultLogger.debug(this,">>>Debug:::001 event from getParameter internal limit is > "+ event);
   
    OBInternalLimitParameterTrxValue obTrxValue = null;
    Object obj = session.getAttribute("com.integrosys.cms.ui.creditriskparam.internallimit.InternalLimitAction.internalLmtParamTrxValue");
    DefaultLogger.debug(this,">>>Debug:::003 " + obj);
    
    int sno = 0;
    List parametersArray = null ;
    List stagingParametersArray = null ;
    DefaultLogger.debug(this,">>>Debug:::004 ");
   
     if( obj ==null ) {
        out.println("Expected session parameter 'internalLmtParamTrxValue' is missing.");
        return;
    }
    DefaultLogger.debug(this,">>>Debug:::005 ");
    obTrxValue = (OBInternalLimitParameterTrxValue)obj;

    parametersArray = obTrxValue.getActualILPList();
    stagingParametersArray = obTrxValue.getStagingILPList();
   
    DefaultLogger.debug(this,">>>Debug:::006 " + stagingParametersArray);
    
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
    document.forms[0].action = "InternalLimitList.do?event=checker_approve_internalLmt";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action = "InternalLimitList.do?event=checker_reject_internalLmt";
    document.forms[0].submit();
}
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action="InternalLimitList.do">
<input type="hidden" name="event" value="checker_process_internalLmt"/>
	
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
            if(stagingParametersArray != null){
	             for(sno=0; sno<stagingParametersArray.size(); sno++){
		             
		              IInternalLimitParameter stagingParameter = (IInternalLimitParameter)stagingParametersArray.get(sno);
                  IInternalLimitParameter parameter = (IInternalLimitParameter)parametersArray.get(sno);
                  boolean differenceFound1 = !( CompareOBUtil.compOB(stagingParameter,parameter,"capitalFundAmount"));
                  boolean differenceFound2 = !( CompareOBUtil.compOB(stagingParameter,parameter,"totalLoanAdvanceAmount"));
                  boolean differenceFound3 = !( CompareOBUtil.compOB(stagingParameter,parameter,"gp5LimitPercentage"));
                  boolean differenceFound4 = !( CompareOBUtil.compOB(stagingParameter,parameter,"internalLimitPercentage"));
                  
                  boolean diff = false;
                  if(differenceFound1 == true || differenceFound2 == true || differenceFound3 == true || differenceFound4 == true){
	                  diff = true;
                  }   
          %>
          
          <%
		       		String rowClass="";
		      		if(sno%2!=0){
		           		rowClass="odd";
		       		}else{
		           		rowClass="even";
		       		}
		       		
		       	//	NumberFormat formatter = new DecimalFormat("##");
		       	NumberFormat formatter = new DecimalFormat("#,###,###");
   		    %>  		    
   	      
            <tr class="<%=rowClass%>">
                <td class='<%=diff?"indexdiff":"index"%>'><%=sno+1%></td>
                <td><integro:empty-if-null value="<%=iLPBankEntityList.getILPBankEntityName(((OBInternalLimitParameter)stagingParametersArray.get(sno)).getDescriptionCode())%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=((OBInternalLimitParameter)stagingParametersArray.get(sno)).getCapitalFundAmountCurrencyCode()%>"/>&nbsp;
                		<integro:empty-if-null value="<%=formatter.format(((OBInternalLimitParameter)stagingParametersArray.get(sno)).getCapitalFundAmount())%>"/>&nbsp;
                </td>
                <td><integro:empty-if-null value="<%=((OBInternalLimitParameter)stagingParametersArray.get(sno)).getTotalLoanAdvanceAmountCurrencyCode()%>"/>&nbsp;
                    <integro:empty-if-null value="<%=formatter.format(((OBInternalLimitParameter)stagingParametersArray.get(sno)).getTotalLoanAdvanceAmount())%>"/>&nbsp;
                </td>
                <td><integro:empty-if-null value="<%=String.valueOf(((OBInternalLimitParameter)stagingParametersArray.get(sno)).getGp5LimitPercentage())%>"/>&nbsp;%</td>
                <td><integro:empty-if-null value="<%=String.valueOf(((OBInternalLimitParameter)stagingParametersArray.get(sno)).getInternalLimitPercentage())%>"/>&nbsp;%</td>
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
    	    <%
						    String paramUID = obTrxValue.getUserInfo();
						    String paramRemarks = obTrxValue.getRemarks();
						    if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
						    	paramRemarks=" ";
						    }    
				  %>
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
    	</td>
    </tr>
    
  </tbody>
</table>

<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="#" onclick="approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80"
                                                                                                                                               height="20" border="0" id="Image8"/></a></td>
        <td><a href="#" onclick="rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70"
                                                                                                                                             height="20" border="0" id="Image9"/></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10"/></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</body>
</html:form>
</html>
<%@ page import="com.integrosys.cms.app.collateral.trx.parameter.ICollateralSubTypeTrxValue,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.srp.global.SRPGlobalConstants,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Collection,
                 java.util.HashMap,
                 com.integrosys.cms.app.collateral.trx.parameter.OBCollateralSubTypeTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateralSubType,
                 com.integrosys.cms.ui.srp.SRPHelper,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String event = request.getParameter("event");
    String approveEvent=null;
    String rejectEvent=null;
    String cancelEvent="checker_view";

    if(event.equals("checker_add_read")){
        approveEvent="checker_approve_add";
        rejectEvent="checker_reject_add";
    }else if(event.equals("checker_edit_read")){
        approveEvent="checker_approve_edit";
        rejectEvent="checker_reject_edit";
    }else if(event.equals("checker_delete_read")){
        approveEvent="checker_approve_delete";
        rejectEvent="checker_reject_delete";
    }
    OBCollateralSubTypeTrxValue obTrxValue = null;
    Object trxObjFromSession = session.getAttribute("com.integrosys.cms.ui.srp.global.SRPGlobalAction.CollateralSubTypeTrxValue");
    ICollateralSubType[]  parametersArray = null ;
    ICollateralSubType[]  stagingParametersArray = null ;
    if( trxObjFromSession ==null ) {
        out.println("Expected session parameter 'CollateralSubTypeTrxValue' is missing.");
        return;
    }
    obTrxValue = (OBCollateralSubTypeTrxValue)trxObjFromSession;

    parametersArray = obTrxValue.getCollateralSubTypes();

    stagingParametersArray = obTrxValue.getStagingCollateralSubTypes();
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
    document.forms[0].action='<%=SRPGlobalConstants.ACTION_URL+"?event="+approveEvent%>';
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action='<%=SRPGlobalConstants.ACTION_URL+"?event="+rejectEvent%>';
    document.forms[0].submit();
}
function cancelPage(){
    //document.forms[0].action='<%=SRPGlobalConstants.ACTION_URL+"?event="+cancelEvent%>';
    //document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action='<%=SRPGlobalConstants.ACTION_URL+"?event=maker_cncl_reject_edit"%>';
    document.forms[0].submit();
}
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action="SRPGlobal.do?" >
<body>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>&nbsp;</td>
    </tr>  	
    <tr>
			<td><h3>Process SRP - Global Parameter and Eligible Security - <%=obTrxValue.getCollateralSubTypes()[0]!=null?obTrxValue.getCollateralSubTypes()[0].getTypeName():"SECURITY_SUBTYPE_IS_NULL"%></h3></td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="10%">S/N</td>
              <td width="50%">Description</td>
              <td width="10%">Max %&nbsp;<font color="#00AAFF">* </font></td>
							<td width="10%">Standardised Approach</td>
              <td width="10%">Foundation IRB</td>
              <td width="10%">Advanced IRB</td>
            </tr>
          </thead>
          <tbody>
          <%
              for (int i = 0; i < stagingParametersArray.length; i++)
              {
                  ICollateralSubType stagingParameter = stagingParametersArray[i];
                  ICollateralSubType parameter = parametersArray[i];
                  boolean differenceFound = false;
									if(!CompareOBUtil.compOB(stagingParameter,parameter,"maxValue")||
									   !CompareOBUtil.compOB(stagingParameter,parameter,"subTypeStandardisedApproach")||
										 !CompareOBUtil.compOB(stagingParameter,parameter,"subTypeFoundationIRB")||
										 !CompareOBUtil.compOB(stagingParameter,parameter,"subTypeAdvancedIRB")){
									  differenceFound = true;
									}
          %>
            <tr class='<%=(i%2==0?"even":"odd")%>' >
            <%if(obTrxValue.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)){%>
                <td class='<%=differenceFound?"indexdiff":"index"%>'><%=(i+1)%></td>
                <%}else {%>
                <td><%=(i+1)%></td>
                <%}%>
                <td><%=stagingParameter.getSubTypeDesc()%></td>
                <td style="text-align:right;padding-right:5px"><%=ConvertFloatToString.getInstance().convertDouble(stagingParameter.getMaxValue())%> </td>
  							<td style="text-align:center"><input name="subTypeStandardisedApproach" disabled type="checkbox" value='<%=i%>' <%if(stagingParameter.getSubTypeStandardisedApproach()){ %> checked <% } %> /></td>
  							<td style="text-align:center"><input name="subTypeFoundationIRB" disabled type="checkbox" value='<%=i%>' <%if(stagingParameter.getSubTypeFoundationIRB()){ %> checked <% } %> /></td>
  							<td style="text-align:center"><input name="subTypeAdvancedIRB" disabled type="checkbox" value='<%=i%>' <%if(stagingParameter.getSubTypeAdvancedIRB()){ %> checked <% } %> /></td>
            </tr>
          <%
              }
          %>
          </tbody>
        </table></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
      <td>
        <jsp:include page="../srp_remarks_section_include.jsp" flush="true" >
           <jsp:param name="UID" value='<%=obTrxValue.getUserInfo()%>' />
           <jsp:param name="remarks" value='<%=obTrxValue.getRemarks()%>' />
        </jsp:include>
      </td>
    </tr>
  </tbody>
</table>
<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr>
<%	
	if((event!=null) && !(event.equals("to_track"))) {
		if(obTrxValue.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)) {
%>
    <td><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
<%
		} else {
%>
	<td>&nbsp;</td>
	<td><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
	<td width="100" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
<%
		}
	} else {
%>
	<td width="100" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
<%
	}
%>
  </tr>
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr><td colspan="3">&nbsp;</td></tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.component.commondata.app.trx.IBusinessParameterGroupTrxValue,
                 com.integrosys.component.commondata.app.bus.IBusinessParameterGroup,
                 com.integrosys.component.commondata.app.Constants,
                 com.integrosys.component.commondata.app.bus.IBusinessParameter,
                 java.util.Collections,
                 java.util.Collection,
                 java.util.Arrays,
                 com.integrosys.component.commondata.app.bus.BusinessParameterComparator,
                 com.integrosys.component.commondata.app.bus.OBBusinessParameter,
                 java.util.Comparator,
                 com.integrosys.cms.app.systemparameters.trx.OBSystemParametersTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%
    String event = request.getParameter("event");
     com.integrosys.cms.ui.systemparameters.MaintainSystemParametersForm aForm = (com.integrosys.cms.ui.systemparameters.MaintainSystemParametersForm) request.getAttribute("MaintainSystemParametersForm");
    DefaultLogger.debug("checker_user.jsp","event from getParameter is > "+event);

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
    IBusinessParameterGroupTrxValue businessParameterGroupTrxVal = (IBusinessParameterGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.systemparameters.MaintainSystemParametersAction.SystemParametersTrxValue");
    IBusinessParameterGroup businessParameterGroup = businessParameterGroupTrxVal.getBusinessParameterGroup();
    IBusinessParameterGroup stageBusinessParameterGroup = businessParameterGroupTrxVal.getStagingBusinessParameterGroup();

    IBusinessParameter[] parametersArray = businessParameterGroup.getBusinessParameters();
    IBusinessParameter[] stageParametersArray = stageBusinessParameterGroup.getBusinessParameters();

    Arrays.sort(parametersArray, new BusinessParameterComparator());
    Arrays.sort(stageParametersArray, new BusinessParameterComparator());


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
    document.forms[0].action="MaintainSystemParameters.do?event=<%=approveEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="MaintainSystemParameters.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){	
    //document.forms[0].action="MaintainSystemParameters.do?event=<%=cancelEvent%>";
    //document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action="MaintainSystemParameters.do?event=maker_cncl_reject_edit";
    document.forms[0].submit();
}

</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="MaintainSystemParameters.do?" >

<body onload="MM_preloadImages('img/approve2.gif','img/reject2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Process General Parameters</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="8%">S/N</td>
              <td width="73%">Description</td>
              <td width="19%">Parameter Value&nbsp;<font color="#00AAFF">* </font></td>
            </tr>
          </thead>
          <tbody>
          <%
                  String parameterValue[] = new String[parametersArray.length];
                            parameterValue =aForm.getParameterValues();
              for (int i = 0; i < stageParametersArray.length; i++) {
                  IBusinessParameter stageParameter = stageParametersArray[i];
                  IBusinessParameter parameter = parametersArray[i];

          %>
          <tr class=<%=(i%2==0)?"odd":"even"%>>
            <html:hidden property="parameterCodes" value="<%=stageParameter.getParameterCode()%>" ></html:hidden>
             <%if(businessParameterGroupTrxVal.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)){%>
              <td class='<%=CompareOBUtil.compOB(stageParameter,parameter,"parameterValue")?"index":"indexdiff"%>'><%=(i+1)%></td>
              <%}else{%>
              <td class="index" ><%=(i+1)%></td>
              <%}%>
              <td ><%=stageParameter.getParameterName()%></td>
                <%
                         String hardCodedParamUnit = "Hour(s)"; //hardcoded
                      if(stageParameter.getParameterName()!=null)
                      {
                      if(stageParameter.getParameterName().trim().equalsIgnoreCase("Number of days BFL not accepted by customers")
                        || stageParameter.getParameterName().trim().equalsIgnoreCase("Number of days DDN not issued upon Approval date of BCA")
                      ) {
                          hardCodedParamUnit = "Day(s)";
                      }
                           if(stageParameter.getParameterName().trim().equalsIgnoreCase("Percentage Rise of Market Index")
                        || stageParameter.getParameterName().trim().equalsIgnoreCase("Percentage Fall of Market Index")
                      ) {
                          hardCodedParamUnit = "%";
                      }
                      }  %>
              <td ><%=stageParameter.getParameterValue()%><%--<%=parameterValue[i]%>--%>&nbsp;<%=hardCodedParamUnit%></td>
            </tr>
         <%
             }
         %>


          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr>
              <td width="43%" class="fieldname">Remarks</td>
              <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
            </tr>
            <tr>
              <td class="fieldname">Last Action By</td>
              <td class="even"><%=((OBSystemParametersTrxValue)businessParameterGroupTrxVal).getUserInfo()%>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Last Remarks Made</td>
              <td><integro:wrapper value="<%=businessParameterGroupTrxVal.getRemarks()%>"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td width="70">&nbsp;</td>
  </tr>
  <tr>
   <%if((event!=null) && !(event.equals("to_track"))){%>
    <%if(businessParameterGroupTrxVal.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)){%>
    <td><a href="javascript:approvePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:history.go(-1);" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%}else{%>
        <td>&nbsp;</td>

         <td><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="100" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
         <%}%>
   <%}else {%>
             <td width="100" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
             <td>&nbsp;</td>
        <%}%>
       <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->

</html:form>

</body>
<!-- InstanceEnd --></html>

<%@ page import="com.integrosys.cms.app.collaborationtask.trx.ICCTaskTrxValue,
                 com.integrosys.cms.app.collaborationtask.bus.ICCTask,
                 com.integrosys.cms.ui.cccoltask.CCColTaskForm,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICCTaskTrxValue colTrxVal = (ICCTaskTrxValue)session.getAttribute("com.integrosys.cms.ui.cccoltask.CCColTaskAction.colTrxVal");
    ICCTask act = colTrxVal.getCCTask();
    ICCTask staging = colTrxVal.getStagingCCTask();
    if(staging!=null){
        pageContext.setAttribute("colTask",staging);
    }

	String remarks = "";
    String lastActionBy = "";
    String status = "";
	if(colTrxVal!=null) {
        status = colTrxVal.getStatus();
        remarks = colTrxVal.getRemarks();
        lastActionBy = colTrxVal.getUserInfo();
	}
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    int row = 0;

    CCColTaskForm aForm = (CCColTaskForm)request.getAttribute("CCColTaskForm");
 boolean toView = false;
 boolean toReject=false;
%>




<html><!-- InstanceBegin template="/Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable -->
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


function approve(){
    document.forms[0].event.value="approve";
    document.forms[0].submit();
}

function reject(){
    document.forms[0].event.value="reject";
    document.forms[0].submit();
}
//-->
</script>




</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="MM_preloadImages('img/approve2.gif','img/reject2.gif','img/cancel2.gif')">
<html:form action="CCColTask" >
<html:hidden property="event" />
<html:hidden property="legalRef"/>
<html:hidden property="legalName"/>
<html:hidden property="customerCategory"/>
<html:hidden property="domicileCountry"/>
<html:hidden property="customerType"/>
<html:hidden property="orgCode"/>
<!-- InstanceBeginEditable name="menuScript" --> <!-- InstanceEndEditable -->
    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
      <thead>
<%@include file="cccoltask_title.jsp" %>
      </thead>
      <tbody>
        <tr>
          <td colspan="2"> <hr /></td>
        </tr>
        <tr>
          <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
              <tbody>
			<tr class="even">
              <td class="fieldname">Customer Category</td>

              <td>&nbsp;<bean:write name="CCColTaskForm" property="customerCategory" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">LE ID</td>
              <td>
              <%    if ((aForm.getLegalRef() != null) && (aForm.getLegalRef().trim().length() > 0))
                    {              
              %>    &nbsp;<bean:write name="CCColTaskForm" property="legalRef" />                        
              <%    }
                    else
                    {
              %>    -
              <%    }%>      
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Legal Name</td>

              <td>&nbsp;<bean:write name="CCColTaskForm" property="legalName" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Instr Bkg Loc Ctry</td>
              <td>&nbsp;<bean:write name="CCColTaskForm" property="domicileCountry" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Customer Type</td>
              <%
                  String custType = aForm.getCustomerType();
                  custType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.LEGAL_CONSTITUTION,custType);
              %>
              <td>&nbsp;<integro:empty-if-null value="<%=custType%>" /></td>
            </tr>
            <tr class="odd">
            
              <td class="fieldname">Organisation Code</td>
              <%
                  String orgCode = "-";
                  orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getOrgCode());
              %>
              <td><integro:empty-if-null value="<%=orgCode%>" /></td>
            </tr>
            <tr class="even">
              <td height="25" class="<%=CompareOBUtil.compOB(staging,act,"remarks")? "fieldname":"fieldnamediff"%>" >Remarks</td>
              <td><html:textarea property="colRemarks" rows="3" cols="60" onkeyup="limitTextInput(this.form.colRemarks, 250, 'Remarks');" value="<%=remarks%>"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
          <!-- CR136 only 1 remarks field is enough
            <tr>
              <td class="fieldname">Remarks</td>
              <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
            </tr> -->
            <tr>
              <td class="fieldname">Last Action By</td>
              <td class="even">&nbsp;<%=lastActionBy%></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Last Remarks Made</td>
              <td>&nbsp;<integro:wrapper value="<%=remarks%>" /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%@ include file="/cccoltask/history_comments.jsp"%>                    
<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td width="70">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="#" onclick="approve()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="#" onclick="reject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
</body>
<!-- InstanceEnd --></html>

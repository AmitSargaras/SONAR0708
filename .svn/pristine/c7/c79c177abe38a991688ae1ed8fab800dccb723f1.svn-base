<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ITemplateTrxValue itemTrxVal =(ITemplateTrxValue)session.getAttribute("com.integrosys.cms.ui.ccmaster.CCMasterAction.itemTrxVal");
    ITemplate iTemplate = (ITemplate)session.getAttribute("com.integrosys.cms.ui.ccmaster.CCMasterAction.template");
    
    String law = CommonDataSingleton.getCodeCategoryLabelByValue("APP_LAW", iTemplate.getLaw());
    if(iTemplate!=null)
        pageContext.setAttribute("iTemplate",iTemplate);
    int row = 0;
    String editFlag = (String) request.getAttribute("isEdit");
    boolean isEdit = false;
    if("true".equals(editFlag)){
        isEdit = true;
    }
    String remarks = itemTrxVal.getRemarks();
    String lastActionBy = itemTrxVal.getUserInfo();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    String closeFlag = (String)request.getAttribute("closeFlag");
    boolean close = false;
    if("true".equals(closeFlag)){
        close = true;
    }

    boolean toTrack = false;
    String event = request.getParameter("event");
    if("to_track".equals(event)){
        toTrack = true;
    }

    String custType = "";
    if(iTemplate!=null) {
        pageContext.setAttribute("iTemplate",iTemplate);
        custType = iTemplate.getLegalConstitution();
    }

    custType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.LEGAL_CONSTITUTION,custType);

    boolean viewOnly = false;
    if(request.getParameter("view")!=null &&request.getParameter("view").equals("view")){
        viewOnly=true;
    }


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

function refreshContent() {
	window.location="CCDocTemp(sscmaker,corp&eng).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCMaster.do">
<input type="hidden" name="event" />
<input type="hidden" name="mandatoryID" />
<% if(isEdit){ %>
<input type="hidden" name="isEdit" value="true" />
<%}%>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=law%> - <integro:empty-if-null value="<%=custType%>" /></h3></td>
      <td valign="bottom"><table width="75"  border="0" align="right" cellpadding="0" cellspacing="2">
          <tr>
            &nbsp;
            </td>

          <td width="75" valign="baseline" align="center">&nbsp; </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead>
        <tr>
          <td rowspan="2" width="4%">S/N</td>
          <td colspan="2" >Mandatory</td>
          <td rowspan="2" >Code</td>
          <td rowspan="2" >Description</td>
           <td rowspan="2"><bean:message key="label.cc.checklist.application.type"/></td>
	      <td rowspan="2" >Pre-Approval Document</td>
	      <td rowspan="2" >Document Version</td>
          <td rowspan="2" >Expiry Date</td>
        </tr>
        <tr>
          <td width="9%">Borrower<br><input type="checkbox" name="list11" id="list11" 
          value="Check All"  disabled /> Select All </td>
          <td width="9%">Chargor/<br>Pledgor/<br>Guarantor<br><input type="checkbox" name="list22" id="list22" 
          value="Check All" disabled /> Select All </td>
        </tr>
        </thead> <tbody>
		<logic:present name="iTemplate" property="templateItemList" >
   <logic:iterate id="OB" name="iTemplate"  property="templateItemList" type="com.integrosys.cms.app.chktemplate.bus.ITemplateItem"  >
<%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    boolean checked1 = false;
    if(OB.getIsMandatoryForBorrowerInd()){
    	checked1 = true;
    }
    boolean checked2 = false;
    if(OB.getIsMandatoryForPledgorInd()){
    	checked2 = true;
    }
    String isApproval = "N";
    if(OB.getItem().getIsPreApprove()){
    	isApproval = "Y";
    }

   %>
        <tr class="<%=rowClass%>">
          <td class="index" height="18" ><%=row%></td>
          <td style="text-align:center" height="18">&nbsp;
           <input name="forBorrowerID" type="checkbox" value="<%=OB.getIsMandatoryForBorrowerInd()%>" <%if(checked1){ %> checked <% } %> disabled />
          </td> 
          <td style="text-align:center" height="18">&nbsp;
            <input name="forPledgorID" type="checkbox" value="<%=OB.getIsMandatoryForPledgorInd()%>" <%if(checked2){ %> checked <% } %> disabled />
          </td> 
          <td >&nbsp;<bean:write name="OB" property="item.itemCode" /></td>
          <td >&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
          <td style="text-align:center">
          <%java.util.Iterator iter = OB.getItem().getCMRDocAppItemList().iterator(); 
          	while (iter.hasNext())
          	{
          		com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem docAppItem = (com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem) iter.next();
          %>
          	&nbsp;<integro:common-code display="true" categoryCode="APPLICATION_TYPE" descWithCode="false" entryCode="<%=docAppItem.getAppType()%>" />
          	<br>
          <%
          	}
          %>
          </td>
          <td style="text-align:center">&nbsp;<%=isApproval %></td>
          <td style="text-align:center">&nbsp;<bean:write name="OB" property="item.documentVersion" /></td>
          <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getItem().getExpiryDate())%></td>
        </tr>
</logic:iterate>
</logic:present>

  <logic:notPresent name="iTemplate" property="templateItemList" >
              <tr class="odd">
                <td colspan="8"><bean:message key="label.global.not.found"/></td>
              </tr>
  </logic:notPresent>

        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<%if(!toTrack && close){%>

<p/>
<p/>
<p/>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>
<%}%>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
  <td valign="baseline" align="center">
  <%if(!toTrack && close) { %>
    <a href="CCMaster.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else if(toTrack){%>
        <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else{%>
    <%if(!viewOnly){%>
        <a href="CCMaster.do?event=master_cc_list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else{%>
        <a href="CCMaster.do?event=master_cc_list&view=view" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}%>
    <%}%>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
        <td width="100%" align="left"><span class="errormsg">*Expired item will not be shown</span></td>
    </tr>
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

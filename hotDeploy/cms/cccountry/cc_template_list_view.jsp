<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ITemplateTrxValue itemTrxVal =(ITemplateTrxValue)session.getAttribute("com.integrosys.cms.ui.cccountry.CCCountryAction.itemTrxVal");
    ITemplate iTemplate = (ITemplate)session.getAttribute("com.integrosys.cms.ui.cccountry.CCCountryAction.template");
    String custType = "-";
    String law = CommonDataSingleton.getCodeCategoryLabelByValue("APP_LAW", iTemplate.getLaw());
    if(iTemplate!=null) {
        pageContext.setAttribute("iTemplate",iTemplate);
        custType = iTemplate.getLegalConstitution();
        custType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.LEGAL_CONSTITUTION,custType);
    }
    int row = 0;
    String status = "";
    if(itemTrxVal!=null){
        status = itemTrxVal.getStatus();
    }
    CountryList cList = CountryList.getInstance();
    String countryName = cList.getCountryName(iTemplate.getCountry());

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
   boolean viewOnly = false;
    if(request.getParameter("view")!=null &&request.getParameter("view").equals("view")){
        viewOnly=true;
    }

    String cCode = iTemplate.getCountry();
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
	window.location="CCDocTemp(sscmaker,cty=hk).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif','img/cancel2.gif')">
<html:form action="CCCountry" >
<input type="hidden" name="event" />
<%-- for check boxes--%>

<%--to display correct country name--%>
<html:hidden property="countryCode" />
<html:hidden property="countryName" />

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>&nbsp;<%=law%> - <%=custType%> - (<%=countryName%>)</h3></td>
      <td valign="bottom">&nbsp;</td>
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
              <td rowspan="2" width="3%">S/N</td>
              <td colspan="2" width="8%">Mandatory</td>
	          <td colspan="2" width="8%">Type</td>
              <td rowspan="2" width="6%">Code</td>
              <td rowspan="2" width="50%">Description</td>
              <td rowspan="2" width="3%"><bean:message key="label.cc.checklist.application.type"/></td>
              <td rowspan="2" width="3%">Pre-Approval Document</td>
              <td rowspan="2" width="3%">In Vault</td>
              <td rowspan="2" width="3%">Audit</td>
              <td rowspan="2" width="7%">Expiry Date</td>
            </tr>
            <tr>
          		<td>Borrower</td>
          		<td>Chargor/<br>Pledgor/<br>Guarantor</td>
          		<td>Borrower</td>
          		<td>Chargor/<br>Pledgor/<br>Guarantor</td>
       	 	</tr>
          </thead>
          <tbody>
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
    boolean inherited = false;
    boolean fromGlobal = false;
    boolean mandatoryForBorrower = false;
    boolean mandatoryForPledgor = false;
    boolean inVault = false;
    boolean extCustodian = false;
    boolean audit = false;

    if(OB.isInherited()){
        inherited = true;
    }
    if(OB.isFromGlobal()){
        fromGlobal = true;
    }
    if(OB.getIsInVaultInd()){
        inVault = true;
    }
    if(OB.getIsExtCustInd()){
        extCustodian = true;
    }
    if(OB.getIsAuditInd()){
        audit = true;
    }
    String isApproval = "N";
    if(OB.getItem().getIsPreApprove()){
    	isApproval = "Y";	
    }
	if(OB.getIsMandatoryForBorrowerInd()){
		mandatoryForBorrower = true;
	}
	if(OB.getIsMandatoryForPledgorInd()){
		mandatoryForPledgor = true;
	}
   %>
        <tr class="<%=rowClass%>">
          <td class="index" ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatoryForBorrower && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" />
            <%
            	}else if(!inherited) {
            		if(OB.getItem().getIsForBorrower()){
            %>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatoryForBorrower){%> checked <%} %> disabled />
            <%}}%>
          </td>
          <td style="text-align:center">&nbsp;
            <%if(mandatoryForPledgor && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" />
            <%}else if(!inherited){%>
				<%if(OB.getItem().getIsForPledgor()){ %>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatoryForPledgor){%> checked <%} %> disabled />
            <%}}%>
          </td>
          <td style="text-align:center">&nbsp;<%=(OB.getItem().getIsForBorrower()) ? ICMSConstant.TRUE_VALUE : ICMSConstant.FALSE_VALUE%></td>
          <td style="text-align:center">&nbsp;<%=(OB.getItem().getIsForPledgor()) ? ICMSConstant.TRUE_VALUE : ICMSConstant.FALSE_VALUE%></td>
          <td >&nbsp;<bean:write name="OB" property="item.itemCode" /></td>
          <td height="18" >&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
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
          </td>          <td style="text-align:center"><%=isApproval %></td>
          <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%> disabled /></td>
          <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled /></td>
          <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getItem().getExpiryDate())%></td>

          <%--<td style="text-align:center" height="18" ><input name="removeID" type="checkbox" value="<%=(row-1)%>" /></td>--%>
        </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="iTemplate" property="templateItemList" >
            <tr class="odd">
              <td colspan="11">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>
<%if(!toTrack && close) { %>
<p/>
<p/>
<p/>
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr class="even">
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>
<% } %>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
  <td valign="baseline" align="center">

  <%if(!toTrack && close) { %>
    <a href="CCCountry.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else{
        if(toTrack){%>
            <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <% }else{ %>
        <%if(!viewOnly){%>
            <a href="CCCountry.do?event=cancel&countryCode=<%=cCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        <%}else{%>
            <a href="CCCountry.do?event=country_law_list&view=view&countryCode=<%=cCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        <%}%>
    <%}}%>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

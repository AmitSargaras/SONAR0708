<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.Iterator,
                 com.integrosys.cms.app.chktemplate.bus.ITemplateItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.ITemplateItem" %>
<%@ page import="com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ITemplateTrxValue itemTrxVal =(ITemplateTrxValue)session.getAttribute("com.integrosys.cms.ui.cccountry.CCCountryAction.itemTrxVal");
    ITemplate iTemplate = (ITemplate)session.getAttribute("com.integrosys.cms.ui.cccountry.CCCountryAction.template");
    String country = iTemplate.getCountry();
    String custType = "-";
    String law = CommonDataSingleton.getCodeCategoryLabelByValue("APP_LAW", iTemplate.getLaw());
    custType = iTemplate.getLegalConstitution();
    custType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.LEGAL_CONSTITUTION,custType);

/*
    if(iTemplate!=null)
        pageContext.setAttribute("iTemplate",iTemplate);
*/
    String lastActionBy = itemTrxVal.getUserInfo();
    String remarks = itemTrxVal.getRemarks();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    int row = 0;
    String status = "";
    if(itemTrxVal!=null){
        status = itemTrxVal.getStatus();
    }
    CountryList cList = CountryList.getInstance();
    String countryName = cList.getCountryName(iTemplate.getCountry());

    ITemplateItem array[] = null;

    if(itemTrxVal.getTemplate()==null){
        array = null;
    }else{
        array = itemTrxVal.getTemplate().getTemplateItemList();
    }
	List res = CompareOBUtil.compOBArray(itemTrxVal.getStagingTemplate().getTemplateItemList(),array);

    ArrayList list = new ArrayList(res);
    pageContext.setAttribute("templates",list);


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

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="approve_template_item";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="reject_template_item";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<html:form action="CCCountry" >
<input type="hidden" name="event" />
<%-- for check boxes--%>
<input type="hidden" name="mandatoryRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />


<%--to display correct country name--%>
<html:hidden property="countryCode" />
<html:hidden property="countryName" />

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>&nbsp;&nbsp;<%=law%> - <%=custType%> - (<%=countryName%>)</h3></td>
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
<logic:present name="templates"  >
   <logic:iterate id="compResult" name="templates"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
 <%
     ITemplateItem OB = (com.integrosys.cms.app.chktemplate.bus.ITemplateItem) compResult.getObj();
     String rowClass = "";
     row++;
     if (row % 2 != 0) {
         rowClass = "odd";
     } else {
         rowClass = "even";
     }
     boolean inherited = false;
     boolean fromGlobal = false;
     boolean mandatoryForBorrower = false;
     boolean mandatoryForPledgor = false;
     boolean inVault = false;
     boolean extCustodian = false;
     boolean audit = false;

     if (OB.isInherited()) {
         inherited = true;
     }
     if (OB.isFromGlobal()) {
         fromGlobal = true;
     }
     if (OB.getIsInVaultInd()) {
         inVault = true;
     }
     if (OB.getIsExtCustInd()) {
         extCustodian = true;
     }
     if (OB.getIsAuditInd()) {
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
          <td class='<bean:write name="compResult" property="key" />'  ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatoryForBorrower && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatoryForBorrower){%> checked <%} %> disabled />
            <%}%>
          </td>
          <td style="text-align:center">&nbsp;
            <%if(mandatoryForPledgor && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatoryForPledgor){%> checked <%} %> disabled />
            <%}%>
          </td>
          <td style="text-align:center">&nbsp;<%=(OB.getItem().getIsForBorrower()) ? ICMSConstant.TRUE_VALUE : ICMSConstant.FALSE_VALUE%></td>
          <td style="text-align:center">&nbsp;<%=(OB.getItem().getIsForPledgor()) ? ICMSConstant.TRUE_VALUE : ICMSConstant.FALSE_VALUE%></td>
          <td >&nbsp;<bean:write name="compResult" property="obj.item.itemCode" /></td>
          <td height="18" >&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
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
          <td style="text-align:center"><%=isApproval %></td>
          <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%> disabled /></td>
          <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled /></td>
          <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getItem().getExpiryDate())%></td>

          <%--<td style="text-align:center" height="18" ><input name="removeID" type="checkbox" value="<%=(row-1)%>" /></td>--%>
        </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="templates" >
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
<p/>
<p/>
<p/>
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="120"></textarea></td>
					</tr>
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

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

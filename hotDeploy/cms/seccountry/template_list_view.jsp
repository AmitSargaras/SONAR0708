<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicPropertySetup,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicProperty,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.seccountry.SecurityCountryForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ITemplateTrxValue itemTrxVal =(ITemplateTrxValue)session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.itemTrxVal");
    ITemplate iTemplate = (ITemplate)session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.template");
    if(iTemplate!=null)
        pageContext.setAttribute("iTemplate",iTemplate);
    int row = 0;
    String status = "";
    if(itemTrxVal!=null){
        status = itemTrxVal.getStatus();
    }
    String cCode = "";
    String cName = "";
    if(iTemplate!=null){
        cCode = iTemplate.getCountry();
        CountryList cList = CountryList.getInstance();
        cName = cList.getCountryName(cCode);
    }
    if(cName.equals("")){
        SecurityCountryForm aForm = (SecurityCountryForm)request.getAttribute("SecurityCountryForm");
        cName = aForm.getCountryName();
    }

    String colType = iTemplate.getCollateralType();
    String subType = iTemplate.getCollateralSubType();
    String checkString = ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH; 
    String cc = colType;
    String ss = subType;
    
    //System.out.println("Col Type"+colType);
    //System.out.println("Sub Type"+subType);
    
    SecurityTypeList list1 = SecurityTypeList.getInstance();
    colType = list1.getSecurityTypeValue(colType,request.getLocale());
    SecuritySubTypeList list2 = SecuritySubTypeList.getInstance();
    subType = list2.getSecuritySubTypeValue(subType,request.getLocale());

    String remarks = itemTrxVal.getRemarks();
    String lastActionBy = itemTrxVal.getUserInfo();
    String closeFlag = (String)request.getAttribute("closeFlag");
    boolean close = false;
    if("true".equals(closeFlag)){
        close = true;
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";


    String formNumber = "1";
    String frame = (String)session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.frame");
    if(!"true".equals(frame)){
        formNumber = "0";
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
	
	boolean isABCheck = false;
    
    if (ss.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH) || ss.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_PLANT)){
    	isABCheck = true ;
    }
    
	boolean isPTCheck = false ;
    
    if (cc.equals(ICMSConstant.SECURITY_TYPE_PROPERTY)){
    	isPTCheck = true ;
    }
    
    IDynamicPropertySetup[] dynamicPropertySetupList = null;
    
    if(isABCheck){
//    	dynamicPropertySetupList = (IDynamicPropertySetup[]) session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.dynamicPropertySetupList");
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

function goCancel() {
    var formObj = document.forms[<%=formNumber%>];
    formObj.event.value="country_sec_list";
    formObj.submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="SecurityCountry" >
<input type="hidden" name="event" />

<html:hidden property="countryCode" />
<html:hidden property="countryName" />
<html:hidden property="secType" />
<html:hidden property="subType" />
<%if(viewOnly){%>
<input type="hidden" name="view" value="view">
<%}%>
<%-- for check boxes--%>

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=colType%> (<%=subType%>)</h3></td>
      <td valign="bottom"><table width="233"  border="0" align="right" cellpadding="0" cellspacing="2">
          <tr>
          <td width="75" valign="baseline" align="center">&nbsp;
            
          </td>
          <td width="75" valign="baseline" align="center">&nbsp;
              
          </td>
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
              <td width="3%">S/N</td>
              <td <%if(isABCheck){ %> width="6%" <%}else{ %>width="8%"<%} %> >Mandatory</td>
              <td width="6%">Code</td>
              <td <%if(isABCheck){ %> width="10%" <%}else{ %>width="30%"<%} %>>Description</td>
              <td <%if(isABCheck){ %> width="6%" <%}else{ %>width="8%"<%} %> >Pre-Approval Document</td>
              <td <%if(isABCheck){ %> width="6%" <%}else{ %>width="8%"<%} %> >Type</td>
              <td width="6%">To Vault</td>
              <%if(isABCheck){ %>
			  <td width="20%" style="text-align:center" >Goods Status</td>
			  <%} %>
			  <%if(isPTCheck){ %>
              <td width="50%">Conditions</td>
              <%} %>
              <!--  <td width="6%">Audit</td> -->
              <td width="8%">Expiry Date</td>
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
    boolean mandatory = false;
    boolean inVault = false;
    boolean extCustodian = false;
    boolean audit = false;
    boolean withTitle = false;
    boolean withoutTitle = false;
    boolean underConstruction = false;
    boolean completedProperty = false;
    boolean usedWithFBR = false;
    boolean usedWithoutFBR = false;
    boolean newWithFBR = false;
    boolean newWithoutFBR = false;

    if(OB.isInherited()){
        inherited = true;
    }
    if(OB.isFromGlobal()){
        fromGlobal = true;
    }
    if(OB.getIsMandatoryInd()){
        mandatory = true;
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
    
    if(OB.getWithTitle()){
    	withTitle = true;
    }
    if(OB.getWithoutTitle()){
    	withoutTitle = true;
    }
    if(OB.getUnderConstruction()){
    	underConstruction = true;
    }
    if(OB.getPropertyCompleted()){
    	completedProperty = true;
    }
    if(OB.getIsAuditInd()){
        audit = true;
    }
    if (OB.getNewWithFBR())
    {
    	newWithFBR = true;
    }
    if (OB.getNewWithoutFBR())
    {
    	newWithoutFBR = true;
    }
    if (OB.getUsedWithFBR())
    {
    	usedWithFBR = true;
    }
    if (OB.getUsedWithoutFBR())
    {
    	usedWithoutFBR = true;
    }
    
    String isApproval = "N";
    if(OB.getItem().getIsPreApprove()){
    	isApproval = "Y";	
    }
    
    IDynamicProperty[] propertyList =null; 
    if(OB.getItem().getPropertyList()!=null){
    	propertyList = OB.getItem().getPropertyList();
    }

   %>
        <tr class="<%=rowClass%>">
          <td class="index" ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %>  disabled />
            <%}%>
          </td>
          <td >&nbsp;<bean:write name="OB" property="item.itemCode" /></td>
          <td height="18" >&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
          <td style="text-align:center"><%=isApproval %></td>
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
      	   <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled /></td> 
          
         
         <!-- <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled /></td> -->
          <%if(isABCheck) {%>
          	<td nowrap>
          		<input name="newWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithFBR){ out.print(" Checked "); }%>/>New With FBR
          		<input name="newWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithoutFBR){ out.print(" Checked "); }%> />New Without FBR
          		<input name="usedWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithFBR){ out.print(" Checked "); }%>/>Used With FBR
          		<input name="usedWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithoutFBR){ out.print(" Checked "); }%>/>Used Without FBR
          	</td>
          <%} %>
          <%if(isPTCheck) {%>
          	<td nowrap>
          		<input name="withTitleID" type="checkbox" value="<%=(row-1)%>" <%if(withTitle){ out.print(" Checked "); }%>/>With Title
          		<input name="withoutTitleID" type="checkbox" value="<%=(row-1)%>" <%if(withoutTitle){ out.print(" Checked "); }%>/>Without Title
          		<input name="completedPropertyID" type="checkbox" value="<%=(row-1)%>" <%if(completedProperty){ out.print(" Checked "); }%>/>Completed Property
          		<input name="underConstructionID" type="checkbox" value="<%=(row-1)%>" <%if(underConstruction){ out.print(" Checked "); }%> />Under Construction
          	</td>
          <%} %>	
          <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getItem().getExpiryDate())%></td>
        </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="iTemplate" property="templateItemList" >
            <tr class="odd">
              <td colspan="8">There is no document</td>
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
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
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
    <td width="100%" valign="baseline" align="center">
	<%if(!toTrack && close) { %>
    <a href="SecurityCountry.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;
    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else if(toTrack){%>
        <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else{%>
    <a href="#" onclick="goCancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
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

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

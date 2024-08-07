<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.IDocumentItem,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicProperty,
                 com.integrosys.cms.app.chktemplate.bus.ITemplateItem,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicPropertySetup,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.List"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/secmaster/chk_template_list_view.jsp,v 1.16 2006/10/27 08:47:34 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.16 $
 * @since $Date: 2006/10/27 08:47:34 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ITemplateTrxValue secTrxVal =(ITemplateTrxValue)session.getAttribute("com.integrosys.cms.ui.secmaster.SecurityMasterAction.secTrxVal");
    ITemplate iTemplate = (ITemplate)session.getAttribute("com.integrosys.cms.ui.secmaster.SecurityMasterAction.template");

    String colType = iTemplate.getCollateralType();
    String subType = iTemplate.getCollateralSubType();
    String cc = colType;
    String ss = subType;
    
    SecurityTypeList list1 = SecurityTypeList.getInstance();
    colType = list1.getSecurityTypeValue(colType,request.getLocale());
    SecuritySubTypeList list2 = SecuritySubTypeList.getInstance();
    subType = list2.getSecuritySubTypeValue(subType,request.getLocale());

    String lastActionBy = secTrxVal.getUserInfo();
    String remarks = secTrxVal.getRemarks();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";
/*    if(iTemplate!=null)
        pageContext.setAttribute("iTemplate",iTemplate);*/
    int row = 0;

    ITemplateItem array[] = null;
//        System.out.println("Array Length staging"+secTrxVal.getStagingTemplate().getTemplateItemList().length);
    if(secTrxVal.getTemplate()==null){
        array = null;
    }else{
        array = secTrxVal.getTemplate().getTemplateItemList();
    }

    ITemplateItem[] stagingItemList = secTrxVal.getStagingTemplate().getTemplateItemList();
    
    if(!(stagingItemList == null && array == null)) {
        List res = CompareOBUtil.compOBArray(secTrxVal.getStagingTemplate().getTemplateItemList(),array);
        

        ArrayList list = new ArrayList(res);
        pageContext.setAttribute("templates",list);
    }
    
	boolean isABCheck = false;
    if (ss.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH) || ss.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_PLANT)){
    	isABCheck = true ;
    }
    
    boolean isPTCheck = false;
    if (cc.equals(ICMSConstant.SECURITY_TYPE_PROPERTY)){
    	isPTCheck = true ;
    }

    IDynamicPropertySetup[] dynamicPropertySetupList = null;
    int dynamicPropertySetupListSize = 0;
    int comlen1Size = 0;
    int comlen2Size = 0;
    if(isABCheck){
//	    dynamicPropertySetupList = (IDynamicPropertySetup[]) session.getAttribute("com.integrosys.cms.ui.secmaster.SecurityMasterAction.dynamicPropertySetupList");
//	    dynamicPropertySetupListSize = dynamicPropertySetupList.length;
//	    comlen1Size = dynamicPropertySetupList[0].getEntryCodes().length;
//	    comlen2Size = dynamicPropertySetupList[1].getEntryDescription().length;
    }
    
%>




<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
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

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function refreshContent() {
	window.location="CollTemp(sscmaker,prop&res2).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
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

<body>
<html:form action="SecurityMaster" >
<input type="hidden" name="event" />

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=colType%> (<%=subType%>)</h3></td>
      <td valign="bottom"><table width="75"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            &nbsp;
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
      <td colspan="2"> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td <%if(isABCheck){ %> width="4%" <%}else{ %>width="4%"<%} %>>S/N</td>
			  <td <%if(isABCheck){ %>width="5%" <%}else{ %>width="10%"<%} %> >Critical</td>
			  <td <%if(isABCheck){ %>width="5%" <%}else{ %>width="10%"<%} %> >Mandatory</td>
			  <td <%if(isABCheck){ %>width="10%" <%}else{ %>width="10%"<%} %> >Doc Code</td>
			  <td <%if(isABCheck){ %>width="15%" <%}else{ %>width="44%"<%} %> >Description</td>
			  <td <%if(isABCheck){ %>width="10%" <%}else{ %>width="20%"<%} %> >Tenure</td>
<!--			  <%if(isABCheck){ %>-->
<!--			  <td width="30%">Goods Status</td>-->
<!--			  <%} %>-->
<!--			  <%if(isPTCheck){ %>-->
<!--              <td width="50%">Conditions</td>-->
<!--              <%} %>-->
            </tr>
          </thead>
          <tbody>
<logic:present name="templates"  >
   <logic:iterate id="compResult" name="templates"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
    ITemplateItem OB = (ITemplateItem) compResult.getObj();
    String rowClass = "";
    row++;
    if (row % 2 != 0) {
        rowClass = "odd";
    } else {
        rowClass = "even";
    }
    String isPreApprove = "N";
    if(OB.getItem().getIsPreApprove()){
    	isPreApprove = "Y";
    }
    boolean checked = false;
    if (OB.getIsMandatoryInd()) {
        checked = true;
    }
    boolean checkedDisplay = false;
    if(OB.getIsMandatoryDisplayInd()){
    	checkedDisplay= true;
    }
    int propertySetupID = 0;
    String propertyValue = "PBT";
    IDynamicProperty[] propertyList =null; 
    if(OB.getItem().getPropertyList()!=null){
    	propertyList = OB.getItem().getPropertyList();
    }
    
    boolean withTitle = false;
    boolean withoutTitle = false;
    boolean underConstruction = false;
    boolean completedProperty = false;
    
    boolean usedWithFBR = false;
    boolean usedWithoutFBR = false;
    boolean newWithFBR = false;
    boolean newWithoutFBR = false;
    
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
    
    if (OB.getNewWithFBR()){
    	newWithFBR = true;
    }
    
    if (OB.getNewWithoutFBR()){
    	newWithoutFBR = true;
    }
    
    if (OB.getUsedWithFBR()){
    	usedWithFBR = true;
    }
    
    if (OB.getUsedWithoutFBR()){
    	usedWithoutFBR = true;
    }
%>
     <tr class=<%=rowClass%>>
              <td class='<bean:write name="compResult" property="key" />'><%=row%></td>
              <td style="text-align:center"><input name="tempID" type="checkbox" value="<%=row-1%>" <%if(checked){ %> checked <% } %> disabled />
              </td>
                  <td style="text-align:center"><input name="tempDisplayID" type="checkbox" value="<%=row-1%>" <%if(checkedDisplay){ %> checked <% } %> disabled />
              </td>
              <td>&nbsp;<bean:write name="compResult" property="obj.item.itemCode" /></td>
              <td>&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
           
             <td>&nbsp;<%=OB.getItem().getTenureCount()%> &nbsp; <integro:common-code-single  entryCode="<%=OB.getItem().getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" display="true" descWithCode="false" /></td>
<!--             <%if(isABCheck){ %>-->
<!--              <td nowrap>-->
<!--          		<input name="newWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithFBR){ out.print(" Checked "); }%> DISABLED/>New With FBR-->
<!--          		<input name="newWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithoutFBR){ out.print(" Checked "); }%> DISABLED/>New Without FBR-->
<!--          		<input name="usedWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithFBR){ out.print(" Checked "); }%> DISABLED/>Used With FBR-->
<!--          		<input name="usedWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithoutFBR){ out.print(" Checked "); }%> DISABLED/>Used Without FBR-->
<!--          	</td>-->
<!--          	<%} %>-->
<!--          	  <%if(isPTCheck) {%>-->
<!--          	<td nowrap>-->
<!--          		<input name="withTitleID" type="checkbox" value="<%=(row-1)%>" <%if(withTitle){ out.print(" Checked "); }%> DISABLED/>With Title-->
<!--          		<input name="withoutTitleID" type="checkbox" value="<%=(row-1)%>" <%if(withoutTitle){ out.print(" Checked "); } %> DISABLED/>Without Title-->
<!--          		<input name="completedPropertyID" type="checkbox" value="<%=(row-1)%>" <%if(completedProperty){ out.print(" Checked "); }%> DISABLED/>Completed Property-->
<!--          		<input name="underConstructionID" type="checkbox" value="<%=(row-1)%>" <%if(underConstruction){ out.print(" Checked "); }%> DISABLED/>Under Construction-->
<!--          	</td>-->
<!--          <%} %>	-->
            </tr>       
</logic:iterate>
</logic:present>

<logic:notPresent name="templates"  >
            <tr class="odd">
              <td colspan="7"><bean:message key="label.global.not.found"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<p/>
<p/>
<p/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
    <tr>
      <td class="fieldname">Remarks</td>
      <td class="odd"><textarea name="remarks" rows="4" cols="90"></textarea>
      </br><html:errors property="templateRemarksError"></html:errors></td>
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

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
        <td width="100%" align="left"><span class="errormsg">*Expired item will not be shown</span></td>
    </tr>
</table>
<p/>
<p/>
<p/>


</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

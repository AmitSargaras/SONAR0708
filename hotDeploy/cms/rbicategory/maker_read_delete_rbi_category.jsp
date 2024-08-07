<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays,
                 java.util.ArrayList,
                 java.util.Iterator,
                 java.util.Set,                 
                 com.integrosys.cms.app.rbicategory.bus.OBRbiCodeCategoryMs,
                 com.integrosys.cms.app.rbicategory.trx.IRbiCategoryTrxValue,
                 com.integrosys.cms.app.rbicategory.bus.OBRbiCategory,
                 com.integrosys.cms.app.rbicategory.bus.OBIndustryCodeCategory,
                 com.integrosys.cms.app.rbicategory.bus.OBRbiCodeCategory,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Collections"%>
<%@page import="com.integrosys.cms.ui.rbicategory.RbiCategoryForm"%>                 

<%
	String context = request.getContextPath() + "/";
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";			
	IRbiCategoryTrxValue rbiCategoryTrxValue = (IRbiCategoryTrxValue) request.getAttribute("rbiCategoryTrxValue");
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"." + IGlobalConstant.USER);
	OBRbiCategory obiCategory = (OBRbiCategory) rbiCategoryTrxValue.getRbiCategory();

%>
<%
String actionStr1 = "com.integrosys.cms.ui.rbicategory.RbiCategoryAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
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
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
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
function cancelPage(){
	 document.forms[0].action="rbi_category.do?event=redirect_list_rbi_category";
    
    document.forms[0].submit();
}
function submitForm() {
 	document.forms[0].action="rbi_category.do?event=maker_delete_rbi_category";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='rbi_category.do?'>
	<body>
	<!-- InstanceBeginEditable name="Content" -->
	
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<br>
			<br>
			<br>
			<br>
			<br>
			<tr>
				<td>
				<h3>Delete Rbi Category</h3>
				</td>
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInput">
					<thead>
					</thead>
					<tbody>

					<tr class="even" >
          			<td width="20%" class="fieldname" >Industry Name<span class="style11"> </span></td>
          			<td width="20%" class="even"><span class="odd"><integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_INDUSTRY%>" entryCode="<%=obiCategory.getIndustryNameId()%>" display="true" descWithCode="false"/></span></td>

     		 </tr>
     		 <tr class="odd">
          			<td width="20%" class="fieldname">RBI  Code &amp; Category<span class="style11"></span></td>
         			 <td width="20%" class="odd"> 
         			  <%
         			  String append = "";
         		 	HashMap rBICateCodeHashMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.HDFC_RBI_CODE);
  			  							List rbiList =new ArrayList();
										Set rbiC = obiCategory.getStageIndustryNameSet();
										Iterator itSet = rbiC.iterator();
										OBIndustryCodeCategory oBIndustryCodeCategory = new OBIndustryCodeCategory();
										OBRbiCodeCategory oBRbiCodeCategory = new OBRbiCodeCategory();
										while(itSet.hasNext()){
										oBIndustryCodeCategory = (OBIndustryCodeCategory)itSet.next();
																
        								append = oBRbiCodeCategory.getCode() + "-" + append;
        								%>
										<%--<integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>" entryCode="<%=oBIndustryCodeCategory.getRbiCodeCategoryId()%>" display="true" descWithCode="true"/>
										<br>
										--%><%
										if(null!=rBICateCodeHashMap.get(oBIndustryCodeCategory.getRbiCodeCategoryId())){
                                  	 rbiList.add(rBICateCodeHashMap.get(oBIndustryCodeCategory.getRbiCodeCategoryId()).toString()+"("+oBIndustryCodeCategory.getRbiCodeCategoryId()+")");
                                 	 }
										}
                                 	 Collections.sort(rbiList);
                                 	 Iterator itRbiList = rbiList.iterator();
                                 	  while(itRbiList.hasNext())
                                 	 {%>
                                 	 <%=itRbiList.next() %><br>
                                 	 <%} %>              
         			 
         			 </td>
            </tr>
 <html:hidden name="RbiCategoryForm" property="industryNameId" value="<%=obiCategory.getIndustryNameId()%>"/> 
 <html:hidden name="RbiCategoryForm" property="appendRbiCodeCategoryList" value="<%=append%>"/>        
 <html:hidden name="RbiCategoryForm" property="status" value="<%=obiCategory.getStatus() %>"/>
 <html:hidden name="RbiCategoryForm" property="createBy" value="<%=obiCategory.getCreateBy() %>"/>
 <html:hidden name="RbiCategoryForm" property="lastUpdateBy" value="<%=user.getUserName() %>"/>
 <html:hidden name="RbiCategoryForm" property="lastUpdateDate"/>
 <html:hidden name="RbiCategoryForm" property="creationDate"/>
 <html:hidden name="RbiCategoryForm" property="deprecated" value="N"/>
 <html:hidden name="RbiCategoryForm" property="id"/>




					</tbody>
				</table>
				</td>
			</tr>

		</tbody>
	</table>

	<table width="130" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="65">&nbsp;</td>
			<td width="65">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/delete2.gif',1)"
				onClick="submitForm()"><img src="img/delete1.gif"
				name="Image3311" border="0" id="Image3311" /> </a>&nbsp;&nbsp;</td>
			<td colspan="2">
			<center><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
				src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
			</a></center>
			&nbsp;</td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>


	<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>

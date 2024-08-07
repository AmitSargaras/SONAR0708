
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.goodsMaster.GoodsMasterForm,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.app.goodsMaster.trx.IGoodsMasterTrxValue,com.integrosys.cms.app.goodsMaster.trx.OBGoodsMasterTrxValue"%>
<%
GoodsMasterForm goodsMasterForm = (GoodsMasterForm) request
			.getAttribute("GoodsMasterForm");
	IGoodsMasterTrxValue goodsMasterTrx = (IGoodsMasterTrxValue) session
			.getAttribute("com.integrosys.cms.ui.goodsMaster.GoodsMasterAction.IgoodsMasterTrxValue");
	int sno = 0;
	int startIndex = 0;
	String prohibitedGoodsCode= (String)session.getAttribute("com.integrosys.cms.ui.goodsMaster.GoodsMasterAction.prohibitedGoodsCodeStr");
	String isRecordEditable = "N";
	if(ICMSConstant.STATE_PENDING_PERFECTION.equals(goodsMasterTrx.getFromState())){
		isRecordEditable = "Y";
	}
%>
<%
List goodsParentCodeList = (List)session.getAttribute("com.integrosys.cms.ui.goodsMaster.GoodsMasterAction.goodsParentCodeList");
pageContext.setAttribute("goodsParentCodeList",goodsParentCodeList);
%>

<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
function cancelPage(){
	document.forms[0].action="ToDo.do?event=prepare";
	document.forms[0].submit();
	}
function submitForm() {
		document.forms[0].action = "goodsMaster.do?event=maker_save_update";
		document.forms[0].submit();
	}
	
function refreshRestrictionType(){
	var goodsParentCode = document.getElementById("goodsParentCode").value;
	var prohibitedGoodsCode = '<%=prohibitedGoodsCode%>';
	var prohibitedGoodsArray = prohibitedGoodsCode.split(',');
	
	var restrictionType = document.getElementById("restrictionType").value;
	
	var isFound = false;
	if(goodsParentCode != "" ){
		for (var i = 0; i < prohibitedGoodsArray.length; i++) {
		    if(goodsParentCode == prohibitedGoodsArray[i]){
		    	isFound = true;
		    	break;
		    }
		}
	}

	if(isFound){
		document.getElementById("restrictionType").value = "PROHIBITED";
		document.getElementById("restrictionType").disabled = true;
	}
	else {
		document.getElementById("restrictionType").value = "";
		document.getElementById("restrictionType").disabled = false;
	}
}	

window.onload = function(){
	
	if( 'N' == '<%=isRecordEditable%>'){
		document.getElementById("goodsParentCode").disabled = true;
		document.getElementById("goodsCode").disabled = true;
	}
	
	if(document.getElementById("restrictionType").value == "PROHIBITED"){
		document.getElementById("restrictionType").disabled = true;
	}
}	

</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='goodsMaster.do'>
	<html:hidden property="startIndex" />
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>

				<tr>
					<td>
						<h3>Goods Master</h3>
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
							<tr class="odd">
									<td class="fieldname" >Goods Parent <font color="red">*</font></td>
				                  <td width="20%">
				                  <%if(goodsMasterForm.getGoodsParentCode() != null ){ %>
				                  <html:select property="goodsParentCode" name="GoodsMasterForm" styleId="goodsParentCode" onchange="javascript:refreshRestrictionType();">	
											<html:options name="goodsParentCodeList" labelName="goodsParentCodeList"/>			                   
										</html:select>
								  <%} else{ %>
								  	<integro:empty-if-null value="<%=goodsMasterForm.getGoodsParentCode() %>"/>
								  <%} %>		
										
				                   </td>
				                   
									<td class="fieldname" width="30%">Goods Code<font
										color="red">*</font></td>
									<td width="20%"><html:text property="goodsCode"
											size="50" maxlength="100"></html:text>&nbsp; <br>
											<html:errors property="goodsCode" />
											<html:errors property="goodsNameLengthError" /> 
				                  			<html:errors property="goodsNameError" /> 
											</td>
								</tr>
								<tr class="odd">
									<td class="fieldname" >Goods Name <font color="red">*</font></td>
				                  <td width="20%">
				                  	<html:text property="goodsName"  maxlength="30"/>
											<html:errors property="goodsName" />
											<html:errors property="goodsNameLengthError" /> 
				                  			<html:errors property="goodsNameError" /> 
				                   </td>
				                   
									<td class="fieldname" width="30%">Restriction Type<font
										color="red">*</font></td>
									<td width="20%">
									<html:select  property="restrictionType" styleId="restrictionType" value = "<%=goodsMasterForm.getRestrictionType() %>" >
								    <integro:common-code categoryCode="<%=CategoryCodeConstant.RESTRICTION_TYPE%>" 
								    descWithCode="false"  />
					               </html:select>
									</td>
								</tr>
								<tr class="odd">
									<td class="fieldname">Status&nbsp;</td>
									<td>Enable<input type="radio" checked="checked"
										id="status" name="status" value="ACTIVE">
										&nbsp; Disable<input type="radio" id="status" name="status"
										value="INACTIVE" >&nbsp;
									</td>
									<td class="fieldname"></td>
									<td>&nbsp;</td>
								</tr>
								<html:hidden name="GoodsMasterForm" property="status" />
								<html:hidden name="GoodsMasterForm" property="goodsCode" />
								<html:hidden name="GoodsMasterForm" property="goodsName" />
								<html:hidden name="GoodsMasterForm" property="goodsParentCode" />
								<html:hidden name="GoodsMasterForm" property="restrictionType" />
								<html:hidden name="GoodsMasterForm" property="createBy" />
								<html:hidden name="GoodsMasterForm" property="lastUpdateBy" />
								<html:hidden name="GoodsMasterForm" property="lastUpdateDate" />
								<html:hidden name="GoodsMasterForm" property="creationDate" />
								<html:hidden name="GoodsMasterForm" property="deprecated" />
								<html:hidden name="GoodsMasterForm" property="id" />
								</tr>
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
				<td>
					<center>
						<a href="javascript:submitForm();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
							<img src="img/submit1.gif" name="Image3311" border="0"
							id="Image3311" />
						</a>
					</center> &nbsp;
				</td>
				
				<td>
					<center>
						<a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
						</a>
					</center> &nbsp;
				</td>
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

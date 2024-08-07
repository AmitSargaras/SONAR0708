<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.List,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays"%>
<%@page import="com.integrosys.cms.ui.collateralrocandinsurance.CollateralRocForm,
		java.util.List"%>                 

<%
List collateralCategoryList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.collateralrocandinsurance.CollateralRocAction.collateralCategoryList");

if (!(collateralCategoryList == null)) {
	pageContext.setAttribute("collateralCategoryList", collateralCategoryList);
	session.setAttribute("collateralCategoryList", collateralCategoryList);
	 
	}

List collateralRocCodeList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.collateralrocandinsurance.CollateralRocAction.collateralRocCodeList");

if (collateralRocCodeList!=null && collateralRocCodeList.size()>0) {
	pageContext.setAttribute("collateralRocCodeList", collateralRocCodeList);
	session.setAttribute("collateralRocCodeList", collateralRocCodeList);
	}

String collateralRocCode = (String)request.getParameter("collateralRocDescription");


 
if (collateralRocCode!=null && collateralRocCode != "") {
	pageContext.setAttribute("collateralRocCode", collateralRocCode);
	}

	String context = request.getContextPath() + "/";
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
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
function cancelPage(){
    document.forms[0].action="collateralrocandinsurance.do?event=maker_list_collateral_roc&go=N";
    document.forms[0].submit();
}
function submitForm() {
 	document.forms[0].action="collateralrocandinsurance.do?event=maker_create_collateral_roc";
    document.forms[0].submit();
}

function saveForm() {
 	document.forms[0].action="collateralrocandinsurance.do?event=maker_draft_collateral_roc";
    document.forms[0].submit();
}

function enableStatus(){
	document.forms[0].status="ACTIVE";
}

//-->

function changeCollateralCode(dropdown)
{
	document.getElementById("collateralRocDescription").value = "";
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'collateralRocCode';
 var url = '/cms/collateralrocandinsurance.do?event=refresh_collateral_code&collateralCategoryValue='+curSel;
 sendLoadDropdownReq(dep, url);
}

function changeDescription()
{
	var label = document.getElementById('collateralRocCode')[document.getElementById('collateralRocCode').selectedIndex].innerHTML;
	var value = document.getElementById("collateralRocCode").value;
	
	var element = document.getElementById('collateralRocActualCode');
    element.value = label;
	document.getElementById("collateralRocDescription").value = value;
}

</script>
<style type="text/css"><!--

.hiddenDiv {
	display: none;
	}
.visibleDiv {
	display: block;
	border: 1px grey solid;
	}
.style1 {color: #FF0000}
.style5 {color: #FF0000}
.style11 {color: #FF0000}
-->
</style>
<!-- InstanceEndEditable -->
</head>
<bean:define id="formObj" name="CollateralRocForm" scope="request" type="com.integrosys.cms.ui.collateralrocandinsurance.CollateralRocForm"/>
<html:form action="/collateralrocandinsurance" >
<body >

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3>Collateral Roc & Insurance Mapping - Add New</h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" id="choiceTable">
          <thead>
          </thead>
          <tbody>
						        <tr class="even">
						          				<td class="fieldname" width="20%">
						          					Collateral Category<font color="red">*</font>
						          				</td>
						          				
												<td width="30%">
												
								                  		<html:select property="collateralCategory" 
								                  		styleId="collateralCategory" name="CollateralRocForm"
								                  		onchange="javascript:changeCollateralCode(this)">
								                  		<option value="">Please Select</option>
								                  		<html:options collection="collateralCategoryList" property="value" labelProperty="label" />
								                    	</html:select>
								                   		<br><html:errors property="collateralCategoryError"/>
												</td>
												<td class="fieldname" ></td>
             									<td>&nbsp;</td>
						        </tr>
						        
          						<tr class="odd">
										<td class="fieldname">Collateral Code<font color="red">*</font></td>
										<td><html:select name="CollateralRocForm"  property="collateralRocCode" value="<%=collateralRocCode %>"
											style="width:250px" styleId="collateralRocCode" onchange="changeDescription();">
											<option value="">Please Select</option>
											<%if(collateralRocCodeList!=null && collateralRocCodeList.size()>0){%>
											<html:options collection="collateralRocCodeList" labelProperty="label"
												property="value" />
												<%}%>
										</html:select>
										<br><html:errors property="collateralRocCodeError"/>
										<html:errors property="collateralRocCategoryError"/>
										</td>
										
										<td class="fieldname">Collateral Description</td>
										
										<td><html:text property="collateralRocDescription" size="30" 
											maxlength="75" styleId="collateralRocDescription"></html:text>&nbsp;
												<html:errors property="collateralRocDescriptionError"/>
										</td>
								</tr>
								
                  				<tr class="even">
												<td class="fieldname">
													IRB Category <font color="red">*</font>
												</td>
												<td>
              
										              	<html:select name="CollateralRocForm"   property="irbCategory" >
														<integro:common-code categoryCode="<%=CategoryCodeConstant.IRB_CATEGORY%>" descWithCode="false" />
										                </html:select>&nbsp;</br>
										                <html:errors property="irbCategoryError"/>
									            </td>
							
												<td class="fieldname">Insurance Applicable<font color="#FF0000">*</font></td>
 												<td>
		     											<html:radio property="insuranceApplicable" value="Applicable" ></html:radio>Applicable
		     											<html:radio property="insuranceApplicable" value="Not Applicable" ></html:radio>Not Applicable
														&nbsp;</br><html:errors property="insuranceApplicableError" />	
												</td>
									</tr>
				<html:hidden name="CollateralRocForm" property="collateralRocActualCode" styleId="collateralRocActualCode"/>
				<html:hidden name="CollateralRocForm" property="collateralCategory"/>
				<html:hidden name="CollateralRocForm" property="collateralRocCode"/>
				<html:hidden name="CollateralRocForm" property="collateralRocDescription"/>
                <html:hidden name="CollateralRocForm" property="irbCategory"/>
                <html:hidden name="CollateralRocForm" property="insuranceApplicable"/>
                <html:hidden name="CollateralRocForm" property="createBy"/>
 				<html:hidden name="CollateralRocForm" property="lastUpdateBy"/>
  				<html:hidden name="CollateralRocForm" property="lastUpdateDate"/>
   				<html:hidden name="CollateralRocForm" property="creationDate"/>
     			<html:hidden name="CollateralRocForm" property="deprecated" value="N"/>
     			<html:hidden name="CollateralRocForm" property="id"/>
                
            
           
		
          </tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
  <td colspan="4">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
			<td colspan="4"><a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" width="70" height="20"
				border="0" id="ImageSave" />
				
				</a>&nbsp;&nbsp;
				
				</td>
			<td colspan="4">
						
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						
						&nbsp;&nbsp;
					</td>
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<% if(formObj.getInsuranceApplicable() == null || formObj.getInsuranceApplicable().equals("")) { %>
				<script language="javascript">
				document.all.insuranceApplicable[1].checked=true;
				</script>
		<% } %>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>

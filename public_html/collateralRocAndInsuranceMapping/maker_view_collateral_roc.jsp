<%@page import="com.integrosys.cms.ui.collateralrocandinsurance.CollateralRocForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>
<%
	
	CollateralRocForm collateralRocForm = (CollateralRocForm) request
			.getAttribute("CollateralRocForm");
	
	String event = request.getParameter("event");
	  int startIndex = 0;
	    String ind= (String) request.getAttribute("startIndex");
		if(ind!=null && (!ind.equals("")))
			 startIndex = Integer.parseInt(ind);
	List collateralCategoryList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.collateralrocandinsurance.CollateralRocAction.collateralCategoryList");
	if (!(collateralCategoryList == null)) {
		pageContext.setAttribute("collateralCategoryList", collateralCategoryList);
		session.setAttribute("collateralCategoryList", collateralCategoryList);
		 
		}
	String rejectEvent;
	if (event.equals("checker_view_collateral_roc")) {
		rejectEvent = "checker_collateral_roc";
	} else {
		rejectEvent = "maker_list_collateral_roc";
	}
	int sno = 0;
	
%>
<%
String actionStr1 = "com.integrosys.cms.ui.collateralrocandinsurance.CollateralRocAction";
	
%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
function cancelPage(){
    document.forms[0].action="collateralrocandinsurance.do?event=<%=rejectEvent%>&go=N";
    document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='collateralrocandinsurance.do?'>
<body>
<input type="hidden" name="startIndex" id="startIndex" value="<%=startIndex %>">
<table align="center" width="80%"  class="tblFormSection">
<tr >

<td >&nbsp;</td>
</tr>
</table>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <br>
  <br>
  <br>
  <br>
  <br>
  <tr>
      <td><h3>Collateral Roc & Insurance Mapping - View </h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            								
											
											
											
						<tr class="even">
							<td class="fieldname">Collateral Category<font color="red">*</font>
									</td>

									<td class="even"><html:select property="collateralCategory"
											value='<%=collateralRocForm.getCollateralCategory()%>'
											styleId="collateralCategory" name="CollateralRocForm"
											disabled="true"
											onchange="javascript:changeCollateralCode(this)">
											<option value=""></option>
											<html:options collection="collateralCategoryList"
												property="value" labelProperty="label" />
										</html:select> <br>
									<html:errors property="collateralCategoryError" /></td>
									<td class="fieldname" ></td>
             									<td>&nbsp;</td>
						</tr>

								<tr class="odd">

									<td class="fieldname" width="20%">Collateral Code</td>
									<td width="30%" ><%=collateralRocForm.getCollateralRocCode()%>&nbsp;
									</td>

									<td class="fieldname">Collateral Description</td>
									<td><%=collateralRocForm.getCollateralRocDescription()%>&nbsp;
										<br /></td>

								</tr>
								<tr class="even">
									<td class="fieldname">IRB Category<font color="red">*</font>
									</td>
									<td>                                   
                                     	<integro:common-code-single entryCode="<%=collateralRocForm.getIrbCategory()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.IRB_CATEGORY%>" descWithCode="false" />&nbsp;
                                    		</center>
                                    </td>
								
									<td class="fieldname">Insurance Applicable<font color="red">*</font></td>
									<td class="even">
								<%
									if (collateralRocForm.getInsuranceApplicable() != null && collateralRocForm.getInsuranceApplicable().equals("Applicable")) {
								%>
									<input type="radio" name="insuranceApplicable" value="Applicable" checked="checked"
										disabled="disabled" /> Applicable
									<input type="radio" name="insuranceApplicable" value="Not Applicable"
										disabled="disabled" /> Not Applicable
								<%
										}
									%>
								<%
									if (collateralRocForm.getInsuranceApplicable() == null || collateralRocForm.getInsuranceApplicable().equals("Not Applicable")) {
								%>
									<input type="radio" name="insuranceApplicable" value="Applicable"
										disabled="disabled" /> Applicable
									<input type="radio" name="insuranceApplicable" value="Not Applicable" checked="checked"
										disabled="disabled" /> Not Applicable
								<%
										}
									%>
								
								</td>
						         
						     </tr>
											
											


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
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;
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
<!-- InstanceEnd --></html>

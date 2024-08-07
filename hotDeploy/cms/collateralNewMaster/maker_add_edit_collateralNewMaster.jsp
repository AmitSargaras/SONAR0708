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
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays"%>

<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterForm"%>  
<%
	String context = request.getContextPath() + "/";
%>               
<%
	boolean isInsuranceReq=true;
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
	 MaintainCollateralNewMasterForm collateralNewMasterForm = (MaintainCollateralNewMasterForm) request.getAttribute("MaintainCollateralNewMasterForm");
	DefaultLogger.debug("maker_list_collateralNewMaster.jsp", "size is " + collateralNewMasterForm+ "<<<<<<<<<<<<<<");
	String event = request.getParameter("event");
	pageContext.setAttribute("collateralNewMasterList", collateralNewMasterForm);
	List timeFreqList = (List)session.getAttribute("com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterAction.timeFreqList");	
	List colCategoryList = (List)session.getAttribute("com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterAction.colCategoryList");
	
	pageContext.setAttribute("timeFreqList",timeFreqList);
	pageContext.setAttribute("colCategoryList",colCategoryList);
	int sno = 0;
	int startIndex = 0;
	String ind= (String) request.getAttribute("startIndex");
	System.out.println(":::::::::::::::::::::::"+ind);
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	System.out.println(":::::::::::::::::::::::"+request.getParameter("newCollateralMainType"));
	
%>
<%
String actionStr1 = "com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>

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
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
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
    document.forms[0].action="collateralNewMaster.do?event=maker_list_collateralNewMaster&startIndex="+<%=startIndex%>+"&go=N&newCollateralDescription=&newCollateralCode=&newCollateralMainType=&newCollateralSubType=";
    document.forms[0].submit();
}



function saveForm() {

 	document.forms[0].action="collateralNewMaster.do?event=maker_update_draft_collateralNewMaster";
    document.forms[0].submit();
}
function submitForm(event) {
	
	if(event=="maker_prepare_resubmit_create")
		{
		
		document.forms[0].action="collateralNewMaster.do?event=maker_confirm_resubmit_create";
		
    }else{
      
    	document.forms[0].action="collateralNewMaster.do?event=maker_edit_collateralNewMaster";
    }
    
    document.forms[0].submit();
}
function refreshSubType(dropdown){	
	var currVal = "";
	for(i=0; i<dropdown.options.length; i++){
		if (dropdown.options[i].selected == true){
			currVal = dropdown.options[i].value;	
		}
	}
	if(currVal=='AB'||currVal=='OT'||currVal=='PT'){
		//alert("inside id type");
		//isInsuranceReq=false;
		document.getElementById("insurance").disabled=false;
		}else{
			document.getElementById("insurance").disabled=true;
			}		
	var dep = 'newCollateralSubType';

	var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name='+dep+'&code=<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>&ref='+currVal;

	
	sendLoadDropdownReq(dep, url);	
}	
function disableStatus(){
	document.forms[0].status="DISABLE";
}

function enableStatus(){
	document.forms[0].status="ENABLE";
}
//-->
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

<html:form action='collateralNewMaster.do?'>
<body>
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
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <br>
  <br>
  <br>
  <br>
  <br>
  <tr>
   <%if((event.equals("maker_prepare_resubmit_create"))){%>
                    <td><h3>Create Collateral Master</h3></td><!-- Heading changes added by Uma Khot -->
                    <%}else{ %>
                     <td><h3>Edit Collateral Master</h3></td><!-- Heading changes added by Uma Khot -->
                     <%} %>
     
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
          
           									<tr class="odd">

												<td class="fieldname" width="20%">Collateral Code</td>
												<td width="30%"><%=collateralNewMasterForm.getNewCollateralCode() %> &nbsp;
												<br/><html:errors property="newCollateralCodeError"/></td>
												<td class="fieldname">
													Collateral Description<font color="red">*</font>
												</td>
												<td><html:text property="newCollateralDescription" maxlength="75" value="<%=collateralNewMasterForm.getNewCollateralDescription() %>"  ></html:text>
												<br/><html:errors property="newCollateralDescriptionError"/></td>
												
											</tr>
											
          									 <tr class="even">

												<td class="fieldname">
													Collateral Type<font color="red">*</font>
												</td>
												<td>
<!--												<html:text property="newCollateralMainType" value="<%=collateralNewMasterForm.getNewCollateralMainType() %>"  ></html:text>-->
												<html:select property="newCollateralMainType" onchange="refreshSubType(this);">
                                    	<integro:common-code 
                                    		categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE%>"/>
                                    </html:select>
												<br/><html:errors property="newCollateralMainTypeError"/></td>
												<td class="fieldname">
													Collateral Sub Type<font color="red">*</font>
												</td>
												<td>
												<html:select property="newCollateralSubType">
								
                                    <integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>"  refEntryCode="<%=collateralNewMasterForm.getNewCollateralMainType() %>"/>
								
                                </html:select>
												<br/><html:errors property="newCollateralSubTypeError"/></td>
												
											</tr>
											<tr class="even">

												<td class="fieldname">
													Insurance Required
												</td>
												<%
												if(collateralNewMasterForm.getNewCollateralMainType().equals("AB")
														||collateralNewMasterForm.getNewCollateralMainType().equals("OT")
														||collateralNewMasterForm.getNewCollateralMainType().equals("PT")){
													isInsuranceReq=false;
												}
												%>
												<td><html:checkbox property="insurance" disabled="<%=isInsuranceReq %>" />
												</td>
												<td class="fieldname">
													Revaluation Frequency
												</td>
												<td><html:text property="revaluationFrequencyCount" maxlength="3"  />
												<html:select name="MaintainCollateralNewMasterForm"   property="revaluationFrequencyDays" >
											      <option value="">Please Select </option>	
									                      <html:options collection="timeFreqList" property="label" labelProperty="value"/>
									                    </html:select>&nbsp;  <html:errors property="revaluationFrequencyCountError"/>
												</td>
												
											</tr>
											  <tr class="odd">
             <td class="fieldname" >Status&nbsp;</td>
              <td >Enable<html:radio   property="status" value="ACTIVE" />&nbsp;
              Disable<html:radio  property="status" value="INACTIVE" />&nbsp;</td>
              <td class="fieldname" ></td>
              <td>&nbsp;</td>
            </tr>
            
            <tr class="even">
            	<td class="fieldname">
					Collateral Category<font color="red">*</font>
				</td>
				<td>
					<html:select property="newCollateralCategory" >
						<option value="">Please Select </option>	
						<html:options collection="colCategoryList" property="label" labelProperty="value"/>
					</html:select>
					<br/>
					<html:errors property="newCollateralCategoryError"/>
				</td>
				<td class="fieldname">
					CERSAI Charge Applicable<font color="red">*</font>
				</td>
				<td>Yes<html:radio property="isApplicableForCersaiInd" value="Y"/>
              		&nbsp;
              		No<html:radio property="isApplicableForCersaiInd" value="N"/>&nbsp;
              		<html:errors property="isApplicableForCersaiIndError"/>
              	</td>
			</tr>
											
            
                <html:hidden name="MaintainCollateralNewMasterForm" property="status" value="ENABLE"/>
                <html:hidden name="MaintainCollateralNewMasterForm" property="newCollateralSubType"/>
                <html:hidden name="MaintainCollateralNewMasterForm" property="newCollateralMainType"/>
                <html:hidden name="MaintainCollateralNewMasterForm" property="newCollateralDescription"/>
                <html:hidden name="MaintainCollateralNewMasterForm" property="newCollateralCode"/>
<!--                <html:hidden name="MaintainCollateralNewMasterForm" property="insurance"/>-->
                <html:hidden name="MaintainCollateralNewMasterForm" property="revaluationFrequencyCount"/>
                <html:hidden name="MaintainCollateralNewMasterForm" property="revaluationFrequencyDays"/>
                <html:hidden name="MaintainCollateralNewMasterForm" property="createBy"/>
 				<html:hidden name="MaintainCollateralNewMasterForm" property="lastUpdateBy"/>
  				<html:hidden name="MaintainCollateralNewMasterForm" property="lastUpdateDate"/>
    			<html:hidden name="MaintainCollateralNewMasterForm" property="creationDate"/>
     			<html:hidden name="MaintainCollateralNewMasterForm" property="deprecated" value="N"/>
     		 	<html:hidden name="MaintainCollateralNewMasterForm" property="id"/>           
                <html:hidden name="MaintainCollateralNewMasterForm" property="newCollateralCategory"/>
                <html:hidden name="MaintainCollateralNewMasterForm" property="isApplicableForCersaiInd"/>           
                           
 
                
            
           
            
           
		
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
  <%if((event.equals("maker_prepare_resubmit_create"))){%>
                   <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_prepare_resubmit_create')"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                    <%}else{ %>
                    <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_edit_collateralNewMaster')"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                     <%} %>
  <td colspan="2">
  <center>
  <a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" width="70" height="20"
				border="0" id="ImageSave" /></a>
				
				</center>
				&nbsp;
				</td>
			
 <td colspan="2">
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

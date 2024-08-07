<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.*,
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
<%@page import="com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterForm"%>                 
<%@page import="com.integrosys.cms.app.facilityNewMaster.bus.OBFacilityNewMaster"%>
  <%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.facilityNewMaster.bus.IFacilityNewMaster"%>

<% ArrayList filterActualRiskTypeIds = new ArrayList();
filterActualRiskTypeIds = (ArrayList)request.getAttribute("actualRiskTypeIds");

  %>
   
<%
	String context = request.getContextPath() + "/";
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	List facilityCategoryList = (List)session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.facilityCategoryList");
	
	List facilityTypeList = (List)session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.facilityTypeList");
	List systemList = (List)session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.systemList");
	List purposeList = (List)session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.purposeList");
	List productAllowedList =(List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.productAllowedList");
	List lineCurrencyList =(List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.lineCurrencyList");

	List actualRiskTypeIds =(List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.actualRiskTypeIds");
	pageContext.setAttribute("actualRiskTypeIds",actualRiskTypeIds);
	
	List actualRiskTypeIds1 =(List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.actualRiskTypeIds1");
	
	if(actualRiskTypeIds1 != null)
	{
	System.out.println("actualRiskTypeIds1=============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+actualRiskTypeIds1);
	pageContext.setAttribute("actualRiskTypeIds1",actualRiskTypeIds1);
	}
	else
	{
		actualRiskTypeIds1= new ArrayList();
		pageContext.setAttribute("actualRiskTypeIds1",actualRiskTypeIds1);
	}
	
	IFacilityNewMaster obj=new OBFacilityNewMaster();
	 MaintainFacilityNewMasterForm facilityNewMasterForm = (MaintainFacilityNewMasterForm) request.getAttribute("MaintainFacilityNewMasterForm");

	String riskTypeAllowed=facilityNewMasterForm.getSelectedRiskTypes();

										 

	
	if(null!=actualRiskTypeIds && null!=actualRiskTypeIds1) {
	 	for(int i=0;i<actualRiskTypeIds1.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)actualRiskTypeIds1.get(i);
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			actualRiskTypeIds.add(lvBean1);
	 			actualRiskTypeIds1.remove(lvBean1);
	 	}
	}
	int cnt = actualRiskTypeIds.size();
	ArrayList newArrRiskType = new ArrayList();
	if(null!=riskTypeAllowed && null!=actualRiskTypeIds) {
		List<String> items = Arrays.asList(riskTypeAllowed.split(","));
	 	for(int i=0;i<actualRiskTypeIds.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)actualRiskTypeIds.get(i);
	 		if(items.contains(lvBean.getValue())) {
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			actualRiskTypeIds1.add(lvBean1);
	 			//actualRiskTypeIds.remove(lvBean1);
	 			newArrRiskType.add(lvBean1);
	 		}
	 	}
	}
	pageContext.setAttribute("actualRiskTypeIds1",actualRiskTypeIds1);
	pageContext.setAttribute("actualRiskTypeIds",actualRiskTypeIds);
	
	if(null!=actualRiskTypeIds && null!=newArrRiskType) {
	 	for(int i=0;i<newArrRiskType.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)newArrRiskType.get(i);
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			//actualRiskTypeIds.add(lvBean1);
	 			actualRiskTypeIds.remove(lvBean1);
	 	}
	}
	
	

	
	int sno = 0;
	int startIndex = 0;
	

	
	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ list of hub "+facilityCategoryList);
	
	pageContext.setAttribute("facilityCategoryList",facilityCategoryList);
	pageContext.setAttribute("facilityTypeList",facilityTypeList);
	pageContext.setAttribute("systemList",systemList);
	pageContext.setAttribute("purposeList",purposeList);
	pageContext.setAttribute("productAllowedList",productAllowedList);
	pageContext.setAttribute("lineCurrencyList",lineCurrencyList);
%>


<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
 
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">

function checkAvailAndOptionApplicable()
{
    var x =document.getElementById("AvailAndOptionApplicable").checked;
        if (x == true) {
        document.getElementById("AvailAndOptionApplicable").value="on";
        document.getElementById("availAndOptionApplicable").value="on";
        }
    else
        {
        document.getElementById("availAndOptionApplicable").value="off";
        document.getElementById("AvailAndOptionApplicable").value="off";
        //document.forms[0].skipImgTag.value="DISABLE";
    //    alert("skipImgTag"+document.forms[0].skipImgTag.value);
        }
    
}


function hideCurrencyRestriction(dropdown) 
{
	
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}
		if(curSel == "UBS-LIMITS" || curSel == "FCUBS-LIMITS" ) {
	    	document.getElementById("CurrencyRestriction").style.visibility = "visible";
	    }
		else {
		    document.getElementById("CurrencyRestriction").style.visibility = "hidden";
		}

	 }
}	

function moveDualList( srcList, destList, moveAll,operation) 
{
	//alert("operation="+operation)
	// Do nothing if source is empty
	if (!hasOptions(srcList) ||
		(( srcList.selectedIndex == -1 ) && ( moveAll == false ) )) { return; } // or nothing is selected 

	var SelID='';
	var SelText='';
	// Move rows from srcList to destList from bottom to top
	for (i=srcList.options.length - 1; i>=0; i--)
	{
		if (srcList.options[i].selected == true || moveAll)
		{
			SelID=srcList.options[i].value;
			SelText=srcList.options[i].text;
			
			var newRow = new Option(SelText,SelID);
			destList.options[destList.length]=newRow;
			srcList.options[i]=null;
		}
	}
	sortSelect(destList);

	var temp="";
	if(operation=="Add"){
		for(var i=0;i<destList.length-1;i++){
			temp+=destList[i].value+",";
		}
		temp+=destList[destList.length-1].value
		document.getElementById('selectedRiskTypes').value=temp;
	}
	if(operation=="Delete"){
		if(srcList.length==0)
			document.getElementById('selectedRiskTypes').value="";
		
		for(var i=0;i<srcList.length-1;i++){
			temp+=srcList[i].value+",";
		}
		temp+=srcList[srcList.length-1].value
		document.getElementById('selectedRiskTypes').value=temp;
		
	}	
}

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
    document.forms[0].action="facilityNewMaster.do?event=maker_list_facilityNewMaster&go=N";
    
    document.forms[0].submit();
}
function submitForm() {
 	document.forms[0].action="facilityNewMaster.do?event=maker_create_facilityNewMaster";
    document.forms[0].submit();
}

function saveForm() {
	
 	document.forms[0].action="facilityNewMaster.do?event=maker_draft_facilityNewMaster";
    document.forms[0].submit();
}

function enableStatus(){
	document.forms[0].status="ACTIVE";
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
<bean:define id="formObj" name="MaintainFacilityNewMasterForm" scope="request" type="com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterForm"/>
<html:form action="/facilityNewMaster" onreset="showSpanCustodian()">
<body onload="showSpanCustodian();enableStatus();">

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3>Add New Facility</h3></td>
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
          
           <tr class="odd">

												<td class="fieldname" width="20%">
													Facility Code
													
												</td>
												<td width="30%" class="even">
												 
												 
												<html:text property="newFacilityCode" maxlength="30"  style="background:#B4CFEC" disabled="true"/>
												&nbsp;
												<br/><html:errors property="newFacilityCodeError"/>												
												</td>
												<td class="fieldname">
													Facility Name <font color="red">*</font>
												</td>
												<td><html:text property="newFacilityName" maxlength="75" ></html:text>&nbsp;
												<br/><html:errors property="newFacilityNameError" />
												</td>
												
											</tr>
											
          									 <tr class="even">
												<td class="fieldname">
													Facility Category <font color="red">*</font>
												</td>
												<td>
              
									              <html:select name="MaintainFacilityNewMasterForm"   property="newFacilityCategory" >
<!--											      <option value="">Please Select  </option>	-->
<!--									                      <html:options collection="facilityCategoryList" property="label" labelProperty="value"/>-->
												<integro:common-code categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY%>" descWithCode="false" />
									                    </html:select>&nbsp;</br><html:errors property="newFacilityCategoryError"/> </td>
												
												<td class="fieldname">
													Facility Type <font color="red">*</font>  
												</td>
												<td>
              
									              <html:select name="MaintainFacilityNewMasterForm"   property="newFacilityType" >
											      <option value="">Please Select </option>	
									                      <html:options collection="facilityTypeList" property="value" labelProperty="label"/>
									                    </html:select>&nbsp;</br><html:errors property="newFacilityTypeError"/> </td>
												
											</tr>
											<tr class="even">

												<td class="fieldname">
													System <font color="red">*</font>
												</td>
												<td><html:select property="newFacilitySystem" style="width:250px" onclick="javascript:hideCurrencyRestriction(this)">
										<integro:common-code categoryCode="<%=CategoryCodeConstant.SYSTEM%>" />
										</html:select>&nbsp;</br><html:errors property="newFacilitySystemError"/> </td>
												<td class="fieldname">
													Line no.
												</td>
												<td><html:text property="lineNumber" maxlength="20"/>&nbsp;</br><html:errors property="lineNumberError"/><html:errors property="duplicateCodeError"/>
												</td>
												
											</tr>
											<tr class="even">

												<td class="fieldname">
													Purpose
												</td>
												<td>
												<html:select property="purpose" style="width:250px">
										<integro:common-code categoryCode="<%=CategoryCodeConstant.PURPOSE%>" />
										</html:select>&nbsp;</br><html:errors property="purposeListError"/> </td>
									                    
												<td class="fieldname">
													Weightage %
												</td>
												<td><html:text property="weightage" value="100" maxlength="8"  />&nbsp;</br><html:errors property="weightageError"/>
												<html:errors property="WeightageError"/>
												</td>
												
											</tr>
											<tr class="odd">
             <td class="fieldname" >Status&nbsp;</td>
              <td >Enable<input type="radio" checked="checked" id="status" name="status" value="ACTIVE" disabled="disabled" >
              &nbsp;
              Disable<input type="radio"  id="status" name="status" value="INACTIVE" disabled="disabled">&nbsp;</td>
             <td class="fieldname">
													Rule Id 
												</td>
												<td>
              
									              <html:select name="MaintainFacilityNewMasterForm"   property="ruleId" >

												<integro:common-code categoryCode="<%=CategoryCodeConstant.NPA_RULE_ID%>" descWithCode="false" />
									                    </html:select>&nbsp;</br></td>
            </tr>
                                         <tr class="even">
                                         <td class="fieldname" width="20%">Product Allowed</td>
			  <td >
									 <html:select name="MaintainFacilityNewMasterForm" property="productAllowed" style="width:250px">
									 <option value="">Please Select </option>	
						               <html:options collection="productAllowedList" property="value" labelProperty="label"/>
						            </html:select> &nbsp;</br>
             </td>
                                       <td class="fieldname" >Currency Restriction<font color="red" id="CurrencyRestriction">*</font></td>
                                       <td >Yes<html:radio name="MaintainFacilityNewMasterForm"  property="currencyRestriction"  value="Yes" />
                                       &nbsp;
                                       No<html:radio name="MaintainFacilityNewMasterForm"  property="currencyRestriction"  value="No"/> 
                                       <html:errors property="currencyRestrictionError"/>&nbsp;</td>&nbsp;</td>									                    
                                       
                                       </tr>
                                       
                                       <tr class="odd">
                                       <td class="fieldname">Revolving Line</td>
                                       <td>
                                    <html:radio property="revolvingLine" value="Yes" ></html:radio>Yes
		     						<html:radio property="revolvingLine" value="No" ></html:radio>No</td>
                                      <td class="fieldname" width="20%">Line Currency</td>
			                         <td >
									 <html:select name="MaintainFacilityNewMasterForm" property="lineCurrency" style="width:250px">
									 <option value="">Please Select </option>
						             <html:options collection="lineCurrencyList" property="value" labelProperty="label"/>
						             </html:select>  &nbsp;</br>
                                     </td>          
                                     </tr>
                                       
                                       <tr class="even">
                                       <td class="fieldname" >Eligible for Intraday Limit<font color="red">*</font>&nbsp;</td>
                                       <td ><html:radio property="intradayLimit"  value="Yes" ></html:radio>Yes
                                       <html:radio   property="intradayLimit"  value="No" ></html:radio>No&nbsp;</br>
                                       <html:errors property="intradayLimitError"/></td>	
                                       <td class="fieldname" >STL Flag<font color="red">*</font>&nbsp;</td>
                                       <td ><html:radio   property="stlFlag" value="Yes" ></html:radio>Yes
                                        <html:radio   property="stlFlag"  value="No" ></html:radio>No&nbsp;</br>
                                       <html:errors property="stlFlagError"/></td>	
                                       </tr>
                                       <tr class="odd">
                                       <td class="fieldname">
													Line Description <font color="red">*</font>
												</td>
												<td><html:text property="lineDescription" maxlength="100" ></html:text>&nbsp;
												<br/>
												<html:errors property="lineDescriptionError"/>
												<html:errors property="lineDescriptionlengthError"/>
												</td>
												 <td class="fieldname" >SCM Flag<font color="red">*</font>&nbsp;</td>
                                       <td ><html:radio   property="scmFlag" value="Yes" ></html:radio>Yes
                                        <html:radio   property="scmFlag"  value="No" ></html:radio>No&nbsp;</br>
                                       <html:errors property="scmFlagError"/></td>	
												
										</tr>
										<tr class="even">
												<td class="fieldname">
													Line Exclude from LOA Master
												</td>
												<td>
													<html:checkbox name="MaintainFacilityNewMasterForm" property="lineExcludeFromLoa" value="Y"/>
												</td>
												<td class="fieldname" >IDL Applicable</td>
                                       <td ><html:radio   property="idlApplicableFlag" value="Yes" ></html:radio>Yes
                                        <html:radio   property="idlApplicableFlag"  value="No" ></html:radio>No&nbsp;</br>
                                       <html:errors property="idlApplicableFlagError"/></td>	
										</tr>		
            
           
       
             <tr class="even">
                  <td class="fieldname">Availability & Option Applicable</td>
  				     <% if(null !=formObj.getAvailAndOptionApplicable()  && ("Yes".equalsIgnoreCase(formObj.getAvailAndOptionApplicable()) || "on".equalsIgnoreCase( formObj.getAvailAndOptionApplicable() ))){%> 
                 	<td>	 <input type="checkbox" id="AvailAndOptionApplicable" name="availAndOptionApplicable" property="availAndOptionApplicable" disabled="true"  checked="true" onclick="javascript:checkAvailAndOptionApplicable()"></input>
                 	</td>
					 <html:hidden property="availAndOptionApplicable" styleId="availAndOptionApplicable"/>
					<% }else {%> 
					<td><input type="checkbox" id="AvailAndOptionApplicable" name="availAndOptionApplicable" property="availAndOptionApplicable"  onclick="javascript:checkAvailAndOptionApplicable()"></input>
					</td>
								<html:hidden property="availAndOptionApplicable" styleId="availAndOptionApplicable"/>
								<%} %>
								
				<td class="fieldname" >&nbsp;</td>
                <td>&nbsp;</td>			
                </tr>

			<tr class="odd">
                 <td class="fieldname" width="20%">Risk Type Master <font color="#ff0000">*</font></td>
                     <td width="30%">
						   <html:select name="MaintainFacilityNewMasterForm" size="10" multiple="multiple" style="width:260" property="allListRiskType" >
							<html:options collection="actualRiskTypeIds" property="value" labelProperty="label"/> 
		                			</html:select> 
             		        <td>
		             		<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allListRiskType,riskTypeNames, false,'Add')" class="btnNormal"/>
			                <br/> <br/>  
							<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(riskTypeNames,allListRiskType,false, 'Delete')" class="btnNormal"/>
		               </td>
		               <td>
									 <html:select name="MaintainFacilityNewMasterForm" size="10" multiple="multiple" style="width:260" property="riskTypeNames" >
 		                			 <html:options collection="actualRiskTypeIds1" property="value" labelProperty="label"/> 
 		                			
		                			</html:select> 
		                			&nbsp;</br><html:errors property="riskTypeNames"/>
		                		</td>
              
            </tr> 
        
           
           
                <html:hidden name="MaintainFacilityNewMasterForm" property="status" />
                 <html:hidden name="MaintainFacilityNewMasterForm" property="weightage"/>
                  <html:hidden name="MaintainFacilityNewMasterForm" property="purpose"/>
                   <html:hidden name="MaintainFacilityNewMasterForm" property="lineNumber"/>
                     <html:hidden name="MaintainFacilityNewMasterForm" property="newFacilitySystem"/>
                       <html:hidden name="MaintainFacilityNewMasterForm" property="newFacilityType"/>
                         <html:hidden name="MaintainFacilityNewMasterForm" property="newFacilityName"/>
                           <html:hidden name="MaintainFacilityNewMasterForm" property="newFacilityCode"/>
 <html:hidden name="MaintainFacilityNewMasterForm" property="createBy"/>
 <html:hidden name="MaintainFacilityNewMasterForm" property="lastUpdateBy"/>
  <html:hidden name="MaintainFacilityNewMasterForm" property="lastUpdateDate"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="creationDate"/>
     <html:hidden name="MaintainFacilityNewMasterForm" property="deprecated" value="N"/>
      <html:hidden name="MaintainFacilityNewMasterForm" property="id"/>
          <html:hidden name="MaintainFacilityNewMasterForm" property="productAllowed"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="currencyRestriction"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="revolvingLine"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="lineCurrency"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="intradayLimit"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="stlFlag"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="lineDescription"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="scmFlag"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="selectedRiskTypes" styleId="selectedRiskTypes"/>
    <html:hidden name="MaintainFacilityNewMasterForm" property="idlApplicableFlag"/>
   
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

<% if(formObj.getRevolvingLine() == null || formObj.getRevolvingLine().equals("")) { %>
				<script language="javascript">
				document.all.revolvingLine[1].checked=true;
				</script>
		<% } %>
<% if(formObj.getIntradayLimit() == null || formObj.getIntradayLimit().equals("")) { %>
				<script language="javascript">
				document.all.intradayLimit[1].checked=true;
				</script>
		<% } %>
<% if(formObj.getStlFlag() == null || formObj.getStlFlag().equals("")) { %>
				<script language="javascript">
				document.all.stlFlag[1].checked=true;
				</script>
		<% } %>	
<% if(formObj.getScmFlag() == null || formObj.getScmFlag().equals("")) { %>
				<script language="javascript">
				document.all.scmFlag[1].checked=true;
				</script>
		<% } %>	
<% if(formObj.getIdlApplicableFlag() == null || formObj.getIdlApplicableFlag().equals("")) { %>
				<script language="javascript">
				document.all.idlApplicableFlag[1].checked=true;
				</script>
		<% } %>								
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>

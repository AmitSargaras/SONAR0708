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
                 com.integrosys.cms.app.common.constant.ICMSConstant,
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
                  
<%
	 MaintainFacilityNewMasterForm facilityNewMasterForm = (MaintainFacilityNewMasterForm) request.getAttribute("MaintainFacilityNewMasterForm");
	DefaultLogger.debug("maker_list_facilityNewMaster.jsp", "size is " + facilityNewMasterForm+ "<<<<<<<<<<<<<<");
	String event = request.getParameter("event");
	List  facilityCategoryList = (List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.facilityCategoryList");
	
	pageContext.setAttribute("facilityCategoryList", facilityCategoryList);
	List  facilityTypeList = (List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.facilityTypeList");
	
	pageContext.setAttribute("facilityTypeList", facilityTypeList);
	List  systemList = (List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.systemList");
	
	pageContext.setAttribute("systemList", systemList);
	List  purposeList = (List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.purposeList");
	
	pageContext.setAttribute("purposeList", purposeList);
	pageContext.setAttribute("facilityNewMasterList", facilityNewMasterForm);
	
	
	List productAllowedList =(List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.productAllowedList");
	pageContext.setAttribute("productAllowedList",productAllowedList);
	
	List lineCurrencyList =(List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.lineCurrencyList");
	pageContext.setAttribute("lineCurrencyList",lineCurrencyList);
	

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
	

	IFacilityNewMasterTrxValue trxvalue = (IFacilityNewMasterTrxValue)session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.IFacilityNewMasterTrxValue");
	System.out.println("getFromState>>>>>"+trxvalue.getFromState());
	
	
%>



<%@page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>

<%@page import="com.integrosys.cms.app.facilityNewMaster.trx.IFacilityNewMasterTrxValue"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/itgDualList.js"></script>
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

function moveDualList( srcList, destList, moveAll,operation) 
{
	
    // alert("operation="+operation)
	// Do nothing if source is empty
	var unSelectList=document.getElementById('unSelectList').value;
	var unSelect = unSelectList.toString();
	var authorizedArray = unSelect.split(",");
	
	if (!hasOptions(srcList) ||
		(( srcList.selectedIndex == -1 ) && ( moveAll == false )) ) { return; } // or nothing is selected 

		var SelID='';
		var SelText='';				

	for(k=0;k<srcList.length;k++){
		if(srcList.options[k].selected == true){			
			if(authorizedArray.indexOf(srcList.options[k].value) == -1){					
				// Move rows from srcList to destList from bottom to top
			  for (i=srcList.options.length - 1; i>=0; i--)
			  {					
					if (srcList.options[i].selected == true)
					{
						SelID=srcList.options[i].value;
						SelText=srcList.options[i].text;
						if(authorizedArray.indexOf(SelID) == -1){
							var newRow = new Option(SelText,SelID);
							destList.options[destList.length]=newRow;
							srcList.options[i]=null;
						}
					}
				}
				
				sortSelect(destList);

				var temp="";
				
				if(operation=="Add"){
					for(var i=0;i<destList.length-1;i++){
						temp+=destList[i].value+",";
					}
					
					temp+=destList[destList.length-1].value;
					document.getElementById('selectedRiskTypes').value=temp;
				}
				
				if(operation=="Delete"){
					if(srcList.length==0)
						document.getElementById('selectedRiskTypes').value="";
					
					for(var i=0;i<srcList.length-1;i++){
						temp+=srcList[i].value+",";
					}
					temp+=srcList[srcList.length-1].value;
					document.getElementById('selectedRiskTypes').value=temp;
				}	
			}
		}
	}
}
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function showSpanHub()   {
 	document.getElementById("linkedHub").style.visibility = "visible";
}

function hideSpanHub()   {
document.getElementById("linkedHub").style.visibility = "hidden"; 
}

function showSpanCustodian()   {

if(document.forms[0].isVault.checked==false){
	document.getElementById("cust1").className = "hiddenDiv";
	document.getElementById("cust2").className = "hiddenDiv";
	//document.getElementById("cust1").style.visibility = "hidden"; 
	// document.getElementById("cust2").style.visibility = "hidden"; 
	
	}else if(document.forms[0].isVault.checked==true){
		document.getElementById("cust1").className = "visibleDiv";
		document.getElementById("cust2").className = "visibleDiv";
	//	 document.getElementById("cust1").style.visibility = "visible"; 
	//	 document.getElementById("cust2").style.visibility = "visible"; 
		}
 
 	//document.getElementById("custodian").style.visibility = "visible";
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
function submitForm(event) {
		document.forms[0].action="facilityNewMaster.do?event=maker_save_update";
	    document.forms[0].submit();
}

function saveForm() {

 	document.forms[0].action="facilityNewMaster.do?event=maker_draft_facilityNewMaster";
    document.forms[0].submit();
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

<html:form action='facilityNewMaster.do?'>
<body>
<input type="hidden" name="unSelectList" id="unSelectList" value="<%=facilityNewMasterForm.getSelectedRiskTypes()%>">
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
                    <td><h3>Create Facility Master</h3></td>
                    <%}else{ %>
                     <td><h3>Edit Facility Master</h3></td>
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

												<td class="fieldname" width="20%">
													Facility Code
												</td>
												<td width="30%"><%=facilityNewMasterForm.getNewFacilityCode()%>&nbsp;
												</td>
												<td class="fieldname">
													Facility Name<font color="red">*</font>
												</td>
												<td><html:text property="newFacilityName" maxlength="75"></html:text>
												<br/><html:errors property="newFacilityNameError"/>
												
											</tr>
											
          									
												
										 <tr class="even">
												<td class="fieldname">
													Facility Category<font color="red">*</font>
												</td>
												<td>
              
									              <html:select name="MaintainFacilityNewMasterForm"   property="newFacilityCategory" >
<!--											  <option value="">Please Select </option>	-->
<!--									                      <html:options collection="facilityCategoryList" property="label" labelProperty="value"/>-->
													<integro:common-code categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY%>" descWithCode="false" />
									                    </html:select>&nbsp;</br><html:errors property="newFacilityCategoryError"/> </td>
												
												<td class="fieldname">
													Facility Type<font color="red">*</font>  
												</td>
												<td>
              
									              <html:select name="MaintainFacilityNewMasterForm"   property="newFacilityType" >
											      <option value="">Please Select </option>	
									                      <html:options collection="facilityTypeList" property="value" labelProperty="label"/>
									                    </html:select>&nbsp;</br><html:errors property="newFacilityTypeError"/> </td>
												
											</tr>
											<tr class="odd">

												<td class="fieldname">
													System<font color="red">*</font>
												</td>
												<td>
              
									              <html:select property="newFacilitySystem" style="width:250px">
										<integro:common-code categoryCode="<%=CategoryCodeConstant.SYSTEM%>" />
										</html:select>&nbsp;</br><html:errors property="newFacilitySystemError"/> </td>
												<td class="fieldname">
													Line no.
												</td>
												<td><html:text property="lineNumber"  maxlength="25"/>&nbsp;</br><html:errors property="lineNumberError"/>
												</td>
												
											</tr>
											<tr class="even">

												<td class="fieldname">
													Purpose
												</td>
												<td>
												<html:select name="MaintainFacilityNewMasterForm"   property="purpose" >
											      <option value="">Please Select </option>	
									                      <html:options collection="purposeList" property="value" labelProperty="label"/>
									                    </html:select>&nbsp;</br><html:errors property="purposeListError"/> </td>
									                    
												<td class="fieldname">
													Weightage %
												</td>
												<td><html:text property="weightage"  />&nbsp;</br><html:errors property="WeightageError"/>
												</td>
												
											</tr>
											 <tr class="odd">
             <td class="fieldname" >Status&nbsp;</td>
             <% if(  trxvalue.getFromState().equals("ACTIVE") ){ %>
             	<td >Enable<html:radio   property="status" value="ACTIVE"/>&nbsp;
              Disable<html:radio  property="status" value="INACTIVE"/>&nbsp;</td>
             <%}else{ %>
              <td >Enable<html:radio   property="status" value="ACTIVE" disabled="true"/>&nbsp;
              Disable<html:radio  property="status" value="INACTIVE" disabled="true"/>&nbsp;</td>
              <%} %>
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
                                       <td class="fieldname" >Currency Restriction</td>
                                       <td >Yes<html:radio name="MaintainFacilityNewMasterForm"  property="currencyRestriction"  value="Yes" />
                                       &nbsp;
                                       No<html:radio name="MaintainFacilityNewMasterForm"  property="currencyRestriction"  value="No"/> 								                    
                                       <html:errors property="currencyRestrictionError"/>&nbsp;</td></tr>
                                       
                                       <tr class="odd">
                                       <td class="fieldname" >Revolving Line</td>
                                       <td >Yes<html:radio name="MaintainFacilityNewMasterForm"  property="revolvingLine"  value="Yes" />
                                       &nbsp;
                                       No<html:radio  name="MaintainFacilityNewMasterForm"  property="revolvingLine"  value="No" />&nbsp;</td>									                    
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
                                       <td >Yes<html:radio name="MaintainFacilityNewMasterForm"  property="intradayLimit"  value="Yes" />
                                       &nbsp;
                                       No<html:radio   name="MaintainFacilityNewMasterForm"  property="intradayLimit"  value="No" />
                                       <html:errors property="intradayLimitError"/>&nbsp;</td>	
                                       <td class="fieldname" >STL Flag<font color="red">*</font>&nbsp;</td>
                                       <td >Yes<html:radio name="MaintainFacilityNewMasterForm"  property="stlFlag"  value="Yes" />
                                       &nbsp;
                                       No<html:radio  name="MaintainFacilityNewMasterForm"  property="stlFlag"  value="No" />
                                       <html:errors property="stlFlagError"/>&nbsp;</td>	
                                       </tr>
                                       <tr class="odd">
                                       <td class="fieldname">
													Line Description <font color="red">*</font>
												</td>
												<td><html:text property="lineDescription" maxlength="75" ></html:text>&nbsp;
												<br/>
												<html:errors property="lineDescriptionError"/>
												<html:errors property="lineDescriptionlengthError"/>
												</td>
												<td class="fieldname" >SCM Flag<font color="red">*</font>&nbsp;</td>
                                       <td >Yes<html:radio name="MaintainFacilityNewMasterForm"  property="scmFlag"  value="Yes" />
                                       &nbsp;
                                       No<html:radio  name="MaintainFacilityNewMasterForm"  property="scmFlag"  value="No" />
                                       <html:errors property="scmFlagError"/>&nbsp;</td>	
												
										</tr>	

										<tr>
												<td class="fieldname">
													Line Exclude from LOA Master
												</td>
												<td>
													<html:checkbox name="MaintainFacilityNewMasterForm" property="lineExcludeFromLoa" value="Y"/>
												</td>
												
											 <td class="fieldname" >IDL Applicable</td>
                                       <td >Yes<html:radio name="MaintainFacilityNewMasterForm"  property="idlApplicableFlag"  value="Yes" />
                                       &nbsp;
                                       No<html:radio  name="MaintainFacilityNewMasterForm"  property="idlApplicableFlag"  value="No" />
                                       <html:errors property="idlApplicableFlagError"/>&nbsp;</td>
										</tr>	
										<tr class="even">
                  <td class="fieldname">Availability & Option Applicable</td>
  				    <%System.out.println("facilityNewMasterForm.getAvailAndOptionApplicable().............."+facilityNewMasterForm.getAvailAndOptionApplicable()); %>
  				     <% if(null !=facilityNewMasterForm.getAvailAndOptionApplicable()  && ("Yes".equalsIgnoreCase(facilityNewMasterForm.getAvailAndOptionApplicable().trim() ) || "on".equalsIgnoreCase( facilityNewMasterForm.getAvailAndOptionApplicable().trim() ))){%> 
                 	<td>	 <input type="checkbox" id ="AvailAndOptionApplicable"  name="availAndOptionApplicable" property="availAndOptionApplicable" onclick="javascript:checkAvailAndOptionApplicable()" checked="true" ></input>
                 	</td>
					 <html:hidden property="availAndOptionApplicable" styleId="availAndOptionApplicable"/>
					<% }else {%> 
					<td><input type="checkbox" id ="AvailAndOptionApplicable"  name="availAndOptionApplicable" onclick="javascript:checkAvailAndOptionApplicable()" property="availAndOptionApplicable"   ></input></td>
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
              
                <html:hidden name="MaintainFacilityNewMasterForm" property="status"/>
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
     <html:hidden name="MaintainFacilityNewMasterForm" property="deprecated"/>
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
   <%if((event.equals("maker_update_save_process"))){%>
                   <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_update_save_process')"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                    <%}else{ %>
                    <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_save_create')"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                     <%} %>
   
<!--			<td colspan="2"><a href="javascript:saveForm();"-->
<!--				onmouseout="MM_swapImgRestore()"-->
<!--				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img-->
<!--				src="img/save1.gif" name="ImageSave" width="70" height="20"-->
<!--				border="0" id="ImageSave" /></a>-->
<!--				&nbsp;&nbsp;-->
<!--				-->
<!--				</td>-->
			<td colspan="2">
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;&nbsp;
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

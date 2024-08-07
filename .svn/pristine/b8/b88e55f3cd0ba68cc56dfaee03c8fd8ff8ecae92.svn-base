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
                 java.util.Arrays,
                 com.integrosys.cms.ui.common.CommonCodeList"%>
<%@page import="com.integrosys.cms.ui.component.MaintainComponentForm"%>                 
<%
MaintainBaselForm baselForm = (MaintainBaselForm) request.getAttribute("MaintainBaselForm");
IBaselMasterTrxValue baselTrx = (IBaselMasterTrxValue)session.getAttribute("com.integrosys.cms.ui.baselmaster.MaintainBaselMasterAction.IBaselMasterTrxValue");
	String event = request.getParameter("event");
	pageContext.setAttribute("baselList", baselForm);
	int sno = 0;
	int startIndex = 0;
	 String ind= (String)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.startIndex");
	 System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL>>>>>>>>>>>> startIndex"+startIndex);
		if(ind!=null && (!ind.equals("")))
			 startIndex = Integer.parseInt(ind);
		
	
	String searchcomponentName=(String)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.searchcomponentName");
	System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL>>>>>>>>>>>> searchcomponentName"+searchcomponentName);
	CommonCodeList commonCode = CommonCodeList.getInstance("BASEL_MASTER");
	pageContext.setAttribute("refCatCodeLabels",commonCode.getCommonCodeLabels());
	pageContext.setAttribute("refCatCodeValues",commonCode.getCommonCodeLabels());	
%>



<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.baselmaster.MaintainBaselForm"%>
<%@page import="com.integrosys.cms.app.baselmaster.trx.IBaselMasterTrxValue"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
	document.forms[0].action="baselmaster.do?event=return_search_basel";
	  document.forms[0].submit();
}



function saveForm() {

 	document.forms[0].action="baselmaster.do?event=maker_update_draft_component";
    document.forms[0].submit();
}
function submitForm(event) {
	
	if(event=="maker_prepare_resubmit_create")
		{
		
		document.forms[0].action="baselmaster.do?event=maker_confirm_resubmit_create";
		
    }else{
      
    	document.forms[0].action="baselmaster.do?event=maker_edit_basel";
    }
    
    document.forms[0].submit();
}
function disableStatus(){
	document.forms[0].status="DISABLE";
}

function enableStatus(){
	document.forms[0].status="ENABLE";
}

function disable(){
	

	if(document.MaintainComponentForm.componentType[1].checked){
		document.MaintainComponentForm.hasInsurance.checked = false;
		document.MaintainComponentForm.hasInsurance.disabled = true;
	}

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

<html:form action='baselmaster.do?'>
<body>
<input type="hidden" name="startIndex" id="startIndex" value="<%=startIndex %>">

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
 <tr><td align="right"><font color="red">*</font>Mandatory</td>
  </tr>
  <tr>
   <%if((event.equals("maker_prepare_resubmit_create"))){%>
                    <td><h3>Create Component</h3></td>
                    <%}else{ %>
                     <td><h3>Edit Basel System Master</h3></td>
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
          
           <tr class="even">
             
              <td class="fieldname" width="20%">
               System Filed<font color="red">*</font>
              </td>
              <td width="30%"><span class="odd"> <html:select
								property="system"
								value="<%=baselForm.getSystem() %>">
								<%-- <integro:common-code
									categoryCode="<%=CategoryCodeConstant.BASEL_MASTER%>"
									descWithCode="false" /> --%>
									<html:options name="refCatCodeValues" labelName="refCatCodeLabels"/>
							</html:select> <html:errors property="systemError"/> </span></td>    
			  <td class="fieldname" width="20%">
               Value Filed<font color="red">*</font>
              </td>  
              <td><html:text property="systemValue" maxlength="5" value="<%=baselForm.getSystemValue() %>"  size="10"></html:text>&nbsp;   <html:errors property="systemValueError"/>   </td>            
            </tr>
            
            <tr class="odd">             
              <td class="fieldname" width="20%">Exposure Source System<font color="red">*</font></td>
                <td width="30%"><html:text property="exposureSource" maxlength="5" value="<%=baselForm.getExposureSource() %>" size="10"></html:text>&nbsp;   <html:errors property="exposureError"/>   </td>   
             <td class="fieldname" width="20%">Basel Validation<font color="red">*</font></td>
                 <td>
                 <html:radio property="baselValidation" value="L" name="MaintainBaselForm" onclick="javascript:enable()" ></html:radio>
              Limit
              &nbsp;&nbsp;
              <html:radio property="baselValidation" value="A" name="MaintainBaselForm" onclick="javascript:enable()" ></html:radio>
              Account&nbsp;
               <html:errors property="baselError"/> 
              </td>            
            </tr>
            
            <tr class="even">             
              <td class="fieldname" width="20%">To be reported in hand off<font color="red">*</font></td>
              <td colspan="3">
              <html:radio property="reportHandOff" value="Y" name="MaintainBaselForm" onclick="javascript:enable()" ></html:radio>
              Yes
              &nbsp;&nbsp;
              <html:radio property="reportHandOff" value="N" name="MaintainBaselForm" onclick="javascript:enable()" ></html:radio>No&nbsp;
               <html:errors property="handOffError"/> 
              </td>            
            </tr>
            
            
            
           
		
          </tbody>
        </table> </td>
  </tr>
  <tr>&nbsp;</tr>
<tr>&nbsp;</tr>
<tr>&nbsp;</tr>
<tr>&nbsp;</tr>
<tr>&nbsp;</tr>
<tr>&nbsp;</tr>
<tr>&nbsp;</tr>

<tr>
<td>
<thead>
          </thead>
          <tbody>
<table width="80%" border="0" cellspacing="0" cellpadding="0" class="tblInput" align="center">
<tr class="even">
<td class="fieldname" width="20%">Edited By</td>
<%if(baselForm.getCreatedBy()!=null){ %>
<td ><%=baselForm.getCreatedBy() %></td>
<%}else{ %>
<td>- &nbsp;</td>
<%} %>
<td class="fieldname" width="20%">Last Approved By</td>
<%if(baselForm.getLastUpdatedBy()!=null){ %>
<td ><%=baselForm.getLastUpdatedBy() %></td>
<%}else{ %>
<td>- &nbsp;</td>
<%} %>
</tr>
<tr class="even">
<td class="fieldname" width="20%">Edited On</td>
<%if(baselForm.getCreatedOn()!=null){ %>
<td ><%=baselForm.getCreatedOn() %></td>
<%}else{ %>
<td>- &nbsp;</td>
<%} %>

<td class="fieldname" width="20%">Last Approved On</td>
<%if(baselForm.getLastUpdatedOn()!=null){ %>
<td ><%=baselForm.getLastUpdatedOn() %></td>
<%}else{ %>
<td>- &nbsp;</td>
<%} %>

</tr>
  <html:hidden name="MaintainBaselForm" property="deprecated" value="N"/>
     <html:hidden name="MaintainBaselForm" property="status" value="ACTIVE"/>
  <html:hidden name="MaintainBaselForm" property="createdBy" value="<%=baselForm.getCreatedBy() %>"/>
  <html:hidden name="MaintainBaselForm" property="lastUpdatedBy" value="<%=baselForm.getLastUpdatedBy() %>"/>
  <html:hidden name="MaintainBaselForm" property="createdOn" value="<%=baselForm.getCreatedOn() %>"/>
  <html:hidden name="MaintainBaselForm" property="lastUpdatedOn" value="<%=baselForm.getLastUpdatedOn() %>"/>

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
							onClick=" submitForm('maker_edit_component')"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                     <%} %>
 <!--  <td colspan="2">
  <center>
  <a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" width="70" height="20"
				border="0" id="ImageSave" /></a>
				
				</center>
				&nbsp;
				</td> -->
			
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

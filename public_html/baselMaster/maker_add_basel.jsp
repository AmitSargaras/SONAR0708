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

<%
	String context = request.getContextPath() + "/";
%>
<%
	String path = request.getContextPath();
	MaintainBaselForm form=(MaintainBaselForm)request.getAttribute("MaintainBaselForm");
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>getReportHandOff>"+form.getReportHandOff());
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String startIndex=(String)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.startIndex");
	String searchcomponentName=(String)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.searchcomponentName");
	String search = (String)session.getAttribute("com.integrosys.cms.ui.baselmaster.MaintainBaselMasterAction.session.searchbaselName");;
	
	CommonCodeList commonCode = CommonCodeList.getInstance("BASEL_MASTER");
	pageContext.setAttribute("refCatCodeLabels",commonCode.getCommonCodeLabels());
	pageContext.setAttribute("refCatCodeValues",commonCode.getCommonCodeLabels());	

%>


<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.baselmaster.MaintainBaselForm"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function disableHub(){
	

	var key = document.getElementById("pqr").value;
	alert(key);
	var radioBtns = document.getElementById('choiceTable');
	var allRadios = radioBtns.getElementsByTagName('html:radio');
	for(var i=0; i<allRadios.length;i++)
	{
		alert("xx");
		if(allRadios[i].checked == true){
			var val = allRadios[i].value;
			if(val=='N'){
				document.getElementById('abc').disabled = false;
			}
			else{
				document.getElementById('abc').disabled = true;
			}
		}
	}
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
	
  document.forms[0].action="baselmaster.do?event=return_search_basel&session.searchbaselName=<%=search%>";
  document.forms[0].submit();
}
function submitForm() {

 	document.forms[0].action="baselmaster.do?event=maker_create_basel";
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

<html:form action="/baselmaster" onreset="showSpanCustodian()" >
<input type="hidden" name="event" />
<input type="hidden" name="searchcomponentName" />
<input type="hidden" name="startIndex" />
<body onload=enableStatus();">

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr><td align="right"><font color="red">*</font>Mandatory</td>
  </tr>
  <tr>
      <td><h3>Add Basel System Mapping</h3></td>
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
               System Filed<font color="red">*</font>
              </td>
              <td width="30%"><span class="odd"> <html:select property="system">
								<%-- <integro:common-code 
									categoryCode="<%=CategoryCodeConstant.BASEL_MASTER%>" 
									display="false" descWithCode="false" /> --%>
									<html:options name="refCatCodeValues" labelName="refCatCodeLabels"/>
							</html:select> <html:errors property="systemError"/> </span></td>    
			  <td class="fieldname" width="20%" >
               Value Filed<font color="red">*</font>
              </td>  
              <td><html:text property="systemValue" maxlength="5" size="10"></html:text>&nbsp;   <html:errors property="systemValueError"/>   </td>
            </tr>
            
            <tr class="odd">             
              <td class="fieldname" width="20%">Exposure Source System<font color="red">*</font></td>
                <td width="30%"><html:text property="exposureSource" maxlength="5" size="10"></html:text>&nbsp;   <html:errors property="exposureError"/>   </td>   
             <td class="fieldname" width="20%">Basel Validation<font color="red">*</font></td>
                 <td>
                 <%if(form.getBaselValidation()==null){ %>
              <input type="radio"  name="baselValidation" value="L" onclick="javascript:enable()">Limit
              &nbsp;&nbsp;
              <input type="radio" name="baselValidation" value="A" onclick="javascript:disable()" >Account&nbsp;
              <%}else if(form.getBaselValidation().equals("L")){ %>
                <input type="radio"  name="baselValidation" value="L" onclick="javascript:enable()" checked="checked">Limit
              &nbsp;&nbsp;
              <input type="radio" name="baselValidation" value="A" onclick="javascript:disable()" >Account&nbsp;
              <%}else if(form.getBaselValidation().equals("A")){ %>
               <input type="radio"  name="baselValidation" value="L" onclick="javascript:enable()">Limit
              &nbsp;&nbsp;
              <input type="radio" name="baselValidation" value="A" onclick="javascript:disable()" checked="checked">Account&nbsp;
              <%} 
              else if(form.getBaselValidation().equals("")){ %>
              <input type="radio"  name="baselValidation" value="L" onclick="javascript:enable()">Limit
             &nbsp;&nbsp;
             <input type="radio" name="baselValidation" value="A" onclick="javascript:disable()">Account&nbsp;
             <%}
              %>
               <html:errors property="baselError"/> 
              </td>             
            </tr>
            
            <tr class="even">             
              <td class="fieldname" width="20%">To be reported in hand off<font color="red">*</font></td>
              <td colspan="3">
               <%if(form.getReportHandOff()==null){ %>
              <input type="radio"  name="reportHandOff" value="Y" onclick="javascript:enable()">Yes
              &nbsp;&nbsp;
              <input type="radio" name="reportHandOff" value="N" onclick="javascript:disable()" >No&nbsp;
              <%}else if(form.getReportHandOff().equals("Y")){ %>
              <input type="radio"  name="reportHandOff" value="Y" onclick="javascript:enable()" checked="checked">Yes
              &nbsp;&nbsp;
              <input type="radio" name="reportHandOff" value="N" onclick="javascript:disable()" >No&nbsp;
              <%}else if(form.getReportHandOff().equals("N")){ %>
               <input type="radio"  name="reportHandOff" value="Y" onclick="javascript:enable()">Yes
              &nbsp;&nbsp;
              <input type="radio" name="reportHandOff" value="N" onclick="javascript:disable()" checked="checked">No&nbsp;
              <%} 
              else if(form.getReportHandOff().equals("")){ %>
              <input type="radio"  name="reportHandOff" value="Y" onclick="javascript:enable()">Yes
             &nbsp;&nbsp;
             <input type="radio" name="reportHandOff" value="N" onclick="javascript:disable()">No&nbsp;
             <%}
              %>
               <html:errors property="handOffError"/> 
              </td>             
            </tr>
            
            
                 
           
		
          </tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>


 
     <html:hidden name="MaintainBaselForm" property="deprecated" value="N"/>
     <html:hidden name="MaintainBaselForm" property="status" value="ACTIVE"/>
      <html:hidden name="MaintainBaselForm" property="baselValidation"/>
       <html:hidden name="MaintainBaselForm" property="reportHandOff" />
      

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


<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>

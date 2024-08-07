<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="  com.integrosys.cms.ui.cersaiMapping.CersaiMappingForm,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping,
                com.integrosys.cms.app.cersaiMapping.bus.OBCersaiMapping,
                 java.util.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.cersaiMapping.CersaiMappingForm,com.integrosys.cms.app.cersaiMapping.trx.ICersaiMappingTrxValue,com.integrosys.cms.app.cersaiMapping.trx.OBCersaiMappingTrxValue"%>
<%

 CersaiMappingForm cersaiMappingForm = (CersaiMappingForm) request.getAttribute("CersaiMappingForm");

ICersaiMappingTrxValue cersaiMappingTrx = (ICersaiMappingTrxValue)session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.ICersaiMappingTrxValue");
OBCersaiMapping oc=(OBCersaiMapping)cersaiMappingTrx.getStagingCersaiMapping();
String mastername=oc.getMasterName();
int counter = 0;

ICersaiMapping[] masterValueList = (ICersaiMapping[])request.getAttribute("masterValueList");
if (!(masterValueList == null)) {
System.out.println("<<<<<<xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx>>>>>>"+masterValueList);
pageContext.setAttribute("masterValueList", masterValueList);
session.setAttribute("masterValueList", masterValueList);
}


String event = request.getParameter("event");
System.out.println(">>>>>>>>>>event<<<<<<<<<<<"+event);
String rejectEvent;
if (event.equals("checker_view_cersai_mapping")) {
	rejectEvent = "checker_list_cersai_mapping";
} else {
	rejectEvent = "maker_list_cersai_mapping";
}
	
%>

<%@page import="com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html>
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

function cancelPage() {
	document.forms[0].action = "ToDo.do?event=prepare";
	document.forms[0].submit();
}
function submitPage(event) {
	if(event=="maker_draft_close_process"){
		document.forms[0].action="cersaiMapping.do?event=maker_confirm_draft_close";
    }else {
    	document.forms[0].action="cersaiMapping.do?event=maker_confirm_close";
    }
    document.forms[0].submit();
}
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='cersaiMapping.do?'>
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="80%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<br>
				<br>
				<br>
				<tr>
					<td>
						<h3>Cersai Mapping</h3>
					</td>
				</tr>
			</thead>
			<tbody>
			
			<tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      <tr class="even">
          <td class="fieldname" width="29%">Master Name&nbsp;</td>
          <td width="71%"><%=mastername%>
          <!--  
               <html:select property="masterName">
         				<html:option value="">Please Select</html:option> 
                </html:select>-->
                     
            </td>
        </tr>
      </table>
    </td>
    </tr>
    
    <tr>
                          <td  colspan="2">
                          <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
                              <td width="5%">S/N</td>                            
                              <td width="40%">Clims Value</td>
                              <td width="45%">CERSAI Value</td>
                            </tr>
                            </thead>
                            
                            <logic:iterate id="OB" name="masterValueList" type="com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping" scope="page" >
					  
                   <%
                       String rowClass = "";
                       counter++;
                       if ( counter%2 != 0 ) {
                           rowClass = "odd";
                       } else {
                           rowClass = "even";
                       }
                      // String[] aa=OB.getClimsValues();
                       //int a=aa.length;
						
                     //  String itemURL = "DiaryItem.do?event=read&frompage=list_non_expired&itemId="+OB.getItemID();
                  %>
                  <tbody>
                    <tr class=<%=rowClass%>>
                      <td class="index" width="5%"><%=counter%></td>
                      <td width="45%"><integro:wrapper value="<%=OB.getClimsValue()%>" /><input type="hidden" name="climsValues" value="<%=OB.getClimsValue()%>"/></td>  
                      <td width="40%">
                	<integro:wrapper value="<%=OB.getCersaiValue()%>" /><input type="hidden" name="updatedCersaiValue" value="<%=OB.getCersaiValue()%>"/>
            </td>  
                    </tr>
                              </tbody>
                             
                              </logic:iterate>
                            
                            </table>
                            </td>
                            </tr>
                            <html:hidden name="CersaiMappingForm" property="lastUpdateBy" />
                            <html:hidden name="CersaiMappingForm" property="status" />
							<html:hidden name="CersaiMappingForm" property="createBy" />
							<html:hidden name="CersaiMappingForm" property="lastUpdateDate" />
							<html:hidden name="CersaiMappingForm" property="creationDate" />
							<html:hidden name="CersaiMappingForm" property="deprecated" />
							<html:hidden name="CersaiMappingForm" property="id" />
			</tbody>
		</table>

		<table width="130" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="65">&nbsp;</td>
				<td width="65">&nbsp;</td>
			</tr>
			<tr>
					<td colspan="2">
			 			<%if((event.equals("maker_draft_close_process"))){%>
							<a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)"
								onClick="submitPage('maker_draft_close_process')">
								<img src="img/close1a.gif"
								name="Image3311" border="0" id="Image3311" />
							</a>&nbsp; 
						<%}else{ %>
							<a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)"
								onClick="submitPage('maker_prepare_close')">
								<img src="img/close1a.gif"
								name="Image3311" border="0" id="Image3311" />
							</a>&nbsp;
				   		<%} %>
					</td>
 					<td colspan="4">
						<center>
							<a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
								<img src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
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
<!-- InstanceEnd -->
</html>

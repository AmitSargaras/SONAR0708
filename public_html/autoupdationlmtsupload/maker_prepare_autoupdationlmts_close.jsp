<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
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
	java.util.HashMap,java.util.Locale,java.util.Arrays,
	com.integrosys.cms.ui.component.MaintainComponentForm,com.integrosys.cms.app.component.trx.IComponentTrxValue,com.integrosys.cms.app.component.trx.OBComponentTrxValue"%>
<%
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
String event = request.getParameter("event");
IFileUploadTrxValue itrxValue=(IFileUploadTrxValue)session.getAttribute("com.integrosys.cms.ui.autoupdationlmtsupload.AutoupdationLmtsUploadAction.IFileUploadTrxValue");
List autoupdationlmtsList =(List) session.getAttribute("com.integrosys.cms.ui.autoupdationlmtsupload.AutoupdationLmtsUploadAction.List");
if(autoupdationlmtsList!=null){
	pageContext.setAttribute("autoupdationlmtsList",autoupdationlmtsList);
}

	int sno = 0;
	IFileUploadTrxValue trxValueOut=(IFileUploadTrxValue)session.getAttribute("com.integrosys.cms.ui.autoupdationlmtsupload.AutoupdationLmtsUploadAction.trxValueOut");
	int startIndex = 0;
	String total = (String) request.getAttribute("total");
	String correct = (String) request.getAttribute("correct");
	String fail = (String) request.getAttribute("fail");
	String system="";
	if(trxValueOut != null){
		system = trxValueOut.getTransactionSubType();	
	}
%>



<%@page import="com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
		<!-- InstanceEndEditable -->
	</head>
	<script language="JavaScript" type="text/JavaScript">
function submitPage(){
	
    document.forms[0].action="AutoupdationLmtsupload.do?event=maker_close_autoupdationlmts_file";
    
    document.forms[0].submit();
}

function downloadImage(){ //v3.0
	var aLocation = "AutoupdationLmtsupload.do?event=downloadReport&system="+'<%=system%>';
window.location.href = aLocation ;
}
</script>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">

<html:form action="AutoupdationLmtsupload.do" >
<input type="hidden" name="event"/>


<table width="95%"  border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
<thead>
<h3>Auto Updation of Limits</h3>
<br></br>
</thead>
<tbody>

<tr style="right:800;">
                        <td>
       	<a href="#" onclick="downloadImage()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
									<img src="img/download.jpg" name="Image3316" border="0"
										id="Image3316" align="right" /> </a>
       	
       	</td>
                   
                      </tr>
   
      <tr>
        <td colspan="4" align="center">
	  <table width="95%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr height="20">
        <td width="30%" class="fieldname">Total No of Uploaded Records:</td>
       	<td width="60%"  class="even" align="center"><%=total%></td>
       		
    </tr>
    <tr height="20">
        <td  class="fieldname">Successful Uploaded Records:</td>
       	<td  class="odd" align="center"><%=correct%></td>
    </tr>
    <tr height="20">
        <td  class="fieldname">Failed Uploaded Records:</td>
       	<td  class="even" align="center"><%=fail%></td>
    </tr>    
              
            </tbody>
          </table>
	</td>
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
							
							<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)"
				onClick="submitPage()">
				<img src="img/close1a.gif"
				name="Image3311" border="0" id="Image3311" />
				</a>&nbsp;		
							
						</center></td>
						<td>
						<center><a
				href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
				<img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" />
				</a> &nbsp;<center>
					</td>
   </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


</html:form>
</td>
</tr>
<!-- End Content -->
 			
</table>

</html>
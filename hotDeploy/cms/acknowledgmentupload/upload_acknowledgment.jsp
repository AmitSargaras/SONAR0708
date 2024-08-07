<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>


<%
	String context = request.getContextPath() + "/";
%>
<%
	String fileType = (String) request.getAttribute("fileType");
	System.out.println("fileType---" + fileType);
	if (fileType == null)
		fileType = "";
	String path = request.getContextPath();
	System.out.println("pathFor Excel---" + path);
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("basePath Excel---" + basePath);		
	String preUpload = (String) request.getAttribute("preUpload");
	if (preUpload == null)
		preUpload = "false";
	System.out.println("preUpload---" + preUpload);
	
%>

<html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		
		<title>Untitled Document</title>
<script language="JavaScript" type="text/JavaScript">		
		function submitForm() {
 	document.forms[0].action="Acknowledgmentupload.do?event=acknowledgmentupload";
    document.forms[0].submit();
}
</script>
		
		<style type="text/css">
<!--
.hiddenDiv {
	display: none;
}

.visibleDiv {
	display: block;
	border: 1px grey solid;
}

.style1 {
	color: #FF0000
}

.style5 {
	color: #FF0000
}

.style11 {
	color: #FF0000
}
-->
</style>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action="/Acknowledgmentupload" enctype="multipart/form-data">
		<body >

			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				 <%if(preUpload.equalsIgnoreCase("false")){ %> 
				<thead>
					<br>
					<br>
					<br>
					<br>
					<br>
					<tr>
						<td align="center">
							<h3>
								CERSAI Acknowledgment Upload
							</h3>
						</td>
					</tr>
					<tr>
						<td>
							<hr width="50%" />
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td valign="bottom" align="center">
							<html:file property="fileUpload" size="50"></html:file></br><html:errors property="acknowledgmentfileuploadError"/>
							<html:errors property="acknowledgmentfileformatError"/>
						</td>
					</tr>
					<%
						if (fileType.equals("NOT_EXCEL")) {
					%>
					<tr>
						<td valign="bottom" align="center">
							<bean:message key="label.global.file.excelformat" />
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
				
			<table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick="submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" /> </a>&nbsp;&nbsp;
					</td>


				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
				<%}else{ %>
  <thead>
    <tr>
      <td><h3>Opps!!!
          <hr/>
        </h3></td>
    </tr>
  </thead>
  <%} %>
		<tbody>
  <%if(preUpload.equalsIgnoreCase("true")){%>  
   
      <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td height="111" class="odd" style="text-align:center"><b>Previous Uploaded File Is Pending For Authorization!!!</b></td>
            </tr>
            
          </tbody>
        </table></td>
    </tr>
    
    <table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)"><img
									src="img/ok1.gif" name="Image4411" border="0" id="Image4411" />
						</a>
					</td>


				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
    <%} %>
  </tbody>		
			</table>



			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>

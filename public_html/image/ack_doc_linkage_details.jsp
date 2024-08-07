<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>Untitled Document</title>
<script>
	function imgUpload(){
		document.forms[0].action="ImageUpload.do?event=image_upload&fromMenu=Y&userType=MAKER&customerID=-999999999&limitProfileID=-999999999";
		document.forms[0].submit();
	}
</script>
</head>
<html:form action="/ImageUploadAdd">
<body>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
		      <td><h3>Document Linkage Details</h3></td>
		  	</tr>
  			<tr>
    			<td><hr/></td>
  			</tr>
  		</thead>
  		<tbody>
  			<tr>
  				<td>
					<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
					  <thead>
					    <tr>
					      <td><h3>Confirmation
					        </h3>
					        <hr>
					        </td>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <td><table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
					          <thead>
					          </thead>
					          <tbody>
					            <tr>
					              <td class="odd"><br><b>The transaction has been submitted.</b></td>
					            </tr>
					            <tr>
					              <td class="odd">
					              	<br>
					              	<input type="button" class="btnNormal" style="width:60px" value="OK" onclick="imgUpload();">&nbsp;
					              </td>
					            </tr>
					          </tbody>
					        </table></td>
					    </tr>
					  </tbody>
					</table>
			</td>
		</tr>
	</tbody>
</table>					
</body>
</html:form>
</html>
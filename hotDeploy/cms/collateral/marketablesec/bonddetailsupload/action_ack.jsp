<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
String action = (String) request.getParameter("action");
%>
<html>
<head>
	<script type="text/javascript">
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

		function goBack(){
			document.forms[0].action = "ToDo.do?event=prepare";		
			document.forms[0].submit(); 
		}
	</script>
</head>
<body>
	<br>
	<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td valign="top">
				<html:form action="BondDetailsUpload.do">
					<input type="hidden" name="event"/>
					<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
						<thead>
							<tr>
      							<td><h3><bean:message key="menu.uploads.bonddetailsupload.name" /></h3></td>
    						</tr>
						</thead>
						<tbody>
							<tr>
      							<td>
      								<table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          								<thead></thead>
          								<tbody>
            								<tr>
              									<td height="111" class="odd" style="text-align:center"><b><bean:message key="menu.uploads.bonddetailsupload.name" /> is <%=action%>!!!</b></td>
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
									<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)">
										<img src="img/ok1.gif" name="Image4411" border="0" id="Image4411" />
									</a>
								</center>&nbsp;
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
	</table>
</body>
</html>
<%@page import="com.integrosys.cms.ui.stockdetailsupload.IStockDetailsUploadConstants"%>
<%@page import="com.integrosys.cms.ui.stockdetailsupload.StockDetailsUploadAction"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	List totalUploadedList = (List)session.getAttribute(StockDetailsUploadAction.class.getName() + "." + IStockDetailsUploadConstants.SESSION_TOTAL_UPLOADED_LIST);
	List totalFailedList = (List)session.getAttribute(StockDetailsUploadAction.class.getName() + "." + IStockDetailsUploadConstants.SESSION_TOTAL_FAILED_LIST);
	String total = (String) request.getAttribute(IStockDetailsUploadConstants.TOTAL);
	String pass = (String) request.getAttribute(IStockDetailsUploadConstants.PASS);
	String fail = (String) request.getAttribute(IStockDetailsUploadConstants.FAIL);
	
	Boolean enableClose = new Boolean(request.getParameter("enableClose"));
	pageContext.setAttribute("enableClose", enableClose);
	
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

		function downloadImage(){ //v3.0
			var aLocation = "Stockdetailsupload.do?event=download_report";
			window.location.href = aLocation ;
		}

		function cancelPage(){
	    	document.forms[0].action="ToDo.do?event=prepare";
	    	document.forms[0].submit();
		}
		function submitPage(){
		    document.forms[0].action="Stockdetailsupload.do?event=maker_close";
		    document.forms[0].submit();
		}
		

	</script>
</head>
<body>
	<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td valign="top">
				<html:form action="Stockdetailsupload.do" >
					<input type="hidden" name="event"/>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
						<thead>
							<tr>
								<td>
									<table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
										<thead>
											<tr>
												<td>
													<h3><bean:message key="menu.uploads.stockdetailsupload.name"/></h3>
												</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
											</tr>	
										</thead>
										<tbody>
											<tr height="20">
												 <td></td>
												 <td align="right"></td>
											</tr>
											<tr>
												 <td colspan="4" align="center">
												 	<table width="95%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
												 		<tbody>
												 			<tr height="20">
												 				<td width="30%" class="fieldname">Total No of Uploaded Records:</td>
												 				<td width="30%" class="even" align="center"><%=total%></td>
												 				<td width="30%" rowspan="3" align="center">
												 					<a href="#" onclick="downloadImage()" onmouseout="MM_swapImgRestore()"
																		onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
																			<img src="img/download.jpg" name="Image3316" border="0"
																			id="Image3316" align="center" /> 
																	</a>
																</td>	
												 			</tr>
												 			<tr height="20">
        														<td  class="fieldname">Successful Uploaded Records:</td>
       															<td  class="odd" align="center"><%=pass%></td>
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
								</td>
							</tr>
						</thead>
					</table>
					<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
    						<td width="65">&nbsp;</td>
    						<td width="65">&nbsp;</td>
  						</tr>
						<tr>
							<logic:equal name="enableClose" value="true">
								 <td colspan="4">
								 	<center>
										<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)"
											onClick="submitPage()">
											<img src="img/close1a.gif" name="Image3311" border="0" id="Image3311" />
										</a>&nbsp;		
									</center>
								</td>
								<td>
								 	<center>
								 		<a href="javascript:cancelPage()" onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('Image4411','','img/cancel1.gif',1)"><img
										src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
										</a>
								 	</center>&nbsp;
								 </td>
							 </logic:equal>
							 <logic:equal name="enableClose" value="false">
							 	 <td colspan="4">
								 	<center>
									<a href="javascript:cancelPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)">
										<img src="img/ok1.gif" name="Image4411" border="0" id="Image4411" />
									</a>
								</center>&nbsp;
								 	
							 	 </td>
							 </logic:equal>
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
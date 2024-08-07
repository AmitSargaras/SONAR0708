<%@page import="com.integrosys.cms.ui.stockdetailsupload.IStockDetailsUploadConstants"%>
<%@page import="com.integrosys.cms.ui.stockdetailsupload.StockDetailsUploadAction"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%
IFileUploadTrxValue trxValueOut=(IFileUploadTrxValue)session.getAttribute(StockDetailsUploadAction.class.getName() + "." + IStockDetailsUploadConstants.SESSION_TRX_VALUE_OUT);
List totalUploadedList=(List)session.getAttribute(StockDetailsUploadAction.class.getName() + "." + IStockDetailsUploadConstants.SESSION_TOTAL_UPLOADED_LIST);

String total = (String) request.getAttribute(IStockDetailsUploadConstants.TOTAL);
if(total == null) {
	total = request.getParameter(IStockDetailsUploadConstants.TOTAL);
}
String pass = (String) request.getAttribute(IStockDetailsUploadConstants.PASS);
if(pass == null) {
	pass = request.getParameter(IStockDetailsUploadConstants.PASS);
}
String fail = (String) request.getAttribute(IStockDetailsUploadConstants.FAIL);
if(fail == null) {
	fail = request.getParameter(IStockDetailsUploadConstants.FAIL);
}
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
			
			function approvePage() {
				var x = document.getElementById("confirm").checked;
				if (x) {
					document.forms[0].action="Stockdetailsupload.do?event=checker_approve";
					document.forms[0].submit();
				}else{
		        	alert('Please confirm.!!!');
	            }
			}
			
			function rejectPage() {
			    document.forms[0].action="Stockdetailsupload.do?event=checker_reject";
			    document.forms[0].submit();
			}
			
			function cancelPage(){
			    document.forms[0].action="ToDo.do?event=prepare";
			    document.forms[0].submit();
			}
		</script>
	</head>
	 
	 <html:form	action='Stockdetailsupload.do'>
	 	<input type="hidden" name="total" value="<%=total%>" />
	 	<input type="hidden" name="pass" value="<%=pass%>" />
	 	<input type="hidden" name="fail" value="<%=fail%>" /> 
		<body>
			<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td><h3><bean:message key="menu.uploads.stockdetailsupload.name" /></h3></td>
					</tr>
				</thead>
				<tbody>
					<tr height="20">
						<td></td>
						<td align="right">
							<a href="#" onclick="downloadImage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
								<img src="img/download.jpg" name="Image3316" border="0"	id="Image3316" />
							</a>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
								<tbody>
									<tr height="20">
										<td class="fieldname">
											Total No of Uploaded Records:
										</td>
										<td class="even" align="center"><%=total%></td>
									</tr>
									<tr height="20">
										<td class="fieldname">
											Successful Uploaded Records:
										</td>
										<td class="odd" align="center"><%=pass%></td>
									</tr>
									<tr height="20">
										<td class="fieldname">
											Failed Uploaded Records:
										</td>
										<td class="even" align="center"><%=fail%></td>
									</tr>
									<tr>
										<td class="fieldname">
											Remarks
										</td>
										<td class="odd">
											<html:textarea property="remarks" rows="3" cols="120" />
											<br>&nbsp;<html:errors property="remarksError" />
										</td>
									</tr>
									<tr>
										<td class="fieldname">
											Last Action By
										</td>
										<td class="even"><%=trxValueOut.getUserInfo()%>&nbsp;
										</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">
											Last Remarks Made
										</td>
										<td>
											<integro:wrapper value="<%=trxValueOut.getRemarks()%>" />
											&nbsp;
										</td>
									</tr>
									<tr>
										<td colspan="2" >
											<input type="checkbox" id="confirm" onclick="javascript:checkbox()"></input>&nbsp;&nbsp;
											<b>I confirm that I have checked the uploaded file report.</b>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:approvePage();"	onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)">
							<img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" />
						</a>
					</td>
					<td>
						<a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)">
							<img src="img/reject1.gif" name="Image9" width="70" height="20"	border="0" id="Image9" />
						</a>
					</td>
					<td>
						<a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="Image1" border="0" id="Image1" />
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
		</body>
	</html:form>
</html>
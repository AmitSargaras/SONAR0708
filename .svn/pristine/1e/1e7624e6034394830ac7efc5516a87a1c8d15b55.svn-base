<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%
	Locale locale = (Locale) session
			.getAttribute(ICommonEventConstant.GLOBAL_SCOPE
					+ "."
					+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	String event = request.getParameter("event");
	IFileUploadTrxValue itrxValue = (IFileUploadTrxValue) session.getAttribute("com.integrosys.cms.app.leiDetailsUpload.LeiDetailsUploadAction.IFileUploadTrxValue");
	List leidetailsList = (List) session.getAttribute("com.integrosys.cms.app.leiDetailsUpload.LeiDetailsUploadAction.leidetailsList");
	
	if (leidetailsList != null) {
		pageContext.setAttribute("leidetailsList", leidetailsList);
	}
	
	String total = (String) request.getAttribute("total");
	String correct = (String) request.getAttribute("correct");
	String fail = (String) request.getAttribute("fail");
	
	if(null==total){
		total=request.getParameter("total");
	}
	if(null==correct){
		correct=request.getParameter("correct");
	}
	if(null==fail){
		fail=request.getParameter("fail");
	}
	
	DefaultLogger.debug(this," total :"+ total);
	DefaultLogger.debug(this," correct : "+ correct);
	DefaultLogger.debug(this," fail : "+ fail); 
	DefaultLogger.debug(this,"leidetailsList size : "+ leidetailsList.size());
	
	int sno = 0;
	String heading = "LEI Details Upload";
	String approve_event = "checker_approve_create_leidetails";
	
%>



<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page
	import="com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%><html:form
	action='leidetailsupload.do?'>
	<head>
		<script language="JavaScript" type="text/JavaScript"><!--


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
		var aLocation = "leidetailsupload.do?event=downloadReport&system=";
	window.location.href = aLocation ;
}

function approvePage() {
	var x =document.getElementById("confirm").checked;
	//var x = document.getElementById("confirm").value; 
	//	if (x == 'Y') {
		if (x == true) {
		    document.forms[0].action="leidetailsupload.do?event="+'<%=approve_event%>';
            document.forms[0].submit();
            newShowSilkScreen();
		               } 
		               else{
		               alert('Please confirm.!!!');
		               }

}

function checkbox(){

/*	if(document.getElementById("confirm").checked==true)
	{
		document.getElementById("confirm").value= "Y";
	
	}
	else if(document.getElementById("confirm").value=='')
	{
		document.getElementById("confirm").value= "Y";
		
	}
	else
	{
		document.getElementById("confirm").value= "Y";
		
	}
	*/
}


function rejectPage() {
	var x =document.getElementById("confirm").checked;
	if (x == true) {
    document.forms[0].action="leidetailsupload.do?event=checker_reject_create_leidetails";
    document.forms[0].submit();
	}else{
        alert('Please confirm.!!!');
    }
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
}


//
--></script>

	</head>
 	 <input type="hidden" name="total" value="<%=total%>" />
	 <input type="hidden" name="correct" value="<%=correct%>" />
	 <input type="hidden" name="fail" value="<%=fail%>" />  
	   
	<body>
		<!-- InstanceBeginEditable name="Content" -->

		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<h3><%=heading%></h3>
				<br></br>
			</thead>
			<tbody>
				<tr height="20">
					<td></td>
					<td align="right">
						<a href="#" onclick="downloadImage()"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
							<img src="img/download.jpg" name="Image3316" border="0"
								id="Image3316" align="" right"" /> </a>
					</td>
				</tr>

				<tr>
					<td colspan="4" align="center">
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tblInfo">
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
									<td class="odd" align="center"><%=correct%></td>
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
										&nbsp;
										</br>
										<html:errors property="limitRemarksError" />
									</td>
								</tr>
								<tr>
									<td class="fieldname">
										Last Action By
									</td>
									<td class="even"><%=itrxValue.getUserInfo()%>&nbsp;
									</td>
								</tr>
								<tr class="odd">
									<td class="fieldname">
										Last Remarks Made
									</td>
									<td>
										<integro:wrapper value="<%=itrxValue.getRemarks()%>" />
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="2" >
										<input type="checkbox" id="confirm" onclick="javascript:checkbox()"></input>&nbsp;&nbsp;<b>I confirm that I have checked the uploaded file report.</b>

									</td>
									
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>



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


				<td>
					<a href="javascript:approvePage();"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
							src="img/approve1.gif" name="Image8" width="80" height="20"
							border="0" id="Image8" />
					</a>
				</td>
				<td>
					<a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
							src="img/reject1.gif" name="Image9" width="70" height="20"
							border="0" id="Image9" />
					</a>
				</td>
				<td>
					<a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image1" border="0" id="Image1" />
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


		<!-- InstanceEndEditable -->
	</body>
</html:form>

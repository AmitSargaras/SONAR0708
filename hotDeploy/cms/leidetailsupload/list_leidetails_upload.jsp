<%@ page import="com.integrosys.cms.batch.ubs.IUbsErrorLog,
				com.integrosys.cms.batch.ubs.IUbsErrDetLog,
				com.integrosys.base.uiinfra.tag.PageIndex,
				java.util.*,
				com.integrosys.base.techinfra.util.DateUtil"
                 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	int rowCount=0;
	IFileUploadTrxValue trxValueOut=(IFileUploadTrxValue)session.getAttribute("com.integrosys.cms.app.leiDetailsUpload.LeiDetailsUploadAction.trxValueOut");
	String fileType = (String) request.getAttribute("fileType");
	System.out.println("fileType:"+fileType);
	String total = (String) request.getAttribute("total");
	String correct = (String) request.getAttribute("correct");
	String fail = (String) request.getAttribute("fail");
	Set errDetLog=null;
	List totalUploadedList=(ArrayList)session.getAttribute("com.integrosys.cms.app.leiDetailsUpload.LeiDetailsUploadAction.totalUploadedList");
	if(totalUploadedList!=null)
		pageContext.setAttribute("totalUploadedList",totalUploadedList);
	else
		pageContext.setAttribute("totalUploadedList",new ArrayList());
		String system = trxValueOut.getTransactionSubType();
		List errorList=(ArrayList)session.getAttribute("com.integrosys.cms.app.leiDetailsUpload.LeiDetailsUploadAction.errorList");
	if(errorList!=null)
		pageContext.setAttribute("errorList",errorList);
	else
		pageContext.setAttribute("errorList",new ArrayList());
		
		List<LeiDetailsUploadError> finalList=(ArrayList)session.getAttribute("com.integrosys.cms.app.leiDetailsUpload.LeiDetailsUploadAction.finalList");
		
	if(finalList!=null)
		pageContext.setAttribute("finalList",finalList);
	else
		pageContext.setAttribute("finalList",new ArrayList());
		
	int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
		String obj="";
		pageContext.setAttribute("obj",obj);
		
		String totalUploadedListheight = "0";
		String errorListheight = "0";
		String finalListheight = "0";
		
		if(totalUploadedList!=null && totalUploadedList.size()>1)
		{
		 totalUploadedListheight = "190";
		}
		
		if(errorList!=null && errorList.size()>1)
		{
		 errorListheight = "190";
		}
		
		if(finalList!=null && finalList.size()>1)
		{
		 finalListheight = "190";
		}
		
%>



<%@page import="com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue"%>
<%@page import="com.integrosys.cms.app.leiDetailsUpload.LeiDetailsUploadError"%><head>
    <title>Untitled Document</title>
    
    

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

function downloadImage(){ //v3.0
		var aLocation = "leidetailsupload.do?event=downloadReport&system="+'<%=system%>';
	window.location.href = aLocation ;
}

function cancelPage(){
    document.forms[0].action="Welcome.do?event=prepare";
    document.forms[0].submit();
}

function goBack(){
	document.forms[0].action = "leidetailsupload.do?event=excelupload";		
	document.forms[0].submit(); 
}


//-->
    </script>
</head>
<body>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">
<!-- Content -->



<html:form action="leidetailsupload.do" >
<input type="hidden" name="event"/>
<%-- Fake value. --%>


<% if(!"NOT_EXCEL".equals(fileType)){%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">

<thead >
   
   
    <tr>
    <td>
    <table width="95%"  border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
<thead>
   <%if(finalList.size()>=1){ %>
<h3>LEI Details Upload Error</h3>
<%}else{ %>
<h3>LEI Details Upload</h3>
<%} %>
<br></br>
</thead>
<tbody>
 <tr height="20">
        <td></td>
       	<td align="right">

</td>
    </tr>
   <%if(finalList.size()>=1){ %>
        <tr>
<td colspan="4" align="center">
<table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                               <thead>
                                <tr>
                        <td width="5%">S/N</td> 
                        <td width="5%">File Row No</td>                        
                        <td width="45%">Column Name</td>  
                        <td width="45%">Error</td>                   
                       
                    </tr>
                                </thead>
                     <logic:iterate id="ob"  offset="<%=String.valueOf(startIndex)%>"  indexId="counter"  name="finalList" type="com.integrosys.cms.app.leiDetailsUpload.LeiDetailsUploadError" scope="page" length="100">
                     <%
					String rowClass = "";
					int i =0;
					if (rowCount % 2 != 0) {
						rowClass = "odd";
					} else {
						rowClass = "even";
						}
					%>           
                     <tr class="<%=rowClass %>">
                        <td width="5%"><%=++rowCount %></td> 
                        <td width="5%"><%=ob.getFileRowNo() %></td>                        
                        <td width="45%"><%=ob.getColumnName() %></td>  
                        <td width="45%"><%=ob.getErrorMessage() %></td>   
                       </tr>
                       </logic:iterate>
                                </table></td></tr>
     
     
     <%}else{%> 
     
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
       	<td width="60%" class="even" align="center"><%=total%></td>
       	
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
      <%} %> 
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
 <td colspan="4">
						<center>
							<%if(finalList.size()>=1){ %>
							<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
							<%}else{%>
							<a href="javascript:cancelPage()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
							<% }%>
							
						</center>&nbsp;
					</td>
   </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<%}else if ("NOT_EXCEL".equals(fileType)){ %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">

<thead>
<tr><td align="center">
<h3>LEI Details Upload Error</h3>
<br></br></td></tr>
<tr>
						<td>
							<hr width="50%" />
						</td>
					</tr>
</thead>
<tbody>
<tr>
	<td valign="bottom" align="center">
		<bean:message key="label.global.file.excelformat" />
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
							
							<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)"><img
									src="img/ok1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
							
						</center>&nbsp;
					</td>
   </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<%} %>

</html:form>
</td>
</tr>
<!-- End Content -->
 			

</table>

</body>

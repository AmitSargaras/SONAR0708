<%@ page import="com.integrosys.cms.batch.ubs.IUbsErrorLog,
				com.integrosys.cms.batch.ubs.IUbsErrDetLog,
				com.integrosys.base.uiinfra.tag.PageIndex,
				java.util.*,
				com.integrosys.base.techinfra.util.DateUtil"
                 %>
<%@page import="com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	int rowCount=0;
	String fileType = (String) request.getAttribute("fileType");
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> fileType>"+fileType);
	String total = (String) request.getAttribute("total");
	String correct = (String) request.getAttribute("correct");
	String fail = (String) request.getAttribute("fail");
	Set errDetLog=null;
	IFileUploadTrxValue trxValueOut=(IFileUploadTrxValue)session.getAttribute("com.integrosys.cms.ui.bulkudfupdateupload.BulkUDFUploadAction.trxValueOut");
	List totalUploadedList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.bulkudfupdateupload.BulkUDFUploadAction.totalUploadedList");
	if(totalUploadedList!=null && totalUploadedList.size()>0)
		pageContext.setAttribute("totalUploadedList",totalUploadedList);
	else
		pageContext.setAttribute("totalUploadedList",new ArrayList());
		
		List errorList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.bulkudfupdateupload.BulkUDFUploadAction.errorList");
	if(errorList!=null && errorList.size()>0)
		pageContext.setAttribute("errorList",errorList);
	else
		pageContext.setAttribute("errorList",new ArrayList());
		String system = trxValueOut.getTransactionSubType();	
		
	int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
		 
		String totalUploadedListheight = "0";
		String errorListheight = "0";
				
		if(totalUploadedList!=null && totalUploadedList.size()>1)
		{
		 totalUploadedListheight = "190";
		}
		
		if(errorList!=null && errorList.size()>1)
		{
		 errorListheight = "190";
		}
		
		  
%>


<head>
    <title>Untitled Document</title>
    
    

    <script language="JavaScript" type="text/JavaScript">
    
    function downloadImage(){ //v3.0
		var aLocation = "Bulkudfupload.do?event=downloadReport&system="+'<%=system%>';
	window.location.href = aLocation ;
}
    function goBack(){
    	document.forms[0].action ="ToDo.do?event=prepare";		
    	document.forms[0].submit(); 
    }

    </script>
</head>
<body>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">

<html:form action="fileUpload.do" >
<input type="hidden" name="event"/>


<table width="95%"  border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
<thead>
<h3>Bulk UDF Update Upload</h3>
<br></br>
</thead>
<tbody>

   
      <tr>
        <td colspan="4" align="center">
	  <table width="95%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr height="20">
        <td width="30%" class="fieldname">Total No of Uploaded Records:</td>
       	<td width="30%"  class="even" align="center"><%=total%></td>
       		<td width="30%" rowspan="3" align="center">
       	<a href="#" onclick="downloadImage()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
									<img src="img/download.jpg" name="Image3316" border="0"
										id="Image3316" align="center" /> </a>
       	
       	</td>
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


</html:form>
</td>
</tr>
<!-- End Content -->
 			
</table>

</body>

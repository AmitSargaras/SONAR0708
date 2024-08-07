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
IFileUploadTrxValue trxValueOut=(IFileUploadTrxValue)session.getAttribute("com.integrosys.cms.ui.bulkudfupdateupload.BulkUDFUploadAction.trxValueOut");
	String fileType = (String) request.getAttribute("fileType");
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> trxValueOut>"+trxValueOut.getTransactionSubType());
	
	Set errDetLog=null;
	List errorList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.bulkudfupdateupload.BulkUDFUploadAction.errorList");
	if(errorList!=null)
		pageContext.setAttribute("errorList",errorList);
	else
		pageContext.setAttribute("errorList",new ArrayList());
		
	int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	String heading="Bulk UDF Update Upload";

%>



<%@page import="com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue"%><head>
    <title>Untitled Document</title>
    
    

    <script language="JavaScript" type="text/JavaScript">

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
<!-- Content -->



<html:form action="Bulkudfupload.do" >
<input type="hidden" name="event"/>
<%-- Fake value. --%>



<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
 
 <thead>
    <tr>
      <td><h3><%=heading %>          
        </h3></td>
    </tr>
  </thead>
 
  <tbody>
 
   
      <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td height="111" class="odd" style="text-align:center"><b><%=heading %> is Rejected!!!</b></td>
            </tr>
            
          </tbody>
        </table></td>
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

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

<html>
<head>
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

function cancelPage(){
    document.forms[0].action="Ubsupload.do?event=csvupload";
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


<%
	int rowCount=0;
	String fileType = (String) request.getAttribute("fileType");
	Set errDetLog=null;
	IUbsErrorLog errLog = (IUbsErrorLog)session.getAttribute("com.integrosys.cms.ui.ubsupload.UBSUploadAction.objUbsErrorLogService");// request.getAttribute("objUbsErrorLog");

	List ubsErrorLogList=(ArrayList) session.getAttribute("com.integrosys.cms.ui.ubsupload.UBSUploadAction.ubsErrorLogList");
	if(ubsErrorLogList!=null)
		pageContext.setAttribute("ubsErrorLogList",ubsErrorLogList);
	else
		pageContext.setAttribute("ubsErrorLogList",new ArrayList());
		
	int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
%>
<html:form action="/Ubsupload" >
<input type="hidden" name="event"/>
<%-- Fake value. --%>



<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<% if(!"NOT_CSV".equals(fileType)){%>
<thead >
    <tr>
        <td height="34"><h3>UBS Upload</h3></td>
    </tr>
    <tr>
    <td>	<hr/></td>
    </tr>
    <tr height="20">
        <td>Total No of Uploaded Records:</td>
       	<td><%=errLog.getNoOfRecords()%></td>
    </tr>
    <tr height="20">
        <td>Successful Uploaded Records:</td>
       	<td><%=errLog.getSuccessRecords()%></td>
    </tr>
    <tr height="20">
        <td>Failed Uploaded Records:</td>
       	<td><%=errLog.getFailedRecords()%></td>
    </tr>           
    <tr>
        <td colspan="3"><hr/></td>
    </tr>
</thead>
<%} %>
<tbody>
<%if("NOT_CSV".equals(fileType)){%>
		<tr class="odd">
					<td colspan="10">
					<bean:message key="label.global.file.format" />
					</td>
		</tr>
<%}%>
    <tr>
        <td colspan="2">
            <table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
                <thead>
                    <tr>
                        <td width="10%">S/N</td>
                        <td width="15%">Record No&nbsp;</td>
                        <td width="55%">Error Message</td>
                        <td width="20%">Time</td>
                       
                    </tr>
                </thead> <tbody>
                <% if(!"NOT_CSV".equals(fileType)){%>
                	<logic:iterate id="errDet" 
                	length="100" 
                    offset="<%=String.valueOf(startIndex)%>"
                    indexId="counter"
                    name="ubsErrorLogList"
                     type="com.integrosys.cms.batch.ubs.IUbsErrDetLog" scope="page">
                	
                	<%
					String rowClass = "";
					rowCount=counter.intValue()+1;
					if (rowCount % 2 != 0) {
						rowClass = "odd";
					} else {
						rowClass = "even";
						}
					%>
					<%
					if(errDet.getErrorMsg()!=null){
					 %>
                	<tr class="<%=rowClass%>">

                               <td class="index"><%=counter.intValue()+1 %></td>
                               <td><%=errDet.getRecordNo()%><br/></td>
                               <td><%=errDet.getErrorMsg()%></td>
                               <td><%=DateUtil.formatDate(null,errDet.getTime(),"dd MMM yyyy | hh:mm:ss aa")%></td>
            				
                	</tr>
                	<%
                	}
                	 %>
                
                	</logic:iterate>
                <%} %>
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
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;
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
 			<logic:present name="ubsErrorLogList">
              <tr>
                <td height="25" colspan="4">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="3%" valign="middle" align="left"><img src="img/icon/seprate_bar.gif" /></td>
                        <%
                           String pageIndexUrl=null;
                           pageIndexUrl = "Ubsupload.do?event=paginate&startIndex=";
                           System.out.println(pageIndexUrl);
                        %>
                        <td width="97%" valign="middle" align="left">
                           &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(startIndex,100, ubsErrorLogList.size())%>'
                                url='<%=pageIndexUrl%>' />

                        </td>
                        
                      </tr>
                    </table>
                 </td>
              </tr>
              </logic:present>

</table>

</body>
</html>
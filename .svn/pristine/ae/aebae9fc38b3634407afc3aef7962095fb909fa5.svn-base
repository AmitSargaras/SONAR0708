<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@ page import="com.integrosys.cms.app.transaction.*,
                 com.integrosys.base.businfra.transaction.ITrxResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<!--
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/common/ack_submit.jsp,v 1.7 2006/10/27 08:42:38 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.7 $
 * @since $Date: 2006/10/27 08:42:38 $
 * Tag: $Name:  $
 */
 -->





<%@page import="java.util.List"%><html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>

<%
		ITrxResult trxResult = (ITrxResult)request.getAttribute("request.ITrxResult");
        ICMSTrxValue cmsTrxValue = (ICMSTrxValue)request.getAttribute("request.ITrxValue");
		String trxId = "";
		if ( trxResult != null ) {
			ICMSTrxValue value = (ICMSTrxValue)trxResult.getTrxValue();
			if ( value != null )
				trxId = value.getCurrentTrxHistoryID();
		} else if(cmsTrxValue!=null){
            trxId = cmsTrxValue.getCurrentTrxHistoryID();
        }
		
		String preUpload=(String)request.getAttribute("preUpload");
		List fileList=(List)request.getAttribute("fileInfo");
		if(fileList!=null){
			
			
			pageContext.setAttribute("fileList",fileList);
		}
		
System.out.println(" >>>>>>>>>>>>>>>>>>>>>>>> preUpload >"+preUpload);
int sno = 0;
%>

<script language="JavaScript" type="text/javascript">
	function goBack(){
	
		document.forms[0].action		=	"fileUpload.do?event=system_upload";		
		document.forms[0].submit(); 
	}
	

</script>


<body>
<html:form action="fileUpload.do">
<!-- InstanceBeginEditable name="Content" -->
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
 <%if(preUpload.equalsIgnoreCase("false")){ %> 
 <thead>
    <tr>
      <td><h3>BAHRAIN File List
          <hr/>
        </h3></td>
    </tr>
  </thead>
  
  <tbody>
<tr>
<td colspan="4" align="center">
<table width="90%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="6%">S/N</td>
                                  <td width="20%">File Name</td>
                                
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="fileList">
                    <logic:iterate id="ob" name="fileList" 
                    length="10"                     
                    indexId="counter"
                     type="java.io.File" scope="page">
                        <%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                           // boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
                        %>
                                <tr class="<%=rowClass%>">
                                  <td class="index"><%=counter.intValue()+1%></td>
                                   <td><center><a href="fileUpload.do?event=maker_upload_bahrain_file&path=<%=ob.getPath() %>"  ><%=ob.getName() %></a></center></td> 
                                   
                                </tr>
                                </logic:iterate>
                                <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <% } %>
                </logic:present>
                <logic:notPresent name="fileList">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                              </tbody>
                            </table></td>
          
</tr>
<tr><td>&nbsp;</td></tr>
      <tr><td>&nbsp;</td></tr>		

</tbody>
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
    <%} %>
  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr><td width="65">&nbsp;</td>
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
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

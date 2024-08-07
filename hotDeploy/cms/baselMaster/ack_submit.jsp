<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
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




<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

%>

<script language="JavaScript" type="text/javascript">
	function goBack(){
		document.forms[0].action		=	"baselmaster.do?event=maker_list_basel_master";		
		document.forms[0].submit(); 
	}

</script>


<body>
<html:form action="baselmaster.do">
<!-- InstanceBeginEditable name="Content" -->
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <thead>
    <tr>
      <td><h3>Confirmation
          <hr/>
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
              <td height="111" class="odd" style="text-align:center">The transaction
                has been submitted. <BR>Your Transaction ID is <B><%=trxId%></B></td>
            </tr>
            
          </tbody>
        </table></td>
    </tr>
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

<%@ page import="com.integrosys.cms.ui.tat.TatsForm,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.customer.bus.*,
                 java.util.*"
                 %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/bfl/issue_final_bfl.jsp,v 1.12 2006/10/27 08:10:27 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.12 $
     * @since $Date: 2006/10/27 08:10:27 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html>
<head>
<title>Untitled Document</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>





<script language="JavaScript" type="text/JavaScript">
<!--

function gotopage() {
	document.forms[0].action="Bfl.do?event=confirm_issue_final_bfl";
    document.forms[0].submit();
}



//-->

</script>
</head>

<body onload="MM_preloadImages('img/cancel2.gif')">
<html:form  action="Bfl.do?event=issue_draft_bfl">

<%
    HashMap rs = (HashMap) request.getAttribute("infoMap");
   String infoReq =(String) rs.get("infoReq");
   Date tatStamp = (Date) rs.get("tatStamp");
       %>
   <% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>


<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <thead>
    <tr>
      <td><h3><bean:message key="title.common.confirmation"/>
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

          <td height="111" class="odd" style="text-align:center">
            <bean:message key="label.bfl.issue.final.date.msg"/></td>
            </tr>
            <tr>

          <td height="51" class="odd" style="text-align:center"> <script type="text/javascript">

			m = new Array("1","2","3","4","5","6","7","8","9","10","11","12");

			var a=new Date()
 	 		var hours=a.getHours()
 	 		var minutes=a.getMinutes()
 	 		var seconds=a.getSeconds()
			var day1 = a.getDate()-7;
			var dn="AM"
 	 		if (hours>12)
 	 		{
				dn="PM"
				hours=hours-12
 	 		}
 	 		if (hours==0)
 	 			hours=12
 	 		if (minutes<=9)
 	 			minutes="0"+minutes
			month = m[a.getMonth()];
			month1 = m[a.getMonth()];

		 	if(day1 < 1)
		 	{

			   day1 = 30 - (-day1);
			   month1 = month - 1;

		 	}


				var d = new Date();
                if(d.getDate()<10)
                    document.write("0")
				document.write(d.getDate())
				document.write(".")
                if(d.getMonth()<9)
                    document.write("0")
				document.write(d.getMonth() + 1)
				document.write(".")
				document.write(d.getFullYear())
				<%--document.write(" "+ " ")
				document.write(hours)
				document.write(".")
				document.write(minutes)
				document.write(".")
				document.write(seconds)
				document.write(" "+dn+" ")--%>

			</script></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
                    <table width="140" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="79">&nbsp;</td>
                        <td width="71">&nbsp;</td>
                      </tr>
                      <tr>
                      <td></td>
                        <td><input type="button" name="Submit" value="Confirm" style="width:60px" class="btnNormal" onclick="gotopage()"/></td>
                        <td>&nbsp;&nbsp;&nbsp;</td><td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
 <% if(infoReq.equals("true")) {%>

 <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
    <tr>
      <td>

      <h3><bean:message key="label.bfl.issue.final.status "/><br />
        </h3></td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
                        <td>

      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead>
        <tr>
          <td width="95%"><bean:message key="label.bfl.last.issue.final.date"/></td>
        </tr>
        </thead> <tbody>
        <tr class="odd">
          <td width="95%" align="center"><integro:empty-if-null value='<%=DateUtil.formatDate(locale,tatStamp,"dd.MM.yyyy")%>'/></td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
                    <%}%>


 </html:form>
</body>
</html>

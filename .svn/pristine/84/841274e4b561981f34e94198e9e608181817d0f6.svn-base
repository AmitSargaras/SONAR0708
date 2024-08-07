<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.checklist.bus.IShareDocSummary"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/view_share_doc.jsp,v 1.3 2006/10/27 08:23:02 hmbao Exp $
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.3 $
* Date: $Date: 2006/10/27 08:23:02 $
* Tag: $Name:  $
*/
%>
<%
    IShareDocSummary[] resultList = (IShareDocSummary[])request.getAttribute("shareDocList");
    pageContext.setAttribute("shareDocList",resultList);
    int row=1;
    boolean hasResult = (!(resultList == null || resultList.length==0));
%>


<html>
<head>
<title>View Shared Documents</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>

<body>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
      <tr>
        <td><h3>View Shared Document</h3></td>
      </tr>
      <tr>
        <td><hr /></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
            <thead>
                <tr>
                    <td class="fieldname" width="1%" align="left" >SNo.</td>
                    <td class="fieldname" width="4%" align="left" >Doc Code</td>
                    <td class="fieldname" width="6%" align="left" >Doc No.</td>
                    <td class="fieldname" width="10%" align="left" >Doc Description</td>
                    <td class="fieldname" width="2%" align="left" >Mandatory</td>
                    <td class="fieldname" width="2%" align="left" >CC or SC</td>
                    <td class="fieldname" width="6%" align="left" >Doc Status</td>
                    <td class="fieldname" width="6%" align="left" >Cust Status</td>
                    <td class="fieldname" width="15%" align="left" >Doc Date</td>
                    <td class="fieldname" width="15%" align="left" >Expiry Date</td>
                    <td class="fieldname" width="13%" align="left" >Shared with LE ID/LE Name/Checklist ID</td>
                    <td class="fieldname" width="20%" align="left" >Narration</td>
                </tr>
            </thead>
            <tbody>
            <% if(hasResult) { %>
                <logic:present name="shareDocList">
                  <logic:iterate id="OB" name="shareDocList"  type="com.integrosys.cms.app.checklist.bus.IShareDocSummary">
                    <tr class="<%=(row%2==0) ? "even" : "odd"%>">
                        <td class="index" ><%=row++%></td>
                        <td><integro:empty-if-null value="<%=OB.getDocCode()%>"/></td>
                        <td><%=OB.getDocNo()%>&nbsp;</td>
                        <td><integro:wrapper value="<%=OB.getDocDesc()%>"/></td>
                        <td style="text-align:center"><%=(OB.getIsMandatory()) ? "Y" : "N"%></td>
                        <td style="text-align:center">
                            <%=OB.getChecklistCategory().equals("CC") ? "CCC" : "SC"%>
                        </td>
                        <td style="text-align:center"><integro:empty-if-null value="<%=OB.getDocStatus()%>"/></td>
                        <td style="text-align:center"><integro:empty-if-null value="<%=OB.getCustStatus()%>"/></td>
                        <td style="text-align:center"><integro:date object="<%=OB.getDocDate()%>" />&nbsp;</td>
                        <td style="text-align:center"><integro:date object="<%=OB.getDocExpiry()%>" />&nbsp;</td>
                        <td style="text-align:left">
                            <%  String shareDetailsSummary = OB.getShareDetailsSummary();
                                shareDetailsSummary = (shareDetailsSummary == null) ? null : shareDetailsSummary.replace(',', '\n');                               
                            %>
                            <integro:htmltext value="<%=shareDetailsSummary%>"/>
                        </td>
                        <% boolean hasNarration = !(OB.getNarration() == null || OB.getNarration().equals("")); %>
                        <td style="text-align:<%=hasNarration ? "left" : "center"%>">
                            <% if(hasNarration) { %>
                                <integro:wrapper value="<%=OB.getNarration()%>"/>&nbsp;
                            <% } else { %> - <% } %>
                        </td>
                    </tr>
                  </logic:iterate>
                 </logic:present>
            <% } else { %>
                    <tr class="odd">
                        <td colspan="12" style="text-align:center">No document(s) found.</td>
                    </tr>
            <% } %>
            </tbody>
            </table>
        </td>
      </tr>
    </tbody>
  </table>

</body>
</html>
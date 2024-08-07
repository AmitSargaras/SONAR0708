<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%--
  /**
   * @author KLYong
   * @date 14/June/2007
   * This jsp is an include page. The page is the remarks section for maker/checker.
   * Pages which need to include this page should pass two 'request parameters'. Namely : UID, and remarks.
   * Ex Usage :
   *    <jsp:include page="{relativeURL | <%= expression %>}" flush="true" >
   *        <jsp:param name="UID" value="whatEverUser" />
   *        <jsp:param name="remarks" value="whatEverRemarks" />
   *    </jsp:include>
   */
--%>
<%
    String paramUID = request.getParameter("UID");
    String paramRemarks = request.getParameter("remarks")==null?" " : request.getParameter("remarks");
    if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
    	paramRemarks=" ";
    }
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr>
        <td width="43%" class="fieldname">Remarks</td>
        <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
    </tr>
    <tr>
        <td class="fieldname">Last Action By</td>
        <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>

        </tr>
        <tr class="odd">
            <td class="fieldname">Last Remarks Made</td>
            <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
        </tr>
    </tr>
    </tbody>
</table>
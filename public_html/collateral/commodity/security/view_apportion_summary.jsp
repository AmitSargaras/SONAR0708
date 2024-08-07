<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%
    com.integrosys.cms.ui.collateral.secapportion.ApportionSummaryViewHelper helper =
    new com.integrosys.cms.ui.collateral.secapportion.ApportionSummaryViewHelper();
    String requireApportion = helper.apportionmentRequired("" + itrxValue.getCollateral().getCollateralID()) == true?"y":"n";
    request.setAttribute("requireapportion", requireApportion);
    if (requireApportion.equals("y"))
    {
       double colFsv = 0;
       if (iCol.getFSV() != null)
       {
          colFsv = iCol.getFSV().getAmount();
       } 
       com.integrosys.cms.ui.collateral.secapportion.SecApportionmentUtil.recalColApportionAmt(colFsv, iCol.getSecApportionment(), false); 
       String curEvent = request.getParameter("from_page");
       String curFromEvent = request.getParameter("from_event");
       System.out.println("EVENT IS: ******************************************" + curEvent); 
       java.util.Locale curLocale = (java.util.Locale)(session.getAttribute("global.LOCALE"));
       request.setAttribute("apportion_summary", helper.getApportionmentSummaryList(curEvent, curFromEvent, curLocale, itrxValue));
    }
%>
<logic:equal name="requireapportion" scope="request" value="y">
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
    <thead>
      <tr>
        <td><h3><bean:message key="label.security.aptmnt.title"/></h3></td>
      </tr>
      <tr>
        <td><hr/></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
            <thead>
              <tr>
                <td width="3%"><bean:message key="label.global.sn"/></td>
                <td width="10%"><bean:message key="label.security.aptmnt.rank"/></td>
                <td width="21%"><bean:message key="label.customer.id.subprofile"/></td>
                <td width="22%"><bean:message key="label.security.aptmnt.le.name"/></td>
                <td width="18%"><bean:message key="label.limit.id"/></td>
                <td width="18%"><bean:message key="label.security.aptmnt.amt"/></td>
                <td width="8%"><bean:message key="label.global.action"/></td>
              </tr>
            </thead>
            <tbody>
              <logic:present name="apportion_summary" scope="request">
                <bean:define id="apportionSummaryList" name="apportion_summary" scope="request" type="java.util.List" />
                <bean:define id="summarySize" value="<%= String.valueOf(apportionSummaryList.size()) %>" />
                <logic:equal name="summarySize" value="0" scope="page">
                  <tr class="odd">
                    <td colspan="7"><bean:message key="label.security.aptmnt.info.none"/></td>
                  </tr> 
                </logic:equal>
                <logic:notEqual name="summarySize" value="0" scope="page">
                  <logic:iterate id="curSummary" indexId="summaryInd" name="apportion_summary" scope="request" 
                   type="com.integrosys.cms.ui.collateral.secapportion.OBApportionSummaryLstItem">
                     <tr class="<bean:write name="curSummary" property="rowClass" />">
                       <td class="<bean:write name="curSummary" property="headerClass" />">
                         <%= summaryInd.intValue() + 1 %>
                       </td>
                       <td>
                         <bean:write name="curSummary" property="priorityRank" />
                       </td>
                       <td>
                         <bean:write name="curSummary" property="leIdSubProfileIdConcat" />
                       </td>
                       <td>
                         <bean:write name="curSummary" property="leName" />
                       </td>
                       <td>
                         <bean:write name="curSummary" property="limitId" />
                       </td>
                       <td>
                         <bean:write name="curSummary" property="apportionedAmount" />&nbsp;
                       </td>
                       <td>
                         <a href="CommoditySecurityApportionment.do?event=read&indexID=<%= request.getParameter("indexID") %>&apportionIndexID=<%= curSummary.getRefId() %>&from_page=<%= from_event %>&from_event=<%= from_event %>&apportionstate=1">View</a>
                       </td>  
                     </tr> 
                  </logic:iterate>
                </logic:notEqual>
              </logic:present>
              <logic:notPresent name="apportion_summary" scope="request">
                <tr class="odd">
                  <td colspan="7"><bean:message key="label.security.aptmnt.info.none"/></td>
                </tr>
              </logic:notPresent> 
            </tbody>
          </table>
        </td>
      </tr>  
    </tbody>
  </table>
</logic:equal>
            
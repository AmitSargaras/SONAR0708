<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>


<script language="javascript">
  function createApportionment()
  {
     document.forms[0].event.value="prepare_apportion";
     document.forms[0].apportionIndexID.value="-1";
     document.forms[0].itemType.value = "<%=com.integrosys.cms.ui.collateral.CollateralConstant.APPORTIONMENT %>";
     document.forms[0].submit();
  }

  function updateApportionment(index)
  {
      document.forms[0].event.value="prepare_update_sub_apportion";
      document.forms[0].apportionIndexID.value= index;
      document.forms[0].itemType.value = "<%=com.integrosys.cms.ui.collateral.CollateralConstant.APPORTIONMENT %>";
      document.forms[0].submit();
  }

  function deleteApportionment()
  {
     document.forms[0].event.value="itemDelete";
     document.forms[0].apportionIndexID.value="-1";
     document.forms[0].itemType.value = "<%=com.integrosys.cms.ui.collateral.CollateralConstant.APPORTIONMENT %>";
     document.forms[0].submit();
  }
</script>

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
       String curEvent = request.getParameter("event");
       System.out.println("UPDATE EVENT " + curEvent);
       java.util.Locale curLocale = (java.util.Locale)(session.getAttribute("global.LOCALE"));
       request.setAttribute("apportion_summary", helper.getApportionmentSummaryList(curEvent, null, curLocale, itrxValue));
    }
%>


<logic:equal name="requireapportion" scope="request" value="y">
  <input type="hidden" name="apportionstate" value="1" />
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
    <thead>
      <tr>
        <td><h3><bean:message key="label.security.aptmnt.title"/></h3></td>
        <td align="right" valign="baseline">
          <html:errors property="apportionmentError"/>&nbsp;
          <input class="btnNormal" type="button" name="btnAddApportionment" value="Add New" onclick="javascript:createApportionment()"/>&nbsp;
          <input class="btnNormal" type="button" name="btnDelApportionment" value="Remove" onclick="javascript:deleteApportionment()" />     
        </td>
      </tr>
      <tr>
        <td colspan="2"><hr/></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
            <thead>
              <tr>
                <td width="3%"><bean:message key="label.global.sn"/></td>
                <td width="9%"><bean:message key="label.security.aptmnt.rank"/></td>
                <td width="20%"><bean:message key="label.customer.id.subprofile"/></td>
                <td width="21%"><bean:message key="label.security.aptmnt.le.name"/></td>
                <td width="17%"><bean:message key="label.limit.id"/></td>
                <td width="10%"><bean:message key="label.security.aptmnt.amt"/></td>
                <td width="7%"><bean:message key="label.global.action"/></td>
                <td width="6%"><bean:message key="label.global.delete"/></td> 
              </tr>
            </thead>
            <tbody>
              <logic:present name="apportion_summary" scope="request">
                <bean:define id="apportionSummaryList" name="apportion_summary" scope="request" type="java.util.List" />
                <bean:define id="summarySize" value="<%= String.valueOf(apportionSummaryList.size()) %>" />
                <logic:equal name="summarySize" value="0" scope="page">
                  <tr class="odd">
                    <td colspan="8"><bean:message key="label.security.aptmnt.info.none"/></td>
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
                         <bean:write name="curSummary" property="apportionedAmount" /><br>
                       </td>
                       <td>
                         <a href="javascript:updateApportionment(<%= summaryInd.intValue() %>)">View / Edit</a>
                       </td>
                       <td>
                         <html:multibox property="deletedApportionments"  value="<%= summaryInd.toString() %>" />
                         &nbsp;
                       </td>   
                     </tr> 
                  </logic:iterate>
                </logic:notEqual>
              </logic:present>
              <logic:notPresent name="apportion_summary" scope="request">
                <tr class="odd">
                  <td colspan="8"><bean:message key="label.security.aptmnt.info.none"/></td>
                </tr>
              </logic:notPresent> 
            </tbody>
          </table>
        </td>
      </tr>   
    </tbody>
  </table>
</logic:equal>

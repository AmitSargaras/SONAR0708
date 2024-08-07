<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
		 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.collateral.secapportion.SecApportionmentForm" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="javascript">
  function returnPage()
  {
     document.forms[0].event.value = "read_return";
     document.forms[0].submit();
  }
</script>
</head>

<%
  SecApportionmentForm formObj = (SecApportionmentForm)(request.getAttribute("SecurityApportionmentDtlForm"));
  String priorityRankingAmtStyle = formObj.isPriorityRankingAmtChanged()?"fieldnamediff":"fieldname";
  String byAmountStyle = formObj.isByAmountChanged()?"fieldnamediff":"fieldname";
  String minimumStyle = formObj.isMinimumChanged()?"fieldnamediff":"fieldname";
  String maximumStyle = formObj.isMaximumChanged()?"fieldnamediff":"fieldname";
  String apportionAmtStyle = formObj.isApportionAmtChanged()?"fieldnamediff":"fieldname"; 
  String pageAction = "CommoditySecurityApportionment.do";
%>

<body>
  <html:form action="<%= pageAction %>">
    <input type="hidden" name="event" value="" />
    <input type="hidden" name="indexID" value="<%= request.getParameter("indexID") %>" />
    <input type="hidden" name="apportionIndexID" value="<%= request.getParameter("apportionIndexID") %>"/> 
    <input type="hidden" name="from_page" value="<%= request.getParameter("from_page") %>" />
    <input type="hidden" name="from_event" value="<%= request.getParameter("from_event") %>" />
    <input type="hidden" name="requireapportion" value="y" />

    <%@ include file="/collateral/common/mandatory_flag.jsp" %>
    
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
      <thead>
        <tr> 
          <td width="81%" ><h3>View Security Apportionments</h3></td>
          <td width="19%" align="right" valign="bottom" >&nbsp; </td>
        </tr>
        <tr> 
          <td colspan="2"> <hr/> </td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
              <tbody>
                <tr class="odd"> 
                  <td class="fieldname"><bean:message key="label.security.pri.rnk"/>&nbsp;</td>
                  <td colspan="3">
              	    <bean:write name="SecurityApportionmentDtlForm" property="priorityRankDisp"/>&nbsp;
                  </td>
                </tr>
                <tr class="even">
                  <td class="fieldname"><bean:message key="label.security.available.col.amt "/>&nbsp;</td>
                  <td colspan="3">
                    <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency" />&nbsp;
                    <bean:write name="SecurityApportionmentDtlForm" property="availableCollateralAmt" />
                  </td>
                </tr>
                <tr class="odd">
                  <td class="<%= priorityRankingAmtStyle %>"><bean:message key="label.security.updateaptmnt.pri.rank.amt"/>&nbsp;</td>
                  <td colspan="3">
                    <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency" />&nbsp;
                    <bean:write name="SecurityApportionmentDtlForm" property="priorityRankingAmt" />
                  </td>
                </tr>
                <tr class="even">
                  <td class="fieldname" width="20%"><bean:message key="label.security.le.id"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="leIdDisp" />&nbsp;
                  </td>
                  <td class="fieldname" width="20%"><bean:message key="label.security.aptmnt.le.name"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="leName" />&nbsp;
                  </td>
                </tr>
                <tr class="odd">
                  <td class="fieldname" width="20%"><bean:message key="label.customer.subprofile.id"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="subProfileIdDisp" />&nbsp;
                  </td>
                  <td colspan="2">
                    &nbsp;
                  </td>
                </tr>
                <tr class="even">
                  <td class="fieldname" width="20%"><bean:message key="label.limit.id"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="limitIdDisp" />&nbsp;
                  </td>
                  <td colspan="2">
                    &nbsp;
                  </td>
                </tr>
                <tr class="odd">
                  <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.chg.rank"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="chargeRank" />&nbsp;
                  </td> 
                  <td class="fieldname" width="20%"><bean:message key="label.product.desc"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="productDesc" />&nbsp;
                  </td>
                </tr>
                <tr class="even">
                  <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.apr.limit.ccy"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="approvedLimitCcy" />&nbsp;
                  </td>
                  <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.apr.limit.amt"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="approvedLimitAmt" />&nbsp;
                  </td>
                </tr>    
                <tr class="odd">
                  <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.act.limit.ccy"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="activatedLimitCcy" />&nbsp;
                  </td>
                  <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.act.limit.amt"/>&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecurityApportionmentDtlForm" property="activatedLimitAmt" />&nbsp;
                  </td>
                </tr> 
                <tr class="even">
                  <td class="<%= byAmountStyle %>" width="20%"><bean:message key="label.security.updateaptmnt.amt"/>&nbsp;</td>
                  <td colspan="3">
                    <logic:equal name="SecurityApportionmentDtlForm" property="percAmtInd" value="<%= ICMSConstant.SEC_APPORTION_AMT %>">
                      $&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency" />&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="byAbsoluteAmt" />&nbsp;&nbsp;&nbsp;&nbsp;
                      %&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="byAbsoluteAmtDisp" />&nbsp;
                    </logic:equal>
                    <logic:equal name="SecurityApportionmentDtlForm" property="percAmtInd" value="<%= ICMSConstant.SEC_APPORTION_PERC %>">
                      $&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency" />&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="byPercentageDisp" />&nbsp;&nbsp;&nbsp;&nbsp;
                      %&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="byPercentage" />
                    </logic:equal>&nbsp;   
                  </td>
                </tr>
                <tr class="odd">
                  <td class="<%= minimumStyle %>" width="20%"><bean:message key="label.security.updateaptmnt.min"/>&nbsp;</td>
                  <td colspan="3">
                    <logic:equal name="SecurityApportionmentDtlForm" property="minPercAmtInd" value="<%= ICMSConstant.SEC_APPORTION_AMT %>">
                      $&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency" />&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="minAbsoluteAmt" />&nbsp;&nbsp;&nbsp;&nbsp;
                      %&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="minAbsoluteAmtDisp" />
                    </logic:equal>
                    <logic:equal name="SecurityApportionmentDtlForm" property="minPercAmtInd" value="<%= ICMSConstant.SEC_APPORTION_PERC %>">
                      $&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency" />&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="minPercentageDisp" />&nbsp;&nbsp;&nbsp;&nbsp;
                      %&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="minPercentage" />
                    </logic:equal>&nbsp;   
                  </td>
                </tr>
                <tr class="even">
                  <td class="<%= maximumStyle %>" width="20%"><bean:message key="label.security.updateaptmnt.max"/>&nbsp;</td>
                  <td colspan="3">
                    <logic:equal name="SecurityApportionmentDtlForm" property="maxPercAmtInd" value="<%= ICMSConstant.SEC_APPORTION_AMT %>">
                      $&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency" />&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="maxAbsoluteAmt" />&nbsp;&nbsp;&nbsp;&nbsp;
                      %&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="maxAbsoluteAmtDisp" />
                    </logic:equal>
                    <logic:equal name="SecurityApportionmentDtlForm" property="maxPercAmtInd" value="<%= ICMSConstant.SEC_APPORTION_PERC %>">
                      $&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency" />&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="maxPercentageDisp" />&nbsp;&nbsp;&nbsp;&nbsp;
                      %&nbsp;
                      <bean:write name="SecurityApportionmentDtlForm" property="maxPercentage" />
                    </logic:equal>&nbsp;   
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table>
    <table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
          <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
      </tr>
      <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
      </tr>
    </table>

  </html:form>
</body>
</html>


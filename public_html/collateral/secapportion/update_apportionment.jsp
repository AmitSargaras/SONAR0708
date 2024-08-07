<%--Updated and beautifier  by JJ  --%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>

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
    <script type="text/javascript" src="js/secApportionment.js"></script>
    <script language="javascript">
    <!--
        var limitInfo = new Array();

        <logic:iterate id="curLmt" indexId="lmtInd" name="limitDtlListReq" scope="request" type="com.integrosys.cms.app.collateral.bus.OBSecApportionLmtDtl">
            limitInfo[<%=lmtInd %>] = new Array("<%=curLmt.getLeId() %>", "<%=curLmt.getLeName()==null?"&nbsp;":curLmt.getLeName() %>", "<%=curLmt.getSubProfileId() %>", "<%=curLmt.getCmsLspApprLmtId() %>", "<%=curLmt.getLimitId() %>", "<%=curLmt.getChargeId() %>", "<%=curLmt.getChargeRank() %>", "<%= new java.math.BigDecimal(curLmt.getChargeAmount()).setScale(2, java.math.BigDecimal.ROUND_HALF_UP).toString() %>", "<%=curLmt.getProductDesc()==null?"&nbsp;":curLmt.getProductDesc() %>", "<%=curLmt.getApprovedLimitCcy()==null?"&nbsp;":curLmt.getApprovedLimitCcy() %>", "<%=curLmt.getApprovedLimitAmt()==null?"&nbsp;":curLmt.getApprovedLimitAmt() %>", "<%=curLmt.getActivatedLimitCcy()==null?" ":curLmt.getActivatedLimitCcy() %>", "<%=curLmt.getActivatedLimitAmt()==null?"&nbsp;":curLmt.getActivatedLimitAmt() %>");
        </logic:iterate>   

        var praByCharge = new Array();
        <logic:present name="praAmtByCharge" scope="request">
            <logic:iterate id="curPra" indexId="praInd" name="praAmtByCharge" scope="request" type="java.util.List">
                praByCharge[<%=praInd %>] = new Array("<%=curPra.get(0) %>", "<%=curPra.get(1) %>");
            </logic:iterate>
        </logic:present>

        function submitPage(val) {
            if (val == 1)  {
                if (validateSecApportionmentForm()) {
                    document.forms[0].event.value = "create";
                    document.forms[0].submit();
                }
            }  else if (val == 2)  {
                if (validateSecApportionmentForm()) {
                    document.forms[0].event.value = "update";
                    document.forms[0].submit();
                }
            }  else if (val == 3)  {
                document.forms[0].event.value = "cancel";
                document.forms[0].submit();
            }
        }

        function stateChange(val)  {
            if (val == 2) {
                document.forms[0].apportionstate.value = val;
                var leIdSel = document.forms[0].leId;
                var leIdVal = leIdSel.options[leIdSel.selectedIndex].value;
                leIdSelected(leIdVal);
            } else if (val == 3) {
                document.forms[0].apportionstate.value = val;
                var leIdSel = document.forms[0].leId;
                var leIdVal = leIdSel.options[leIdSel.selectedIndex].value;
                var subprofileSel = document.forms[0].subProfileId;
                var subprofileVal = subprofileSel.options[subprofileSel.selectedIndex].value;
                subprofileIdSelected(leIdVal, subprofileVal);
            }  else if (val == 4) {
                document.forms[0].apportionstate.value = val;
                var limitIdSel = document.forms[0].limitId;
                var limitIdVal = limitIdSel.options[limitIdSel.selectedIndex].value;
                limitIdSelected(limitIdVal);
            }   else if (val == 5){
                var limitIdSel = document.forms[0].limitId;
                var limitIdVal = limitIdSel.options[limitIdSel.selectedIndex].value;
                var chargeRankSel = document.forms[0].chargeDtlId;
                var chargeRankVal = chargeRankSel.options[chargeRankSel.selectedIndex].value;
                chargeRankSelected(limitIdVal, chargeRankVal);
            }
        }
-->
    </script>
</head>

<body>
<%@ include file="/collateral/checkIsSSC.jsp" %>

<%
    String titleStr = " Security Apportionments";
    String submitParam = "1";
    if ("-1".equals(request.getParameter("indexID"))) {
        titleStr = "Add" + titleStr;
    } else {
        titleStr = "Edit" + titleStr;
        submitParam = "2";
    } 
    String pageAction = request.getParameter("prefix") + "SecurityApportionment.do";
%>

<html:form action="<%= pageAction %>">
    <input type="hidden" name="event" value=""/>
    <input type="hidden" name="indexID" value="<%= request.getParameter("indexID") %>"/>
    <input type="hidden" name="from_event" value="<%= request.getParameter("from_event") %>"/>
    <input type="hidden" name="subtype" value="<%= request.getParameter("subtype") %>"/>
    <input type="hidden" name="apportionstate" value="<%= request.getParameter("apportionstate") %>"/>
    <input type="hidden" name="prefix" value="<%= request.getParameter("prefix") %>"/>
    <input type="hidden" name="requireapportion" value="y"/>
    <input type="hidden" name="fsv" value='<bean:write name="fsv" scope="request" />'/>
    <html:hidden property="minFsvCharge"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%"><h3><%
            if("-1".equals(request.getParameter("indexID"))){
                %><bean:message key="label.security.updateaptmnt.title.add"/><%
            }
            else{
                %><bean:message key="label.security.updateaptmnt.title.edit"/><%
            }%></h3>
        </td>
        <td width="19%" align="right" valign="bottom">&nbsp; </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.pri.rnk"/>&nbsp;<font color="#0000FF">*</font></td>
    <td colspan="3">
        <logic:equal parameter="indexID" value="-1">
            <html:select property="priorityRank">
                <html:options name="rankID" labelName="rankValue"/>
            </html:select>&nbsp;
            <html:errors property="priorityRank"/>
        </logic:equal>
        <logic:notEqual parameter="indexID" value="-1">
            <bean:write name="SecurityApportionmentDtlForm" property="priorityRankDisp"/>&nbsp;
            <html:hidden property="priorityRank"/>
        </logic:notEqual>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.updateaptmnt.acm"/>&nbsp;</td>
    <td colspan="3">
        <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency"/>&nbsp;
        <html:text property="availableCollateralAmt" readonly="true"/>
    </td>
</tr>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.updateaptmnt.pri.rank.amt"/>&nbsp;<font color="#0000FF">*</font></td>
    <td colspan="3">
        <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency"/>&nbsp;
        <html:hidden property="fsvCurrency"/><html:text property="priorityRankingAmt"/><span id="id_prAmt">&nbsp;</span>
    </td>
</tr>
<tr class="even">
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.gcif.id"/>&nbsp;<font color="#0000FF">*</font></td>
    <td width="30%">
        <logic:equal parameter="indexID" value="-1">
            <html:select property="leId" style="width:100" onchange="javascript:stateChange(2)">
                <option value=""><bean:message key="label.please.select"/> </option>
                <html:options name="leIdList"/>
            </html:select>&nbsp;
        </logic:equal>
        <logic:notEqual parameter="indexID" value="-1">
            <bean:write name="SecurityApportionmentDtlForm" property="leIdDisp"/>&nbsp;
            <html:hidden property="leId"/>
        </logic:notEqual>
        &nbsp;<span id="id_leId">&nbsp;</span>
    </td>
    <td class="fieldname" width="20%"><bean:message key="label.customer.name"/>&nbsp;</td>
    <td width="30%" id="id_leName">
        <bean:write name="SecurityApportionmentDtlForm" property="leName"/>&nbsp;
    </td>
</tr>
<tr class="even">
    <td class="fieldname" width="20%"><bean:message key="label.limit.id"/>&nbsp;<font color="#0000FF">*</font></td>
    <td width="30%">
        <logic:equal parameter="indexID" value="-1">
            <html:select property="limitId" style="width:100" onchange="javascript:stateChange(4)">
                <option value=""><bean:message key="label.please.select"/> </option>
            </html:select>&nbsp;
            <html:errors property="limitId"/>
        </logic:equal>
        <logic:notEqual parameter="indexID" value="-1">
            <bean:write name="SecurityApportionmentDtlForm" property="limitIdDisp"/>&nbsp;
            <html:hidden property="limitId"/>
        </logic:notEqual>
        &nbsp;<span id="id_limitId">&nbsp;</span>
    </td>
    <td colspan="2">
        &nbsp;
    </td>
</tr>
<tr class="odd">
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.chg.rank"/>&nbsp;</td>
    <td width="30%">
        <logic:equal parameter="indexID" value="-1">
            <html:select property="chargeDtlId" style="width:100" onchange="javascript:stateChange(5)">
            </html:select>&nbsp;
        </logic:equal>
        <logic:notEqual parameter="indexID" value="-1">
            <bean:write name="SecurityApportionmentDtlForm" property="chargeRank"/>&nbsp;
            <html:hidden property="chargeDtlId"/>
        </logic:notEqual>
    </td>
    <td class="fieldname" width="20%"><bean:message key="label.product.desc"/>&nbsp;</td>
    <td width="30%" id="id_productDesc">
        <bean:write name="SecurityApportionmentDtlForm" property="productDesc"/>&nbsp;
    </td>
</tr>
<tr class="even">
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.apr.limit.ccy"/>&nbsp;</td>
    <td width="30%" id="id_approvedLimitCcy">
        <bean:write name="SecurityApportionmentDtlForm" property="approvedLimitCcy"/>&nbsp;
    </td>
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.apr.limit.amt"/>&nbsp;</td>
    <td width="30%" id="id_approvedLimitAmt">
        <bean:write name="SecurityApportionmentDtlForm" property="approvedLimitAmt"/>&nbsp;
    </td>
</tr>
<tr class="odd">
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.act.limit.ccy"/>&nbsp;</td>
    <td width="30%" id="id_activatedLimitCcy">
        <bean:write name="SecurityApportionmentDtlForm" property="activatedLimitCcy"/>&nbsp;
    </td>
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.act.limit.amt"/>&nbsp;</td>
    <td width="30%" id="id_activatedLimitAmt">
        <bean:write name="SecurityApportionmentDtlForm" property="activatedLimitAmt"/>&nbsp;
    </td>
</tr>
<tr class="even">
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.amt"/>&nbsp;<font color="#0000FF">*</font></td>
    <td>
        <html:radio property="percAmtInd" onclick="javascript:byAmountCheckChanged()" value="<%= ICMSConstant.SEC_APPORTION_PERC %>"/>&nbsp;&nbsp;%<br>
        <html:radio property="percAmtInd" onclick="javascript:byAmountCheckChanged()" value="<%= ICMSConstant.SEC_APPORTION_AMT %>"/>&nbsp;&nbsp;Absolute Amount
    </td>
    <td>
        <html:text property="byPercentage" onblur="javascript:byPercentageLostFocus()"/>&nbsp;%<br>
        <span id="id_by_perc">&nbsp;</span><br> 
        <html:text property="byAbsoluteAmt" onblur="javascript:byAmountLostFocus()"/>&nbsp;$&nbsp;
        <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency"/><br>
        <span id="id_by_amt">&nbsp;</span>
    </td>
    <td>
        <html:text property="byPercentageDisp" readonly="true"/>&nbsp;$&nbsp;
        <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency"/><br>
        <span>&nbsp;</span><br>
        <html:text property="byAbsoluteAmtDisp" readonly="true"/>&nbsp;%<br>
        <span>&nbsp;</span>
    </td>
</tr>
<tr class="odd">
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.min"/>&nbsp;</td>
    <td>
        <html:radio property="minPercAmtInd" onclick="javascript:minAmountCheckChanged()" value="<%= ICMSConstant.SEC_APPORTION_PERC %>"/>&nbsp;&nbsp;%<br>
        <html:radio property="minPercAmtInd" onclick="javascript:minAmountCheckChanged()"  value="<%= ICMSConstant.SEC_APPORTION_AMT %>"/>&nbsp;&nbsp;Absolute Amount
    </td>
    <td>
        <html:text property="minPercentage" onblur="javascript:minPercentageLostFocus()"/>&nbsp;%<br>
        <span id="id_min_perc">&nbsp;</span><br>
        <html:text property="minAbsoluteAmt" onblur="javascript:minAmountLostFocus()"/>&nbsp;$&nbsp;
        <bean:write name="SecurityApportionmentDtlForm"   property="fsvCurrency"/><br>
        <span id="id_min_amt">&nbsp;</span>
    </td>
    <td>
        <html:text property="minPercentageDisp" readonly="true"/>&nbsp;$&nbsp;
        <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency"/><br>
        <span>&nbsp;</span><br>
        <html:text property="minAbsoluteAmtDisp" readonly="true"/>&nbsp;%<br>
        <span>&nbsp;</span>
    </td>
</tr>
<tr class="even">
    <td class="fieldname" width="20%"><bean:message key="label.security.updateaptmnt.max"/>&nbsp;</td>
    <td>
        <html:radio property="maxPercAmtInd" onclick="javascript:maxAmountCheckChanged()" value="<%= ICMSConstant.SEC_APPORTION_PERC %>"/>&nbsp;&nbsp;%<br>
        <html:radio property="maxPercAmtInd" onclick="javascritp:maxAmountCheckChanged()"  value="<%= ICMSConstant.SEC_APPORTION_AMT %>"/>&nbsp;&nbsp;Absolute Amount
    </td>
    <td>
        <html:text property="maxPercentage" onblur="javascript:maxPercentageLostFocus()"/>&nbsp;%<br>
        <span id="id_max_perc">&nbsp;</span><br>
        <html:text property="maxAbsoluteAmt" onblur="javascript:maxAmountLostFocus()"/>&nbsp;$&nbsp;
        <bean:write name="SecurityApportionmentDtlForm"    property="fsvCurrency"/><br>
        <span id="id_max_amt">&nbsp;</span>
    </td>
    <td>
        <html:text property="maxPercentageDisp" readonly="true"/>&nbsp;$&nbsp;
        <bean:write name="SecurityApportionmentDtlForm" property="fsvCurrency"/><br>
        <span>&nbsp;</span><br>
        <html:text property="maxAbsoluteAmtDisp" readonly="true"/>&nbsp;%<br>
        <span>&nbsp;</span>
    </td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<html:hidden property="apportionAmt"/>
<table width="225" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(<%=submitParam %>)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" height="22" border="0" id="Image142"/></a>
        </td>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image4411" border="0"  id="Image4411"/></a>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>

<%
    // after validation return ugly code here, may move to server side or use ajax to do validation
    if ("-1".equals(request.getParameter("indexID")) && request.getParameter("minFsvCharge") != null) {
%>
<script language="javascript">
    leIdSelected(<%= request.getParameter("leId") %>);
    subprofileIdSelected(<%= request.getParameter("leId") %>, <%= request.getParameter("subProfileId") %>);
    limitIdSelected(<%= request.getParameter("limitId") %>);
    chargeRankSelected(<%= request.getParameter("limitId") %>, <%= request.getParameter("chargeDtlId") %>);
    document.forms[0].subProfileId.value = <%= request.getParameter("subProfileId") %>;
    document.forms[0].limitId.value = <%= request.getParameter("limitId") %>;
    document.forms[0].chargeDtlId.value = <%= request.getParameter("chargeDtlId") %>;
</script>
<%
    }
%>
<script language="javascript">
  if (document.forms[0].percAmtInd[0].checked == false && document.forms[0].percAmtInd[1].checked == false)
  {
     document.forms[0].percAmtInd[0].checked = true;
  }
  if (document.forms[0].percAmtInd[0].checked == true)
  {
     document.forms[0].byAbsoluteAmt.disabled = true;
     document.forms[0].byPercentage.disabled = false;  
  }
  else if (document.forms[0].percAmtInd[1].checked == true)
  {
     document.forms[0].byPercentage.disabled = true;
     document.forms[0].byAbsoluteAmt.disabled = false;
  }
  if (document.forms[0].minPercAmtInd[0].checked == true)
  {
     document.forms[0].minAbsoluteAmt.disabled = true;
     document.forms[0].minPercentage.disabled = false;
  }
  else if (document.forms[0].minPercAmtInd[1].checked == true)
  {
     document.forms[0].minPercentage.disabled = true;
     document.forms[0].minAbsoluteAmt.disabled = false; 
  }
  else
  {
     document.forms[0].minPercentage.disabled = true;
     document.forms[0].minAbsoluteAmt.disabled = true;
  } 
  if (document.forms[0].maxPercAmtInd[0].checked == true)
  {
     document.forms[0].maxAbsoluteAmt.disabled = true;
     document.forms[0].maxPercentage.disabled = false;
  }
  else if (document.forms[0].maxPercAmtInd[1].checked == true)
  {
     document.forms[0].maxPercentage.disabled = true;
     document.forms[0].maxAbsoluteAmt.disabled = false; 
  }
  else
  {
     document.forms[0].maxPercentage.disabled = true;
     document.forms[0].maxAbsoluteAmt.disabled = true; 
  } 
</script>
</body>
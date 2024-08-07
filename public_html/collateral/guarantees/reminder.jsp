<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%
    String fromPath = request.getParameter("path");
    String sessionPath = "com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.serviceColObj";
    ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(sessionPath);
%>

<html>
<head>
<script type="text/javascript" src="js/imageNavigation.js"></script>
</head>

<body>
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:mesage key="label.security.reminder.guarantee"/></h3></td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:0;margin-bottom:20px">
          <thead>
            <tr >
              <td valign="top"><bean:message key="label.global.sn"/></td>
              <td valign="top"><bean:message key="label.reminder"/></td>
              <td  valign="top"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td valign="top" class="index">1</td>
              <td valign="top"  ><bean:message key="label.security.biennial"/></td>
              <td  valign="top"><input type="button" name="Button21" value="View" class="btnNormal" style="width:60" onclick="gotopage('<%=fromPath%>Collateral.do?event=print_reminder&path=<%=fromPath%>&doc=gtee_bieannal')"/></td>
            </tr>
            <% if (!(itrxValue.getCollateral().getCollateralSubType().getSubTypeCode().equals(ICMSConstant.COLTYPE_GUARANTEE_PERSONAL))) { %>
            <tr class="odd" >
              <td valign="top" class="index">2</td>
              <td valign="top"  ><bean:message key="label.security.swift.msg.sblc.banker"/></td>
              <td  valign="top"><input type="button" name="Button22" value="View" class="btnNormal" style="width:60" onclick="gotopage('<%=fromPath%>Collateral.do?event=print_reminder&path=<%=fromPath%>&doc=sblc_swift')"/></td>
            </tr>
            <% } %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="<%=fromPath%>Collateral.do?event=read&collateralID=<%=itrxValue.getCollateral().getCollateralID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>

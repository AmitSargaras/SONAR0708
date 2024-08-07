<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.commondata.app.trx.IBusinessParameterGroupTrxValue,
                 com.integrosys.component.commondata.app.bus.IBusinessParameterGroup,
                 com.integrosys.component.commondata.app.Constants,
                 com.integrosys.component.commondata.app.bus.IBusinessParameter,
                 java.util.Arrays,
                 com.integrosys.component.commondata.app.bus.BusinessParameterComparator,
                 com.integrosys.cms.ui.systemparameters.MaintainSystemParametersForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
                 
<%
    MaintainSystemParametersForm aForm = (MaintainSystemParametersForm) request.getAttribute("MaintainSystemParametersForm");

    IBusinessParameterGroupTrxValue businessParameterGroupTrxVal = (IBusinessParameterGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.systemparameters.MaintainSystemParametersAction.SystemParametersTrxValue");
    IBusinessParameterGroup businessParameterGroup = businessParameterGroupTrxVal.getBusinessParameterGroup();

    IBusinessParameter[] parametersArray = businessParameterGroup.getBusinessParameters();

    Arrays.sort(parametersArray, new BusinessParameterComparator());
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<!-- InstanceEndEditable -->
</head>
<html:form action="MaintainSystemParameters.do?" >

<body onload="MM_preloadImages('img/return2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>View General Parameters</h3></td>
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
              <td width="8%">S/N</td>
              <td width="73%">Description</td>
              <td width="19%">Parameter Value&nbsp;<font color="#00AAFF">* </font></td>
            </tr>
          </thead>
          <tbody>
          <%
                  String parameterValue[] = new String[parametersArray.length];
                            parameterValue =aForm.getParameterValues();
              for (int i = 0; i < parametersArray.length; i++) {
                  IBusinessParameter parameter = parametersArray[i];

          %>
          <tr class=<%=(i%2==0)?"odd":"even"%>>
            <html:hidden property="parameterCodes" value="<%=parameter.getParameterCode()%>" ></html:hidden>
              <td class="index" ><%=(i+1)%></td>
              <td ><integro:empty-if-null value="<%=parameter.getParameterName()%>"/>&nbsp;</td>
                <%
                         String hardCodedParamUnit = "Hour(s)"; //hardcoded
                      if(parameter.getParameterName()!=null)
                      {
                      if(parameter.getParameterName().trim().equalsIgnoreCase("Number of days BFL not accepted by customers")
                        || parameter.getParameterName().trim().equalsIgnoreCase("Number of days DDN not issued upon Approval date of BCA")
                      ) {
                          hardCodedParamUnit = "Day(s)";
                      }
                           if(parameter.getParameterName().trim().equalsIgnoreCase("Percentage Rise of Market Index")
                        || parameter.getParameterName().trim().equalsIgnoreCase("Percentage Fall of Market Index")
                      ) {
                          hardCodedParamUnit = "%";
                      }
                      }  %>
              <td ><%=parameter.getParameterValue()%><%--<%=parameterValue[i]%>--%>&nbsp;<%=hardCodedParamUnit%></td>
            </tr>
         <%
             }
         %>


          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

<!-- InstanceEndEditable -->

</html:form>

</body>
<!-- InstanceEnd --></html>

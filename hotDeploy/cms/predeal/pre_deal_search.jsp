<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%

%>


<html>
  <head>
    <title>
      <!-- Pre-Deal -->
      <bean:message key="title.pre.deal"/>
    </title>

  </head>

  
  <!-- InstanceBeginEditable name="head" -->

  <script>
  <!--

    function submitPage(gobutton) {
      if(gobutton==1)  {
        document.forms[0].isinCode.value="";
        document.forms[0].ric.value="";
      } else if(gobutton==2){
        document.forms[0].counterName.value="";
        document.forms[0].ric.value="";
      }else if(gobutton==3){
        document.forms[0].counterName.value="";
        document.forms[0].isinCode.value="";
      }
      document.forms[0].submit();
    }
  //-->
  </script>
  
  <body>
    <br />

    <html:form action="/PreDeal.do" >
    <html:hidden property="event" value="<%=PreDealConstants.EVENT_MAKER_SEARCH%>" />

      <table class="tblInput" align="center" width="60%" border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <td colspan="3">Please enter search criteria<br/>
              <html:errors property="searchError" /> 
            </td>
          </tr>
        </thead>

        <tbody>
          <tr class="odd">
            <td class="fieldname"><bean:message key="label.predeal.counterName"/> : </td>
            <td><input name="<%= PreDealConstants.COUNTER_NAME %>" type="text" size="40"/></td>
            <td><input onclick="submitPage(1)" name="AddNew2" type="button" id="AddNew2" value="Go" class="btnNormal" /></td>
          </tr>

          <tr class="even">
            <td width="37%" class="fieldname"><bean:message key="label.predeal.isin"/> : </td>
            <td width="48%"><input name="<%= PreDealConstants.ISIN_CODE %>" type="text" size="40"/></td>
            <td width="15%"><input onclick="submitPage(2)" name="AddNew1" type="button" id="AddNew1" value="Go" class="btnNormal" /></td>
          </tr>

          <tr class="odd">
            <td class="fieldname"><bean:message key="label.predeal.ric"/> : </td>
            <td><input name="<%= PreDealConstants.RIC %>" type="text" size="40"/></td>
            <td><input onclick="submitPage(3)" name="AddNew3" type="button" id="AddNew3" value="Go" class="btnNormal" /></td>
          </tr>
        </tbody>
      </table>
    </html:form>

  </body>

</html>
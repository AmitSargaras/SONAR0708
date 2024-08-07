<%@ page import="com.integrosys.cms.ui.customer.viewdetails.CustomerViewAction" %>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartyCCIAction"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
     String context = request.getContextPath() + "/";
%>
<script type="text/javascript">
    <!--
        var token='vc<%--=TokenTag.generateToken()--%>';
        function viewCustomer(subProfileID) {
           // var url = "CounterpartyCCI.do?event=<%=CounterpartyCCIAction.EVENT_VIEW_CUSTOMER_DETAILS%>&subProfileID=" + subProfileID  ;
            var url = <%=context%> +"customer/viewdetails/popup_viewCustomer.jsp?subProfileID=" + subProfileID  ;
            MM_openBrWindow(url, token, "left=220, top=20, height=600, width=750, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no", 'yes');
            disableGoButtons(false) ;
        }

    var w = null;
    function MM_openBrWindow(theURL,winName,features) {
         if(w != undefined && isOpen() && w.name == winName){
            w.location.replace(theURL);
         }else{
           w = window.open(theURL,winName,features);
        }
        w.focus();
    }

     function isOpen(){
      try{
        w.document;
      return true;
      } catch(ex){}
      return false;
    }
   -->
</script>


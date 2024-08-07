<%@ page import="com.integrosys.cms.app.custexposure.bus.IContingentLiabilities" %>
<%@ page import="com.integrosys.cms.app.custexposure.bus.ICustExposure" %>
<%@ page import="com.integrosys.cms.app.customer.bus.ICMSCustomer" %>
<%@ page import="com.integrosys.cms.ui.custexposure.CustExposureAction" %>
<%@ page import="com.integrosys.cms.app.custexposure.bus.OBCustExposure"%>
<%@ page import="com.integrosys.cms.app.custexposure.trx.IExposureTrxValue"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@ page import="com.integrosys.cms.ui.custexposure.CustExposureUIHelper"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.*"%>
<%@ page import="com.integrosys.base.uiinfra.common.Constants"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@ page import="com.integrosys.cms.ui.common.ForexHelper"%>
<%@ page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@ page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.base.businfra.currency.Amount"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ICollateralAllocation"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.OBLimitExposureByBankEntity"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.ILimitExposureByBankEntity"%>
<%@ page import="com.integrosys.cms.app.transaction.OBTrxContext"%>
<%@ page import="com.integrosys.cms.app.customer.bus.ICMSLegalEntity"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    String exposureType ="";
    double totalAuthorizedLimitAmt = 0;
    double totalOutstandingAmt = 0;
    double totalExposureAmt = 0;
    int rowIdx = 0;
    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);
    IExposureTrxValue trxValue = (IExposureTrxValue) session.getAttribute("com.integrosys.cms.ui.custexposure.CustExposureAction." + CustExposureUIHelper.service_CustExposureTrxValue);
    ICustExposure aICustExposure = (ICustExposure)session.getAttribute("com.integrosys.cms.ui.custexposure.CustExposureAction.session.ICustExposure");
    String event = (String) request.getParameter("event");
    String from_event = (String) request.getParameter("fromEvent");
    String sub_profile_id = (String) request.getParameter("sub_profile_id");
    String groupNum = (String) session.getAttribute("com.integrosys.cms.ui.custexposure.CustExposureAction.session.grpID");

    HashMap aa = new HashMap();
    ICMSCustomer customer = null;
    ILimit limits = null;
    ILimitExposureByBankEntity[] banktype = null;
    String leRef = "";
    String leSource = "";
    ICMSLegalEntity leEntity = null;
    //ICustExposure aICustExposure =null;
    
	  if(aICustExposure == null){
		   if (trxValue != null) {
		     aICustExposure  = trxValue.getCustExposure() ;
		   }
	  }
	  
   if (aICustExposure !=  null){
        customer = aICustExposure.getCMSCustomer();
        leEntity = customer.getCMSLegalEntity(); 
        leRef=leEntity.getLEReference();
				leSource=leEntity.getSourceID();
        aa = aICustExposure.getLimitExposureByBankEntityMap();
    }
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="Javascript" type="text/javascript">
    <!--
     -->
    </script>
</head>
<body>

<html:form action="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_CUST_BACK_SYS_EXPOSURE%>">

    <input type="hidden" name="event"/>
    <input type="hidden" name="fromEvent" value=""/>
    <table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
        <tr>
            <td colspan="4">
                <h3><bean:message key="title.svc.customer"/> - <%=customer.getCustomerName()%></h3>
           </td>
        </tr>
        <!--tr>
            <td colspan="4"><hr/></td>
        </tr-->

        <!--for Customer -> View By Bank Entity -->
        
         <%@ include file="view_by_bank_entity.jsp" %>

        <tr>
            <td colspan="4" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" align="center">&nbsp;</td>
        </tr>

        <tr>
            
            
            <td colspan="4" align="center">
            <%if(from_event.equals("view_cust_exposure_frm_grp")){%>
               <a href="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_CUST_EXPOSURE_FRM_GRP%>&sub_profile_id=<%=sub_profile_id%>&grpID=<%=groupNum%>" 
                 onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Return" border="0"></a>
            </td>
            <%}else if(from_event.equals("view_cust_exposure")){%>
              <a href="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_CUST_EXPOSURE%>&cifNo=<%=leRef%>&sub_profile_id=<%=sub_profile_id%>&cifSource=<%=leSource%>&cifName=<%=customer.getCustomerName()%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
              <img src="img/return1.gif" name="Return" border="0"></a>
            <%}else{%>
              <a href="javascript:history.go(-1);" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
              <img src="img/return1.gif" name="Return" border="0"></a>
            <%}%>
        </tr>

        </table>
        </td>
    </tr>
    </table>

</html:form>
</body>
</html>

<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                com.integrosys.cms.app.custrelationship.bus.ICustRelationship,
                com.integrosys.cms.app.custrelationship.bus.OBCustRelationship,
                com.integrosys.cms.ui.common.constant.IGlobalConstant,
                com.integrosys.cms.app.custexposure.trx.IExposureTrxValue,
                com.integrosys.cms.app.customer.bus.ICMSCustomer,
                java.util.Locale,
                java.util.Set,
                java.util.Iterator,
                java.util.LinkedHashSet,
                java.util.Map,
                java.util.HashMap,
                com.integrosys.base.techinfra.logger.DefaultLogger,
								com.integrosys.component.user.app.bus.ICommonUser,
								com.integrosys.base.uiinfra.common.Constants,
								com.integrosys.cms.ui.custexposure.CustExposureUIHelper,
								com.integrosys.cms.ui.custexposure.CustExposureAction,
								com.integrosys.cms.ui.common.constant.ICMSUIConstant,
								com.integrosys.cms.ui.common.CommonCodeList,
								com.integrosys.cms.app.common.constant.ICMSConstant,
								com.integrosys.cms.app.customer.bus.OBCMSCustomer,
								com.integrosys.cms.app.cci.bus.*,
		 		        com.integrosys.cms.app.limit.bus.*,
		 		        com.integrosys.cms.app.custgrpi.bus.IGroupMember,
		 		        com.integrosys.cms.ui.custexposure.group.GrpExposureAction,
								com.integrosys.cms.app.custexposure.bus.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    int rowIdx =0;
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);
    String  from_event_sub_profile_id = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTEXPOSURE_SUB_PROFILE_ID);
    String sub_profile_id = (String) request.getParameter("sub_profile_id");
    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    String startIndex = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "startIndex");
    IExposureTrxValue trxValue = (IExposureTrxValue) session.getAttribute("com.integrosys.cms.ui.custexposure.CustExposureAction."+ CustExposureUIHelper.service_CustExposureTrxValue);
    ICustExposure aICustExposure = (ICustExposure)session.getAttribute("com.integrosys.cms.ui.custexposure.CustExposureAction.session.ICustExposure");
    String event = (String) request.getParameter("event");
    String groupNum = (String) session.getAttribute("com.integrosys.cms.ui.custexposure.CustExposureAction.session.grpID");

    ICCICounterpartyDetails aICCICounterparty =null;
    ICustExposureEntityRelationship[] aIEntityRelationship =null;
    ICustExposureGroupRelationship[] aIGroupRelationship =null;
    IContingentLiabilities[] aIContingentLiabilities =null;
    ICMSCustomer customer = null;
  
    if(aICustExposure == null){
	    if(trxValue != null){
		    aICustExposure  = trxValue.getCustExposure() ;
	    }
    }
    //if (trxValue != null) {
     // aICustExposure  = trxValue.getCustExposure() ;
      if (aICustExposure !=  null){
	         aICCICounterparty = aICustExposure.getCCICounterpartyDetails();
           aIEntityRelationship = aICustExposure.getCustExposureEntityRelationship();
           aIGroupRelationship = aICustExposure.getCustExposureGroupRelationship();
           aIContingentLiabilities =  aICustExposure.getContingentLiabilities();
           customer = aICustExposure.getCMSCustomer() ;
      }
   //}

%>

<%
  try {
%>

<html>
<head>
   <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

    <script type="text/javascript">
        <!--
        function fnViewCustBackSysExposure(event){
                 var frm = document.forms[0];
	               frm.fromEvent.value = '<%=event%>';
	               frm.event.value='<%=CustExposureAction.EVENT_VIEW_CUST_BACK_SYS_EXPOSURE%>';
	               frm.action='CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_CUST_BACK_SYS_EXPOSURE%>&sub_profile_id=<%=sub_profile_id%>';
                 frm.submit();
        }
        
        function fnReturn()
				{
                 location.href="CRCustomerSearch.do?event=return&custName="+escape("<%=customer.getCustomerName()%>");
			  }

      -->
    </script>

</head>

<body>

<html:form action="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_CUST_EXPOSURE%>">

<input type="hidden" name="event"/>
<input type="hidden" name="fromEvent" value=""/>

<table width="98%" border="0" cellpadding="0" cellspacing="0"  align="center">
 <tr>
    <td valign="top" >

        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
            <tr>
                <td valign="top">

                    <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="23%"><h3><bean:message key="title.svc.customer"/> - <%=customer.getCustomerName()%></h3></td>
                        <td width="40%" valign="baseline" align="left">
                        <%if(event.equals("view_cust_exposure")){%>
                            <a href="javascript:fnViewCustBackSysExposure('<%=event%>','<%=groupNum%>');"><bean:message key="label.view.by.bank.entity"/></a>
                            <%}else{%>
                            <a href="javascript:fnViewCustBackSysExposure('<%=event%>', '<%=groupNum%>');"><bean:message key="label.view.by.bank.entity"/></a>
                            <%}%>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="4"><hr/></td>
                    </tr>

                    <!--for Single View of Customer Details -->
                    <tr>
                        <td colspan="4"> 
                     <% try { %>
                        <%@ include file="exposureViewLimits.jsp" %>
                     <%}catch(Exception e){
                            System.out.println("Error in exposureViewLimits = " + e);
                        } %>
                       </td>
                    </tr>

                   <!--for Contingent Liabilities -->
                   <tr>
                        <td colspan="4">
                            <table width="70%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection">
                                <thead>
                                    <tr>
                                        <td><h3><bean:message key="title.svc.contingent"/></h3></td>
                                    </tr>
                                    <tr>
                                        <td><hr/></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="3%"><bean:message key="label.global.sno"/></td>
                                                        <td width="46%"><bean:message key="label.svc.borrower"/> </td>
                                                        <td width="20%"><bean:message key="label.svc.guarantee.type"/> </td>
                                                        <td width="26%"><bean:message key="label.svc.guarantee.amt"/> </td>
                                                    </tr>
                                                </thead>
                                                 <tbody>
                                                <%
                                                    if (aIContingentLiabilities != null && aIContingentLiabilities.length > 0) {
                                                        for (int counter = 0; counter < aIContingentLiabilities.length; counter++) {

                                                %>
                                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                                        <td class="index"><%=counter + 1%></td>
                                                        <td><integro:empty-if-null value="<%=aIContingentLiabilities[counter].getBorrowerName()%>"/>&nbsp;</td>
                                                        <td><integro:empty-if-null value="<%=aIContingentLiabilities[counter].getGuaranteeType()%>"/>&nbsp;</td>
                                                        <td>
                                                            <integro:amount amount="<%=aIContingentLiabilities[counter].getGuaranteeAmt()%>" locale="<%=locale%>" decimal="0"/>&nbsp;</td>
                                                   </tr>
                                                <%
                                                    }
                                                } else {
                                                        System.out.println("aIContingentLiabilities no records");
                                                    %>
                                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                                        <td colspan="4"> <bean:message key="label.global.not.found" /> </td>
                                                    </tr>
                                                <% } %>
                                            </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>

                    <!--for Entity Relationship-->
                    <tr>
                        <td colspan="4">
                            <table width="70%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection">
                                <thead>
                                    <tr>
                                        <td><h3><bean:message key="label.cust.relationship.entity.rel"/></h3></td>
                                    </tr>
                                    <tr>
                                        <td><hr/></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td> 
                                           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="3%"><bean:message key="label.global.sno"/></td>
                                                        <td width="46%"><bean:message key="label.group.relationship"/></td>
                                                        <td width="46%"><bean:message key="label.svc.relative.entity"/> </td>
                                                    </tr>
                                                </thead>
                                               <tbody>
                                              
                                                <%
                                                    String subProfileID="";
                                                    String customerName="";
                                                    String entityRelatedName="";
                                                    String relName="";
                                                    String groupName="";
                                                    String relType="";

                                                    CommonCodeList commonCode = CommonCodeList .getInstance(null, null, ICMSUIConstant.ENTITY_REL, null);
                                                    if (aIEntityRelationship != null && aIEntityRelationship.length > 0) {

                                                        for (int counter = 0; counter < aIEntityRelationship.length; counter++) {
                                                          
	                                                       subProfileID = aIEntityRelationship[counter].getRelatedEntiySubProfileId()+"";  // zero value
                                                           groupName = aIEntityRelationship[counter].getGroupName();
                                                           relName = aIEntityRelationship[counter].getRelationName();
                                                           customerName = aIEntityRelationship[counter].getCustomerName();
                                                           entityRelatedName = aIEntityRelationship[counter].getRelatedEntiyName();
                                                           relType = aIEntityRelationship[counter].getRelationType();                          
                                                %>
                                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                                        <td class="index"><%=counter + 1%></td>
                                                        <% if ("HAS".equals(relType)) { %>
                                                        <td><%=customer.getCustomerName()%>&nbsp;<bean:message key="label.has"/>&nbsp;<integro:empty-if-null value="<%=relName%>"/></td>
                                                        <% } else if ("IS".equals(relType)) {%>
                                                        <td><%=customer.getCustomerName()%>&nbsp;<bean:message key="label.is"/>&nbsp;<integro:empty-if-null value="<%=relName%>"/>&nbsp;<bean:message key="label.of"/></td>
                                                        <% } %>
                                                        <td>
                                                            <a href="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_CUST_EXPOSURE%>&sub_profile_id=<%=subProfileID%>">
                                                                <integro:empty-if-null value="<%=customerName%>"/>
                                                            </a>
                                                        </td>
                                                   </tr>
                                                <%
                                                    }
                                                } else {
                                                        System.out.println("aICustRelationship no records");
                                                    %>
                                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                                        <td colspan="3"> <bean:message key="label.global.not.found" /> </td>
                                                    </tr>
                                                <% } %>
                                            </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>


                    <!--for Group Relationship -->
                   <tr>
                    <td colspan="4">
                            <table width="70%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection">
                            <thead>
                                <tr>
                                    <td><h3><bean:message key="title.svc.group.rel"/></h3></td>
                                </tr>
                                <tr>
                                    <td><hr/></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                            <thead>
                                                <tr>
                                                    <td width="3%"><bean:message key="label.global.sno"/></td>
                                                    <td width="46%"><bean:message key="label.group.relationship"/></td>
                                                    <td width="46%"><bean:message key="label.svc.related.group"/></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    String grpID ="";
                                                    String relationName = "";
                                                    String relatedGroup = "";
                                                    IGroupMember groupRelationship = null;
                                                    Set set = new LinkedHashSet();
                                                    if (aIGroupRelationship != null && aIGroupRelationship.length > 0) {

                                                        for (int counter = 0; counter < aIGroupRelationship.length; counter++) {
                                                           if (aIGroupRelationship[counter] != null) {
		                                                         groupRelationship = aIGroupRelationship[counter].getGroupMember();
		                                                         relationName = groupRelationship.getRelationName();
		                                                         relatedGroup = aIGroupRelationship[counter].getGroupName();
		                                                         grpID = Long.toString(groupRelationship.getGrpID());
	                                                           Map map = new HashMap();
	                                                           map.put("relationName",relationName);
	                                                           map.put("relatedGroup",relatedGroup);
	                                                           map.put("grpID",grpID);
	                                                           set.add(map);
		                                                     }
	                                                     }

                                                     Iterator iterator = set.iterator(); 
                                                     int cnt = 0;
                                                     int num1 = 0;
                                                    while(iterator.hasNext()) {
                                                        num1 = ++cnt;
                                                        Map m = (Map) iterator.next();
                                                        if (!m.isEmpty()){
                                                %>
                                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                                        <td class="index"><%=num1%></td>
                                                        <td>
                                                            <%=m.get("relationName")%>
                                                            &nbsp;</td>
                                                        <td>
                                                        <%if(event.equals("view_cust_exposure")){%>
                                                            <a href="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_GROUP_EXPOSURE%>&grpID=<%=m.get("grpID")%>">
                                                                <%=m.get("relatedGroup")%>
                                                            </a>
                                                        <%}else{%>
                                                            <a href="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_GROUP_TO_OTR_GROUP_EXPOSURE%>&grpID=<%=m.get("grpID")%>&sub_profile_id=<%=sub_profile_id%>">
                                                                <%=m.get("relatedGroup")%>
                                                            </a>
                                                        <%}%>
                                                        &nbsp;</td>
                                                   </tr>
                                                <%
                                                         }
                                                       }
                                                  } else {
                                                        System.out.println("groupMemeber no records");
                                                    %>
                                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                                        <td colspan="3"> <bean:message key="label.global.not.found" /> </td>
                                                    </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                   </td>
                                </tr>
                            </tbody>
                        </table>
                     </td>
                    </tr>


                    <tr>
                        <td colspan="4" align="center">&nbsp;</td>
                    </tr>

                    <tr>    
                        <td colspan="4" align="center">
                        <%if(event.equals("view_cust_exposure")){%>
                                 <a href="javascript:fnReturn();"
                                   onMouseOut="MM_swapImgRestore()"
                                   onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
                                  <img src="img/return1.gif" name="Return" border="0"></a>
                         <%}else{
	                         %>
                                <a href="GrpExposure.do?event=<%=GrpExposureAction.EVENT_VIEW_SINGLE_GROUP_EXPOSURE%>&grpID=<%=groupNum%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
                                <img src="img/return1.gif" name="Return" border="0" /></a>
                                
                                <!--a href="javascript:history.go(-1);" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
                                <img src="img/return1.gif" name="Return" border="0"></a-->
                         <%}%>
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>
    </table>
   </td>
 </tr>
</table>
</html:form>
</body>

</html>

<%
    }catch( Exception e){

    }
%>

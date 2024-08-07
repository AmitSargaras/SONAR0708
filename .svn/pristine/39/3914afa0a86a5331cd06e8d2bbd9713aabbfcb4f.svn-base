<%@ page import="com.integrosys.base.businfra.currency.Amount"%>
<%@ page import="com.integrosys.base.techinfra.util.SortUtil"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.app.custexposure.trx.group.IGroupExposureTrxValue"%>
<%@ page import="com.integrosys.cms.app.custexposure.trx.group.OBGroupExposureTrxValue"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.OBGroupExposure"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.IGroupExposure"%>
<%@ page import="com.integrosys.cms.ui.custexposure.group.GrpExposureAction"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.IGroupExpBankEntity"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.OBGroupExpBankEntity"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.OBGroupExpCustGrp"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.IGroupExpCustGrp"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.IGroupExpCustGrpSubLimit"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.OBGroupExpCustGrpSubLimit"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.IGroupExpCustGrpOtrLimit"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.OBGroupExpCustGrpOtrLimit"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.IGroupExpCustGrpEntityLimit"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.group.OBGroupExpCustGrpEntityLimit"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.ICustExposure"%>
<%@ page import="com.integrosys.cms.app.custexposure.bus.*"%>
<%@ page import="com.integrosys.cms.ui.custexposure.CustExposureAction"%>
<%@ page import="com.integrosys.cms.ui.custexposure.CustExposureUIHelper"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.base.techinfra.util.DateUtil"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.NumberFormat"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Describe this JSP.
* Purpose: group svc -- view limits
* Description: view group exposure details
*
* @author $Grace Teh$<br>
* @version $Revision$
* Date: $30 July 2008$
* Tag: $Name$
*/
%>

<%
    int rowIdx = 0;
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    IGroupExposure stagingObj = null;  
    IGroupExpBankEntity[] grpEntityLimit = null;
    ICustGrpIdentifier  grpIdn =  null;
    IGroupExpCustGrp custGrp = null;
    IGroupExpCustGrpSubLimit[] subLimit = null;
    IGroupExpCustGrpOtrLimit[] otherLimit = null;
    IGroupExpCustGrpEntityLimit[] custGrpEntityLimit = null;
    
    /*IGroupExposureTrxValue trxValue = (IGroupExposureTrxValue) session.getAttribute("com.integrosys.cms.ui.custexposure.group.GrpExposureAction.GroupExposureTrxValue");
    if (trxValue != null){
        stagingObj = trxValue.getGroupExposure();
    }*/
    
    stagingObj = (IGroupExposure)session.getAttribute("com.integrosys.cms.ui.custexposure.group.GrpExposureAction.session.IGrpExposure");

    if (stagingObj == null){
	   
        stagingObj = new OBGroupExposure();
    }
     
    String grpNo = (String) request.getParameter("grpNo");
    custGrp = stagingObj.getGroupExpCustGrp();   
    grpEntityLimit = stagingObj.getGroupExpBankEntity();	
    
	  if(custGrp != null){
		  grpIdn = custGrp.getCustGroup();
		  if(grpIdn != null){
			  
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>

<body>

<html:form action="GrpExposure.do">

    <input type="hidden" name="event"/>

    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td valign="top">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
    <tr>
    <td valign="top">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td width="75%"><h3><bean:message key="title.svc.customer"/>&nbsp;<bean:message key="label.group"/> - <%=grpIdn.getGroupName()%>&nbsp;</h3></td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </thead>
    <tbody>
    <!--For View Group  -->
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="left">
                <tbody>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="25%"><p> <bean:message key="label.group.name"/></p></td>
                        <td width="75%"><%=grpIdn.getGroupName()%>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width"25%"><p><bean:message key="label.group.id"/></p></td>
                        <td><%=grpIdn.getGrpNo()%>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="25%"><p><bean:message key="label.group.type"/> </p></td>
                        <td> <%=CustGrpIdentifierUIHelper.getCodeDesc(grpIdn.getGroupType(), ICMSUIConstant.GRP_TYPE)%>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="25%"><bean:message key="label.group.master.group"/></td>
                        <td>
                            <% if (grpIdn.getMasterGroupInd()){ %>
                              Yes
                            <%} else {%>
                              No
                            <%}%>
                            &nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname"><p><bean:message key="label.group.manager"/>  </p></td>
                        <td><%=grpIdn.getGroupAccountMgrCode()%></td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname"> <bean:message key="label.group.domicile.country"/></td>
                        <td><%=CustGrpIdentifierUIHelper.getCountryCodeDesc(grpIdn.getGroupCounty())%>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="25%"><bean:message key="label.business.unit"/> </td>
                        <td><%=CustGrpIdentifierUIHelper.getCodeDesc(grpIdn.getBusinessUnit(), ICMSUIConstant.BIZ_UNIT)%>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname" width="25%"><p><bean:message key="label.group.currency"/></p></td>
                        <td><%=CustGrpIdentifierUIHelper.getCodeDesc(grpIdn.getGroupCurrency(), ICMSUIConstant.ISO_CUR)%>&nbsp;</td>
                    </tr>
                  </tbody>
              </table>
          </td>   
      </tr>
      <tr>
					<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
					<td colspan="2">
							<table width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
							<thead>
										<tr>
													<td width="11%"><bean:message key="label.bank.entity"/></td>
													<td width="10%"><bean:message key="label.limit.gp5"/></td>
													<td width="10%"><bean:message key="label.crp.limit.last.review.date"/></td>
													<td width="10%"><bean:message key="label.internal.lmt"/></td>
													<td width="10%"><bean:message key="label.total.exposure"/></td>
													<td width="10%"><bean:message key="label.lmt.booked"/></td>
													<td width="10%"><bean:message key="label.lmt.avail"/></td>
													<td width="10%"><bean:message key="label.limit.utilized"/></td>
													<td width="11%"><bean:message key="title.svc.contingent"/></td>
										</tr>
							</thead>
							<tbody>
							<%
							     if(grpEntityLimit != null && grpEntityLimit.length > 0){
							         for(int k=0; k< grpEntityLimit.length; k++){
								         
							%>
							       <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
													<%if(grpEntityLimit[k].getBankEntity().equals(ICMSConstant.BANKING_GROUP_CODE)){%>
							                 <td><integro:empty-if-null value="<%=ICMSConstant.BANKING_GROUP_DESC%>" /></td>
										       <%}else{%>
																<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.SUB_LIMIT_DESC_CATEGORY_CODE, grpEntityLimit[k].getBankEntity())%>" /></td>
													 <%}%>
													<td>
													    <% if (grpEntityLimit[k].getGP5Limit() != null && grpEntityLimit[k].getGP5Limit().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=grpEntityLimit[k].getGP5Limit()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=grpEntityLimit[k].getGP5Limit()%>" param="amount" decimal="0"/>
							                <%} else { %>
							                     -
							                <% } %>
													    &nbsp;
													</td>
							            <td><integro:date object="<%=grpEntityLimit[k].getLimitReviewDate()%>"/>&nbsp;</td>
							            <td>
							                <% if (grpEntityLimit[k].getInternalLimit() != null && grpEntityLimit[k].getInternalLimit().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=grpEntityLimit[k].getInternalLimit()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=grpEntityLimit[k].getInternalLimit()%>" param="amount" decimal="0"/>
							                <%} else { %>
							                     -
							                <% } %>
													    &nbsp;
							            </td>
							            <td>
							               <% if (grpEntityLimit[k].getTotalExposure() != null && grpEntityLimit[k].getTotalExposure().getCurrencyCode() != null ){%>
							                    <integro:currency amount="<%=grpEntityLimit[k].getTotalExposure()%>" param="currency"/>&nbsp;
							                    <integro:amount amount="<%=grpEntityLimit[k].getTotalExposure()%>" param="amount" decimal="0"/>
							               <%} else { %>
							                       -
							               <% } %>
							                    &nbsp;
							             </td>
							             <td>
							                <% if (grpEntityLimit[k].getBookedLimit() != null && grpEntityLimit[k].getBookedLimit().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=grpEntityLimit[k].getBookedLimit()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=grpEntityLimit[k].getBookedLimit()%>" param="amount" decimal="0"/>
							                <%} else { %>
							                     -
							                <% } %>
							                   &nbsp;
							              </td>
							             <td>
							                 <%
							                   if (grpEntityLimit[k].getAvailableLimit()!= null && grpEntityLimit[k].getAvailableLimit().getCurrencyCode() != null ){%>
							                       <integro:currency amount="<%=grpEntityLimit[k].getAvailableLimit()%>" param="currency"/>&nbsp;
							                       <integro:amount amount="<%=grpEntityLimit[k].getAvailableLimit()%>" param="amount" decimal="0"/>
							                  <%} else { %>
							                       -
							                  <% } %>
							                       &nbsp;
							               </td>
							               <td><% NumberFormat formatter = new DecimalFormat("#");
							                     if(String.valueOf(grpEntityLimit[k].getPercentageLimitUsed())!=null && grpEntityLimit[k].getPercentageLimitUsed() > 0){%>
							                       <integro:empty-if-null value="<%=String.valueOf(formatter.format(grpEntityLimit[k].getPercentageLimitUsed()))%>" />&nbsp; %
							                       &nbsp;
							                      <%} else { %>
							                       0&nbsp; %
							                  <% } %>
							                       &nbsp; 
							               </td>
							               <td>
							                      <% if (grpEntityLimit[k].getContingentLiabilities() != null && grpEntityLimit[k].getContingentLiabilities().getCurrencyCode() != null ){%>
							                                <integro:currency amount="<%=grpEntityLimit[k].getContingentLiabilities()%>" param="currency"/>&nbsp;
							                                <integro:amount amount="<%=grpEntityLimit[k].getContingentLiabilities()%>" param="amount" decimal="0"/>
							                      <%} else { %>
							                               -
							                      <% } %>
							                         &nbsp;
							                </td>
							         </tr>
							
							<%       }
							      }%>
						</tbody>
						</table>
				</td>
			</tr>
				
			<tr>
						<td colspan="2" align="right">&nbsp;</td>
			</tr>
			
		  <tr>
			<td colspan="2">
							<table width="100%" class="tblInfo" height="50" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
								<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
											<td class="fieldname"><bean:message key="label.security.remarks"/></td>
											<td>
														<% String disRemarks = "-";
																if (grpIdn.getGroupRemarks() != null && !"".equals(grpIdn.getGroupRemarks())){
																                  disRemarks = grpIdn.getGroupRemarks().trim();
														%>
														<integro:wrapper value="<%=disRemarks%>"/>
														<%} else {%>
														<integro:empty-if-null value="<%=disRemarks%>"/>
													 <%}%>
															&nbsp;
											</td>
								 </tr>
								</table>
			 </td>
			 </tr>
    
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    
    <tr>
        <td>
            <h3>Sub Limit</h3>
        </td>
    </tr>
    <tr>
        <td colspan="2" height="">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                    <tr>
                        <td width="3%"><bean:message key="label.global.sno"/></td>
                        <td width="22%"><bean:message key="label.security.sub.limit.type"/></td>
                        <td width="15%"><bean:message key="label.group.description"/></td>
                        <td width="15%"><bean:message key="label.sub.lmt.last.review.date"/></td>
                        <td width="15%"><bean:message key="label.security.sub.limit.amount"/></td>
                        <td width="15%"><bean:message key="label.svc.outstanding.amt"/></td>
                    </tr>
                </thead>
                 <tbody>
                 <%
                    subLimit = custGrp.getGroupExpCustGrpSubLimit();
                    if(subLimit != null && subLimit.length >0){
	                     for(int s=0; s< subLimit.length; s++){
                 %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td><%=s+1%></td>
                      <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.SUB_LIMIT_TYPE, subLimit[s].getSubLimitTypeCD())%>"/></td>
                      <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.SUB_LIMIT_DESC, subLimit[s].getDescription())%>"/></td>
                      <td><integro:date object="<%=subLimit[s].getLastReviewedDt()%>"/></td>
                      <td>
                      <% if (subLimit[s].getLimitAmt() != null && subLimit[s].getLimitAmt().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=subLimit[s].getLimitAmt()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=subLimit[s].getLimitAmt()%>" param="amount" decimal="0"/>
							         <%} else { %>
							                     -
							         <% } %>
							            &nbsp;
                      </td>
                      <td>
                      <% if (subLimit[s].getAggregatedOutstanding() != null && subLimit[s].getAggregatedOutstanding().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=subLimit[s].getAggregatedOutstanding()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=subLimit[s].getAggregatedOutstanding()%>" param="amount" decimal="0"/>
							         <%} else { %>
							                     -
							         <% } %>
							            &nbsp;
                      </td>
                    </tr>
                 <%     }
                     }else{
                 %>
                 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
											<td colspan="6"><bean:message key="label.global.not.found"/></td>
									</tr>
									<tr>
											<td colspan="6" bgcolor="#FFFFFF" style="border:0">&nbsp;</td>
									</tr>
                 <%}%>

                 </tbody>
            </table>
         </td>
    </tr>
    
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    
    <tr>
        <td>
            <h3><bean:message key="label.group.other.limit"/></h3>
        </td>
    </tr>
    <tr>
        <td colspan="2" height="">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                    <tr>
                        <td width="3%"><bean:message key="label.global.sno"/></td>
                        <td width="22%"><bean:message key="label.group.other.limit.type"/></td>
                        <td width="15%"><bean:message key="label.group.description"/></td>
                        <td width="15%"><bean:message key="label.otr.lmt.last.review.date"/></td>
                        <td width="15%"><bean:message key="label.otr.lmt.amt"/></td>
                        <td width="15%"><bean:message key="label.svc.outstanding.amt"/></td>
                    </tr>
                </thead>
                 <tbody>
                 <%
                    otherLimit = custGrp.getGroupExpCustGrpOtrLimit();
                    if(otherLimit != null && otherLimit.length >0){
	                     for(int w=0; w< otherLimit.length; w++){
                 %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td><%=w+1%></td>
                      <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.OTR_LIMIT_TYPE, otherLimit[w].getOtrLimitTypeCD())%>"/></td>
                      <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.OTR_LIMIT_DESC, otherLimit[w].getDescription())%>"/></td>
                      <td><integro:date object="<%=otherLimit[w].getLastReviewedDt()%>"/></td>
                      <td>
                      <% if (otherLimit[w].getLimitAmt() != null && otherLimit[w].getLimitAmt().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=otherLimit[w].getLimitAmt()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=otherLimit[w].getLimitAmt()%>" param="amount" decimal="0"/>
							         <%} else { %>
							                     -
							         <% } %>
							            &nbsp;
                      </td>
                      <td>
                      <% if (otherLimit[w].getAggregatedOutstanding() != null && otherLimit[w].getAggregatedOutstanding().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=otherLimit[w].getAggregatedOutstanding()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=otherLimit[w].getAggregatedOutstanding()%>" param="amount" decimal="0"/>
							         <%} else { %>
							                     -
							         <% } %>
							            &nbsp;
                      </td>
                    </tr>
                 <%     }
                     }else{
                 %>
                 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
											<td colspan="6"><bean:message key="label.global.not.found"/></td>
									</tr>
									<tr>
											<td colspan="6" bgcolor="#FFFFFF" style="border:0">&nbsp;</td>
									</tr>
                 <%}%>
                 </tbody>
            </table>
         </td>
    </tr>
    
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    
    <tr>
        <td>
            <h3>Entity Limit</h3>
        </td>
    </tr>
    <tr>
        <td colspan="2" height="">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                    <tr>
                        <td width="3%"><bean:message key="label.global.sno"/></td>
                        <td width="22%"><bean:message key="label.cust.name.grp.member"/></td>
                        <td width="15%"><bean:message key="label.customer.id.source"/></td>
                        <td width="15%"><bean:message key="label.security.pledgor.le.id"/></td>
                        <td width="15%"><bean:message key="label.entity.lmt.amt"/></td>
                        <td width="15%"><bean:message key="label.svc.outstanding.amt"/></td>
                    </tr>
                </thead>
                 <tbody>
                 <%
                     custGrpEntityLimit = custGrp.getGroupExpCustGrpEntityLimit();
                     
                    if(custGrpEntityLimit != null && custGrpEntityLimit.length >0){
	                     for(int q=0; q< custGrpEntityLimit.length; q++){
                 %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td><%=q+1%></td>
                      <td><integro:empty-if-null value="<%=custGrpEntityLimit[q].getCustomerName()%>"/></td>
                      <td><integro:empty-if-null value="<%=custGrpEntityLimit[q].getCustIDSource()%>"/></td>
                      <td><integro:empty-if-null value="<%=custGrpEntityLimit[q].getLEReference()%>"/></td>
                      <td>
                      <% if (custGrpEntityLimit[q].getLimitAmount() != null && custGrpEntityLimit[q].getLimitAmount().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=custGrpEntityLimit[q].getLimitAmount()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=custGrpEntityLimit[q].getLimitAmount()%>" param="amount" decimal="0"/>
							         <%} else { %>
							                     -
							         <% } %>
							            &nbsp;
                      </td>
                      <td>
                      <% if (custGrpEntityLimit[q].getAggregatedOutstanding() != null && custGrpEntityLimit[q].getAggregatedOutstanding().getCurrencyCode() != null ){%>
							                     <integro:currency amount="<%=custGrpEntityLimit[q].getAggregatedOutstanding()%>" param="currency"/>&nbsp;
							                     <integro:amount amount="<%=custGrpEntityLimit[q].getAggregatedOutstanding()%>" param="amount" decimal="0"/>
							         <%} else { %>
							                     -
							         <% } %>
							            &nbsp;
                      </td>
                    </tr>
                 <%     }
                     }else{
                 %>
                 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
											<td colspan="6"><bean:message key="label.global.not.found"/></td>
									</tr>
									<tr>
											<td colspan="6" bgcolor="#FFFFFF" style="border:0">&nbsp;</td>
									</tr>
                 <%}%>
                 </tbody>
            </table>
         </td>
    </tr>
        
    </tbody>
    </table>
    </td>
    </tr>
    </table>
    </td>
    </tr>
    </table>

    <br><br>

    <table width="60%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td align="center">
                <a href="javascript:history.go(-1);" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Return" border="0"></a>
            </td>
        </tr>
    </table>
</html:form>

</body>
</html>
<%}}%>

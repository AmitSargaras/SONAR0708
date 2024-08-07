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
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<%@ page import="com.integrosys.base.businfra.currency.CurrencyCode"%>

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
* Purpose: view group customer limit exposure
*
* @author $Grace Teh$<br>
* @version $Revision$
* Date: $28 July 2008$
* Tag: $Name$
*/
%>

<%
    int rowIdx = 0;
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    String sub_profile_id = (String) request.getParameter("sub_profile_id");
    String event = (String) request.getParameter("event");
    String grpNo = (String) request.getParameter("grpID");
    int startIndex = Integer.parseInt(String.valueOf(request.getAttribute("startInd")));
  	int records_per_page =Integer.parseInt(String.valueOf(request.getAttribute("records_per_page")));
  	int total_records = Integer.parseInt(String.valueOf(request.getAttribute("total_records")));
  	int total_cust = Integer.parseInt(String.valueOf(request.getAttribute("total_cust")));
    int endIndex = Integer.parseInt(String.valueOf(request.getAttribute("endInd")));
    
    IGroupExposure stagingObj = null;  
    IGroupExpBankEntity[] grpEntityLimit = null;
    ICustGrpIdentifier  grpIdn =  null;
    IGroupExpCustGrp custGrp = null;
    String relName="";
    String custName="";
    String businessSec ="";
    String leRef ="";
    String leSource ="";
    String subProfileID ="";
    String grpID ="";
    IGroupExposureTrxValue trxValue = null;
    
    //stagingObj = (IGroupExposure)session.getAttribute("com.integrosys.cms.ui.custexposure.group.GrpExposureAction.session.IGrpExposure");
    
	  trxValue = (IGroupExposureTrxValue) session.getAttribute("com.integrosys.cms.ui.custexposure.group.GrpExposureAction.GroupExposureTrxValue");
	  if (trxValue != null){
	        //stagingObj = trxValue.getGroupExposure();
	        stagingObj = (IGroupExposure)session.getAttribute("com.integrosys.cms.ui.custexposure.group.GrpExposureAction.session.IGrpExposure");
	  }

    if (stagingObj == null){
        stagingObj = new OBGroupExposure();
    } 

    custGrp = stagingObj.getGroupExpCustGrp();
    grpEntityLimit = stagingObj.getGroupExpBankEntity();	
    	
	  if(custGrp != null){
		  grpIdn = custGrp.getCustGroup();
		  if(grpIdn != null){	
			  grpID = Long.toString(grpIdn.getGrpID());	 
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="Javascript" type="text/javascript">
    <!--
      function fnReadALLGroupExposure(){
           var frm = document.forms[0];
           frm.event.value='<%=GrpExposureAction.EVENT_VIEW_ALL_GRP_EXPOSURES%>';
           frm.action="GrpExposure.do?event=<%=GrpExposureAction.EVENT_VIEW_ALL_GRP_EXPOSURES%>&grpID=<%=grpNo%>";
           frm.submit();
        }
        
       function fnGroupExposureReport(){
           var frm = document.forms[0];
           frm.event.value='<%=GrpExposureAction.EVENT_VIEW_GPR_EXPOSURE_RPT%>';
           frm.action="GrpExposure.do?event=<%=GrpExposureAction.EVENT_VIEW_GPR_EXPOSURE_RPT%>&grpID=<%=grpNo%>";
           frm.submit();
       }
       
       function fnCance(){
            var frm = document.forms[0];
            frm.action = 'CustGrpIdentifier.do?event=view_return';
            frm.submit();
        }  
       
       function returnCust(){
	          location.href="CustExposure.do?event=view_cust_exposure_frm_grp&grpID="+'<%=grpNo%>'+"&sub_profile_id="+'<%=sub_profile_id%>';
	     } 

     -->
    </script>
</head>

<body>

<html:form action="GrpExposure.do">
<input type="hidden" name="event"/>
<input type="hidden" name="fromEvent" value=""/>
<table width="100%" border="0" cellpadding="0" cellspacing="0"  align="center">
<tr>
<td colspan ="4">

    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td colspan="4" width="75%" style="text-align:left;padding-left:10px"><h3><bean:message key="title.svc.customer"/>&nbsp; - <%=grpIdn.getGroupName()%>&nbsp;</h3></td>
        </tr>
        <tr>
            <td colspan="4" style="padding:10px,10px"><hr/></td>
        </tr>
    </thead>
    <tbody>
    <!--For View Group  -->
    <tr>
        <td colspan="4">
            <table align="center" width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
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
                        <td><%=grpIdn.getGroupAccountMgrCode()%>  </td>
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
                        <% 
                        if (grpIdn.getGroupCurrency() != null && grpIdn.getGroupCurrency().trim().length() != 0){%>
                        <td><%=grpIdn.getGroupCurrency()%>&nbsp;</td>
                        <%}else{
	                      %>
                         <td><%=CustGrpIdentifierUIHelper.getCodeDesc(grpIdn.getGroupCurrency(),PropertyManager.getValue("baseExchangeCcy"))%>&nbsp;</td> 
                        <%}%>
                    </tr>
                  </tbody>
              </table>
          </td>   
      </tr>
      <tr>
					<td colspan="4">&nbsp;</td>
			</tr>
			<tr>
					<td colspan="4">
							<table align="center" width="98%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
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
							               <td><%  NumberFormat formatter = new DecimalFormat("#");
							                     if(String.valueOf(grpEntityLimit[k].getPercentageLimitUsed())!=null && grpEntityLimit[k].getPercentageLimitUsed() >0){%>
							                       <integro:empty-if-null value="<%=String.valueOf(formatter.format(grpEntityLimit[k].getPercentageLimitUsed()))%>" />&nbsp;%
							                       &nbsp;
							                      <%} else { %>
							                       0 &nbsp;%
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
						<td colspan="4">&nbsp;</td>
			</tr>
			
		  <tr>
			<td colspan="4">
							<table align="center" width="98%" class="tblInfo" height="50" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
								<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
											<td class="fieldname"><bean:message key="label.remarks"/></td>
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
	        <td colspan="4">&nbsp;</td>
	    </tr>
	    
	    <tr>
	        <td colspan="4" align="right">
	            <input class="btnNormal" type="button" name="ViewLimit" value="View Limit" onclick="javascript:fnReadALLGroupExposure()"/>
	            &nbsp;
	            <input class="btnNormal" type="button" name="ViewReport" value="View Report" onclick="javascript:fnGroupExposureReport()"/>
	            &nbsp;&nbsp;
	    </tr>
	    
	    <tr>
	     <td colspan="4">
	       <br/>
	     </td>
	    </tr>

	    <tr>
	    <br/>
	           <td colspan="4">
	            <% try {
		              if(stagingObj != null){
			              ICustExposure[] custExposure = stagingObj.getGroupMemberExposure();  
			         %>
	                 <%@ include file="group_cust_exp_view_limits.jsp" %>
	            <%}
	            }catch(Exception e){
	                  System.out.println("Error in Group exposure View Limits = " + e);
	             } %>
	           </td>
	    </tr>

    </tbody>
    </table>
</td>
</tr>
</table> 
    
<br><br>
</html:form>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
     <tr>
         <td align="center">
         <%if(event.equals("view_single_grp_exposure")){%>
              <a href="CustGrpIdentifier.do?event=view_return" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
              <img src="img/return1.gif" name="Return" border="0" />
              </a> 
         <%}else if(event.equals("view_grp_exposure")){%>  
              <a href="javascript:history.go(-1);" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
              <img src="img/return1.gif" name="Return" border="0" />
              </a>   
         <%}else{%>      
              <a href="javascript:returnCust();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
              <img src="img/return1.gif" name="Return" border="0" />
              </a>
         <%}%>
         </td>
     </tr>
     <tr>
       <td bgcolor="#FFFFFF" style="border:0">&nbsp;</td>
     </tr>
          <tr>
       <td bgcolor="#FFFFFF" style="border:0">&nbsp;</td>
     </tr>
     <tr>
        <td height="50%">
           <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
							<%if(event.equals("view_single_grp_exposure")){%>
							<tr valign="bottom">
							  	<td valign="middle" style="padding-left:10px;font-size:12px;font-family:Verdana">
							  		<integro:pageindex
							  			pageIndex='<%=new PageIndex(startIndex, records_per_page, total_cust+startIndex)%>'
							  			url='<%="GrpExposure.do?event=view_single_grp_exposure&grpID="+grpNo+"&startInd="%>'/>
							  	</td>
							</tr>
							<%}else{%>
							<tr valign="bottom">
							  	<td valign="middle" style="padding-left:10px;font-size:12px;font-family:Verdana">
							  		<integro:pageindex
							  			pageIndex='<%=new PageIndex(startIndex, records_per_page, total_cust+startIndex)%>'
							  			url='<%="GrpExposure.do?event=view_grp_exposure&grpID="+grpNo+"&startInd="%>'/>
							  	</td>
							</tr>
							<%}%>
						</table>
        </td>
     </tr>
     
<script type="text/javascript">
<!--
   
-->
</script>
</table>
</body>
</html>
<%}}%>




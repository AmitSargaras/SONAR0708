
<%@ page import="com.integrosys.cms.ui.creditriskparam.sharecounter.ShareCounterConstants"%>

<%@ page import="com.integrosys.cms.app.creditriskparam.bus.ICreditRiskParamGroup"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%

	/**
	* Copyright Integro Technologies Pte Ltd
	* $Header$
	*
	* Describe this JSP.
	* Purpose:
	* Description:
	*
	* @author $Author$<br>
	* @version $Revision$
	* Date: $Date$
	* Tag: $Name$
	*/



%>


<html>

    <head>


        <script type="text/javascript" >
		<!--

			function submit( )
			{
				document.forms[0].submit () ;
			}

		//-->
		</script>

		<title>
			<!--Credit Risk Parameter-->
			<bean:message key="title.credit.risk.param"/>
		</title>

    </head>

    <body>

        <html:form action="MaintainShareCounter.do"  >

			<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
				<thead>

					<tr>
						<td>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td>
							<h3>
								<!--Credit Risk Parameter-->
								<bean:message key="title.credit.risk.param"/>
							</h3>
						</td>
					</tr>

					<tr>
						<td>
							<hr>
						</td>
					</tr>
				</thead>
			</table>

            <table width="70%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInput">

				<tbody>

					<tr class="odd">

						<td class="fieldname">
							<!--Stock Exchange-->
							<bean:message key="label.stock.exchange"/>
						</td>

						<td>
							<html:select property="<%=ShareCounterConstants.GROUP_SUBTYPE %>"  >    								
								<integro:common-code categoryCode="<%=ShareCounterConstants.COMMON_CODE_STOCK_EXCHANGE%>" descWithCode="false"/>
							</html:select>
							<html:errors property="<%=ShareCounterConstants.GROUP_SUBTYPE %>"/>
						</td>

					</tr>

					<tr class="even">

						<td class="fieldname">
							<!--Types-->
							<bean:message key="label.type"/>
						</td>

						<td>

							<html:select property="<%=ShareCounterConstants.GROUP_STOCK_TYPE %>">
								<integro:common-code categoryCode="<%=ShareCounterConstants.COMMON_CODE_SHARE_TYPE%>" 
									refEntryCode="<%=ShareCounterConstants.COMMON_CODE_REF_STOCK_TYPE %>" 
									onlyMatchRefEntry="true"
									descWithCode="false"/>
							</html:select>
							<html:errors property="<%=ShareCounterConstants.GROUP_STOCK_TYPE %>"/>
						</td>

					</tr>

				</tbody>

            </table>
<%
            //String roleType = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
			String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
			long roleType = Long.parseLong(teamTypeMemID);
			if (roleType == ICMSConstant.TEAM_TYPE_SC_MAKER||roleType == ICMSConstant.TEAM_TYPE_SC_MAKER_WFH)
			{
%>
				<input type="hidden" name="event" id="event" value="<%=ShareCounterConstants.SHARE_COUNTER_MAKER_TYPE_SELECTED%>" />
<%
            }
            else
			{
%>
				<input type="hidden" name="event" id="event" value="<%=ShareCounterConstants.SHARE_COUNTER_VIEW%>" />				
<%
            }
%>

			<br /> 

			<div align="center" >

				<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','img/go1b.gif',1)" onclick="submit()" >
					<img src="img/go1.gif" name="Image4413"  border="0" id="Image4413" />
				</a>
				
			</div>

		</html:form>

    </body>

</html>
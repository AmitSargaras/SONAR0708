<%@ include file="/console/console_template.jsp" %>

<%@ page
	import="org.springframework.jdbc.core.JdbcTemplate,org.springframework.jdbc.core.RowMapper,org.springframework.dao.EmptyResultDataAccessException,org.springframework.dao.IncorrectResultSizeDataAccessException,org.springframework.dao.DataAccessException,com.integrosys.base.techinfra.exception.EntityNotFoundException,com.integrosys.base.techinfra.context.BeanHouse,java.rmi.RemoteException,javax.sql.DataSource,java.sql.SQLException,java.sql.ResultSet,java.util.Iterator,com.integrosys.cms.app.limit.bus.ILimitProfile,com.integrosys.cms.app.limit.bus.ILimitDAO,com.integrosys.cms.app.limit.bus.LimitException,com.integrosys.cms.app.limit.proxy.ILimitProxy,com.integrosys.cms.app.transaction.ICMSTrxValue,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.proxy.ICommonUserProxy,com.integrosys.cms.host.eai.limit.response.InquiryMessageBody,com.integrosys.cms.host.eai.core.IMessageHandler,com.integrosys.cms.host.eai.EAIMessage,com.integrosys.cms.host.eai.EAIMessageException,com.integrosys.cms.host.eai.core.IEaiConstant,com.integrosys.cms.host.eai.service.MessageSender,com.integrosys.cms.host.eai.core.MessageMarshallerFactory,org.apache.commons.lang.StringEscapeUtils"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%
	String cmsLimitProfileIdStr = request.getParameter("cmsLimitProfileId");
	String losAANumber = request.getParameter("losAANumber");
	String hostAANumber = request.getParameter("hostAANumber");

	JdbcTemplate jdbc = new JdbcTemplate();
	jdbc.setDataSource((DataSource) BeanHouse.get("ofaPool"));

	String rawResponseMsg = "";

	long cmsLimitProfileId = 0;
	if (cmsLimitProfileIdStr != null && cmsLimitProfileIdStr.length() > 0) {
		Long cmsLimitProfileIdObject = null;
		try {
			cmsLimitProfileIdObject = Long.valueOf(cmsLimitProfileIdStr);
		}
		catch (NumberFormatException ex) {
			rawResponseMsg = "[" + cmsLimitProfileIdStr + "] is not a valid internal key number."; 
		}

		if (cmsLimitProfileIdObject != null) {
			try {
				cmsLimitProfileId = jdbc.queryForLong(
						"select cms_lsp_lmt_profile_id from sci_lsp_lmt_profile where cms_lsp_lmt_profile_id = ?",
						new Object[] { cmsLimitProfileIdObject });
			}
			catch (EmptyResultDataAccessException ex) {
				rawResponseMsg = "No Limit Profile / AA found for Limit Profile Id [" + cmsLimitProfileIdStr + "]";
			}
			catch (DataAccessException ex) {
				rawResponseMsg = "Error query Limit Profile / AA found for Limit Profile Id ["
						+ cmsLimitProfileIdStr + "] " + ex;
			}
		}

		System.out.println("result found for limit profile id, key = " + cmsLimitProfileId);
	}
	else if (losAANumber != null && losAANumber.length() > 0) {
		try {
			cmsLimitProfileId = jdbc.queryForLong(
					"select cms_lsp_lmt_profile_id from sci_lsp_lmt_profile where los_bca_ref_num = ?",
					new Object[] { losAANumber });
		}
		catch (EmptyResultDataAccessException ex) {
			rawResponseMsg = "No Limit Profile / AA found for LOS AA Number [" + losAANumber + "]";
		}
		catch (DataAccessException ex) {
			rawResponseMsg = "Error query Limit Profile / AA found for LOS AA Number [" + losAANumber + "] "
					+ ex;
		}

		System.out.println("result found for limit profile id, key = " + cmsLimitProfileId);
	}
	else if (hostAANumber != null && hostAANumber.length() > 0) {
		try {
			cmsLimitProfileId = jdbc.queryForLong(
					"select cms_lsp_lmt_profile_id from sci_lsp_lmt_profile where llp_bca_ref_num = ?",
					new Object[] { hostAANumber });
		}
		catch (EmptyResultDataAccessException ex) {
			rawResponseMsg = "No Limit Profile / AA found for HOST AA Number [" + hostAANumber + "]";
		}
		catch (IncorrectResultSizeDataAccessException ex) {
			if (ex.getActualSize() > 1) {
				List cmsLimitProfileIdList = jdbc.query(
						"select los_bca_ref_num from sci_lsp_lmt_profile where llp_bca_ref_num = ?",
						new Object[] { hostAANumber }, new RowMapper() {
							public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
								return rs.getString("los_bca_ref_num");
							}
						});
				if (!cmsLimitProfileIdList.isEmpty()) {
					rawResponseMsg = "Multiple Limit Profile / AA retrieved for HOST AA Number ["
							+ hostAANumber + "], please choose one to fire.<br>";
				}
				int i = 1;
				for (Iterator itr = cmsLimitProfileIdList.iterator(); itr.hasNext();) {
					String theLosAANumber = (String) itr.next();
					rawResponseMsg += "( " + i++ + " )" + " <a href=\"./rtoc_si_fac_response_test.jsp?losAANumber="
							+ theLosAANumber + "\">" + theLosAANumber + "</a><br>";
				}
			}
		}
		catch (DataAccessException ex) {
			rawResponseMsg = "Error query Limit Profile / AA found for HOST AA Number [" + hostAANumber + "] "
					+ ex;
		}

		System.out.println("result found for limit profile id, key = " + cmsLimitProfileId);
	}
	else {
		rawResponseMsg = "nothing input.";
	}

	if (cmsLimitProfileId > 0) {
		ILimitProxy proxy = (ILimitProxy) BeanHouse.get("limitProxy");

		ILimitProfile limitProfile = null;
		try {
			limitProfile = proxy.getLimitProfile(cmsLimitProfileId);
		}
		catch (LimitException ex) {
			rawResponseMsg = "<br><br>error when retrieve limit profile [" + cmsLimitProfileId + "] " + ex
					+ "; ";
		}

		ILimitDAO limitJdbcDao = (ILimitDAO) BeanHouse.get("limitJdbcDao");
		if (limitProfile != null && limitJdbcDao.checkLimitProfileStpComplete(limitProfile)) {

			ICMSTrxValue latestTrxValue = limitJdbcDao
					.retrieveLatestCollateralOrFacilityTrxValueByCmsLimitProfileId(cmsLimitProfileId);
			if (latestTrxValue == null) {
				rawResponseMsg += "<br><br>no latest transaction record tied to limit profile ["
						+ cmsLimitProfileId + "]; ";
			}

			ICommonUserProxy commonUserProxy = (ICommonUserProxy) BeanHouse.get("userProxy");
			ICommonUser user = null;
			if (latestTrxValue != null) {
				try {
					user = commonUserProxy.getUser(latestTrxValue.getLoginId());
				}
				catch (EntityNotFoundException ex) {
					//rawResponseMsg += "<br><br>no user found for login id [" + latestTrxValue.getLoginId()
							//+ "];";
				}
				catch (RemoteException ex) {
					//rawResponseMsg += "<br><br>error when searching user for login id ["
							//+ latestTrxValue.getLoginId() + "] " + ex + "; ";
				}
			}

			InquiryMessageBody inquiry = new InquiryMessageBody();
			inquiry.setCmsLimitProfileId(limitProfile.getLimitProfileID());
			inquiry.setLosAANumber(limitProfile.getLosLimitProfileReference());
			inquiry.setStpDate(latestTrxValue.getTransactionDate());
			inquiry.setUser(user);

			EAIMessage message = new EAIMessage();
			message.setMsgBody(inquiry);

			IMessageHandler facResponseMsgHandler = (IMessageHandler) BeanHouse
					.get("facilityResponseMessageHandler");
			EAIMessage responseMsg = null;
			try {
				Properties msgContext = facResponseMsgHandler.processMessage(message);
				responseMsg = (EAIMessage) msgContext.get(IEaiConstant.MSG_OBJ);
			}
			catch (EAIMessageException ex) {
				rawResponseMsg += "<br><br>error when preparing response for limit profile ["
						+ cmsLimitProfileId + "] " + ex + "; ";
			}

			if (responseMsg != null) {
				MessageMarshallerFactory marshaller = (MessageMarshallerFactory) BeanHouse
						.get("messageMarshallerFactory");
				rawResponseMsg = marshaller.marshall(responseMsg);

				MessageSender rlosMessageSender = (MessageSender) BeanHouse.get("rlosMessageSender");

				try {
					String theResponse = (String) rlosMessageSender.sendAndReceive(responseMsg);
					if (theResponse != null) {
						rawResponseMsg += "<br><br>" + theResponse;
					}
					else {
						rawResponseMsg += "** There is no response from the source **";
					}
				}
				catch (EAIMessageException ex) {
					rawResponseMsg += "<br><br>failed to send response over for limit profile ["
							+ cmsLimitProfileId + "] " + ex + "; ";
				}
			}

		}
		else {
			rawResponseMsg += "<br><br>no requirement to fire limit profile response for [" + cmsLimitProfileId
					+ "] ";
		}
	}
%>

<html>
<head>
<title>Facility Response Publish</title>
<script>
<!--
	function goLimitProfileId() {
		document.forms["siform"].losAANumber.value = '';
		document.forms["siform"].hostAANumber.value = '';
		document.forms["siform"].submit();
	}

	function goLosAANumber() {
		document.forms["siform"].cmsLimitProfileId.value = '';
		document.forms["siform"].hostAANumber.value = '';
		document.forms["siform"].submit();
	}

	function goHostAANumber() {
		document.forms["siform"].losAANumber.value = '';
		document.forms["siform"].cmsLimitProfileId.value = '';
		document.forms["siform"].submit();
	}
-->
</script>
<%@ include file="/console/console_include.jsp"%>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>XML
		Facility Response Test (AC002)</strong></td>
	</tr>
</table>
<br>


<form name="siform" action="rtoc_si_fac_response_test.jsp" class="niceform">
<table width="90%" border="0" cellspacing="1" cellpadding="1"
	align="center" class="style1">
	<tr>
		<td width="250" align="left">CMS Limit Profile / AA internal key:
		</td>
		<td width="300" align="left"><input type="text"
			name="cmsLimitProfileId" size="50" /></td>
		<td align="left"><input onclick="goLimitProfileId();"
			type="button" value="Go" /></td>
	</tr>
	<tr>
		<td width="250" align="left">LOS AA Number:</td>
		<td width="300" align="left"><input type="text"
			name="losAANumber" size="50" /></td>
		<td align="left"><input onclick="goLosAANumber();" type="button"
			value="Go" /></td>
	</tr>
	<tr>
		<td width="250" align="left">HOST (eg. SIBS) AA Number:</td>
		<td width="300" align="left"><input type="text"
			name="hostAANumber" size="50" /></td>
		<td align="left"><input onclick="goHostAANumber();" type="button"
			value="Go" /></td>
	</tr>
</table>
</form>

<hr>
<div>
<%
	if (rawResponseMsg != null && rawResponseMsg.length() > 0) {
		out.println("<p>Message processed successfully, response as follow: ");
		out.println("<p>");
		out.println("<font style=\"color:blue\">"
				+ ((rawResponseMsg.indexOf("<?xml") >= 0) ? StringEscapeUtils.escapeXml(rawResponseMsg)
						: rawResponseMsg) + "</font>");
	}
%>
</div>


</body>
</html>
<%@page import="com.integrosys.cms.app.common.constant.PropertiesConstantHelper"%>
<%@page import="com.integrosys.base.techinfra.exception.OFAException"%>
<%@page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue" %>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>

<%
	Exception e = (Exception)request.getAttribute("losException");
System.out.println("Error Is e ======= "+e+" request "+request);
	StringBuffer rootbuffer = new StringBuffer();
	OFAException oe = null;
	String stackTrace = "";
	String message = "";
	String rootCause = "";
	System.out.println("logReportFlag Is logReportFlag ======= ");
	boolean logReportFlag = PropertiesConstantHelper.displayExceptionLog();
	//boolean logReportFlag = true;
	System.out.println("logReportFlag Is logReportFlag ======= "+logReportFlag);
	if (logReportFlag) 
	{
		if((null != e) && (e instanceof Throwable))
		{System.out.println("logReportFlag Is logReportFlag if ======= "+logReportFlag);
			java.lang.StackTraceElement[] stackTraceElement = null;
			if (e instanceof OFAException) {
				oe = (OFAException)e;

				if (oe.getRootCause() != null)
				{
					stackTraceElement = oe.getRootCause().getStackTrace();
					if (oe.getRootCause() != null)
					{
						rootCause = oe.getRootCause().toString();	
					}
				} else {
					stackTraceElement = oe.getStackTrace();
				}
			} else {
				stackTraceElement = e.getStackTrace();									
			}

			// set stackTrace
			if (stackTraceElement != null) {
				for (int i=0; i<stackTraceElement.length; i++)
				{
					java.lang.StackTraceElement obj = stackTraceElement[i];
					rootbuffer.append(obj.toString() + "<br />");
				}
			}
			stackTrace = rootbuffer.toString();

			// set message
			message = e.getMessage();

			// set root cause message
			if (rootCause != null && rootCause.length() == 0) {
				rootCause = (e.getCause() != null) ? 
						e.getCause().toString() : e.toString();
			}
		}
		
		String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
		ICollateralTrxValue iColTrxValue = (ICollateralTrxValue) session.getAttribute(ipinPath+".serviceColObj");
		System.out.println("logReportFlag Is iColTrxValue ======= "+iColTrxValue);
		String collateralInfo = null;
		if (iColTrxValue != null) {
			System.out.println("logReportFlag Is inside iColTrxValue ======= "+iColTrxValue);
			collateralInfo = (iColTrxValue.getCollateral() != null)?
					String.valueOf(iColTrxValue.getCollateral().getCollateralID()) +"\t("+
						iColTrxValue.getCollateral().getCollateralSubType().getTypeName() +" - "+
						iColTrxValue.getCollateral().getCollateralSubType().getSubTypeName()+")":
						String.valueOf(iColTrxValue.getStagingCollateral().getCollateralID()+"\t("+
								iColTrxValue.getStagingCollateral().getCollateralSubType().getTypeName() +" - "+
								iColTrxValue.getStagingCollateral().getCollateralSubType().getSubTypeName()+")");
		}
%>
		<script language="JavaScript" type="text/javascript">
		
			function showErrorPopup()
			{
				var url = "<%=request.getContextPath()%>/system/error_popup_detail_trace.jsp";
				
				stackTrace = document.getElementById("stackTraceId");
				message = document.getElementById("messageId");
				rootCause = document.getElementById("rootCauseId");		
				
				var scrwidth = 1000;
				if (screen.width < scrwidth) scrwidth = screen.width;
				var scrheight = 600;
				if (screen.height < scrheight) scrheight = screen.height;

				var LeftPosition = (screen.width)?(screen.width-scrwidth-10)/2:100;
				if (LeftPosition < 0) LeftPosition = 0;
				var TopPosition = (screen.height)?(screen.height-scrheight-100)/2:100;
				if (TopPosition < 0) TopPosition = 0;

				popupWindow = window.open(url, "errorLog", "height=" + scrheight + ", width=" + scrwidth + ", scrollbars=yes, toolbar=no, location=no, titlebar=no, directories=no, status=no, menubar=no, resizable=no, channelmode=no" + ", top=" + TopPosition + ", left=" + LeftPosition);

				if (window.focus) 
				{
					popupWindow.focus();
				}

			}
		
		</script>
		<tr class="even">
		<td>Click to see error log</td>
		</tr>
		<tr class="even">
			<td colspan="2" style="border:none;text-align:center">
				<br><a href="javascript:showErrorPopup();">Click to see error log</a>
				<div id="stackTraceId" style="display:none;"><%=stackTrace %></div>
				<div id="messageId" style="display:none;"><%=message %></div>
				<div id="rootCauseId" style="display:none;"><%=rootCause %></div>
				<div id="collateralId" style="display:none;"><%=collateralInfo %></div>
			</td>
		</tr>
<% 	} %>
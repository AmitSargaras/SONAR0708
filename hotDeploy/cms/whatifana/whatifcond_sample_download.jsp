<%@ page
	import="java.io.*,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	com.integrosys.cms.ui.common.constant.ICMSUIConstant,
	com.integrosys.cms.ui.whatifana.WhatIfCondReportConstants"%><%
	String reportType = request.getParameter("reportType");
	String sampleReportName = "What-if-Analysis-PT-Sample.xls";
	
	if (reportType.equals(WhatIfCondReportConstants.REPORT_TYPE_STATE)) {
		sampleReportName = "What-if-Analysis-PT-Sample.xls";
	} else if (reportType.equals(WhatIfCondReportConstants.REPORT_TYPE_INDEX_TYPE)) {
		sampleReportName = "What-if-Analysis-ST-Sample.xls";
	} else if (reportType.equals(WhatIfCondReportConstants.REPORT_TYPE_MAKE)) {
		sampleReportName = "What-if-Analysis-MK-Sample.xls";
	} else if (reportType.equals(WhatIfCondReportConstants.REPORT_TYPE_GOLD_GRADE)) {
		sampleReportName = "What-if-Analysis-GG-Sample.xls";
	}

	java.io.File filepath = new java.io.File(PropertyManager
			.getValue(ICMSUIConstant.REPORT_TEMPLATE_PATH)
			+ "/" + sampleReportName);

	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition",
			"attachment; filename=\"" + sampleReportName + "\"");

	response.setContentLength(new Long(filepath.length()).intValue());

	FileInputStream fis = new FileInputStream(filepath);
	ServletOutputStream sos = response.getOutputStream();
	int c = 0;
	while ((c = fis.read()) != -1)
		sos.write(c);

	sos.flush();
	fis.close();
%>
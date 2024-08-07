package com.integrosys.cms.ui.whatifana;

import java.util.HashMap;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.ICommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.batch.reports.OBReport;
import com.integrosys.cms.ui.report.ReportCommandAccessor;

/*
 * Copyright Integro Technologies Pte Ltd
 */

/**
 * Description: This command retrieves the selected what-if-analysis report and
 * prepares the value object for streaming to the client
 * 
 * @author $Author: siew kheat $<br>
 */
public class GetWhatIfCondReportCommand extends ReportCommandAccessor implements ICommand, ICommonEventConstant {
	/**
	 * Defines an two dimensional array with the result list to be expected as a
	 * result from the doExecute method using a HashMap syntax for the array is
	 * (HashMapkey,classname,scope) The scope may be request,form or service
	 * 
	 * @return the two dimensional String array
	 */
	public String[][] getParameterDescriptor() {
		return (new String[][] { { "reportId", "java.lang.String", REQUEST_SCOPE },
				{ "reportType", "java.lang.String", REQUEST_SCOPE } });
	}

	/**
	 * Defines an two dimensional array with the result list to be expected as a
	 * result from the doExecute method using a HashMap syntax for the array is
	 * (HashMapkey,classname,scope) The scope may be request,form or service
	 * 
	 * @return the two dimensional String array
	 */
	public String[][] getResultDescriptor() {
		return (new String[][] { { "OBReport", "com.integrosys.cms.batch.reports.OBReport", REQUEST_SCOPE },
				{ "reportType", "java.lang.String", REQUEST_SCOPE } });
	}

	/**
	 * This method does the Business operations with the HashMap and put the
	 * results back into the HashMap.
	 * 
	 * Invokes the ReportSchedulerDAO and returns a list of what-if-analysis report
	 * objects selected based on date
	 * 
	 * @param map is of type HashMap
	 * @return HashMap with the Result
	 */
	public HashMap doExecute(HashMap map) throws CommandProcessingException, CommandValidationException {
		DefaultLogger.info(this, "Entering method doExecute");
		HashMap returnMap = new HashMap();
		HashMap resultMap = new HashMap();

		try {
			DefaultLogger.debug(this, "Map input keyset " + map.keySet());
			// process inputs
			long reportId = Long.parseLong((String) map.get("reportId"));
			String reportType = (String) map.get("reportType");
			DefaultLogger.debug(this, "*****ReportId= " + reportId);
			DefaultLogger.debug(this, "*****ReportType= " + reportType);

			OBReport report = getReportRequestManager().getReport(reportId, reportType);

			DefaultLogger.debug(this, "Report Contents= " + report.toString());

			resultMap.put("OBReport", report);
			resultMap.put("reportType", reportType);

		}
		catch (Exception e) {
			DefaultLogger.error(this, "Error occurring in retrieving What-If-Analysis Reports", e);
			throw (new CommandProcessingException(e.getMessage()));
		}

		DefaultLogger.debug(this, "Going out of doExecute()");
		returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
		return returnMap;
	}

}

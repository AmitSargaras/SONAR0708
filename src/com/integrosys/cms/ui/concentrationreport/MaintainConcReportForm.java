/** * Copyright Integro Technologies Pte Ltd * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/ui/concentrationreport/MaintainConcReportForm.java,v 1.1 2003/09/24 09:55:54 pooja Exp $ */package com.integrosys.cms.ui.concentrationreport;import java.io.Serializable;import com.integrosys.cms.ui.common.TrxContextForm;/** *  * @author $Author: pooja $<br> *  * @version $Revision: 1.1 $ *  * @since $Date: 2003/09/24 09:55:54 $ *  *        Tag: $Name: $ */public class MaintainConcReportForm extends TrxContextForm implements Serializable {	String groupCode = "";	String groupName = "";	String groupStatus = "";	String groupVersionTime = "";	String[] parameterCodes;	String[] parameterValues;	String[] parameterNames;	public String[] getParameterNames() {		return parameterNames;	}	public void setParameterNames(String[] parameterNames) {		this.parameterNames = parameterNames;	}	public String getGroupCode() {		return groupCode;	}	public void setGroupCode(String groupCode) {		this.groupCode = groupCode;	}	public String[] getParameterCodes() {		return parameterCodes;	}	public void setParameterCodes(String[] parameterCodes) {		this.parameterCodes = parameterCodes;	}	public String[] getParameterValues() {		return parameterValues;	}	public void setParameterValues(String[] parameterValues) {		this.parameterValues = parameterValues;	}	public String getGroupName() {		return groupName;	}	public void setGroupName(String groupName) {		this.groupName = groupName;	}	public String getGroupStatus() {		return groupStatus;	}	public void setGroupStatus(String groupStatus) {		this.groupStatus = groupStatus;	}	public String getGroupVersionTime() {		return groupVersionTime;	}	public void setGroupVersionTime(String groupVersionTime) {		this.groupVersionTime = groupVersionTime;	}	public void reset() {	}	public String[][] getMapper() {		String[][] input = {		{ "BusinessParameterGroup", "com.integrosys.cms.ui.concentrationreport.MaintainConcReportMapper" },		{ "SystemParametersTrxValue", "com.integrosys.cms.ui.concentrationreport.MaintainConcReportMapper" },		{ "theOBTrxContext", "com.integrosys.cms.ui.common.TrxContextMapper" },		};		return input;	}}
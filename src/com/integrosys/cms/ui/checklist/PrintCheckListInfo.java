package com.integrosys.cms.ui.checklist;import java.util.ArrayList;/** * Copyright Integro Technologies Pte Ltd $Header: * /home/cms2/cvsroot/cms2/src/com * /integrosys/cms/ui/checklist/PrintCheckListInfo.java,v 1.8 2006/08/16 * 02:02:17 jzhai Exp $Header: * /home/cms2/cvsroot/cms2/src/com/integrosys/cms/ui/ * checklist/PrintCheckListInfo.java,v 1.8 2006/08/16 02:02:17 jzhai Exp * $Author: jzhai $<br> * @version $Revision: 1.8 $ * @since $Date: 2006/08/16 02:02:17 $ Tag: $Name: $ */public class PrintCheckListInfo {	String customerName = "";	String leID = "";	String pledgorID = "";	String customerCategory = "";	ArrayList mainBorrower = new ArrayList();	ArrayList coBorrower = new ArrayList();	public void addBorrower(PrintInfo info) {		mainBorrower.add(info);	}	public ArrayList getMainBorrower() {		return mainBorrower;	}	public String getCustomerName() {		return customerName;	}	public void setCustomerName(String customerName) {		this.customerName = customerName;	}	public String getLeID() {		return leID;	}	public void setLeID(String leID) {		this.leID = leID;	}	public String getPledgorID() {		return pledgorID;	}	public void setPledgorID(String pledgorID) {		this.pledgorID = pledgorID;	}	public String getCustomerCategory() {		return customerCategory;	}	public void setCustomerCategory(String customerCategory) {		this.customerCategory = customerCategory;	}}
package com.integrosys.simulator.host.transformer;

import java.util.ArrayList;
import java.util.List;

public class OBTransformDefinition {

	private ArrayList fixedLength;

	private ArrayList fixedColumnList;

	private ArrayList delimiterList;

	private ArrayList headerColumnList;

	public OBTransformDefinition() {
	}

	public static List listFactory() {
		return new ArrayList();
	}

	public List getFixedLength() {
		return fixedLength;
	}

	public void setFixedLength(ArrayList fixedLength) {
		this.fixedLength = fixedLength;
	}

	public List getFixedColumnList() {
		return fixedColumnList;
	}

	public void setFixedColumnList(ArrayList fixedColumnList) {
		this.fixedColumnList = fixedColumnList;
	}

	public List getDelimiterList() {
		return delimiterList;
	}

	public void setDelimiterList(ArrayList delimiterList) {
		this.delimiterList = delimiterList;
	}

	public ArrayList getHeaderColumnList() {
		return headerColumnList;
	}

	public void setHeaderColumnList(ArrayList headerColumnList) {
		this.headerColumnList = headerColumnList;
	}

}

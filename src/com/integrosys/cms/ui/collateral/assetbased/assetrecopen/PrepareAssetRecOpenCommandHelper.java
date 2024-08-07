//STUB GENERATED....CHANGE THIS FILE AS YOU FEEL
package com.integrosys.cms.ui.collateral.assetbased.assetrecopen;

import java.util.Collection;
import java.util.HashMap;

import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.cms.ui.collateral.assetbased.NatureOfAssignmentList;
import com.integrosys.cms.ui.collateral.assetbased.TypeOfInvoiceList;

/**
 * Created by IntelliJ IDEA. User: ssathish Date: Jun 22, 2003 Time: 4:45:05 PM
 * To change this template use Options | File Templates.
 */
public class PrepareAssetRecOpenCommandHelper {

	public static String[][] getResultDescriptor() {
		return (new String[][] { { "natureOfChargeID", "java.util.Collection", ICommonEventConstant.REQUEST_SCOPE },
				{ "natureOfChargeValue", "java.util.Collection", ICommonEventConstant.REQUEST_SCOPE },
				{ "typeOfInvoiceListID", "java.util.Collection", ICommonEventConstant.REQUEST_SCOPE },
				{ "typeOfInvoiceListValue", "java.util.Collection", ICommonEventConstant.REQUEST_SCOPE },

		});
	}

	public static void fillPrepare(HashMap map, HashMap result, HashMap exception) {
		NatureOfAssignmentList nature = NatureOfAssignmentList.getInstance();
		Collection list = nature.getNatureOfAssignmentListID();
		result.put("natureOfChargeID", list);
		list = nature.getNatureOfAssignmentListValue();
		result.put("natureOfChargeValue", list);
		TypeOfInvoiceList typeOfInvoice = TypeOfInvoiceList.getInstance();
		list = typeOfInvoice.getTypeOfInvoiceListID();
		result.put("typeOfInvoiceListID", list);
		list = typeOfInvoice.getTypeOfInvoiceListValue();
		result.put("typeOfInvoiceListValue", list);

		return;
	}
}

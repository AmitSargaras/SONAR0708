//GENERATED FILE... ANYMODIFICATION WILL BE LOST. ASK SATHISH FOR ANY CLARIFICATION
package com.integrosys.cms.ui.collateral.assetbased.assetrecspecagent;

import java.util.HashMap;

import com.integrosys.base.uiinfra.common.CommonForm;
import com.integrosys.base.uiinfra.exception.MapperException;
import com.integrosys.cms.ui.collateral.assetbased.AssetBasedMapper;

/**
 * Created by IntelliJ IDEA. User: ssathish Date: Jun 22, 2003 Time: 4:45:05 PM
 * To change this template use Options | File Templates.
 */
public class AssetRecSpecAgentMapper extends AssetBasedMapper {

	public Object mapFormToOB(CommonForm cForm, HashMap inputs) throws MapperException {

		Object obj = AssetRecSpecAgentMapperHelper.getObject(inputs);

		super.mapFormToOB(cForm, inputs, obj);
		return AssetRecSpecAgentMapperHelper.mapFormToOB(cForm, inputs, obj);

	}

	public CommonForm mapOBToForm(CommonForm cForm, Object obj, HashMap inputs) throws MapperException {

		super.mapOBToForm(cForm, obj, inputs);

		AssetRecSpecAgentMapperHelper.mapOBToForm((AssetRecSpecAgentForm) cForm, obj, inputs);

		return cForm;

	}

}

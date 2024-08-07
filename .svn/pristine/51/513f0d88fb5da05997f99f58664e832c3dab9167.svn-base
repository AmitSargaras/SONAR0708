package com.integrosys.cms.ui.limit.facility.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.easymock.MockControl;

import junit.framework.TestCase;

import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.cms.app.collateral.bus.ICollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateralSubType;
import com.integrosys.cms.app.common.DomainObjectStatusMapper;
import com.integrosys.cms.app.limit.bus.ICollateralAllocation;
import com.integrosys.cms.app.limit.bus.ILimit;
import com.integrosys.cms.app.limit.bus.ILimitProfile;
import com.integrosys.cms.app.limit.bus.OBCollateralAllocation;
import com.integrosys.cms.app.limit.bus.OBLimit;
import com.integrosys.cms.app.limit.bus.OBLimitProfile;
import com.integrosys.cms.ui.common.constant.IGlobalConstant;

public class ReadFacilityMainCommandTest extends TestCase {
	public void testSortLimitByAcfNo() {
		HashMap context = new HashMap();

		ICollateral collateral = new OBCollateral();
		collateral.setCollateralID(12345);
		collateral.setSCISecurityID(null);
		collateral.setCollateralSubType(new OBCollateralSubType("AB102"));

		ICollateralAllocation limitSecMap = new OBCollateralAllocation();
		limitSecMap.setCollateral(collateral);

		ILimit limit = new OBLimit();
		limit.setCollateralAllocations(new ICollateralAllocation[] { limitSecMap });
		limit.setAcfNo("1.0");
		limit.setLimitID(2);

		ILimit limit1 = new OBLimit();
		limit1.setAcfNo("2.0");
		limit1.setLimitID(1);

		ILimit limit2 = new OBLimit();
		limit2.setAcfNo("2.0");
		limit2.setLimitID(3);

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setApplicationType("HP");
		limitProfile.setLimits(new ILimit[] { limit1, limit2, limit });

		context.put(IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ, limitProfile);

		MockControl domainObjectStatusMapperControl = MockControl.createControl(DomainObjectStatusMapper.class);
		DomainObjectStatusMapper mockDomainObjectStatusMapper = (DomainObjectStatusMapper) domainObjectStatusMapperControl
				.getMock();
		mockDomainObjectStatusMapper.mapStatus(new Long[] {});
		domainObjectStatusMapperControl.setDefaultReturnValue(null);
		domainObjectStatusMapperControl.replay();

		ReadFacilityMainCommand cmd = new ReadFacilityMainCommand();
		cmd.setFacilityTrxStatusMapper(mockDomainObjectStatusMapper);

		Map returnMap = cmd.doExecute(context);
		Map resultMap = (Map) returnMap.get(ICommonEventConstant.COMMAND_RESULT_MAP);
		List limits = (List) resultMap.get("listLimits");
		List limitsWithoutCollateral = (List) resultMap.get("listLimitWoCollateral");

		assertEquals("1.0", ((ILimit) limits.get(0)).getAcfNo());
		assertEquals("2.0", ((ILimit) limits.get(1)).getAcfNo());
		assertEquals("2.0", ((ILimit) limits.get(2)).getAcfNo());
		assertEquals(2, ((ILimit) limits.get(0)).getLimitID());
		assertEquals(1, ((ILimit) limits.get(1)).getLimitID());
		assertEquals(3, ((ILimit) limits.get(2)).getLimitID());
		assertEquals("2.0", ((ILimit) limitsWithoutCollateral.get(0)).getAcfNo());
		assertEquals("2.0", ((ILimit) limitsWithoutCollateral.get(1)).getAcfNo());
		assertEquals(1, ((ILimit) limitsWithoutCollateral.get(0)).getLimitID());
		assertEquals(3, ((ILimit) limitsWithoutCollateral.get(1)).getLimitID());

		domainObjectStatusMapperControl.verify();
	}
}

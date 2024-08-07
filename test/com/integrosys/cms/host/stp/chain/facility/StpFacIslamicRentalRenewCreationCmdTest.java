package com.integrosys.cms.host.stp.chain.facility;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.propertyfile.PropertyManager;
import com.integrosys.cms.app.limit.bus.*;
import com.integrosys.cms.app.limit.trx.OBFacilityTrxValue;
import com.integrosys.cms.host.stp.adapter.MessageAdapter;
import com.integrosys.cms.host.stp.bus.IStpTransBusManager;
import com.integrosys.cms.host.stp.bus.OBStpMasterTrans;
import com.integrosys.cms.host.stp.bus.OBStpTrans;
import com.integrosys.cms.host.stp.common.IStpConstants;
import com.integrosys.cms.host.stp.common.IStpTransType;
import com.integrosys.cms.host.stp.interfaces.StpMessageSender;
import com.integrosys.cms.host.stp.mapper.DomParser;
import com.integrosys.cms.host.stp.mapper.STPMapper;
import junit.framework.TestCase;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.easymock.MockControl;

import java.net.URL;
import java.util.*;
import java.math.BigDecimal;

/**
 * Facility islamic rental renewal Stp message test case
 *
 * @author Andy Wong
 * @since Oct 1, 2009
 */
public class StpFacIslamicRentalRenewCreationCmdTest extends TestCase implements IStpConstants, IStpTransType {
    StpFacIslamicRentalRenewCreationCmd cmd;
    MockControl limitManagerCtrl, stpBusManagerCtrl;
    IStpTransBusManager stpTransBusManager;
    Map ctx = new HashMap();

    protected void setUp() throws Exception {
        Log4jConfigTestPlugin.configure();

        Properties properties = PropertyManager.getProperty();
        Properties prop = new Properties();
        URL fileNameUrl = getClass().getResource("/stp.properties");
        prop.load(fileNameUrl.openStream());
        properties.putAll(prop);

        Map trxStateMap = new HashMap();
        trxStateMap.put("CREATE", "373");
        trxStateMap.put("UPDATE", "383");
        trxStateMap.put("DELETE", "393");

        limitManagerCtrl = MockControl.createControl(SBLimitManager.class);
        OBLimit obLimit = new OBLimit();
        obLimit.setLimitProfileReferenceNumber("50409000198");
        obLimit.setFacilityCode("722");
        obLimit.setFacilitySequence(1);
        obLimit.setLimitID(213213);

        SBLimitManager limitManager = (SBLimitManager) limitManagerCtrl.getMock();
        limitManager.getLimit(1);
        limitManagerCtrl.setDefaultReturnValue(obLimit);
        OBLimitProfile limitProfile = new OBLimitProfile();
        limitProfile.setApplicationType("CO");
        limitProfile.setLimitProfileID(101);
        limitManager.getLimitProfile(1);
        limitManagerCtrl.setDefaultReturnValue(limitProfile);
        limitManagerCtrl.replay();

        OBFacilityTrxValue obFacilityTrxValue = new OBFacilityTrxValue();
        obFacilityTrxValue.setReferenceID("12345");
        obFacilityTrxValue.setLoginId("TESTGAMC");

        OBFacilityMaster obFacilityMaster = new OBFacilityMaster();
        obFacilityMaster.setId(12345);

        OBFacilityIslamicRentalRenewal rentalRenewal = new OBFacilityIslamicRentalRenewal();
        rentalRenewal.setRenewalRate(new BigDecimal(20));
        rentalRenewal.setRenewalTermCodeEntryCode("ABC");
        rentalRenewal.setPrimeRateNumberEntryCode("1");
        rentalRenewal.setPrimeVariance(new BigDecimal(23));
        obFacilityMaster.setFacilityIslamicRentalRenewal(rentalRenewal);

        obFacilityMaster.setLimit(obLimit);
        obFacilityTrxValue.setFacilityMaster(obFacilityMaster);
        ctx.put(FAC_TRX_VALUE, obFacilityTrxValue);

        STPMapper stpMapper = new STPMapper();
        stpMapper.setStpDomParser(new DomParser(Arrays.asList(new String[]{"/collateralStp.xml", "/otherStp.xml", "/facilityStp.xml"})));

        stpBusManagerCtrl = MockControl.createControl(IStpTransBusManager.class);
        stpTransBusManager = (IStpTransBusManager) stpBusManagerCtrl.getMock();
        stpTransBusManager.updateMasterTrans(new OBStpMasterTrans());
        stpBusManagerCtrl.setDefaultReturnValue(new OBStpMasterTrans());

        stpTransBusManager.getTrxRefNum();
        stpBusManagerCtrl.setDefaultReturnValue(StringUtils.substring(String.valueOf(RandomUtils.nextInt()), 0, 8));

        stpTransBusManager.getSeqNum();
        stpBusManagerCtrl.setDefaultReturnValue(StringUtils.substring(String.valueOf(RandomUtils.nextInt()), 0, 8));

        stpBusManagerCtrl.replay();

        cmd = new StpFacIslamicRentalRenewCreationCmd();
        cmd.setStpMapper(stpMapper);
        cmd.setStpMsgAdapter(new MessageAdapter());
        cmd.setStpMsgSender(new StpMessageSender());
        cmd.setActualLimitBusManager(limitManager);
        cmd.setTrxStateMap(trxStateMap);
        cmd.setStpTransBusManager(stpTransBusManager);
    }

    public void testRentalRenewMsgCreate() throws Exception {
        OBStpMasterTrans obStpMasterTrans = new OBStpMasterTrans();
        obStpMasterTrans.setTransactionType(TRANS_TYPE_LIMIT);
        obStpMasterTrans.setTrxEntriesSet(new HashSet());
        ctx.put(STP_TRX_VALUE, obStpMasterTrans);

        assertFalse(cmd.execute(ctx));
    }

    public void testRentalRenewMsgUpdate() throws Exception {
        OBStpMasterTrans obStpMasterTrans = new OBStpMasterTrans();
        obStpMasterTrans.setTransactionType(TRANS_TYPE_LIMIT);
        obStpMasterTrans.setTrxEntriesSet(new HashSet());
        OBStpTrans obStpTrans = new OBStpTrans();
        obStpTrans.setReferenceId(new Long(12345));
        obStpTrans.setStatus("SUCCESS");
        obStpTrans.setTrxType("373");
        obStpMasterTrans.getTrxEntriesSet().add(obStpTrans);

        ctx.put(STP_TRX_VALUE, obStpMasterTrans);

        assertFalse(cmd.execute(ctx));        
    }
}
package com.integrosys.cms.host.stp.chain.facility;

import com.integrosys.cms.app.limit.bus.IFacilityMaster;
import com.integrosys.cms.app.limit.bus.OBFacilityMaster;
import com.integrosys.cms.app.limit.bus.OBFacilityMultiTierFinancing;
import com.integrosys.cms.app.limit.bus.OBLimit;
import com.integrosys.cms.app.limit.trx.IFacilityTrxValue;
import com.integrosys.cms.app.limit.trx.OBFacilityTrxValue;
import com.integrosys.cms.host.stp.bus.OBStpMasterTrans;
import com.integrosys.cms.host.stp.bus.OBStpTrans;
import com.integrosys.cms.host.stp.chain.AbstractStpCommand;
import com.integrosys.cms.host.stp.common.StpCommandUtil;
import com.integrosys.cms.host.stp.mapper.ISTPMapper;
import com.integrosys.cms.ui.limit.facility.FacilityUtil;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Sai Heng
 * Date: Sep 4, 2008
 * Time: 11:12:20 AM
 * To change this template use File | Settings | File Templates.
 */
public class StpFacMultiTierFinanceCreationCmd extends AbstractStpCommand {

    public boolean execute(Map ctx) throws Exception {
        HashMap fieldValMap = new HashMap();
        OBFacilityTrxValue obFacilityTrxValue = (OBFacilityTrxValue) ctx.get(FAC_TRX_VALUE);
        OBFacilityMaster obFacilityMaster = (OBFacilityMaster) obFacilityTrxValue.getFacilityMaster();
        OBStpMasterTrans obStpMasterTrans = (OBStpMasterTrans) ctx.get(STP_TRX_VALUE);
        Map stpTransMap = StpCommandUtil.getTrxMap(obStpMasterTrans);
        boolean isMoreThanOneMultiTier = false;

        ctx.put(FIELD_VAL_MAP, fieldValMap);
        OBLimit obLimit = (OBLimit) getActualLimitBusManager().getLimit(obFacilityMaster.getLimit().getLimitID());

        //Filter out deleted facility multitier financing
        obFacilityMaster.setFacilityMultiTierFinancingSet(FacilityUtil.filterDeletedMultiTierFin(obFacilityMaster.getFacilityMultiTierFinancingSet()));

        // Only fire creation or update STP when facility multitier set > 1
        if (obFacilityMaster.getFacilityMultiTierFinancingSet() != null
                && obFacilityMaster.getFacilityMultiTierFinancingSet().size() > 1) {
            isMoreThanOneMultiTier = true;
        }

        //create and update transaction
        for (Iterator iterator = obFacilityMaster.getFacilityMultiTierFinancingSet().iterator(); iterator.hasNext();) {
            OBFacilityMultiTierFinancing obFacilityMultiTierFinancing = (OBFacilityMultiTierFinancing) iterator.next();
            ctx.put(REF_NUM, obFacilityMultiTierFinancing.getCmsRefId().toString());
            ctx.put(STP_TRANS_MAP, stpTransMap);

            // Only fire creation or update STP when facility multitier set > 1
            if (isMoreThanOneMultiTier) {
                OBStpTrans obStpTrans = (OBStpTrans) initTransaction(ctx);

                //do conversion from 100% to 0-1 number
                convertPercentToDecimalPoint(obFacilityMultiTierFinancing, fieldValMap);

                //put the OB into an array of object
                ArrayList aObject = new ArrayList();
                aObject.add(obLimit);
                aObject.add(obFacilityMultiTierFinancing);
                aObject.add(fieldValMap);

                //map to field OB
                List stpList = prepareRequest(ctx, aObject.toArray(), obStpTrans.getTrxType(), ISTPMapper.FACILITY_PATH);
                // construct msg, send msg and decipher msg
                stpList = sendMessage(obStpTrans.getReferenceId(), ctx, stpList, obStpTrans.getTrxType());
                //put required OB in context to be used in subsequent command
                ctx.put(STP_TRX_VALUE, obStpMasterTrans);
                ctx.put(FAC_TRX_VALUE, obFacilityTrxValue);

                //map object to biz OB and update STP transaction
                boolean successUpd = processResponse(ctx, obStpTrans, stpList);
                if (!successUpd) {
                    return true;
                } else {
                    updateFacWithoutTrx(ctx, obFacilityTrxValue);
                }
            }
        }
        return false;
    }

    public boolean processResponse(Map ctx, OBStpTrans obStpTrans, List obStpFieldL) throws Exception {
        boolean successStp = super.processResponse(ctx, obStpTrans, obStpFieldL);

        if (successStp) { //Check valid stp response
            IFacilityTrxValue facilityTrxValue = (IFacilityTrxValue) ctx.get(FAC_TRX_VALUE);
            IFacilityMaster actualFacilityMaster = (IFacilityMaster) facilityTrxValue.getFacilityMaster();
            IFacilityMaster stageFacilityMaster = (IFacilityMaster) facilityTrxValue.getStagingFacilityMaster();

            //map to actual and stage OB based on cmsRefId
            for (Iterator iterator = actualFacilityMaster.getFacilityMultiTierFinancingSet().iterator(); iterator.hasNext();) {
                OBFacilityMultiTierFinancing obFacilityMultiTierFinancing = (OBFacilityMultiTierFinancing) iterator.next();
                if (obFacilityMultiTierFinancing.getCmsRefId() != null
                        && obFacilityMultiTierFinancing.getCmsRefId().equals(obStpTrans.getReferenceId())) {
                    getStpMapper().mapToBizOB(obFacilityMultiTierFinancing, obStpFieldL);
                    break;
                }
            }

            for (Iterator iterator = stageFacilityMaster.getFacilityMultiTierFinancingSet().iterator(); iterator.hasNext();) {
                OBFacilityMultiTierFinancing obFacilityMultiTierFinancing = (OBFacilityMultiTierFinancing) iterator.next();
                if (obFacilityMultiTierFinancing.getCmsRefId() != null
                        && obFacilityMultiTierFinancing.getCmsRefId().equals(obStpTrans.getReferenceId())) {
                    getStpMapper().mapToBizOB(obFacilityMultiTierFinancing, obStpFieldL);
                    break;
                }
            }

            ctx.put(FAC_TRX_VALUE, facilityTrxValue);
        }
        return successStp;
    }

    private void convertPercentToDecimalPoint(OBFacilityMultiTierFinancing obFacilityMultiTierFinancing, Map fieldValMap) {
        if ((obFacilityMultiTierFinancing.getRate() != null) && (obFacilityMultiTierFinancing.getRate().doubleValue() > 0)) {
            BigDecimal bigDecimal = new BigDecimal(obFacilityMultiTierFinancing.getRate().doubleValue()).
                    setScale(9, BigDecimal.ROUND_HALF_UP).divide(new BigDecimal(100), BigDecimal.ROUND_HALF_UP);
            fieldValMap.put("AMRATE", bigDecimal.toString());
        }
    }
}
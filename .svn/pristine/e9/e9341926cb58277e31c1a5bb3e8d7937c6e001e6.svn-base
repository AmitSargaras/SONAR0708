package com.integrosys.cms.app.limit.bus;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MockFacilityDaoImpl implements IFacilityDao {

	Long seq = new Long(0);

	Long insrSeq = new Long(0);

	Long officerSeq = new Long(0);

	Long relSeq = new Long(0);

	private Map idFacilityMasterMap = new HashMap();

	public Serializable createFacilityMaster(String entityName, IFacilityMaster facilityMaster) {
		Long key = createSequence();
		facilityMaster.setId(key.longValue());

		if (facilityMaster.getFacilityBnmCodes() != null) {
			facilityMaster.getFacilityBnmCodes().setFacilityMasterId(key.longValue());
		}

		if (facilityMaster.getFacilityFeeCharge() != null) {
			facilityMaster.getFacilityFeeCharge().setFacilityMasterId(key.longValue());
		}

		if (facilityMaster.getFacilityGeneral() != null) {
			facilityMaster.getFacilityGeneral().setFacilityMasterId(key.longValue());
		}

		if (facilityMaster.getFacilityInterest() != null) {
			facilityMaster.getFacilityInterest().setFacilityMasterId(key.longValue());
		}

		if (facilityMaster.getFacilityPayment() != null) {
			facilityMaster.getFacilityPayment().setFacilityMasterId(key.longValue());
		}

		if (facilityMaster.getFacilityInsuranceSet() != null) {
			for (Iterator itr = facilityMaster.getFacilityInsuranceSet().iterator(); itr.hasNext();) {
				IFacilityInsurance insr = (IFacilityInsurance) itr.next();
				insr.setId(createInsuranceSequence().longValue());
				insr.setFacilityMasterId(key.longValue());
			}
		}

		if (facilityMaster.getFacilityOfficerSet() != null) {
			for (Iterator itr = facilityMaster.getFacilityOfficerSet().iterator(); itr.hasNext();) {
				IFacilityOfficer officer = (IFacilityOfficer) itr.next();
				officer.setId(createOfficerSequence().longValue());
				officer.setFacilityMasterId(key.longValue());
			}
		}

		if (facilityMaster.getFacilityRelationshipSet() != null) {
			for (Iterator itr = facilityMaster.getFacilityRelationshipSet().iterator(); itr.hasNext();) {
				IFacilityRelationship rel = (IFacilityRelationship) itr.next();
				rel.setId(createRelationshipSequence().longValue());
				rel.setFacilityMasterId(key.longValue());
			}
		}

		idFacilityMasterMap.put(key, facilityMaster);

		return key;
	}

	public void deleteFacilityMaster(String entityName, IFacilityMaster facilityMaster) {
		idFacilityMasterMap.remove(new Long(facilityMaster.getId()));
	}

	public IFacilityMaster findFacilityMasterByCmsLimitId(String entityName, long cmsLimitId) {
		throw new IllegalStateException("not yet implemented.");
	}

	public List findFacilityMasterByCmsLimitIdList(String entityName, List cmsLimitIdList) {
		throw new IllegalStateException("not yet implemented.");
	}

	public IFacilityMaster findFacilityMasterByLimitRef(String entityName, String limitRef) {
		throw new IllegalStateException("not yet implemented.");
	}

	public List findFacilityMasterByLimitRefList(String entityName, List limitRefList) {
		throw new IllegalStateException("not yet implemented.");
	}

	public IFacilityMaster retrieveFacilityMasterByPrimaryKey(String entityName, Serializable key) {
		return (IFacilityMaster) idFacilityMasterMap.get((Long) key);
	}

	public IFacilityMaster updateFacilityMaster(String entityName, IFacilityMaster facilityMaster) {
		idFacilityMasterMap.put(new Long(facilityMaster.getId()), facilityMaster);

		return facilityMaster;
	}

	protected Long createSequence() {
		seq = new Long(seq.longValue() + 1);
		return seq;
	}

	protected Long createInsuranceSequence() {
		insrSeq = new Long(insrSeq.longValue() + 1);
		return insrSeq;
	}

	protected Long createOfficerSequence() {
		officerSeq = new Long(officerSeq.longValue() + 1);
		return officerSeq;
	}

	protected Long createRelationshipSequence() {
		relSeq = new Long(relSeq.longValue() + 1);
		return relSeq;
	}
}

package com.integrosys.cms.host.stp.mapper;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.collateral.bus.*;
import com.integrosys.cms.app.collateral.bus.type.property.OBPropertyCollateral;
import com.integrosys.cms.app.collateral.bus.type.property.subtype.agricultural.OBAgricultural;
import com.integrosys.cms.app.limit.bus.*;
import com.integrosys.cms.host.stp.bus.OBStpField;
import com.integrosys.component.user.app.bus.ICommonUser;
import com.integrosys.component.user.app.bus.OBCommonUser;
import junit.framework.TestCase;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

/**
 * Test Case to test Class STP.
 *
 * @author KLYong
 */

public class StpMapperTest extends TestCase {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    private final STPMapper stpMapper = new STPMapper();

    protected void setUp() throws Exception {
        Log4jConfigTestPlugin.configure();
        stpMapper.setStpDomParser(new DomParser(Arrays.asList(new String []{"/collateralStp.xml", "/otherStp.xml", "/facilityStp.xml"})));
    }

    // Test if able to get xml list
    public void testGetList() throws Exception {
        List xmlList = stpMapper.getList("request-349", STPMapper.FACILITY_PATH);
        assertTrue(xmlList.size() > 0); // Must be true if request/response id
        // was valid
        if (xmlList.size() != 0) {
            this.checkGetList(xmlList, 0); // xml line 1 header
        }
    }

    public void checkGetList(List list, int index) {
        OBStpField obStpField = new OBStpField(list, index);

        assertEquals("Result", "SKTMLEN", obStpField.getFieldID());
        assertEquals("Result", "4", obStpField.getLength());
        assertEquals("Result", "0", obStpField.getDecimalPoint());
    }

    // Test map pass as biz object
    public void testMapPassAsBizObject() throws Exception {
        OBFacilityRelationship obFacRel = (OBFacilityRelationship) OBFacRel();

        List xmlList = stpMapper.getList("request-322", STPMapper.FACILITY_PATH);
        List stpList = stpMapper.mapToFieldOB(obFacRel, xmlList); // Pass as biz
        // object
        assertTrue(xmlList.size() > 0); // XML list must contain value if
        // request/response id was correct
        assertTrue(stpList.size() > 0); // Stp List must contain value if
        // properly mapped

        for (Iterator iterator = stpList.iterator(); iterator.hasNext();) {
            OBStpField obStpField = (OBStpField) iterator.next();
            System.out.println(obStpField.getFieldID() + " - " + obStpField.getValue());
        }
    }

    public Object OBFacRel() {
        OBFacilityRelationship obFacRelTemp = new OBFacilityRelationship();
        Amount amount = new Amount();
        // amount.setCurrencyCode("MYR");
        amount.setAmount(550.50);
        obFacRelTemp.setGuaranteeAmount(amount);
        obFacRelTemp.setCifNumber("01234567890");
        obFacRelTemp.setGuaranteePercentage(new Double(10.15));
        obFacRelTemp.setReceiveMailCode(Boolean.valueOf(true));

        return obFacRelTemp;
    }

    public void checkMapPassAsBizObject(List list) {
        assertEquals("cifNumber", ((OBStpField) list.get(73)).getClassField());
        assertEquals("guaranteeAmount", ((OBStpField) list.get(75)).getClassField());
        assertEquals("guaranteePercentage", ((OBStpField) list.get(76)).getClassField());
        assertEquals("receiveMailCode", ((OBStpField) list.get(79)).getClassField());

        assertEquals("01234567890", ((OBStpField) list.get(73)).getValue());
        assertEquals("550.5", ((OBStpField) list.get(75)).getValue());
        assertEquals("1", ((OBStpField) list.get(75)).getDecimalPoint());
        assertEquals("10.15", ((OBStpField) list.get(76)).getValue());
        assertEquals("Y", ((OBStpField) list.get(79)).getValue());
    }

    // Test map to stp field object with hashmap as input object
    public void testPassAsHashMap() throws Exception {
        Map facGenMap = FacGenMap();

        List xmlList = stpMapper.getList("response-331", STPMapper.FACILITY_PATH);
        List stpList = stpMapper.mapToFieldOB(facGenMap, xmlList); // Pass as
        // hashmap
        assertTrue(xmlList.size() > 0); // XML list must contain value if
        // request/response id was correct
        assertTrue(stpList.size() > 0); // Stp List must contain value if
        // properly mapped

        for (Iterator iterator = stpList.iterator(); iterator.hasNext();) {
            OBStpField obStpField = (OBStpField) iterator.next();
            System.out.println(obStpField.getFieldID() + " - " + obStpField.getValue());
        }
    }

    public Map FacGenMap() {
        Map map = new HashMap();
        Amount amount = new Amount();

        amount.setAmount(1000.00);
        map.put("AFFCDE", "123123");
        map.put("AFTERM", "ADSAS");
        return map;
    }

    public void checkMapPassAsHashMap(List list) {
        assertEquals("AFFCDE", ((OBStpField) list.get(71)).getFieldID());
        assertEquals("facilityCode", ((OBStpField) list.get(71)).getClassField());
        assertEquals("123123", ((OBStpField) list.get(71)).getValue());
        assertEquals("1000.0", ((OBStpField) list.get(75)).getValue());
        // todo: need to format based on current date
        assertEquals("15102008", ((OBStpField) list.get(77)).getValue());
        assertEquals("12", ((OBStpField) list.get(81)).getValue());
    }

    // Test map to stp field object with ArrayList as input object
    public void testPassAsArrayList() throws Exception {
        ArrayList facInsurCol = FacInsurCol();

        List xmlList = stpMapper.getList("request-329", STPMapper.FACILITY_PATH);
        List stpList = stpMapper.mapToFieldOB(facInsurCol, xmlList); // Pass as
        // collection
        assertTrue(xmlList.size() > 0); // XML list must contain value if
        // request/response id was correct
        assertTrue(stpList.size() > 0); // Stp List must contain value if
        // properly mapped

        for (Iterator iterator = stpList.iterator(); iterator.hasNext();) {
            OBStpField obStpField = (OBStpField) iterator.next();
            System.out.println(obStpField.getFieldID() + " - " + obStpField.getValue());
        }
    }

    public ArrayList FacInsurCol() {
        OBFacilityInsurance obFacilityInsurance1 = new OBFacilityInsurance();
        OBFacilityInsurance obFacilityInsurance2 = new OBFacilityInsurance();
        ArrayList arlist = new ArrayList();

        obFacilityInsurance1.setCoverageTypeEntryCode("ABC001");
        obFacilityInsurance1.setInsuranceCompanyEntryCode("COMP7892563");
        obFacilityInsurance1.setPolicyNumber("POL990892");

        obFacilityInsurance2.setCoverageTypeEntryCode("ABC002");
        obFacilityInsurance2.setInsuranceCompanyEntryCode("COMP5677730");
        obFacilityInsurance2.setPolicyNumber("POL127802");

        arlist.add(0, obFacilityInsurance1);
        arlist.add(1, obFacilityInsurance2);

        return arlist;
    }

    public void checkMapPassAsCollection(List list) {
        assertEquals("CCTCOVW", ((OBStpField) list.get(73)).getFieldID());
        assertEquals("1", ((OBStpField) list.get(73)).getSequence());
        assertEquals("coverageTypeEntryCode", ((OBStpField) list.get(73)).getClassField());
        assertEquals("ABC001", ((OBStpField) list.get(73)).getValue());
        assertEquals("COMP7892563", ((OBStpField) list.get(74)).getValue());
        assertEquals("POL990892", ((OBStpField) list.get(75)).getValue());

        assertEquals("CCTCOVW1", ((OBStpField) list.get(84)).getFieldID());
        assertEquals("2", ((OBStpField) list.get(84)).getSequence());
        assertEquals("coverageTypeEntryCode", ((OBStpField) list.get(84)).getClassField());
        assertEquals("ABC002", ((OBStpField) list.get(84)).getValue());
        assertEquals("COMP5677730", ((OBStpField) list.get(85)).getValue());
        assertEquals("POL127802", ((OBStpField) list.get(86)).getValue());
    }

    // Test map to stp field object with ArrayList as Collateral
    public void testPassAsArrayListCollateral() throws Exception {
        ArrayList colPledgor = ColPledgor();
        OBCollateral collateral = Collateral();

        List xmlList = stpMapper.getList("request-126", STPMapper.COLLATERAL_PATH);
        List stpList = stpMapper.mapToFieldOB(colPledgor, xmlList); // Pass as
        // collection
        // pledgor
        stpList = stpMapper.mapToFieldOB(collateral, stpList); // Pass as object
        // collateral
        assertTrue(xmlList.size() > 0); // XML list must contain value if
        // request/response id was correct
        assertTrue(stpList.size() > 0); // Stp List must contain value if
        // properly mapped

        for (Iterator iterator = stpList.iterator(); iterator.hasNext();) {
            OBStpField obStpField = (OBStpField) iterator.next();
            System.out.println(obStpField.getFieldID() + " - " + obStpField.getValue());
        }
    }

    public ArrayList ColPledgor() {
        OBPledgor obPledgor1 = new OBPledgor();
        OBPledgor obPledgor2 = new OBPledgor();
        OBPledgor obPledgor3 = new OBPledgor();
        OBPledgor obPledgor4 = new OBPledgor();
        OBPledgor obPledgor5 = new OBPledgor();
        ArrayList arlist = new ArrayList();

        obPledgor1.setLegalID("LGL001");
        obPledgor2.setLegalID("LGL002");
        obPledgor3.setLegalID("LGL003");
        obPledgor4.setLegalID("LGL004");
        obPledgor5.setLegalID("LGL005");

        arlist.add(0, obPledgor1);
        arlist.add(1, obPledgor2);
        arlist.add(2, obPledgor3);
        arlist.add(3, obPledgor4);
        arlist.add(4, obPledgor5);

        return arlist;
    }

    public OBCollateral Collateral() {
        OBCollateral obCollateral = new OBCollateral();
        obCollateral.setSCISecurityID("99988877");
        return obCollateral;
    }

    public void checkMapPassAsArrayListCol(List list) {
        assertEquals("CCDCID", ((OBStpField) list.get(70)).getFieldID());
        assertEquals("sciSecurityID", ((OBStpField) list.get(70)).getClassField());
        assertEquals("99988877", ((OBStpField) list.get(70)).getValue());

        assertEquals("CCSSNO", ((OBStpField) list.get(73)).getFieldID());
        assertEquals("1", ((OBStpField) list.get(73)).getSequence());
        assertEquals("legalID", ((OBStpField) list.get(73)).getClassField());
        assertEquals("LGL001", ((OBStpField) list.get(73)).getValue());

        assertEquals("C2SSNO", ((OBStpField) list.get(81)).getFieldID());
        assertEquals("2", ((OBStpField) list.get(81)).getSequence());
        assertEquals("LGL002", ((OBStpField) list.get(81)).getValue());

        assertEquals("C3SSNO", ((OBStpField) list.get(89)).getFieldID());
        assertEquals("3", ((OBStpField) list.get(89)).getSequence());
        assertEquals("LGL003", ((OBStpField) list.get(89)).getValue());

        assertEquals("C4SSNO", ((OBStpField) list.get(97)).getFieldID());
        assertEquals("4", ((OBStpField) list.get(97)).getSequence());
        assertEquals("LGL004", ((OBStpField) list.get(97)).getValue());

        assertEquals("C5SSNO", ((OBStpField) list.get(105)).getFieldID());
        assertEquals("5", ((OBStpField) list.get(105)).getSequence());
        assertEquals("LGL005", ((OBStpField) list.get(105)).getValue());
    }

    // Test mapping from stp object to Biz ob
    public void testMapToBizOB() throws Exception {
        OBFacilityOfficer obFacilityOfficer = new OBFacilityOfficer();

        List xmlList = stpMapper.getList("response-338", STPMapper.FACILITY_PATH);
        Map map = new HashMap();
        map.put("LOOSEQ", "99");
        List stpList = stpMapper.mapToFieldOB(map, xmlList); // Pass as biz
        // object
        stpMapper.mapToBizOB(obFacilityOfficer, stpList);

        System.out.println("timestamp=" + System.currentTimeMillis());
        assertEquals(obFacilityOfficer.getHostSequenceNumber(), new Long(99));
    }

    public Object FacInsur() {
        OBFacilityInsurance obFacilityInsurance = new OBFacilityInsurance();

        obFacilityInsurance.setCoverageTypeEntryCode("COV9999021");
        obFacilityInsurance.setInsuranceCompanyEntryCode("COMP0001");
        obFacilityInsurance.setPolicyNumber("POL567879201");

        return obFacilityInsurance;
    }

    public void checkMapToBizOB(OBFacilityInsurance obFacilityInsurance) {
        assertEquals("COV9999021", obFacilityInsurance.getCoverageTypeEntryCode());
        assertEquals("COMP0001", obFacilityInsurance.getInsuranceCompanyEntryCode());
        assertEquals("POL567879201", obFacilityInsurance.getPolicyNumber());
    }

    // Test mapping returning a list of biz ob
    public void testStpMapToBizOBList() throws Exception {
        OBLimit obLimit = (OBLimit) ObLimit();

        List xmlList = stpMapper.getList("request-349", STPMapper.FACILITY_PATH);
        List stpList = stpMapper.mapToFieldOB(obLimit, xmlList); // Pass as biz
        Map hashMap = new HashMap();
        hashMap.put("HDNREC", "1");
        stpList = stpMapper.mapToFieldOB(hashMap, stpList);

        for (Iterator iterator = stpList.iterator(); iterator.hasNext();) {
            OBStpField obStpField = (OBStpField) iterator.next();
            System.out.println(obStpField.getFieldID() + " - " + obStpField.getValue());
        }

        // object
        assertTrue(xmlList.size() > 0); // XML list must contain value if
        // request/response id was correct
        assertTrue(stpList.size() > 0); // Stp List must contain value if
        // properly mapped
        List bizList = stpMapper.mapToBizOBList(stpList);
        if (stpList.size() != 0) {
            this.checkMapToBizOBList(bizList);
        }
    }

    public Object ObLimit() {
        OBLimit obLimit = new OBLimit();

        long facSeq = 2008000903;
        obLimit.setLimitProfileReferenceNumber("8803758261");
        obLimit.setFacilityCode("FAC0994");
        obLimit.setFacilitySequence(facSeq);

        return obLimit;
    }

    public void checkMapToBizOBList(List list) {
        OBLimit obLimit = (OBLimit) list.get(0);

        assertEquals("8803758261", obLimit.getLimitProfileReferenceNumber());
        assertEquals("FAC0994", obLimit.getFacilityCode());
        assertEquals(2008000903, obLimit.getFacilitySequence());
    }

    // Andy Wong: test mapToFieldOB for ICommonUser
    public void testMapToFieldOB() throws Exception {
        OBInsurancePolicy obInsurancePolicy = new OBInsurancePolicy();
        obInsurancePolicy.setInsuredAmount(new Amount(10000000, "MYR"));

        List xmlList = stpMapper.getList("request-124", STPMapper.COLLATERAL_PATH);
        // biz
        // object
        List stpList = stpMapper.mapToFieldOB(obInsurancePolicy, xmlList);

        for (Iterator iterator = stpList.iterator(); iterator.hasNext();) {
            OBStpField obStpField = (OBStpField) iterator.next();

            logger.debug(obStpField.getFieldID() + " - " + obStpField.getValue());
        }
    }

    // Test convertion to object
    public void testConvertToObject() throws Exception {
        ICommonUser iCommonUser = new OBCommonUser();
        iCommonUser.setLoginID("SI1OFF01");

        OBFacilityGeneral obFacilityGeneral = new OBFacilityGeneral();
        Amount amount = new Amount(100.52, "MYR");
        obFacilityGeneral.setFinancedAmount(amount);
        obFacilityGeneral.setCarCodeFlag(new Boolean(true));

        List xmlList = stpMapper.getList("request-321", STPMapper.FACILITY_PATH);
        List stpList = stpMapper.mapToFieldOB(iCommonUser, xmlList); // Pass as
        // biz
        // object
        stpList = stpMapper.mapToFieldOB(obFacilityGeneral, stpList);

        for (Iterator iterator = stpList.iterator(); iterator.hasNext();) {
            OBStpField obStpField = (OBStpField) iterator.next();
            System.out.println(obStpField.getFieldID() + " - " + obStpField.getValue());
        }

        OBFacilityGeneral objFacGen = new OBFacilityGeneral();
        stpMapper.mapToBizOB(objFacGen, stpList);

        assertEquals(obFacilityGeneral.getFinancedAmount(), objFacGen.getFinancedAmount());
        assertEquals(obFacilityGeneral.getCarCodeFlag(), objFacGen.getCarCodeFlag());
    }

    public void testPledgorToBizOBList() throws Exception {
        List xmlList = stpMapper.getList("response-015", STPMapper.OTHER_PATH);
        Map hashMap = new HashMap();
        hashMap.put("HDNREC", "1");
        hashMap.put("CFCIFN", "9099987");
        hashMap.put("CFBRNN", "98");

        List stpList = stpMapper.mapToFieldOB(hashMap, xmlList);

        for (Iterator iterator = stpList.iterator(); iterator.hasNext();) {
            OBStpField obStpField = (OBStpField) iterator.next();
            System.out.println(obStpField.getFieldID() + " - " + obStpField.getValue());
        }

        // object
        assertTrue(xmlList.size() > 0); // XML list must contain value if
        // request/response id was correct
        assertTrue(stpList.size() > 0); // Stp List must contain value if
        // properly mapped

        ICollateralPledgor iCollateralPledgor = new OBCollateralPledgor();
        stpMapper.mapToBizOB(iCollateralPledgor, stpList);
        System.out.println(iCollateralPledgor.getLegalID());
        System.out.println(iCollateralPledgor.getBookingLocation().getOrganisationCode());
    }

}
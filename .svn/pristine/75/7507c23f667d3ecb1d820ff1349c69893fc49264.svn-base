package com.integrosys.cms.app.countrylimit.bus;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.countrylimit.OBCountryLimit;
import com.integrosys.cms.app.creditriskparam.bus.countrylimit.OBCountryRating;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jul 22, 2010
 * Time: 5:55:33 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateCountryLimitTest extends CustomHibernateTestCase {

    private HibernateTemplate hibernateTemplate;

    public void setUp() {
        super.setUp();

        this.hibernateTemplate = new HibernateTemplate(getSessionFactory());
    }

    protected String[] getMappingResources() {
        return new String[]{"CreditRiskParam.hbm.xml"};
    }

    public void testCreateInternalCreditRating() {

        OBCountryLimit OBLimit = new OBCountryLimit();
        OBLimit.setCountryCode("MY");
        OBLimit.setCountryLimitAmount(new Amount(123.45, "MYR"));
        OBLimit.setCountryLimitID(123);
        OBLimit.setCountryRatingCode("ABC");
        OBLimit.setGroupID(456);
        OBLimit.setRefID(789);
        OBLimit.setStatus("ACTIVE");
        OBLimit.setVersionTime(128);

        Long limitId = (Long) hibernateTemplate.save("actualCountryLimit", OBLimit);
        assertNotNull(limitId);

        OBCountryLimit storedOBLimit = (OBCountryLimit) hibernateTemplate.get("actualCountryLimit", limitId);
        assertEquals(OBLimit.getCountryLimitAmount().getAmountAsBigDecimal(), storedOBLimit.getCountryLimitAmount().getAmountAsBigDecimal());

        OBCountryRating OBRating = new OBCountryRating();
        OBRating.setBankCapFundPercentage(new Double(123.23));
        OBRating.setCountryRatingCode("ABC");
        OBRating.setCountryRatingID(123);
        OBRating.setGroupID(456);
        OBRating.setPresetCtryLimitPercentage(new Double(2323.234));
        OBRating.setVersionTime(128);

        Long ratingId = (Long) hibernateTemplate.save("actualCountryRating", OBRating);
        assertNotNull(ratingId);

        OBCountryRating storedOBRating = (OBCountryRating) hibernateTemplate.get("actualCountryRating", ratingId);
        assertEquals(OBRating.getBankCapFundPercentage(), storedOBRating.getBankCapFundPercentage());
    }

}

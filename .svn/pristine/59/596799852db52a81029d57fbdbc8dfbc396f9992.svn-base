package com.integrosys.cms.app.countrylimit.bus;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.countrylimit.*;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jul 23, 2010
 * Time: 2:32:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateCountryLimitDaoImplTest extends CustomHibernateTestCase {

    CountryLimitDaoImpl limitDao;
    CountryRatingDaoImpl ratingDao;

    public void setUp() {
        super.setUp();

        limitDao = new CountryLimitDaoImpl();
        limitDao.setHibernateTemplate(getHibernateTemplate());
        limitDao.setSessionFactory(getSessionFactory());

        ratingDao = new CountryRatingDaoImpl();
        ratingDao.setHibernateTemplate(getHibernateTemplate());
        ratingDao.setSessionFactory(getSessionFactory());
    }

    protected String[] getMappingResources() {
		return new String[] { "CreditRiskParam.hbm.xml" };
	}

    public void testFindAll() {
        OBCountryLimit OBLimit = new OBCountryLimit();
        OBLimit.setCountryCode("MY");
        OBLimit.setCountryLimitAmount(new Amount(123.45, "MYR"));
        OBLimit.setCountryLimitID(123);
        OBLimit.setCountryRatingCode("ABC");
        OBLimit.setGroupID(456);
        OBLimit.setRefID(789);
        OBLimit.setStatus("ACTIVE");
        OBLimit.setVersionTime(128);

        Long limitId = (Long) limitDao.getHibernateTemplate().save("actualCountryLimit", OBLimit);
        
        List results = limitDao.findAll(ICountryLimitDao.ACTUAL_ENTITY_NAME);

        assertNotNull(results);
        assertEquals(1, results.size());

        results.clear();

        OBCountryRating OBRating = new OBCountryRating();
        OBRating.setBankCapFundPercentage(new Double(123.23));
        OBRating.setCountryRatingCode("ABC");
        OBRating.setCountryRatingID(123);
        OBRating.setGroupID(456);
        OBRating.setPresetCtryLimitPercentage(new Double(2323.234));
        OBRating.setVersionTime(128);

        Long ratingId = (Long) ratingDao.getHibernateTemplate().save("actualCountryRating", OBRating);

        results = ratingDao.findAll(ICountryRatingDao.ACTUAL_ENTITY_NAME);

        assertNotNull(results);
        assertEquals(1, results.size());
    }

    public void findByCountryCode() {
        OBCountryLimit OBLimit = new OBCountryLimit();
        OBLimit.setCountryCode("MY");
        OBLimit.setCountryLimitAmount(new Amount(123.45, "MYR"));
        OBLimit.setCountryLimitID(123);
        OBLimit.setCountryRatingCode("ABC");
        OBLimit.setGroupID(456);
        OBLimit.setRefID(789);
        OBLimit.setStatus("ACTIVE");
        OBLimit.setVersionTime(128);

        Long id = (Long) limitDao.getHibernateTemplate().save("actualCountryLimit", OBLimit);

        ICountryLimit storedOBLimit = limitDao.findByCountryCode(ICountryLimitDao.ACTUAL_ENTITY_NAME, "MY");

        assertNotNull(storedOBLimit);
        assertEquals(OBLimit.getCountryLimitAmount().getAmountAsBigDecimal(), storedOBLimit.getCountryLimitAmount().getAmountAsBigDecimal());
    }

}

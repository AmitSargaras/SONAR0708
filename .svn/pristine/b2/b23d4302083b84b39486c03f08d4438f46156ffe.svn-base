package com.integrosys.cms.batch.sibs.parameter;

import java.util.*;

import org.easymock.MockControl;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.test.AbstractSingleSpringContextTests;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.orm.hibernate3.HibernateTransactionManager;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.cms.app.commoncode.bus.CommonCodeDaoImpl;
import com.integrosys.cms.batch.factory.BatchJobDao;
import com.integrosys.cms.batch.factory.OBBatchJobStatus;

/**
 * @author Andy Wong
 */
public class ParameterLoaderBatchJobTest extends AbstractSingleSpringContextTests {

	ApplicationContext context = getApplicationContext();

	MockControl batchJodDaoControl;

	BatchJobDao mockBatchJobDao;

	protected String[] getConfigLocations() {
//		return new String[] { "/batch/sibs/AppContext_DaoJdbc.xml", "/AppContext_TrxDataSource_Test.xml",
//				"/AppContext_DataSource_Ext_Test.xml" };

        return new String[] { "/batch/sibs/AppContext_DaoJdbc.xml",
                "/AppContext_Services.xml",
                "/AppContext_TrxDataSource_Test.xml",
//                "/batch/sibs/AppContext_Services.xml",
                "/AppContext_DataSource_Ext_Test.xml" };

    }

	protected void onSetUp() throws Exception {
		super.onSetUp();

		batchJodDaoControl = MockControl.createControl(BatchJobDao.class);
		mockBatchJobDao = (BatchJobDao) batchJodDaoControl.getMock();
		mockBatchJobDao.createBatchJobStatus(new OBBatchJobStatus());
		batchJodDaoControl.setDefaultReturnValue(new OBBatchJobStatus());
		mockBatchJobDao.updateBatchJobStatus(new OBBatchJobStatus());
		batchJodDaoControl.setDefaultReturnValue(new OBBatchJobStatus());

		Log4jConfigTestPlugin.configure();
	}

	public void testBatchJob() {
		batchJodDaoControl.replay();

        SessionFactory ofaSessionFactory = (SessionFactory) context.getBean("ofaSessionFactory");
        DefaultLogger.debug(this, "ofaSessionFactory.getClass() ^^^^^^ " + ofaSessionFactory.getClass());

		SessionFactory sibsSessionFactory = (SessionFactory) context.getBean("sibsSessionFactory");
        DefaultLogger.debug(this, "sibsSessionFactory.getClass() ^^^^^^ " + sibsSessionFactory.getClass());       

        ParameterBusManagerImpl parameterLoaderBatchJob = new ParameterBusManagerImpl();
		ParameterDaoImpl sibsParamDao = new ParameterDaoImpl();
		sibsParamDao.setSessionFactory(sibsSessionFactory);
		ParameterDaoImpl cmsParamDao = new ParameterDaoImpl();
		cmsParamDao.setSessionFactory(ofaSessionFactory);
		CommonCodeDaoImpl commonCodeDao = new CommonCodeDaoImpl();
		commonCodeDao.setSessionFactory(ofaSessionFactory);

		parameterLoaderBatchJob.setCommonCodeDao(commonCodeDao);
        parameterLoaderBatchJob.setParameterDao(sibsParamDao);

        JdbcTemplate jdbcTemplate = (JdbcTemplate) context.getBean("sibsJdbcTemplate");
        parameterLoaderBatchJob.setJdbcTemplate(jdbcTemplate);

        TransactionTemplate trxTemplate = new TransactionTemplate();
        trxTemplate.setTimeout(600);
        trxTemplate.setTransactionManager((HibernateTransactionManager) context.getBean("txManager"));
        parameterLoaderBatchJob.setTransactionTemplate(trxTemplate);

        TransactionTemplate readTrxTemplate = new TransactionTemplate();
        readTrxTemplate.setTimeout(600);
        readTrxTemplate.setTransactionManager((HibernateTransactionManager) context.getBean("txManager"));
        readTrxTemplate.setReadOnly(true);
        parameterLoaderBatchJob.setReadTransactionTemplate(readTrxTemplate);

        List tempTableList = new ArrayList();
        tempTableList.add("paramLocalWorkingDay|CMS_TEMP_WORKING_DAYS|SI_RUN_TEMP_WORKING_DAYS");
        tempTableList.add("paramLocalForex|NO_TEMP_TABLE|SI_RUN_TEMP_FOREX");
        parameterLoaderBatchJob.setTempTableList(tempTableList);

        SingleParameterLoaderImpl singleParameterLoader = new SingleParameterLoaderImpl();
        JdbcTemplate jdbcCMSTemplate = (JdbcTemplate) context.getBean("sibsJdbcTemplate");
        JdbcTemplate jdbcExternalTemplate = (JdbcTemplate) context.getBean("sibsExternalJdbcTemplate");
        singleParameterLoader.setCmsJdbcTemplate(jdbcCMSTemplate);
        singleParameterLoader.setExternalJdbcTemplate(jdbcExternalTemplate);

        List tempKeysValueList = new ArrayList();
        tempKeysValueList.add("PCKCOD=java.lang.String");

        List tempKeysValueListForUpdate = new ArrayList();
        tempKeysValueListForUpdate.add("PCDESC=java.lang.String");
        tempKeysValueListForUpdate.add("PCEPD7=java.util.Date");
        tempKeysValueListForUpdate.add("PCEFD7=java.util.Date");
        tempKeysValueListForUpdate.add("PCFUND=java.math.BigDecimal");
        tempKeysValueListForUpdate.add("PCKCOD=java.lang.String");

        List tempKeysValueListForCreate = new ArrayList();
        tempKeysValueListForCreate.add("PCKCOD=java.lang.String");
        tempKeysValueListForCreate.add("PCDESC=java.lang.String");
        tempKeysValueListForCreate.add("PCEPD7=java.util.Date");
        tempKeysValueListForCreate.add("PCEFD7=java.util.Date");
        tempKeysValueListForCreate.add("PCFUND=java.math.BigDecimal");

        Map paramHostProductPackageMap = new HashMap();
        paramHostProductPackageMap.put("externalInquiryQueryMap", "SELECT PCKCOD,PCDESC,PCEPD7,PCEFD7,PCFUND FROM PUA2RBS.LNPCKC");  // HSDEEC   // BBA38
        paramHostProductPackageMap.put("cmsInquiryQueryMap", "SELECT PACKAGE_CODE,DESCRIPTION,EXPIRY_DATE,EFFECTIVE_DATE,FUND_ALLOCATED,STATUS,LAST_UPDATE_DATE FROM HOST_PRODUCT_PACKAGE WHERE PACKAGE_CODE=?");
        paramHostProductPackageMap.put("cmsInsertQueryMap", "INSERT INTO HOST_PRODUCT_PACKAGE (PACKAGE_CODE,DESCRIPTION,EXPIRY_DATE,EFFECTIVE_DATE,FUND_ALLOCATED,STATUS,LAST_UPDATE_DATE) VALUES (?,?,?,?,?,'ACTIVE',CURRENT TIMESTAMP)");
        paramHostProductPackageMap.put("cmsUpdateQueryMap", "UPDATE HOST_PRODUCT_PACKAGE SET DESCRIPTION=?, EXPIRY_DATE=?, EFFECTIVE_DATE=?, FUND_ALLOCATED=?, STATUS='ACTIVE',LAST_UPDATE_DATE=CURRENT TIMESTAMP WHERE PACKAGE_CODE=?");
        paramHostProductPackageMap.put("cmsUpdateQueryForDeletionMap", "UPDATE HOST_PRODUCT_PACKAGE SET STATUS='DELETED', LAST_UPDATE_DATE=CURRENT TIMESTAMP");
        paramHostProductPackageMap.put("keysValueList", tempKeysValueList);
        paramHostProductPackageMap.put("keysValueListforUpdate", tempKeysValueListForUpdate);
        paramHostProductPackageMap.put("keysValueListforCreate", tempKeysValueListForCreate);

        Map remoteEntityNameSingleParameterLoaderMap = new HashMap();
        remoteEntityNameSingleParameterLoaderMap.put("paramHostProductPackage", paramHostProductPackageMap);
        singleParameterLoader.setRemoteEntityNameSingleParameterLoaderMap(remoteEntityNameSingleParameterLoaderMap);

        parameterLoaderBatchJob.setSingleParameterLoaderImpl(singleParameterLoader);

        //parameterLoaderBatchJob.setParameterCmsDao(cmsParamDao);
		//parameterLoaderBatchJob.setParameterSibsDao(sibsParamDao);

        String[] paramList = {"paramHostProductPackage", "paramSalutation"};

        Map paramMap = new HashMap();
		paramMap.put("remoteEntityName", paramList);
        

        parameterLoaderBatchJob.setBatchParameterFeedSize(500);
        parameterLoaderBatchJob.execute(paramMap);

        batchJodDaoControl.verify();
	}

}

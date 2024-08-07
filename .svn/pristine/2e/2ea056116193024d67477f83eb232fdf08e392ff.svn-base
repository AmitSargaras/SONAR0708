package com.integrosys.cms.batch.valuation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import junit.framework.TestCase;

import org.easymock.MockControl;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.collateral.bus.valuation.IValuationHandler;
import com.integrosys.cms.app.collateral.bus.valuation.UnknownSecurityTypeException;
import com.integrosys.cms.app.collateral.bus.valuation.ValuationNotRequiredException;
import com.integrosys.cms.app.collateral.bus.valuation.model.GenericValuationModel;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.factory.BatchParameterValidator;

public class ValuationMainTest extends TestCase {

	MockControl valuationHandlerControl;
	MockControl valuationMainDaoControl;
    MockControl batchParameterValidatorControl;


    public void setUp() {
		Log4jConfigTestPlugin.configure();
	}


    public void testSuccessValuationJob() {

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");

		List valuationModelList = new ArrayList();
		GenericValuationModel model1 = new GenericValuationModel();
		model1.setCollateralId(12345);
		valuationModelList.add(model1);
		GenericValuationModel model2 = new GenericValuationModel();
		model2.setCollateralId(67890);
		valuationModelList.add(model2);
		GenericValuationModel model3 = new GenericValuationModel();
		model3.setCollateralId(666111);
		valuationModelList.add(model3);

		valuationHandlerControl = MockControl.createControl(IValuationHandler.class);
		IValuationHandler mockValuationHandler = (IValuationHandler) valuationHandlerControl.getMock();
		mockValuationHandler.performSystemValuation(model1);
		valuationHandlerControl.setReturnValue(new GenericValuationModel());
		mockValuationHandler.performSystemValuation(model2);
		valuationHandlerControl.setThrowable(new ValuationNotRequiredException("valuation is not required."));
		mockValuationHandler.performSystemValuation(model3);
		valuationHandlerControl.setThrowable(new UnknownSecurityTypeException("unknown security type", "GT1000"));
		valuationHandlerControl.replay();

		valuationMainDaoControl = MockControl.createControl(IValuationMainDAO.class);
		IValuationMainDAO mockValuationMainDao = (IValuationMainDAO) valuationMainDaoControl.getMock();
		mockValuationMainDao.getNoOfSecurities(paramMap);
		valuationMainDaoControl.setReturnValue(100);
		mockValuationMainDao.getNextBatchSecurities(paramMap, 0, 3000);
		valuationMainDaoControl.setReturnValue(valuationModelList);
		valuationMainDaoControl.replay();


        batchParameterValidatorControl = MockControl.createControl(BatchParameterValidator.class);
		BatchParameterValidator mockBatchParamHandler = (BatchParameterValidator) batchParameterValidatorControl.getMock();

        ValuationMain valuationJob = new ValuationMain();
		valuationJob.setValuationHandler(mockValuationHandler);
		valuationJob.setValuationMainDao(mockValuationMainDao);
        valuationJob.setValuationParameterValidator(mockBatchParamHandler);
        valuationJob.setTransactionTemplate(new TransactionTemplate(new MockBatchSpringTransactionManager()));

		valuationJob.execute(paramMap);

		valuationHandlerControl.verify();
		valuationMainDaoControl.verify();
	}

	public void testFailValuationJob() {

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");

		List valuationModelList = new ArrayList();
		GenericValuationModel model1 = new GenericValuationModel();
		model1.setCollateralId(12345);
		valuationModelList.add(model1);
		GenericValuationModel model2 = new GenericValuationModel();
		model2.setCollateralId(89991111);
		valuationModelList.add(model2);

		List nextValuationModelList = new ArrayList();
		GenericValuationModel model4 = new GenericValuationModel();
		model4.setCollateralId(888111);
		nextValuationModelList.add(model4);
		GenericValuationModel model5 = new GenericValuationModel();
		model5.setCollateralId(9991111);
		nextValuationModelList.add(model5);
		GenericValuationModel model6 = new GenericValuationModel();
		model6.setCollateralId(77775555);
		nextValuationModelList.add(model6);

		valuationHandlerControl = MockControl.createControl(IValuationHandler.class);
		IValuationHandler mockValuationHandler = (IValuationHandler) valuationHandlerControl.getMock();
		mockValuationHandler.performSystemValuation(model1);
		valuationHandlerControl.setReturnValue(new GenericValuationModel());
		mockValuationHandler.performSystemValuation(model2);
		valuationHandlerControl.setThrowable(new IllegalStateException("mandatory data is missing, possible ?"));
		mockValuationHandler.performSystemValuation(model4);
		valuationHandlerControl.setReturnValue(new GenericValuationModel());
		mockValuationHandler.performSystemValuation(model5);
		valuationHandlerControl.setReturnValue(new GenericValuationModel());
		mockValuationHandler.performSystemValuation(model6);
		valuationHandlerControl.setReturnValue(new GenericValuationModel());
		valuationHandlerControl.replay();

		valuationMainDaoControl = MockControl.createControl(IValuationMainDAO.class);
		IValuationMainDAO mockValuationMainDao = (IValuationMainDAO) valuationMainDaoControl.getMock();
		mockValuationMainDao.getNoOfSecurities(paramMap);
		valuationMainDaoControl.setReturnValue(6000);
		mockValuationMainDao.getNextBatchSecurities(paramMap, 0, 3000);
		valuationMainDaoControl.setReturnValue(valuationModelList);
		mockValuationMainDao.getNextBatchSecurities(paramMap, 3000, 3000);
		valuationMainDaoControl.setReturnValue(nextValuationModelList);
		valuationMainDaoControl.replay();

        batchParameterValidatorControl = MockControl.createControl(BatchParameterValidator.class);
		BatchParameterValidator mockBatchParamHandler = (BatchParameterValidator) batchParameterValidatorControl.getMock();


        ValuationMain valuationJob = new ValuationMain();
		valuationJob.setValuationHandler(mockValuationHandler);
		valuationJob.setValuationMainDao(mockValuationMainDao);
        valuationJob.setValuationParameterValidator(mockBatchParamHandler);
		valuationJob.setTransactionTemplate(new TransactionTemplate(new MockBatchSpringTransactionManager()));

		valuationJob.execute(paramMap);

		valuationHandlerControl.verify();
		valuationMainDaoControl.verify();
	}
}

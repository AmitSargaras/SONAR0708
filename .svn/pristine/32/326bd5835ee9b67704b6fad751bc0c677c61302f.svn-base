package com.integrosys.cms.app.transaction;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.Validate;
import org.mockejb.interceptor.Aspect;
import org.mockejb.interceptor.InvocationContext;
import org.mockejb.interceptor.MethodPatternPointcut;
import org.mockejb.interceptor.Pointcut;
import org.springframework.batch.item.file.mapping.FieldSet;
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;

import com.integrosys.base.businfra.transaction.DefaultTrxProcess;
import com.integrosys.base.businfra.transaction.EBTrxHistory;
import com.integrosys.base.businfra.transaction.EBTrxHistoryHome;
import com.integrosys.base.businfra.transaction.EBTrxStateMatrix;
import com.integrosys.base.businfra.transaction.EBTrxStateMatrixBean;
import com.integrosys.base.businfra.transaction.EBTrxStateMatrixHome;
import com.integrosys.base.businfra.transaction.ITrxOperation;
import com.integrosys.base.businfra.transaction.SBTrxPersistenceManager;
import com.integrosys.base.businfra.transaction.StateEntry;
import com.integrosys.base.techinfra.test.EnhancedEntityDatabaseImpl;
import com.integrosys.base.techinfra.test.MockContextTestCase;
import com.integrosys.base.techinfra.util.AccessorUtil;

/**
 * <p>
 * Test Case for Transaction Engine
 * 
 * <p>
 * All relevant EJB for transaction is deployed into MockContainer. Ease the
 * lookup of entries in table <b>TR_STATE_MATRIX</b>, which should be read from
 * file <b>tr_state_matrix.csv</b> in the classpath.
 * 
 * <p>
 * Otherwise sub class can consider to use {@link #addTrStateMatrix(StateEntry)}
 * to add the state change into the environment.
 * 
 * <p>
 * Sub classes who doing test case on update transaction, can consider to use
 * {@link #createTransaction(ICMSTrxValue)} before passing transaction value
 * into workflow. This can avoid any error encountered.
 * 
 * <p>
 * When doing test case on sub class of {@link ITrxOperation}, consider to use
 * {@link #operateUsingDefaultTrxProcess(ITrxOperation, ICMSTrxValue)}, which is
 * the correct flow of CMS Transaction.
 * 
 * @author Chong Jun Yong
 * @see #createTransaction(ICMSTrxValue)
 * @see #operateUsingDefaultTrxProcess(ITrxOperation, ICMSTrxValue)
 * @see #addTrStateMatrix(StateEntry)
 * 
 */
public abstract class TransactionEngineTestCase extends MockContextTestCase {

	private transient List trxStateMatrixValueList;

	private EBTrxStateMatrixHome ebTrxStateMatrixHome;

	protected void onSetUp() throws Exception {
		deploy("EBTrxStateMatrixHome", EBTrxStateMatrixHome.class, EBTrxStateMatrix.class, EBTrxStateMatrixBean.class);

		deploy("EBCMSTrxValueHome", EBCMSTrxValueHome.class, EBCMSTrxValue.class, EBCMSTrxValueBean.class);

		deploy("EBTrxHistoryHome", EBTrxHistoryHome.class, EBTrxHistory.class, EBCMSTrxHistoryBean.class);

		deploy("SBCMSTrxManagerHome", SBCMSTrxManagerHome.class, SBCMSTrxManager.class, SBCMSTrxManagerBean.class);

		deploy("SBCompTrxManagerHome", SBCompTrxManagerHome.class, SBTrxPersistenceManager.class,
				SBCompTrxManagerBean.class);

		ebTrxStateMatrixHome = (EBTrxStateMatrixHome) get("EBTrxStateMatrixHome");

		addAspect(new FindByFromStateAndOperationAndTrxTypeAspect());
		addAspect(new FindByReferenceIdAndTransactionTypeAspect());

		readTrxStateMatrixValues();
	}

	/**
	 * <p>
	 * Create Transaction into Mock persistent storage.
	 * 
	 * <p>
	 * <code>instanceName</code> of trxValue must be set which is the
	 * transaction type of transaction. This is important when getting next
	 * state of transaction, when trxValue object is used in next flow, such as
	 * update transaction.
	 * 
	 * @param trxValue CMS Transaction Value object which going to be created
	 * @return trxValue with transaction id and version time set.
	 * @throws IllegalArguementException where <code>toState</code> and
	 *         <code>InstanceName</code> is not set
	 */
	public ICMSTrxValue createTransaction(ICMSTrxValue trxValue) throws Exception {
		Validate.notNull(trxValue.getToState(), "'toState' of trxValue must not be null.");
		Validate.notNull(trxValue.getInstanceName(),
				"'instanceName' of trxValue must not be null, it's same as transaction type.");

		EBCMSTrxValueHome trxHome = (EBCMSTrxValueHome) get("EBCMSTrxValueHome");
		EBCMSTrxValue value = trxHome.create(trxValue);

		AccessorUtil.copyValue(value.getTransaction(), trxValue);

		return trxValue;
	}

	/**
	 * <p>
	 * Operate ITrxOperation instance using {@link DefaultTrxProcess}.
	 * DefaultTrxProcess represent the correct flow of CMS transaction.
	 * 
	 * <p>
	 * When testing on ITrxOperation instance, consider to use this method to do
	 * the operation.
	 * 
	 * @param op ITrxOperation instance, which is going to be tested
	 * @param trxValue instance of ICMSTrxValue, normally prepared at proxy
	 * @return ICMSTrxResult which wrapped the ICMSTrxValue object
	 * @see {@link ICMSTrxResult#getTrxValue()}
	 */
	public ICMSTrxResult operateUsingDefaultTrxProcess(ITrxOperation op, ICMSTrxValue trxValue) throws Exception {
		DefaultTrxProcess trxProcess = new DefaultTrxProcess();

		return (ICMSTrxResult) trxProcess.operateTransaction(op, trxValue);
	}

	/**
	 * <p>
	 * Operate ITrxReadOperation instance using {@link DefaultReadProcess}.
	 * DefaultReadProcess represent the correct transaction read flow of CMS
	 * transaction, basically will only invoke
	 * {@link ITrxReadOperation#getTransaction(com.integrosys.base.businfra.transaction.ITrxValue)}
	 * 
	 * <p>
	 * When testing on ITrxReadOperation instance, consider to use this method
	 * to do the operation.
	 * 
	 * @param op ITrxOperation instance, which is going to be tested, should
	 *        implement ITrxReadOperation as well.
	 * @param trxValue instance of ICMSTrxValue, normally prepared at proxy
	 * @return ICMSTrxResult which wrapped the ICMSTrxValue object
	 * @see {@link ICMSTrxResult#getTrxValue()}
	 */
	public ICMSTrxResult operateUsingDefaultReadProcess(ITrxOperation op, ICMSTrxValue trxValue) throws Exception {
		Validate.isTrue((op instanceof ITrxReadOperation), "ITrxReadOperation [" + op
				+ "] is not an instance of ITrxReadOperation.");

		DefaultReadProcess readProcess = new DefaultReadProcess();

		return (ICMSTrxResult) readProcess.operateTransaction(op, trxValue);
	}

	/**
	 * @deprecated consider to use
	 *             {@link #addTrStateMatrix(String, String, String, String)} or
	 *             {@link #addTrStateMatrix(StateEntry)} to add the state matrix
	 *             entry into the list
	 */
	protected void readTrxStateMatrixValues() throws Exception {
		DelimitedLineTokenizer tokenizer = new DelimitedLineTokenizer();
		tokenizer.setNames(new String[] { "stateId", "trxType", "trxOperation", "fromState", "toState", "userState",
				"enabledInd", "frontEndOp" });

		if (trxStateMatrixValueList == null) {
			trxStateMatrixValueList = new ArrayList();
		}

		InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("tr_state_matrix.csv");
		BufferedReader bsr = new BufferedReader(new InputStreamReader(is));

		String line = "";
		while ((line = bsr.readLine()) != null) {
			FieldSet fs = tokenizer.tokenize(line);
			StateEntry se = new StateEntry(fs.readString("fromState"), fs.readString("toState"), fs
					.readString("trxOperation"), fs.readString("trxType"), (fs.readString("trxType") + " : " + fs
					.readString("trxOperation")));

			trxStateMatrixValueList.add(se);
		}
	}

	/**
	 * <p>
	 * Add Tr State Matrix entry into the environment, for easy testing on state
	 * change. Especially testing on {@link ITrxOperation}
	 * 
	 * <p>
	 * Parameters to construct a StateEntry is
	 * <ol>
	 * <li>fromState
	 * <li>toState
	 * <li>operationName
	 * <li>instanceName (transaction type)
	 * <li>description (can be any)
	 * </ol>
	 * 
	 * @param se state entry, instance of {@link StateEntry}
	 * @see StateEntry#StateEntry(String, String, String, String, String)
	 */
	protected void addTrStateMatrix(StateEntry se) {
		if (trxStateMatrixValueList == null) {
			trxStateMatrixValueList = new ArrayList();
		}

		trxStateMatrixValueList.add(se);
	}

	/**
	 * Add a tr state matrix into environment by providing the states changes
	 * information
	 * 
	 * @param fromState from state status
	 * @param toState to state status
	 * @param operationName operation name
	 * @param instanceName instance name, (ie. transaction type)
	 * @see #addTrStateMatrix(StateEntry)
	 */
	protected void addTrStateMatrix(String fromState, String toState, String operationName, String instanceName) {
		Validate.notNull(fromState, "'fromState' must not be null.");
		Validate.notNull(toState, "'toState' must not be null.");
		Validate.notNull(operationName, "'operationName' must not be null.");
		Validate.notNull(instanceName, "'instanceName' must not be null.");

		StateEntry se = new StateEntry(fromState, toState, operationName, instanceName, operationName + instanceName);

		addTrStateMatrix(se);
	}

	class FindByReferenceIdAndTransactionTypeAspect implements Aspect {

		public Pointcut getPointcut() {
			return new MethodPatternPointcut("EBCMSTrxValueHome\\.findByRefIDAndTrxType");
		}

		public void intercept(InvocationContext invocationContext) throws Exception {
			Object[] objects = invocationContext.getParamVals();
			Long referenceId = (Long) objects[0];
			String trxType = (String) objects[1];

			EnhancedEntityDatabaseImpl database = (EnhancedEntityDatabaseImpl) getMockContainer().getEntityDatabase();

			Object[] trxValueEntities = database.getAllObjectsByEjbHomeClass(EBCMSTrxValueHome.class);
			if (trxValueEntities == null) {
				logger.warn("There is no transaction value object persisted, returning null.");
				invocationContext.setReturnObject(null);
			}

			for (int i = 0; i < trxValueEntities.length; i++) {
				EBCMSTrxValue trxValue = (EBCMSTrxValue) trxValueEntities[i];
				OBCMSTrxValue obTrxValue = trxValue.getTransaction();

				if (obTrxValue.getReferenceID().equals(String.valueOf(referenceId))
						&& obTrxValue.getTransactionType().equals(trxType)) {
					invocationContext.setReturnObject(trxValue);
					break;
				}
			}
		}
	}

	class FindByFromStateAndOperationAndTrxTypeAspect implements Aspect {

		private int stateId = 0;

		public Pointcut getPointcut() {
			return new MethodPatternPointcut("EBTrxStateMatrixHome\\.findByFromStateAndOperation");
		}

		public void intercept(InvocationContext invocationContext) {
			Object[] objects = invocationContext.getParamVals();
			String fromState = objects[0].toString();
			String operationName = objects[1].toString();
			String stateInstance = objects[2].toString();

			for (Iterator itr = trxStateMatrixValueList.iterator(); itr.hasNext();) {
				StateEntry se = (StateEntry) itr.next();
				if (se.getFromState().equals(fromState) && se.getOperationName().equals(operationName)
						&& se.getStateInstance().equals(stateInstance)) {
					try {
						EBTrxStateMatrix trxStateMatrixLocal = ebTrxStateMatrixHome.create(String.valueOf(stateId + 1),
								se);
						invocationContext.setReturnObject(trxStateMatrixLocal);
						break;
					}
					catch (Throwable tt) {
						fail("should not have throw exception: " + tt.getClass().getName());
					}
				}
			}

			if (invocationContext.getReturnObject() == null) {
				fail("cannot find state matrix for: from state [" + fromState + "] op name [" + operationName
						+ "] state ins [" + stateInstance + "].");
			}
		}
	}

}

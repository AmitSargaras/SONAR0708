package com.integrosys.cms.batch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.support.AbstractPlatformTransactionManager;
import org.springframework.transaction.support.DefaultTransactionStatus;

public class MockBatchSpringTransactionManager extends AbstractPlatformTransactionManager {

	private final Logger logger = LoggerFactory.getLogger(MockBatchSpringTransactionManager.class);

	protected void doBegin(Object transaction, TransactionDefinition definition) throws TransactionException {
		logger.debug("starting transaction for [" + definition.getName() + "]");

	}

	protected void doCommit(DefaultTransactionStatus status) throws TransactionException {
		logger.debug("commting transaction");
	}

	protected Object doGetTransaction() throws TransactionException {
		return new Object();
	}

	protected void doRollback(DefaultTransactionStatus status) throws TransactionException {
		logger.debug("rollback any transaction for any state");
	}

}

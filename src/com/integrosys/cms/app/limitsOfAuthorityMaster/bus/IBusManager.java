package com.integrosys.cms.app.limitsOfAuthorityMaster.bus;

import com.integrosys.base.businfra.search.SearchResult;
import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.businfra.transaction.TrxParameterException;
import com.integrosys.base.techinfra.ejbsupport.ConcurrentUpdateException;

public interface IBusManager {
	SearchResult getAllLimitsOfAuthority() throws LimitsOfAuthorityMasterException,TrxParameterException,TransactionException,ConcurrentUpdateException;
	ILimitsOfAuthorityMaster create(ILimitsOfAuthorityMaster item)throws LimitsOfAuthorityMasterException;
	ILimitsOfAuthorityMaster getById(long id) throws LimitsOfAuthorityMasterException,TrxParameterException,TransactionException;
	ILimitsOfAuthorityMaster update(ILimitsOfAuthorityMaster item) throws LimitsOfAuthorityMasterException,TrxParameterException,TransactionException,ConcurrentUpdateException;
	ILimitsOfAuthorityMaster updateToWorkingCopy(ILimitsOfAuthorityMaster workingCopy, ILimitsOfAuthorityMaster imageCopy) throws LimitsOfAuthorityMasterException,TrxParameterException,TransactionException,ConcurrentUpdateException;
	ILimitsOfAuthorityMaster deleteToWorkingCopy(ILimitsOfAuthorityMaster workingCopy, ILimitsOfAuthorityMaster imageCopy) throws LimitsOfAuthorityMasterException,TrxParameterException,TransactionException,ConcurrentUpdateException;
}

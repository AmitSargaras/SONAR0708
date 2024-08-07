/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/diary/proxy/DiaryItemProxyManagerImpl.java,v 1.6 2004/06/29 10:03:55 jtan Exp $
 */
package com.integrosys.cms.ui.finwareupload.proxy;



import java.util.ArrayList;

import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.businfra.transaction.TrxParameterException;
import com.integrosys.cms.app.geography.bus.NoSuchGeographyException;
import com.integrosys.cms.app.holiday.bus.HolidayException;
import com.integrosys.cms.batch.ubs.IUbsErrDetLog;
import com.integrosys.cms.batch.ubs.IUbsErrorLog;
import com.integrosys.cms.ui.finwareupload.bus.IFinwareUploadBusManager;

/**
 * This class act as a facade to the services offered by the Holiday modules
 * 
 * @author $Author:  Abhijit R. $<br>
 * @version $Revision: 1.6 $
 * 
 */
public class FinwareUploadProxyManagerImpl implements IFinwareUploadProxyManager {
	private IFinwareUploadBusManager finwareUploadBusManager;

	public IUbsErrorLog insertFinwarefile(ArrayList result,String fileName,String uploadId,IUbsErrDetLog obUbsErrDetLog[]) throws HolidayException,
			TrxParameterException, TransactionException {
		try {
			return getFinwareUploadBusManager().insertFinwareUpload(result,fileName,uploadId,obUbsErrDetLog);
		} catch (Exception e) {
			
			e.printStackTrace();
			throw new NoSuchGeographyException("ERROR-- Due to null State object cannot update.");
		}
	}

	public IFinwareUploadBusManager getFinwareUploadBusManager() {
		return finwareUploadBusManager;
	}

	public void setFinwareUploadBusManager(
			IFinwareUploadBusManager finwareUploadBusManager) {
		this.finwareUploadBusManager = finwareUploadBusManager;
	}


}

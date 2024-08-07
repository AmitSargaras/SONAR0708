package com.integrosys.cms.ui.segmentWiseEmail;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.segmentWiseEmail.bus.OBSegmentWiseEmail;
import com.integrosys.cms.app.segmentWiseEmail.bus.SegmentWiseEmailException;
import com.integrosys.cms.app.segmentWiseEmail.proxy.ISegmentWiseEmailProxyManager;
import com.integrosys.cms.app.segmentWiseEmail.trx.ISegmentWiseEmailTrxValue;
import com.integrosys.cms.app.segmentWiseEmail.trx.OBSegmentWiseEmailTrxValue;
import com.integrosys.cms.app.transaction.OBTrxContext;

public class MakerEditSegmentWiseEmailCmd extends AbstractCommand implements ICommonEventConstant{

	private ISegmentWiseEmailProxyManager segmentWiseEmailProxy;

	public ISegmentWiseEmailProxyManager getSegmentWiseEmailProxy() {
		return segmentWiseEmailProxy;
	}

	public void setSegmentWiseEmailProxy(ISegmentWiseEmailProxyManager segmentWiseEmailProxy) {
		this.segmentWiseEmailProxy = segmentWiseEmailProxy;
	}
	/**
	 * Default Constructor
	 */
	public MakerEditSegmentWiseEmailCmd() {
	}
	
	/**
	 * Defines an two dimensional array with the parameter list to be passed to
	 * the doExecute method by a HashMap syntax for the array is
	 * (HashMapkey,classname,scope) The scope may be request,form or service
	 * 
	 * @return the two dimensional String array
	 */
	public String[][] getParameterDescriptor() {
		return (new String[][] {
				{ "ISegmentWiseEmailTrxValue", "com.integrosys.cms.app.segmentWiseEmail.trx.ISegmentWiseEmailTrxValue",
						SERVICE_SCOPE },
				{ "theOBTrxContext", "com.integrosys.cms.app.transaction.OBTrxContext", FORM_SCOPE },
				{ "remarks", "java.lang.String", REQUEST_SCOPE }, { "event", "java.lang.String", REQUEST_SCOPE },
				{"event", "java.lang.String", REQUEST_SCOPE},
				{ "segmentWiseEmailObj", "com.integrosys.cms.app.segmentWiseEmail.bus.OBSegmentWiseEmail", FORM_SCOPE }

		});
	}
	
	public String[][] getResultDescriptor() {
		return (new String[][] {
				{ "request.ITrxValue", "com.integrosys.cms.app.transaction.ICMSTrxValue", REQUEST_SCOPE } });
	}

	/**
	 * This method does the Business operations with the HashMap and put the
	 * results back into the HashMap.
	 *
	 * @param map
	 *            is of type HashMap
	 * @return HashMap with the Result
	 */
	
	public HashMap doExecute(HashMap map) throws CommandProcessingException, CommandValidationException {
		HashMap returnMap = new HashMap();
		HashMap resultMap = new HashMap();
		HashMap exceptionMap = new HashMap();
		try {
			String event = (String) map.get("event");
			OBSegmentWiseEmail segmentWiseEmail = (OBSegmentWiseEmail) map.get("segmentWiseEmailObj");
			String str=segmentWiseEmail.getEmail();
			String segment=segmentWiseEmail.getSegment();
			OBTrxContext ctx = (OBTrxContext) map.get("theOBTrxContext");
			ISegmentWiseEmailTrxValue trxValueIn = (OBSegmentWiseEmailTrxValue) map.get("ISegmentWiseEmailTrxValue");
			ISegmentWiseEmailTrxValue trxValueOut = new OBSegmentWiseEmailTrxValue();
			if("maker_confirm_resubmit_edit".equals(event)) {
				trxValueOut = getSegmentWiseEmailProxy().makerUpdateRejectedSegmentWiseEmail(ctx, trxValueIn,segmentWiseEmail);
			}else {
				trxValueOut = getSegmentWiseEmailProxy().makerUpdateSegmentWiseEmail(ctx, trxValueIn,segmentWiseEmail);
			}	
			
			if(null!=trxValueOut) {
				String refId=trxValueOut.getStagingReferenceID();
				List items=null;
				if(null!=str && !"".equals(str)) {
					items = Arrays.asList(str.split("\\s*,\\s*"));
				}
				if(items!=null && null!=refId && null!=segment) {
					getSegmentWiseEmailProxy().insertDataToEmailTable(refId, items, segment);
				}
			}
			
			resultMap.put("request.ITrxValue", trxValueOut);
				
		} catch (SegmentWiseEmailException ex) {
			DefaultLogger.debug(this, "got exception in doExecute" + ex);
			ex.printStackTrace();
			throw (new CommandProcessingException(ex.getMessage()));
		} catch (TransactionException e) {
			DefaultLogger.debug(this, "got exception in doExecute" + e);
			throw (new CommandProcessingException(e.getMessage()));
		} catch (Exception e) {
			DefaultLogger.debug(this, "got exception in doExecute" + e);
			e.printStackTrace();
			throw (new CommandProcessingException(e.getMessage()));
		}
		returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
		return returnMap;
	}
}
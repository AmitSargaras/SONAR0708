package com.integrosys.cms.app.leiDetailsUpload;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.integrosys.base.businfra.search.SearchResult;
import com.integrosys.base.businfra.transaction.TrxParameterException;
import com.integrosys.base.techinfra.context.BeanHouse;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.component.bus.ComponentException;
import com.integrosys.cms.app.fileUpload.bus.FileUploadException;
import com.integrosys.cms.app.fileUpload.bus.IFileUploadJdbc;
import com.integrosys.cms.app.fileUpload.bus.OBLeiDetailsFile;
import com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue;
import com.integrosys.cms.app.fileUpload.trx.OBFileUploadTrxValue;
import com.integrosys.cms.app.leiDetailsUpload.proxy.ILeiDetailsUploadProxyManager;

public class CheckerReadLeiDetailsFileUploadCmd extends AbstractCommand implements ICommonEventConstant{
	public CheckerReadLeiDetailsFileUploadCmd(){
	}

	private ILeiDetailsUploadProxyManager leidetailsuploadProxy;
	

	public ILeiDetailsUploadProxyManager getLeiDetailsuploadProxy() {
		return leidetailsuploadProxy;
	}

	public void setLeiDetailsuploadProxy(ILeiDetailsUploadProxyManager leidetailsuploadProxy) {
		this.leidetailsuploadProxy = leidetailsuploadProxy;
	} 

	public String[][] getParameterDescriptor() {
		return (new String[][] { 
				{ "TrxId", "java.lang.String", REQUEST_SCOPE },
				{"event", "java.lang.String", REQUEST_SCOPE},
		});
	}

	/**
	 * Defines an two dimensional array with the result list to be expected as a
	 * result from the doExecute method using a HashMap syntax for the array is
	 * (HashMapkey,classname,scope) The scope may be request,form or service
	 * 
	 * @return the two dimensional String array
	 */
	public String[][] getResultDescriptor() {
		return (new String[][] { 
				{"IFileUploadTrxValue", "com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue", SERVICE_SCOPE},
				{"event", "java.lang.String", REQUEST_SCOPE},
				{ "total", "java.lang.String", REQUEST_SCOPE },
				{ "correct", "java.lang.String", REQUEST_SCOPE },
				{ "fail", "java.lang.String", REQUEST_SCOPE },
				{"totalUploadedList", "java.util.List", SERVICE_SCOPE},
				{"leidetailsList", "java.util.List", SERVICE_SCOPE},
				
		});
	}

	public HashMap doExecute(HashMap map) throws CommandProcessingException, CommandValidationException,ComponentException {
		HashMap returnMap = new HashMap();
		HashMap resultMap = new HashMap();
		
		try {
			SearchResult fileList = new SearchResult();
			ArrayList totalUploadedList=new ArrayList();
			
			IFileUploadTrxValue trxValue=null;
			String fileId=(String) (map.get("TrxId"));
			String event = (String) map.get("event");
			trxValue = (OBFileUploadTrxValue) getLeiDetailsuploadProxy().getFielUploadByTrxID(fileId);
			IFileUploadJdbc jdbc=(IFileUploadJdbc)BeanHouse.get("fileUploadJdbc");
			fileList=jdbc.getAllLeiDetailsFile(trxValue.getStagingReferenceID());
			
			List uploadList=new ArrayList();
			if(fileList!=null){
				uploadList = new ArrayList(fileList.getResultList());		
			}
			long countPass = 0;
			long countFail = 0;
		
			
				for (int i = 0; i < uploadList.size(); i++) {
					OBLeiDetailsFile obj = (OBLeiDetailsFile) uploadList.get(i);

					if ("FAIL".equals(obj.getStatus()) && "N".equals(obj.getUploadStatus())) {
						countFail++;
					} else if ("PASS".equals(obj.getStatus()) && "Y".equals(obj.getUploadStatus())) {
						countPass++;
					}
				}

			resultMap.put("total", String.valueOf(uploadList.size()));
			resultMap.put("correct", String.valueOf(countPass));
			resultMap.put("fail", String.valueOf(countFail));

			resultMap.put("IFileUploadTrxValue", trxValue);
			resultMap.put("totalUploadedList", uploadList);
			resultMap.put("leidetailsList", uploadList);
			resultMap.put("event", event);
		
		} catch(FileUploadException ex){
			DefaultLogger.debug(this, "got exception in doExecute" + ex);
			ex.printStackTrace();
		} catch (TrxParameterException e) {
			new CommandProcessingException(e.getMessage());
		} catch (Exception e) { 
			DefaultLogger.debug(this, "got exception in doExecute" + e);
			e.printStackTrace();
			throw (new CommandProcessingException(e.getMessage()));
		}
		returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
		return returnMap;
	}

}

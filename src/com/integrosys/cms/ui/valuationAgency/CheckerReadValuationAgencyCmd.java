package com.integrosys.cms.ui.valuationAgency;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.struts.util.LabelValueBean;

import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.geography.city.proxy.ICityProxyManager;
import com.integrosys.cms.app.geography.country.bus.ICountry;
import com.integrosys.cms.app.geography.region.bus.IRegion;
import com.integrosys.cms.app.geography.state.bus.IState;
import com.integrosys.cms.app.valuationAgency.bus.ICity;
import com.integrosys.cms.app.valuationAgency.bus.IValuationAgency;
import com.integrosys.cms.app.valuationAgency.bus.OBValuationAgency;
import com.integrosys.cms.app.valuationAgency.bus.ValuationAgencyException;
import com.integrosys.cms.app.valuationAgency.proxy.IValuationAgencyProxyManager;
import com.integrosys.cms.app.valuationAgency.trx.IValuationAgencyTrxValue;
import com.integrosys.cms.app.valuationAgency.trx.OBValuationAgencyTrxValue;
import com.integrosys.cms.ui.manualinput.CommonUtil;

/**
 * @author rajib.aich  For Valuation Agency
 * Command for checker to approve edit .
 */

public class CheckerReadValuationAgencyCmd extends AbstractCommand implements ICommonEventConstant {
	
	
	private IValuationAgencyProxyManager valuationAgencyProxy;	
	
	private ICityProxyManager cityProxy;
	
	
	public ICityProxyManager getCityProxy() {
		return cityProxy;
	}

	public void setCityProxy(ICityProxyManager cityProxy) {
		this.cityProxy = cityProxy;
	}

	public IValuationAgencyProxyManager getValuationAgencyProxy() {
		return valuationAgencyProxy;
	}

	public void setValuationAgencyProxy(
			IValuationAgencyProxyManager valuationAgencyProxy) {
		this.valuationAgencyProxy = valuationAgencyProxy;
	}

	/**
	 * Default Constructor
	 */
	public CheckerReadValuationAgencyCmd() {
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
				{ "TrxId", "java.lang.String", REQUEST_SCOPE },
				{"event", "java.lang.String", REQUEST_SCOPE},
				{
					"IValuationAgencyTrxValue",
					"com.integrosys.cms.app.valuationAgency.trx.IValuationAgencyTrxValue",
					SERVICE_SCOPE },
				
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
				{ "valuationObj", "com.integrosys.cms.app.valuationAgency.bus.OBValuationAgency", FORM_SCOPE },
				{"IValuationAgencyTrxValue",  "com.integrosys.cms.app.valuationAgency.trx.IValuationAgencyTrxValue", SERVICE_SCOPE},
				{ "countryList", "java.util.List", SERVICE_SCOPE },
				{ "regionList", "java.util.List", SERVICE_SCOPE },
				{ "cityList", "java.util.List", SERVICE_SCOPE },
				{ "stateList", "java.util.List", SERVICE_SCOPE },
				{"event", "java.lang.String", REQUEST_SCOPE},
				
		});
	}

	/**
	 * This method does the Business operations with the HashMap and put the
	 * results back into the HashMap.Here creation for Company Borrower is done.
	 * 
	 * @param map is of type HashMap
	 * @return HashMap with the Result
	 */
	public HashMap doExecute(HashMap map) throws CommandProcessingException, CommandValidationException,ValuationAgencyException {
		HashMap returnMap = new HashMap();
		HashMap resultMap = new HashMap();
		try {
			IValuationAgency valuationAgency;
			IValuationAgencyTrxValue trxValue=null;
			String valuationAgencyCode=(String) (map.get("TrxId"));
			String event = (String) map.get("event");
			trxValue = (OBValuationAgencyTrxValue) getValuationAgencyProxy().getValuationAgencyByTrxID(valuationAgencyCode);
			valuationAgency = (OBValuationAgency) trxValue.getStagingValuationAgency();
			resultMap.put("IValuationAgencyTrxValue", trxValue);
			resultMap.put("valuationObj", valuationAgency);
			resultMap.put("event", event);
			
			long stateId = 0, countryId = 0 ,cityId=0 ,regionId=0;
			resultMap.put("countryList", getCountryList(countryId));
			
			if(valuationAgency.getRegion()!=null){
				resultMap.put("stateList", getStateList(valuationAgency.getRegion().getIdRegion()));
			}else{
				resultMap.put("stateList", new ArrayList());
			}
			if(valuationAgency.getCountry()!=null){
				resultMap.put("regionList", getRegionList(valuationAgency.getCountry().getIdCountry()));
			}else{
				resultMap.put("regionList", new ArrayList());
			}
			if(valuationAgency.getState()!=null){
				resultMap.put("cityList", getCityList(valuationAgency.getState().getIdState()));
			}else{
				resultMap.put("cityList", new ArrayList());
					
			}
			
		} catch (ValuationAgencyException e) {
		
			DefaultLogger.debug(this, "got exception in doExecute" + e);
			e.printStackTrace();
			throw (new CommandProcessingException(e.getMessage()));
		} catch (TransactionException e) {
			e.printStackTrace();
			throw (new CommandProcessingException(e.getMessage()));
		}catch (Exception e) {
            DefaultLogger.debug(this, "got exception in doExecute" + e);
            e.printStackTrace();
            throw (new CommandProcessingException(e.getMessage()));
        }

		returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
		return returnMap;
	}
	
	
	private List getCountryList(long countryId) {
		List lbValList = new ArrayList();
		try {
			List idList = (List)getValuationAgencyProxy().getCountryList(countryId);
			for (int i = 0; i < idList.size(); i++) {
				ICountry country = (ICountry) idList.get(i);
				if (country.getStatus().equals("ACTIVE")) {
					String id = Long.toString(country.getIdCountry());
					String val = country.getCountryName();
					LabelValueBean lvBean = new LabelValueBean(val, id);
					lbValList.add(lvBean);
				}
			}
		} catch (Exception ex) {
		}
		return CommonUtil.sortDropdown(lbValList);
	}

	private List getRegionList(long stateId) {
		List lbValList = new ArrayList();
		try {
			List idList = (List)getCityProxy().getRegionList(stateId);
			for (int i = 0; i < idList.size(); i++) {
				IRegion region = (IRegion) idList.get(i);
				if (region.getStatus().equals("ACTIVE")) {
					
					if(stateId!=0){
						String id = Long.toString(region.getIdRegion());
						String val = region.getRegionName();
					 LabelValueBean lvBean = new LabelValueBean(val, id);
					 lbValList.add(lvBean);
					 
					}else{
						String idVal = "";
						String valVal = "";
						 LabelValueBean lvBeanval = new LabelValueBean(valVal, idVal);
						 lbValList.add(lvBeanval);
					}
					
				}
			}
		} catch (Exception ex) {
		}
		return CommonUtil.sortDropdown(lbValList);
	}
	
	private List getStateList(long regionId) {
		List lbValList = new ArrayList();
		try {
			List idList = (List) getCityProxy().getStateList(regionId);

			for (int i = 0; i < idList.size(); i++) {
				IState state = (IState) idList.get(i);
				if (state.getStatus().equals("ACTIVE")) {
					if(regionId!=0){
						String id = Long.toString(state.getIdState());
						String val = state.getStateName();
						
						LabelValueBean lvBean = new LabelValueBean(val, id);
						lbValList.add(lvBean);
					}else{
						String idVal ="";
						String valVal ="";
						
						
						LabelValueBean lvBean = new LabelValueBean(valVal, idVal);
						lbValList.add(lvBean);
					}
				
					
				}
			}
		} catch (Exception ex) {
		}
		return CommonUtil.sortDropdown(lbValList);
	}

	
	
	
	
	private List getCityList(long cityId) {
		List lbValList = new ArrayList();
		try {
			List idList = (List) getValuationAgencyProxy().getCityList(cityId);	 	
			for (int i = 0; i < idList.size(); i++) {
					ICity city = (ICity)idList.get(i);
					if( city.getStatus().equals("ACTIVE")) {
						if(cityId!=0){
					
							String id = Long.toString(city.getIdCity());
							String val = city.getCityName();
							
							LabelValueBean lvBean = new LabelValueBean(val, id);
							lbValList.add(lvBean);
						}else{
							String idVal = "";
							String valVal = "";
							
							LabelValueBean lvBeanval = new LabelValueBean(valVal, idVal);
							lbValList.add(lvBeanval);
						}
						
					}
				}
			} catch (Exception ex) {
		}
		return CommonUtil.sortDropdown(lbValList);
	}

}

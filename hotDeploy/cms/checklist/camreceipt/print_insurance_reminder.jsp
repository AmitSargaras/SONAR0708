<%@ page import="org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.base.businfra.customer.OBCustomer,
                 java.io.StringWriter,
                 java.net.URL,
                 java.util.Properties,
                 java.io.File,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 java.util.StringTokenizer,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recgenagent.IReceivableGeneralAgent,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recopen.IReceivableOpen,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recspecagent.IReceivableSpecificAgent,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recspecnoa.IReceivableSpecificNoAgent,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeaircraft.ISpecificChargeAircraft,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeothers.ISpecificChargeOthers,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeplant.ISpecificChargePlant,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.agricultural.IAgricultural,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.comgeneral.ICommercialGeneral,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.comshophouse.ICommercialShopHouse,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.industrial.IIndustrial,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.resluxury.IResidentialLuxury,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.resstandard.IResidentialStandard,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.specialhotel.ISpecialPurposeHotel,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.specialothers.ISpecialPurposeOthers,
                 com.integrosys.cms.app.collateral.bus.type.asset.IAssetBasedCollateral,
                 com.integrosys.cms.ui.collateral.InsuranceTypeList,
                 com.integrosys.cms.ui.collateral.InsurerNameList,
                 com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.*"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.property.subtype.industrialspecial.IIndustrialSpecial"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.property.subtype.serviceapartment.ICommercialServiceApartment"%>
<%    
    ICheckListItem chkListItem = (ICheckListItem)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.checkListItem");
    ICollateral col = (ICollateral)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.collateral");

try {
	IInsurancePolicy policies[] = new IInsurancePolicy[0];
    String fileName = "insurance_renewal_reminder.rtf";
    String date = DateUtil.formatDate("dd MMM yyyy",chkListItem.getExpiryDate());

	VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
    
    VelocityContext ctx = new VelocityContext();

    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    String colSubtype = col.getCollateralSubType().getSubTypeCode();
     // START CMSSP-594 - Priya updated 
      if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE)) 
	   //Commented CMSSP-594 - Priya  Commenting the below part of code as this Gen Charge should also work same as other types (informed by Hui Seing)    
	  /* { HashMap insuranceMap = (HashMap) ((IGeneralCharge) col).getInsurance();
	    com.integrosys.cms.app.collateral.bus.type.asset.IInsuranceInfo insurance = null;
	    if (insuranceMap != null && !insuranceMap.isEmpty()) {
	    	Collection keySet = insuranceMap.keySet();
	    	Iterator itr = keySet.iterator();
	    	while (itr.hasNext()) {		    	
		    	if (insurance == null) {
			    	insurance = (com.integrosys.cms.app.collateral.bus.type.asset.IInsuranceInfo)insuranceMap.get(itr.next());			    	
		    	} else {
			    	com.integrosys.cms.app.collateral.bus.type.asset.IInsuranceInfo tempIns = (com.integrosys.cms.app.collateral.bus.type.asset.IInsuranceInfo)insuranceMap.get(itr.next());
			    	if (tempIns.getExpiryDate() != null && insurance.getExpiryDate() != null &&
			    		tempIns.getExpiryDate().compareTo(insurance.getExpiryDate()) < 0) {
				    	insurance = tempIns;
			    	}
		    	}
	    	}
    	}
        
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        } */
        // End of commenting - Priya 
      policies  =  ((IGeneralCharge) col).getInsurancePolicies();
 
      else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_RECV_GEN_AGENT)) 
        policies  =  ((IReceivableGeneralAgent) col).getInsurancePolicies();
              
      else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_RECV_OPEN)) 
       policies  =  ((IReceivableOpen) col).getInsurancePolicies();
      
      else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_RECV_SPEC_AGENT)) 
        policies  =  ((IReceivableSpecificAgent) col).getInsurancePolicies();
      
        else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_RECV_SPEC_NOAGENT)) 
         policies  =  ((IReceivableSpecificNoAgent) col).getInsurancePolicies();
	   
        else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_AIRCRAFT)) 
         policies  =  ((ISpecificChargeAircraft) col).getInsurancePolicies();
        
         else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_OTHERS))
         policies  =  ((ISpecificChargeOthers) col).getInsurancePolicies();
        
        else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_PLANT)) 
            policies  =  ((ISpecificChargePlant) col).getInsurancePolicies() ;     
         
          else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH)) 
          policies  =  ((ISpecificChargeVehicle) col).getInsurancePolicies();
        
          else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)) 
          policies  =  ((IAgricultural) col).getInsurancePolicies();
        
          else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_COM_GENERAL)) 
           policies  =  ((ICommercialGeneral) col).getInsurancePolicies();    
        
            else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_COM_SHOP_HOUSE)) 
          policies  =  ((ICommercialShopHouse) col).getInsurancePolicies();
        
          else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_INDUSTRIAL)) 
            policies  =  ((IIndustrial) col).getInsurancePolicies();

		  else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_SPEC_SERVICE_APT))
          policies  =  (( ICommercialServiceApartment ) col).getInsurancePolicies();    // todo check this out

          else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_SPEC_INDUSTRIAL))
            policies  =  (( IIndustrialSpecial ) col).getInsurancePolicies(); 			// todo check this out   

		   else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_RES_LUXURY))
          policies  =  ((IResidentialLuxury) col).getInsurancePolicies();
       
         else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_RES_STANDARD)) 
          policies  =  ((IResidentialStandard) col).getInsurancePolicies();
       
        else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_SPEC_HOTEL)) 
         policies  =  ((ISpecialPurposeHotel) col).getInsurancePolicies();
       
         else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_SPEC_OTHERS)) 
         policies  =  ((ISpecialPurposeOthers) col).getInsurancePolicies();
        
       
                     
	    com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance = null;
		ArrayList policyList = new ArrayList(); 
		 int len = policies == null ? 0 :policies.length;
       
          for(int i = len-1; i>=0; i--)
          { 
	        HashMap  policy = new HashMap();     
            System.out.println( " "+i+".  PolicyNo "+ policies[i].getPolicyNo() + " InsurerName " + policies[i].getInsurerName()+ " InsuranceType "+policies[i].getInsuranceType()+" ExpiryDate "+policies[i].getExpiryDate()+" CurrencyCode "+policies[i].getCurrencyCode());                
            if (policies[i] != null) 
             {  
		          ctx.put("Policy", policy);
				  policy.put("policyNo", policies[i].getPolicyNo());
	              policy.put("policyType", policies[i].getInsuranceType());
	              policy.put("insCompany", policies[i].getInsurerName());
	              if (policies[i].getInsuredAmount() != null && policies[i].getInsuredAmount().getCurrencyCode() != null)
	                {
	                  policy.put("insuredAmount", policies[i].getInsuredAmount().getCurrencyCode()+" "+
	                  CurrencyManager.convertToString(locale, policies[i].getInsuredAmount()));
	                }
	              policy.put("insuredAgainst", policies[i].getInsuredAgainst());
	              policy.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", policies[i].getEffectiveDate()));
	              policy.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", policies[i].getExpiryDate()));
	           } 
             policyList.add(policy);
           }
           ctx.put("PolicyList", policyList);  
          
      // END  CMSSP-594 - Priya updated    
	   
	
    //Start CMSSP-594 - Priya commented 
  /*   else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_RECV_GEN_AGENT)) {
        com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance =
                ((IReceivableGeneralAgent) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        } 
    }
      else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_RECV_OPEN)) {
        com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance =
                ((IReceivableOpen) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        } 
    }  
   else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_RECV_SPEC_AGENT)) {
        com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance =
                ((IReceivableSpecificAgent) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }  
     else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_RECV_SPEC_NOAGENT)) {
        com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance =
                ((IReceivableSpecificNoAgent) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }  
     else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_AIRCRAFT)) {
        com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance =
                ((ISpecificChargeAircraft) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }  
      else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_OTHERS)) {
        com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance =
                ((ISpecificChargeOthers) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }
     else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_PLANT)) {
        com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance =
                ((ISpecificChargePlant) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    } 
   else if (colSubtype.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH)) {
        com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance =
                ((ISpecificChargeVehicle) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    } 
    else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)) {
        com.integrosys.cms.app.collateral.bus.type.property.IInsuranceInfo insurance =
               ((IAgricultural) col).getInsuranceInfo();

   HashMap insuranceMap = (HashMap) ((IAgricultural) col).getInsurance();
	    com.integrosys.cms.app.collateral.bus.IInsurancePolicy insurance = null;
	    if (insuranceMap != null && !insuranceMap.isEmpty()) {
	   
	    	Collection keySet = insuranceMap.keySet();
	    	Iterator itr = keySet.iterator();
	    	while (itr.hasNext()) {	
		    	if (insurance == null) {
			    	insurance = (com.integrosys.cms.app.collateral.bus.IInsurancePolicy)insuranceMap.get(itr.next());			    	
		    	} else {	
			    	com.integrosys.cms.app.collateral.bus.IInsurancePolicy tempIns = (com.integrosys.cms.app.collateral.bus.IInsurancePolicy)insuranceMap.get(itr.next());
			    	if (tempIns.getExpiryDate() != null && insurance.getExpiryDate() != null &&
			    		tempIns.getExpiryDate().compareTo(insurance.getExpiryDate()) < 0) {
				    	insurance = tempIns;

			    	}
		    	}
	    	}
    	}
        ctx.put("insurance", insurance);
        if (insurance != null) {	
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            	System.out.println("insurance type " + InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));

            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }  
    else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_COM_GENERAL)) {
        com.integrosys.cms.app.collateral.bus.type.property.IInsuranceInfo insurance =
                ((ICommercialGeneral) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    } 
    else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_COM_SHOP_HOUSE)) {
        com.integrosys.cms.app.collateral.bus.type.property.IInsuranceInfo insurance =
                ((ICommercialShopHouse) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }  
    	else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_INDUSTRIAL)) {
        com.integrosys.cms.app.collateral.bus.type.property.IInsuranceInfo insurance =
                ((IIndustrial) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }  
     else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_RES_LUXURY)) {
        com.integrosys.cms.app.collateral.bus.type.property.IInsuranceInfo insurance =
                ((IResidentialLuxury) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    } 
     else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_RES_STANDARD)) {
        com.integrosys.cms.app.collateral.bus.type.property.IInsuranceInfo insurance =
                ((IResidentialStandard) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    } 
     else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_SPEC_HOTEL)) {
        com.integrosys.cms.app.collateral.bus.type.property.IInsuranceInfo insurance =
                ((ISpecialPurposeHotel) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }  
    
     else if (colSubtype.equals(ICMSConstant.COLTYPE_PROP_SPEC_OTHERS)) {
        com.integrosys.cms.app.collateral.bus.type.property.IInsuranceInfo insurance =
                ((ISpecialPurposeOthers) col).getInsuranceInfo();
        ctx.put("insurance", insurance);
        if (insurance != null) {
            ctx.put("policyType", InsuranceTypeList.getInstance().getInsuranceTypeItem(insurance.getInsuranceType()));
            ctx.put("insCompany", InsurerNameList.getInstance().getInsurerNameItem(insurance.getInsurerName()));
            if (insurance.getInsuredAmount() != null && insurance.getInsuredAmount().getCurrencyCode() != null) {
                ctx.put("insuredAmount", insurance.getInsuredAmount().getCurrencyCode()+" "+
                    CurrencyManager.convertToString(locale, insurance.getInsuredAmount()));
            }
            ctx.put("issuedDate", DateUtil.formatDate("dd MMM yyyy", insurance.getEffectiveDate()));
            ctx.put("expiryDate", DateUtil.formatDate("dd MMM yyyy", insurance.getExpiryDate()));
        }
    }*/
	 //END CMSSP-594 - Priya commented 
   ctx.put("date",date);
    //ctx.put("item",chkListItem.getItem());
    // customer obj
    ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ctx.put("cust",cust);
	if(cust!=null && cust.getOfficialAddresses()!=null)
	    ctx.put("address",cust.getOfficialAddresses()[0]);

    StringWriter sw = new StringWriter();
    velocityEngine.getTemplate(fileName).merge(ctx,sw);
    byte cont[] = sw.toString().getBytes();
    String strMime = "application/rtf";
    // Clear out response stream
    response.reset();

    // Set the browser's mime type
    response.setContentType(strMime);

    // Ensure the browser's page to expect a file
    response.setHeader("Expires", "0");
    response.addHeader("Content-disposition", "attachment; filename="+"INS POL RENEWAL REMINDER.rtf");
    response.getOutputStream().write(cont);
    response.flushBuffer(); 

} catch (Exception e) {
        e.printStackTrace();
        out.println("An error has occurred while exporting the report.<BR>" + e.toString());
		throw e;
    }

%>
<html>
<body>
<script>

</script>
</body>
</html>
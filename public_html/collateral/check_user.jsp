<%@ page import="com.integrosys.component.user.app.bus.ICommonUser,                 
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,                 
                 com.integrosys.cms.app.sharesecurity.bus.IShareSecurity"%>

 <% boolean userAccess=false;
	boolean isDeletable = false;
	boolean eventCreate = false;
	userAccess=false;
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long teamTypeMembershipID = Long.parseLong(teamTypeMemID);
     
                if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_MAKER 
                		|| teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
                		|| teamTypeMembershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
                		|| teamTypeMembershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH){
                    userAccess = true;
                } else {
                  userAccess=false;
                }

      if(itrxValue.getCollateral() != null){
    
    String subTypeCodeOfCollateralNew = (String)itrxValue.getCollateral().getSCISubTypeValue();
    System.out.println("itrxValue.getCollateral().getSCISubTypeValue()====================>"+subTypeCodeOfCollateralNew);
    
    if("PT701".equals(subTypeCodeOfCollateralNew) || "AB101".equals(subTypeCodeOfCollateralNew) || "AB100".equals(subTypeCodeOfCollateralNew)){
  	  if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_BRANCH_MAKER||teamTypeMembershipID==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH){
            userAccess = true;
        }
    }
      }
    
  	boolean isDeleting = false;
	if (itrxValue.getCollateral()==null) eventCreate=true;
	if (!eventCreate) {
	  	System.out.println("S: "+itrxValue.getCollateral().getStatus()); 
	  	System.out.println("S28: "+ICMSConstant.STATE_DELETED.equalsIgnoreCase(itrxValue.getCollateral().getStatus().trim())); 
	  	System.out.println("S29: "+itrxValue.getStatus().trim());
		if(ICMSConstant.STATE_DELETED.equalsIgnoreCase(itrxValue.getCollateral().getStatus().trim())){
			isDeleting = true;
		}
		System.out.println("Check user + isDeleting=>"+isDeleting);
		/*
	  	if(ICMSConstant.STATE_DELETED.equals(itrxValue.getStatus())||
	  		ICMSConstant.STATE_PENDING_DELETE.equals(itrxValue.getStatus())){
		  	isDeleting = true;
	  	}
	  	
		if(ICMSConstant.STATE_DELETED.equals(itrxValue.getCollateral().getStatus())||
			ICMSConstant.STATE_PENDING_DELETE.equals(itrxValue.getCollateral().getStatus())){
			isDeleting = true;
		}
		*/
	  	isDeletable = false;  
	  	ICollateralLimitMap[] slmArray = itrxValue.getCollateral().getCollateralLimits();
	  	int j=0;
		if(slmArray!=null&&slmArray.length>0){
			//System.out.println("Size of SLM : "+slmArray.length);
			for(int index=0;index<slmArray.length;index++){
				
				if("D".equalsIgnoreCase(slmArray[index].getSCIStatus())){
					//isDeletable = true;
					j++;
				}
			}
		}
		if(slmArray!=null&&slmArray.length>0){
		  if(slmArray.length==j){
			isDeletable = true;
		   }
		}
		System.out.println("Check user + isDeletable=>"+isDeletable);
		/* Commenting off check for GCMS created securities as MBB decision
		IShareSecurity[] shareSecArray = itrxValue.getCollateral().getShareSecArray();
		if(shareSecArray!=null&&shareSecArray.length>0){
			for(int index=0;index<shareSecArray.length;index++){
				if(!"800".equals(shareSecArray[index].getSourceId())){
					isDeletable = false;
					break;
				}
			}
		}
		*/
		
		/*if(isDeleting){
			isDeletable = false;
		}*/
	}
	boolean hasReminder = false;
%>
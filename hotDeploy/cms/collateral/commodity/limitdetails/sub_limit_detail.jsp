<%@ page import="java.util.Iterator,
                 java.math.BigDecimal,
				 java.util.Locale,
				 com.integrosys.base.uiinfra.mapper.MapperUtil,
				 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
				 com.integrosys.cms.app.limit.bus.ILimit,
				 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
				 com.integrosys.cms.app.collateral.bus.type.commodity.sublimit.ISubLimit,
				 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralHelper,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainUtil,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SubLimitUtils,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.list.SubLimitListMapper,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.list.SubLimitListForm,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType,             
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
				 com.integrosys.component.commondata.app.CommonDataSingleton
				 "%>
<%
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	HashMap limitMap  = (HashMap) session.getAttribute(SLUIConstants.CN_COMMODITY_MAIN_ACTION+"."+SLUIConstants.AN_CMDT_LIMIT_MAP);	
	if(limitMap!=null&&!limitMap.isEmpty()){	
		HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
        HashMap sltMap = SubLimitUtils.getSLTMap();
			
		HashMap trxValueMap = (HashMap)session.getAttribute(SLUIConstants.CN_COMMODITY_MAIN_ACTION+"."+SLUIConstants.AN_COMM_MAIN_TRX_VALUE);
		HashMap limitList = (HashMap) trxValueMap.get("limitList");	
		boolean isCMTmaker= CommodityMainUtil.isCurrUserCMTMaker(session);
		SubLimitListForm aForm = (SubLimitListForm)request.getAttribute("SubLimitListForm");
		String[] cashReqQtyArray = aForm.getCashReqQty();
		int limitMapIndex = 0;
		for(Iterator iterator = SubLimitUtils.getSortedLimitDetails(limitMap).iterator();iterator.hasNext();limitMapIndex++){
			ICollateralLimitMap cLimitMap = (ICollateralLimitMap)iterator.next();
			String limitID = CollateralHelper.getColLimitMapLimitID(cLimitMap);
			
			String limitProductType = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, cLimitMap.getLimitType());
			String sciLimitId = null;
			Amount amount = null;
			boolean isInnerLimit = false;
			if (ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER.equals(cLimitMap.getCustomerCategory())) {
				sciLimitId = String.valueOf(cLimitMap.getSCILimitID());
				ILimit limit = (ILimit)limitList.get(limitID);
				amount = limit.getApprovedLimitAmount();
				isInnerLimit = CommodityMainUtil.isInnerLimit(limit);
			} else if (ICMSConstant.CUSTOMER_CATEGORY_CO_BORROWER.equals(cLimitMap.getCustomerCategory())) {
				sciLimitId = String.valueOf(cLimitMap.getSCICoBorrowerLimitID());
				ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(limitID);
				amount = colmt.getApprovedLimitAmount();
				isInnerLimit = CommodityMainUtil.isInnerLimit(colmt);
			}
			
			boolean enableCashReq = false;
			if (cLimitMap.getCashReqPct() != ICMSConstant.DOUBLE_INVALID_VALUE) {		
				enableCashReq = isCMTmaker;
			}				
			ISubLimit[] subLimitArray = cLimitMap.getSubLimit();	
			if(limitMapIndex!=0){
%>
		<tr><td colspan=3>&nbsp;</td></tr>
		<tr><td colspan="3"><hr>&nbsp;</td></tr>
<%		
			}
			if(isView){
%>
			<%@ include file="sub_limit_view.jsp" %>
<%
			}else{
%>
			<%@ include file="sub_limit_update.jsp" %>
<%
			}
		}//end for
	}else{
%>
		<tr><td>There is no limit</td></tr>
<%
	}
%>
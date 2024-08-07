<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBGeneralCharge,
	             com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.io.StringWriter,
                 java.math.BigDecimal,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeUtil,
                 java.util.*"%>

<%@ include file="/collateral/locale.jsp"%>

<%
    try {
        String fromPath = request.getParameter("path");
        ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
        OBGeneralCharge iObj = (OBGeneralCharge)request.getAttribute("drawingPowerCol");

        String fileName = "Drawing_Power_Calculation_Report.rtf";

		VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
        VelocityContext ctx = new VelocityContext();

        ctx.put("ccy", iObj.getCurrencyCode());
        ctx.put("securityID", String.valueOf(iObj.getSCISecurityID()));
		ctx.put("lastUpdateDate", DateUtil.formatDate(locale, itrxValue.getTransactionDate()));
        ctx.put("date", AssetGenChargeUtil.get1stStockValDate(iObj, locale));
                
        Collection customerInfoList = (Collection)request.getAttribute("customerInfoList");
        ctx.put("customerInfoList", customerInfoList);
        
        // stock information
        BigDecimal totalStockType = new BigDecimal(0);
        BigDecimal stockTypeAmt = null;
        
        HashMap stockTypeMap = AssetGenChargeUtil.getTotalStockTypeValue((HashMap)iObj.getStocks(), iObj.getCurrencyCode(), locale, AssetGenChargeUtil.RAW_MATERIAL_TYPE);
        stockTypeAmt = (BigDecimal)stockTypeMap.get("value");
        ctx.put("rawMaterialValue", AssetGenChargeUtil.displayBigDecimalToStrWForex(stockTypeAmt, 0, locale));
        ctx.put("rawMaterialMargin", AssetGenChargeUtil.setMarginDoubleToStr(((BigDecimal)stockTypeMap.get("margin")).doubleValue(), locale));
        
        stockTypeMap = AssetGenChargeUtil.getTotalStockTypeValue((HashMap)iObj.getStocks(), iObj.getCurrencyCode(), locale, AssetGenChargeUtil.FINISHED_GOODS_TYPE);
        stockTypeAmt = (BigDecimal)stockTypeMap.get("value");
        ctx.put("finishedGoodsValue", AssetGenChargeUtil.displayBigDecimalToStrWForex(stockTypeAmt, 0, locale));
        ctx.put("finishedGoodsMargin", AssetGenChargeUtil.setMarginDoubleToStr(((BigDecimal)stockTypeMap.get("margin")).doubleValue(), locale));
        
        stockTypeMap = AssetGenChargeUtil.getTotalStockTypeValue((HashMap)iObj.getStocks(), iObj.getCurrencyCode(), locale, AssetGenChargeUtil.WIP_TYPE);
        stockTypeAmt = (BigDecimal)stockTypeMap.get("value");
        ctx.put("wipValue", AssetGenChargeUtil.displayBigDecimalToStrWForex(stockTypeAmt, 0, locale));
        ctx.put("wipMargin", AssetGenChargeUtil.setMarginDoubleToStr(((BigDecimal)stockTypeMap.get("margin")).doubleValue(), locale));
        
        stockTypeMap = AssetGenChargeUtil.getTotalStockTypeValue((HashMap)iObj.getStocks(), iObj.getCurrencyCode(), locale, AssetGenChargeUtil.GOODS_IN_TRANSIT_TYPE);
        stockTypeAmt = (BigDecimal)stockTypeMap.get("value");
        ctx.put("goodsTransitValue", AssetGenChargeUtil.displayBigDecimalToStrWForex(stockTypeAmt, 0, locale));
        ctx.put("goodsTransitMargin", AssetGenChargeUtil.setMarginDoubleToStr(((BigDecimal)stockTypeMap.get("margin")).doubleValue(), locale));
        
        stockTypeMap = AssetGenChargeUtil.getTotalStockTypeValue((HashMap)iObj.getStocks(), iObj.getCurrencyCode(), locale, AssetGenChargeUtil.STORES_SPARES_TYPE);
        stockTypeAmt = (BigDecimal)stockTypeMap.get("value");
        ctx.put("storesSparesValue", AssetGenChargeUtil.displayBigDecimalToStrWForex(stockTypeAmt, 0, locale));
        ctx.put("storesSparesMargin", AssetGenChargeUtil.setMarginDoubleToStr(((BigDecimal)stockTypeMap.get("margin")).doubleValue(), locale));
        
        stockTypeMap = AssetGenChargeUtil.getTotalStockTypeValue((HashMap)iObj.getStocks(), iObj.getCurrencyCode(), locale, AssetGenChargeUtil.OTHER_MERCHANDISE_TYPE);
        stockTypeAmt = (BigDecimal)stockTypeMap.get("value");
        ctx.put("otherMerchandiseValue", AssetGenChargeUtil.displayBigDecimalToStrWForex(stockTypeAmt, 0, locale));
        ctx.put("otherMerchandiseMargin", AssetGenChargeUtil.setMarginDoubleToStr(((BigDecimal)stockTypeMap.get("margin")).doubleValue(), locale));

        Amount stockGross = iObj.getStockGrossValue();
        ctx.put("totalStockTypeAmt", AssetGenChargeUtil.convertAmtToStringWForex(stockGross, locale));
                       
        Amount stockLessCreditor = iObj.getTotalStockCreditors();
        ctx.put("lessCreditor", AssetGenChargeUtil.convertAmtToStringWForex(stockLessCreditor, locale));
        
        Amount stockNetValue = iObj.getStockNetValue();
        ctx.put("stockNetValue", AssetGenChargeUtil.convertAmtToStringWForex(stockNetValue, locale));
        
        Amount stockRecoverableInsAmt = iObj.getTotalRecoverableStockAmount();
        ctx.put("stockRecoverableInsAmt", AssetGenChargeUtil.convertAmtToStringWForex(stockRecoverableInsAmt, locale));
        
        // debtor information
        Amount debtorGross = iObj.getDebtorGrossValue();
        ctx.put("debtorGross", AssetGenChargeUtil.convertAmtToStringWForex(debtorGross, locale));
                        
        Amount debtorApplicable = iObj.getApplicableDebtAmount();                
        ctx.put("debtorLessOverdue", AssetGenChargeUtil.convertAmtToStringWForex(debtorApplicable, locale));

        Amount debtorOverdueDebtAmt = null;
        if (debtorGross != null) {
            debtorOverdueDebtAmt = (debtorApplicable == null) ? debtorGross : debtorGross.subtract(debtorApplicable);
        }
        ctx.put("lessOverdue", AssetGenChargeUtil.convertAmtToStringWForex(debtorOverdueDebtAmt, locale));        

        if (AssetGenChargeUtil.isForexErrorAmount(stockNetValue)) {
            ctx.put("negativeStockValue", AssetGenChargeUtil.FOREX_ERROR);
        } else if (stockNetValue != null && stockNetValue.getAmountAsBigDecimal() != null &&
        	stockNetValue.getAmountAsBigDecimal().signum() < 0) {
       		ctx.put("negativeStockValue", UIUtil.formatNumberPositiveVal(stockNetValue.getAmountAsBigDecimal().abs(), 0, locale));
        } else {
            ctx.put("negativeStockValue", "-");
        }
        
        Amount applicableDebtorLessNetStock = iObj.getApplicableDebtAmountLessNetStock(debtorApplicable, stockNetValue);
        ctx.put("applicableDebtors", AssetGenChargeUtil.convertAmtToStringWForex(applicableDebtorLessNetStock, locale));

        ctx.put("debtorMargin", AssetGenChargeUtil.setMarginDoubleToStr(iObj.getDebtorMargin(), locale));
        
        Amount debtorNet = iObj.getDebtorNetValue(stockNetValue);
        ctx.put("debtorNet", AssetGenChargeUtil.convertAmtToStringWForex(debtorNet, locale));
        
        // drawing power information - common
        ctx.put("margin", AssetGenChargeUtil.setMarginDoubleToStr(iObj.getMargin(), locale));
        
		if (iObj.getBankShare() != ICMSConstant.DOUBLE_INVALID_VALUE) {
			String bankShare = MapperUtil.mapDoubleToString(iObj.getBankShare(), 2, locale);
			ctx.put("bankShare", bankShare);
		} else {
			ctx.put("bankShare", "");			
		}

		Amount maxAppliedAppLimit = iObj.getTotalAppliedLimitAmount();
		ctx.put("maxAppliedAppLimit", AssetGenChargeUtil.convertAmtToStringWForex(maxAppliedAppLimit, locale));
		
		Amount releasedLimit = iObj.getTotalReleasedLimitAmount();
		ctx.put("releasedLimit", AssetGenChargeUtil.convertAmtToStringWForex(releasedLimit, locale));
		
		// drawing power - After Netting Insurance
		Amount drawingPowerGross = iObj.getCalculatedDrawingPowerLessInsrGrossAmount(stockGross, stockLessCreditor, stockNetValue, debtorNet, stockRecoverableInsAmt);
		ctx.put("drawingPowerGross", AssetGenChargeUtil.convertAmtToStringWForex(drawingPowerGross, locale));
				
		Amount bankShareAmt = iObj.getBankShareAmount(drawingPowerGross);
		ctx.put("bankShareAmt", AssetGenChargeUtil.convertAmtToStringWForex(bankShareAmt, locale));
						
		Amount drawingPowerNet = iObj.getDrawingPowerNetAmount(bankShareAmt);
		ctx.put("drawingPowerNet", AssetGenChargeUtil.convertAmtToStringWForex(drawingPowerNet, locale));
		
		Amount drawingPower = iObj.getDrawingPower(drawingPowerNet, maxAppliedAppLimit);
		ctx.put("drawingPower", AssetGenChargeUtil.convertAmtToStringWForex(drawingPower, locale));
				
		if (AssetGenChargeUtil.isForexErrorAmount(drawingPower) ||
			AssetGenChargeUtil.isForexErrorAmount(releasedLimit)) {		
			ctx.put("deficit", AssetGenChargeUtil.FOREX_ERROR);
		} else if (drawingPower != null && releasedLimit != null) {
			if (drawingPower.getAmount() >= releasedLimit.getAmount()) {
				ctx.put("deficit", "-");
			} else {			
				ctx.put("deficit", UIUtil.formatNumber(releasedLimit.getAmountAsBigDecimal().subtract(drawingPower.getAmountAsBigDecimal()), 0, locale));
			}
		} else {
			ctx.put("deficit", "");
		}
		
		// drawing power - Without Netting Insurance
		Amount drawingPowerGrossWOIns = iObj.getCalculatedDrawingPowerGrossAmount(stockGross, stockLessCreditor, stockNetValue, debtorNet);
		ctx.put("drawingPowerGrossWOIns", AssetGenChargeUtil.convertAmtToStringWForex(drawingPowerGrossWOIns, locale));
				
		Amount bankShareAmtWOIns = iObj.getBankShareAmount(drawingPowerGrossWOIns);
		ctx.put("bankShareAmtWOIns", AssetGenChargeUtil.convertAmtToStringWForex(bankShareAmtWOIns, locale));
						
		Amount drawingPowerNetWOIns = iObj.getDrawingPowerNetAmount(bankShareAmtWOIns);
		ctx.put("drawingPowerNetWOIns", AssetGenChargeUtil.convertAmtToStringWForex(drawingPowerNetWOIns, locale));
		
		Amount drawingPowerWOIns = iObj.getDrawingPower(drawingPowerNetWOIns, maxAppliedAppLimit);
		ctx.put("drawingPowerWOIns", AssetGenChargeUtil.convertAmtToStringWForex(drawingPowerWOIns, locale));
		
		if (AssetGenChargeUtil.isForexErrorAmount(drawingPowerWOIns) ||
			AssetGenChargeUtil.isForexErrorAmount(releasedLimit)) {		
			ctx.put("deficitWOIns", AssetGenChargeUtil.FOREX_ERROR);
		} else if (drawingPowerWOIns != null && releasedLimit != null) {
			if (drawingPower.getAmount() >= releasedLimit.getAmount()) {
				ctx.put("deficitWOIns", "-");
			} else {			
				ctx.put("deficitWOIns", UIUtil.formatNumber(releasedLimit.getAmountAsBigDecimal().subtract(drawingPowerWOIns.getAmountAsBigDecimal()), 0, locale));
			}
		} else {
			ctx.put("deficitWOIns", "");
		}

		// insurance stocks		
		Amount totalValidStock = iObj.getTotalValidStockInsrAmount();
		ctx.put("totalValidStock", AssetGenChargeUtil.convertAmtToStringWForex(totalValidStock, locale));		
				

		if (AssetGenChargeUtil.isForexErrorAmount(stockGross)) {
			ctx.put("insuranceShortfall", AssetGenChargeUtil.FOREX_ERROR);
		} else if (stockGross != null) {
			if (AssetGenChargeUtil.isForexErrorAmount(totalValidStock)) {
				ctx.put("insuranceShortfall", AssetGenChargeUtil.FOREX_ERROR);
			} else {
				Amount insuranceShortfall = (totalValidStock == null) ? stockGross : stockGross.subtract(totalValidStock);
				if (AssetGenChargeUtil.isAmountNegativeValue(insuranceShortfall)) {
					ctx.put("insuranceShortfall", "-");
				} else {
					ctx.put("insuranceShortfall", AssetGenChargeUtil.convertAmtToStringWForex(insuranceShortfall, locale));
				}
			}			
		} else {
			ctx.put("insuranceShortfall", "");
		}
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
        response.addHeader("Content-disposition", "attachment; filename="+fileName);
        response.getOutputStream().write(cont);
        response.flushBuffer();
    } catch (Exception e) {
            e.printStackTrace();
            out.println("An error has occurred while exporting the report.<BR>" + e.toString());
    }

%>

<html>
<body>
<script>

</script>
</body>
</html>
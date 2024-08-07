<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBGeneralCharge,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 java.io.StringWriter,
                 java.math.BigDecimal,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeUtil,
                 java.util.*"%>

<%@ include file="/collateral/locale.jsp"%>

<%
    try {
        String fromPath = request.getParameter("path");
       
        OBGeneralCharge iObj = (OBGeneralCharge)request.getAttribute("drawingPowerCol");
		
        String fileName = "InsuranceReminderLetter.rtf";

		VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
        VelocityContext ctx = new VelocityContext();
        
        String date = DateUtil.formatDate("dd MMM yyyy",new Date());
        ctx.put("sysdate", date);
        
		ctx.put("date", AssetGenChargeUtil.get1stStockValDate(iObj, locale));        
		
        ctx.put("securityID", Long.toString(iObj.getSCISecurityID()));
        
        Collection customerInfoList = (Collection)request.getAttribute("customerInfoList");
        ctx.put("customerInfoList", customerInfoList);
        
        Amount totalStock = iObj.getStockGrossValue();
        ctx.put("totalStockAmt", UIUtil.formatAmount(totalStock, 0, locale));
        
        Amount totalValidStock = iObj.getTotalValidStockInsrAmount();
        
        if (totalValidStock == null) {
	        ctx.put("totalValidStockAmt", "-");
        } else {
			ctx.put("totalValidStockAmt", UIUtil.formatAmount(totalValidStock, 0, locale));                
		}
		
		if (totalStock != null && totalValidStock != null) {
			if (totalValidStock.getAmount() > totalStock.getAmount()) {
				ctx.put("totalShortfallAmt", "-");
			} else {
				ctx.put("totalShortfallAmt", UIUtil.formatAmount(new Amount(totalStock.getAmountAsBigDecimal().subtract(totalValidStock.getAmountAsBigDecimal()), new CurrencyCode(iObj.getCurrencyCode())), 0, locale));
			}
		} else if (totalStock != null && totalValidStock == null) {
			ctx.put("totalShortfallAmt", UIUtil.formatAmount(totalStock, 0, locale));
		} else {
			ctx.put("totalShortfallAmt", "-");
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
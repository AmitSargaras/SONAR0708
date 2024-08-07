<%@ page import="java.util.Properties,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.Date,
                 java.io.StringWriter,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoAction,
                 com.integrosys.cms.app.commodity.deal.bus.purchasesales.IPurchaseAndSalesDetails,
                 com.integrosys.cms.app.commodity.deal.bus.purchasesales.IPurchaseDetails,
                 com.integrosys.cms.app.commodity.deal.bus.purchasesales.ISalesDetails,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.app.commodity.main.bus.profile.ISupplier,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 java.util.Locale,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.commodity.main.bus.profile.IBuyer,
                 com.integrosys.cms.app.commodity.common.Quantity,
                 com.integrosys.cms.app.commodity.common.QuantityConversionRate,
                 java.util.Collection,
                 java.math.BigDecimal,
                 com.integrosys.cms.ui.common.UIUtil"%>
<%
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    String armCode = session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.ARM_Code") == null ? "" : (String)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.ARM_Code");
    String from_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.from_event");
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    ICommodityDeal dealObj;
    if (from_event.equals(GeneralInfoAction.EVENT_READ)) {
        dealObj = trxValue.getCommodityDeal();
    } else {
        dealObj = trxValue.getStagingCommodityDeal();
    }

    IProfile profile = (IProfile)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.profileService");
    Collection dealSummary = (Collection)request.getAttribute("dealSummary");
    Collection limitSummary = (Collection)request.getAttribute("limitSummary");
    String totalAppLimit = (String)request.getAttribute("totalAppLimit");
    String totalActivatedLimit = (String)request.getAttribute("totalActivatedLimit");
    String totalOpLimit = (String)request.getAttribute("totalOpLimit");
    try {
        String fileName = "Approval_Sheet.rtf";

        VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
        VelocityContext ctx = new VelocityContext();

        ctx.put("customerLeID", customer.getCMSLegalEntity().getLEReference());
        ctx.put("customerName", customer.getCustomerName());
        ctx.put("armCode", armCode);

        IPurchaseAndSalesDetails purchaseSale = dealObj.getPurchaseAndSalesDetails();
        IPurchaseDetails purchase = null;
        ISalesDetails sales = null;
        if (purchaseSale != null) {
            purchase = purchaseSale.getPurchaseDetails();
            sales = purchaseSale.getSalesDetails();
        }

        String supplier = "";
        String description = "";
        String qty = "";
        String unitPrice = "";
        String totalValue = "";
        String shipmentDue = "";
        String expiryDate = "";
        String ttClaim = "";
        BigDecimal total = null;
        Amount unitPriceAmt = null;
        if (profile != null) {
            CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
            description = categoryList.getCommProductItem(profile.getCategory(), profile.getProductType());
            description = description +"/"+profile.getProductSubType();
        }
        if (purchase != null) {
            if (purchase.getSupplier() != null) {
                supplier = purchase.getSupplier().getName();
            }
            if (supplier == null || supplier.length() == 0) {
                supplier = purchase.getOtherSupplierName();
            }
            shipmentDue = DateUtil.formatDate(locale, purchase.getShipDate());
            expiryDate = DateUtil.formatDate(locale, purchase.getExpiryDate());
            if (purchase.getIsClaimAllowed()) {
                ttClaim = "Yes "+String.valueOf(purchase.getNoDaysClaimed())+" Days";
            } else {
                ttClaim = "No";
            }

            Quantity purchaseQty = purchase.getQuantity();
            total = null;
            if (purchaseQty != null) {
                qty = (UIUtil.formatNumber(purchaseQty.getQuantity(), 4, locale));
                if (purchaseQty.getUnitofMeasure() != null) {
                    qty = qty +" "+purchaseQty.getUnitofMeasure().getLabel();
                }
                QuantityConversionRate marketRate = dealObj.getContractMarketUOMConversionRate();
                if (marketRate != null) {
                    Quantity marketQty = (Quantity)marketRate.convert(purchaseQty);
                    total = marketQty.getQuantity();
                }
            }
            unitPriceAmt = purchase.getUnitPrice();
            if (unitPriceAmt != null && total != null) {
                unitPrice = unitPriceAmt.getCurrencyCode();
                unitPrice = unitPrice+" "+MapperUtil.mapDoubleToString(unitPriceAmt.getAmount(), 6, locale);
                total = total.multiply(unitPriceAmt.getAmountAsBigDecimal());
                totalValue = unitPriceAmt.getCurrencyCode()+" "+UIUtil.formatNumber(total, 6 ,locale);
            }

        }
        ctx.put("purchaseSupplier", supplier);
        ctx.put("purchaseShipDate", shipmentDue);
        ctx.put("purchaseExpiryDate", expiryDate);
        ctx.put("purchaseTTClaim", ttClaim);
        ctx.put("purchase", purchase);


/*
        if (dealObj.getContractQuantity() != null) {
            QuantityConversionRate marketRate = dealObj.getContractMarketUOMConversionRate();
            if (marketRate != null) {
                try {
                    Quantity marketUnit = (Quantity)marketRate.convert(dealObj.getContractQuantity());
                    total = marketUnit.getQuantity();
                } catch (Exception e) {
                    throw new Exception(e.getMessage());
                }
            }
            qty = UIUtil.formatNumber(dealObj.getContractQuantity().getQuantity(), 4, locale);
            qty = qty + " "+dealObj.getContractQuantity().getUnitofMeasure().getLabel();
        }
        ctx.put("purchaseQty", qty);
        Amount unitPriceAmt = dealObj.getContractPrice();
        if (unitPriceAmt != null && unitPriceAmt.getCurrencyCode() != null && total != null) {
            unitPrice = unitPriceAmt.getCurrencyCode();
            unitPrice = unitPrice + " "+MapperUtil.mapDoubleToString(unitPriceAmt.getAmount(), 6, locale);
            total = total.multiply(unitPriceAmt.getAmountAsBigDecimal());
            totalValue = unitPriceAmt.getCurrencyCode()+" "+UIUtil.formatNumber(total, 6, locale);
        }
*/
        ctx.put("purchaseQty", qty);
        ctx.put("purchaseUnitPrice", unitPrice);
        ctx.put("purchaseTotalVal", totalValue);

        qty = "";
        unitPrice = "";
        totalValue = "";
        shipmentDue = "";
        expiryDate = "";
        ttClaim = "";
        String buyer = "";
        if (sales != null) {
            if (sales.getBuyer() != null) {
                buyer = sales.getBuyer().getName();
            }
            if (buyer == null || buyer.length() == 0) {
                buyer = sales.getOtherBuyerName();
            }
            Quantity salesQty = sales.getQuantity();
            total = null;
            if (salesQty != null) {
                qty = (UIUtil.formatNumber(salesQty.getQuantity(), 4, locale));
                if (salesQty.getUnitofMeasure() != null) {
                    qty = qty +" "+salesQty.getUnitofMeasure().getLabel();
                }
                QuantityConversionRate marketRate = dealObj.getContractMarketUOMConversionRate();
                if (marketRate != null) {
                    Quantity marketQty = (Quantity)marketRate.convert(salesQty);
                    total = marketQty.getQuantity();
                }                
            }
            unitPriceAmt = sales.getUnitPrice();
            if (unitPriceAmt != null && total != null) {
                unitPrice = unitPriceAmt.getCurrencyCode();
                unitPrice = unitPrice+" "+MapperUtil.mapDoubleToString(unitPriceAmt.getAmount(), 6, locale);
                total = total.multiply(unitPriceAmt.getAmountAsBigDecimal());
                totalValue = unitPriceAmt.getCurrencyCode()+" "+UIUtil.formatNumber(total, 6 ,locale);
            }

            shipmentDue = DateUtil.formatDate(locale, sales.getShipDate());
            expiryDate = DateUtil.formatDate(locale, sales.getExpiryDate());
            if (sales.getIsClaimAllowed()) {
                ttClaim = "Yes "+String.valueOf(sales.getNoDaysClaimed())+" Days";
            } else {
                ttClaim = "No";
            }
        }
        ctx.put("salesBuyer", buyer);
        ctx.put("description", description);
        ctx.put("salesQty", qty);
        ctx.put("salesUnitPrice", unitPrice);
        ctx.put("salesTotalVal", totalValue);
        ctx.put("salesShipDate", shipmentDue);
        ctx.put("salesExpiryDate", expiryDate);
        ctx.put("salesTTClaim", ttClaim);
        ctx.put("sales", sales);

        ctx.put("dealSummary", dealSummary);
        ctx.put("limitSummary", limitSummary);
        ctx.put("totalAppLimit", totalAppLimit);
        ctx.put("totalActivatedLimit", totalActivatedLimit);
        ctx.put("totalOpLimit", totalOpLimit);

        StringWriter sw = new StringWriter();
        velocityEngine.mergeTemplate(fileName,ctx,sw);
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
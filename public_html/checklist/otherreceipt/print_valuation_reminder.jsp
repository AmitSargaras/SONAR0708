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
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Date,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.collateral.bus.type.property.IPropertyCollateral,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.agricultural.IAgricultural,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.comgeneral.ICommercialGeneral,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.comshophouse.ICommercialShopHouse,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.industrial.IIndustrial,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.resluxury.IResidentialLuxury,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.resstandard.IResidentialStandard,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.specialhotel.ISpecialPurposeHotel,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.specialothers.ISpecialPurposeOthers,
                 com.integrosys.cms.ui.collateral.property.LandAreaUOMList,                 
                 java.util.StringTokenizer,
                 java.util.Locale"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.property.subtype.serviceapartment.ICommercialServiceApartment"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.property.subtype.industrialspecial.IIndustrialSpecial"%>
<%    
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    ICheckListItem chkListItem = (ICheckListItem)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.checkListItem");
    IPropertyCollateral col = (IPropertyCollateral)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.collateral");
try {
    String fileName = "valuation_letter_reminder.rtf";
    
    String purchasePrice = "-";
    if(col.getSalePurchaseValue() != null)
    {
        purchasePrice = col.getSalePurchaseValue().getCurrencyCode() + " " + CurrencyManager.convertToString(locale, col.getSalePurchaseValue());
    }
    
    String valuationCMV = "-";
    if (col.getCMV() != null)
    {
        valuationCMV = col.getCMV().getCurrencyCode() + " " + CurrencyManager.convertToString(locale, col.getCMV());
    }
       
    String landAreaUOM = "";
    if (col.getLandAreaUOM() != null)
    {
        landAreaUOM = LandAreaUOMList.getInstance().getLandAreaUOMItem(col.getLandAreaUOM());
    }
    
    String tenure = "";
    if (col.getTenureUnit() != null) 
    {
        if (col.getTenureUnit().startsWith("L")) 
        {
            tenure = "Leasehold " + col.getTenure() + " year(s)";
        }
        else 
        { 
            tenure = "Freehold";
        }
    }
    
    System.out.println("SubType: " + col.getCollateralSubType().getSubTypeCode());
    String builtInArea = "-";
    if (ICMSConstant.COLTYPE_PROP_AGRICULTURAL.equals(col.getCollateralSubType().getSubTypeCode()))
    {
        builtInArea = ((IAgricultural)col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((IAgricultural)col).getBuiltupAreaUOM());       
    }
    else if (ICMSConstant.COLTYPE_PROP_COM_GENERAL.equals(col.getCollateralSubType().getSubTypeCode()))
    {
        builtInArea = ((ICommercialGeneral)col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((ICommercialGeneral)col).getBuiltupAreaUOM());       
    }
    else if (ICMSConstant.COLTYPE_PROP_COM_SHOP_HOUSE.equals(col.getCollateralSubType().getSubTypeCode()))
    {
        builtInArea = ((ICommercialShopHouse)col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((ICommercialShopHouse)col).getBuiltupAreaUOM());               
    }
    else if (ICMSConstant.COLTYPE_PROP_INDUSTRIAL.equals(col.getCollateralSubType().getSubTypeCode()))
    {
        builtInArea = ((IIndustrial)col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((IIndustrial)col).getBuiltupAreaUOM());               
    }
	else if (ICMSConstant.COLTYPE_PROP_SPEC_SERVICE_APT.equals(col.getCollateralSubType().getSubTypeCode()))
    {    // todo check this out
        builtInArea = (( ICommercialServiceApartment )col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((ICommercialServiceApartment)col).getBuiltupAreaUOM());
    }
    else if (ICMSConstant.COLTYPE_PROP_SPEC_INDUSTRIAL.equals(col.getCollateralSubType().getSubTypeCode()))
    {    // todo check this out
        builtInArea = (( IIndustrialSpecial )col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((IIndustrialSpecial)col).getBuiltupAreaUOM());               
    }
	else if (ICMSConstant.COLTYPE_PROP_RES_LUXURY.equals(col.getCollateralSubType().getSubTypeCode()))
    {
        builtInArea = ((IResidentialLuxury)col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((IResidentialLuxury)col).getBuiltupAreaUOM());               
    }
    else if (ICMSConstant.COLTYPE_PROP_RES_STANDARD.equals(col.getCollateralSubType().getSubTypeCode()))
    {
        System.out.println("BuildUp Area Unit: " + ((IResidentialStandard)col).getBuiltupAreaUOM());
        builtInArea = ((IResidentialStandard)col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((IResidentialStandard)col).getBuiltupAreaUOM());               
    }    
    else if (ICMSConstant.COLTYPE_PROP_SPEC_HOTEL.equals(col.getCollateralSubType().getSubTypeCode()))
    {
        builtInArea = ((ISpecialPurposeHotel)col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((ISpecialPurposeHotel)col).getBuiltupAreaUOM());               
    }
    else if (ICMSConstant.COLTYPE_PROP_SPEC_OTHERS.equals(col.getCollateralSubType().getSubTypeCode()))
    {
        builtInArea = ((ISpecialPurposeOthers)col).getBuiltupArea() + " " + LandAreaUOMList.getInstance().getLandAreaUOMItem(((ISpecialPurposeOthers)col).getBuiltupAreaUOM());               
    }
    

    VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
    VelocityContext ctx = new VelocityContext();

    ctx.put("col", col);    
    ctx.put("user", user);
    ctx.put("valuation", col.getValuation());    
    ctx.put("salePurchaseValue", purchasePrice);
    ctx.put("valuationCMV", valuationCMV);
    ctx.put("landAreaUOM", landAreaUOM);
    ctx.put("tenure",tenure);
    ctx.put("builtInArea", builtInArea);
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
    response.addHeader("Content-disposition", "attachment; filename="+"valuation_letter_reminder.rtf");
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
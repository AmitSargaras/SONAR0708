<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.IGuaranteeCollateral,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.io.StringWriter,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.*"%>

<%@ include file="/collateral/locale.jsp"%>

<%
    try {
        String fromPath = request.getParameter("path");
        ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.serviceColObj");
        IGuaranteeCollateral iObj = (IGuaranteeCollateral)itrxValue.getCollateral();

        String fileName = request.getParameter("doc")+".rtf";

		VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
        VelocityContext ctx = new VelocityContext();
        String date = DateUtil.formatDate("dd MMM yyyy",new Date());
        ctx.put("date", date);

        ICollateralPledgor[] pledgor = iObj.getPledgors();
        Collection pledgorName = new ArrayList();
        for (int i = 0; i < pledgor.length; i++) {
            pledgorName.add(pledgor[i].getPledgorName());
        }
        ctx.put("pledgorName", pledgorName);

        String customerName = (String)request.getAttribute("customerName");
        ctx.put("customerName", customerName);

        String refNo = iObj.getReferenceNo();
        ctx.put("refNo", refNo);
        String guaranteeAmt = "";
        if (iObj.getGuaranteeAmount() != null && iObj.getGuaranteeAmount().getCurrencyCode() != null) {
            guaranteeAmt = iObj.getGuaranteeCcyCode() +" "+CurrencyManager.convertToString(locale, iObj.getGuaranteeAmount());
        }
        ctx.put("guaranteeAmt", guaranteeAmt);
        String issuerName = iObj.getIssuingBank();
        ctx.put("issuerName", issuerName);
        String beneficiaryName = iObj.getBeneficiaryName();
        ctx.put("beneficiaryName", beneficiaryName);
        String issueDate = DateUtil.formatDate(locale, iObj.getGuaranteeDate());
        ctx.put("issueDate", issueDate);
        String expiryDate = DateUtil.formatDate(locale, iObj.getCollateralMaturityDate());
        ctx.put("expiryDate", expiryDate);

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
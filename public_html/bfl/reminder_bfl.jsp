<%@ page import="java.util.Properties,
				 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.IGuaranteeCollateral,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.io.StringWriter,
                 java.util.Date,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.trx.ILimitProfileTrxValue,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.customer.bus.IContact,
                 com.integrosys.cms.ui.common.CountryList"%>



<%
    try {

        OBCMSCustomer test = (OBCMSCustomer)request.getAttribute("customerOb");
        String reminder = (String)request.getAttribute("reminder");
        ILimitProfileTrxValue iLimitProfileTrxVal = (ILimitProfileTrxValue)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.trxValue");
        String fileName = new String();
        fileName = "BFL_os_reminder.rtf";


         	IContact address[]= test.getOfficialAddresses();
                String   add1=new String();
                String add2=new String();
                String city=new String();
                String postalcd=new String();
                String state=new String();
                String country=new String();
                String customerName= new String();
                if(test.getCustomerName()!=null)
                    customerName=test.getCustomerName();

				if(address!=null && address.length>0)
                    {
                          if(address[0].getAddressLine1()!=null)
                            add1 = address[0].getAddressLine1();
                        if(address[0].getAddressLine2()!=null)
                            add2 = address[0].getAddressLine2();
                         if(address[0].getCity()!=null)
                            city =address[0].getCity();
                         if(address[0].getPostalCode()!=null)
                            postalcd = address[0].getPostalCode();
                        if(address[0].getState()!=null)
                            state =  address[0].getState();
                        if(address[0].getCountryCode()!=null)
                            country =  CountryList.getInstance().getCountryName(address[0].getCountryCode()) ;

                    }

        ILimitProfile  iLimitProfile = (ILimitProfile)request.getAttribute("limitprofileOb");
          Properties p = new Properties();

		VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
          
        VelocityContext ctx = new VelocityContext();
        String date = DateUtil.formatDate("dd MMM yyyy",new Date());
        ctx.put("customerName", customerName);
        ctx.put("date", date);
        ctx.put("add1",add1);
        ctx.put("add2",add2);
        ctx.put("city",city);
        ctx.put("postalcd",postalcd);
        ctx.put("state",state);
        ctx.put("country",country);

        StringWriter sw = new StringWriter();
        velocityEngine.mergeTemplate(fileName, ctx, sw);
        byte cont[] = sw.toString().getBytes();
        String strMime = "application/rtf";
        // Clear out response stream
        response.reset();

        // Set the browser's mime type
        response.setContentType(strMime);

        // Ensure the browser's page to expect a file
        response.setHeader("Expires", "0");
        response.addHeader("Content-disposition", "attachment; filename="+"BFL_os-reminder.rtf");
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
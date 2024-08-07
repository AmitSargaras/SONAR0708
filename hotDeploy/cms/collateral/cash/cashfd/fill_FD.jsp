
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%
//String utilizedAmunt =  (String) request.getAttribute("utilizedAmunt");
String utilizedAmunt = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.utilizedAmunt");
DecimalFormat dft1 = new DecimalFormat("#0.000");
double d1 = Double.parseDouble(utilizedAmunt);
utilizedAmunt = dft1.format(d1);
utilizedAmunt = "Total utilized Amount is "+utilizedAmunt;
String fixed_dep_date="",mat_date="",ver_date="",yyyy="",mm="",dd="";
String fdWebServiceFlag=(String)request.getAttribute("fdWebServiceFlag");
DefaultLogger.debug(this,"fdWebServiceFlag:"+fdWebServiceFlag);
if("N".equalsIgnoreCase(fdWebServiceFlag)){
String cashDeposit=(String)request.getAttribute("cashDeposit");
fixed_dep_date=cashDeposit.split(",")[1];
yyyy=fixed_dep_date.split("-")[0];
mm=fixed_dep_date.split("-")[1];
dd=fixed_dep_date.split("-")[2];
dd=dd.replace(' ','-');
dd=dd.replace('.','-');
dd=dd.split("-")[0];
fixed_dep_date=yyyy+"-"+mm+"-"+dd;
SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat format2 = new SimpleDateFormat("dd/MMM/yyyy");
Date d=format1.parse(fixed_dep_date);
fixed_dep_date=format2.format(d).toString();
//-------------------------------------------
mat_date=cashDeposit.split(",")[2];
yyyy=mat_date.split("-")[0];
mm=mat_date.split("-")[1];
dd=mat_date.split("-")[2];
dd=dd.replace(' ','-');
dd=dd.replace('.','-');
dd=dd.split("-")[0];
mat_date=yyyy+"-"+mm+"-"+dd;
d=format1.parse(mat_date);
mat_date=format2.format(d).toString();
//-------------------------------------------

ver_date=cashDeposit.split(",")[4];

if(!"n".equals(ver_date)){
yyyy=ver_date.split("-")[0];
mm=ver_date.split("-")[1];
dd=ver_date.split("-")[2];
dd=dd.replace(' ','-');
dd=dd.replace('.','-');
dd=dd.split("-")[0];
ver_date=yyyy+"-"+mm+"-"+dd;
d=format1.parse(ver_date);
ver_date=format2.format(d).toString();
}
else{
ver_date="";
}
%>
document.getElementById("depAmt").value='<%= UIUtil.formatWithCommaAndDecimal(cashDeposit.split(",")[0]) %>';
document.getElementById("depositorName").value='<%= cashDeposit.split(",")[5] %>';
document.getElementById("issueDate").value='<%= fixed_dep_date %>';
document.getElementById("depMatDate").value='<%= mat_date %>';
document.getElementById("depositeInterestRate").value='<%= cashDeposit.split(",")[3] %>';
document.getElementById("ver_date").value='<%= ver_date %>';
document.getElementById("depositRefNo").value=document.getElementById("rec").value;
document.getElementById('utilizedAmunt').innerHTML = '<%= utilizedAmunt %>';
document.getElementById("radioSelect").value='Y';
exchangeRateINRCal();

<%} else if("Y".equalsIgnoreCase(fdWebServiceFlag)){
	
	 Map map=(HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.fdMap");
		DefaultLogger.debug(this,"fdMap:"+map);
	if(null!=map && !map.isEmpty()){
		if(null!=map.get("errorMessage") && "".equals(map.get("errorMessage")) ){
	fixed_dep_date=(String)map.get("issueDate");
	
	mat_date=(String)map.get("depositeMaturityDate");
%>
	document.getElementById("depAmt").value='<%= UIUtil.formatWithCommaAndDecimal((String)map.get("depositeAmt"))%>';
	document.getElementById("depositorName").value='<%= map.get("depositorName") %>';
    document.getElementById("issueDate").value='<%= fixed_dep_date %>';
	document.getElementById("depMatDate").value='<%= mat_date %>';
	document.getElementById("depositeInterestRate").value='<%= map.get("depositeInterestRate") %>';
	document.getElementById("depositRefNo").value='<%=map.get("depositorNo")  %>';
	document.getElementById('utilizedAmunt').innerHTML = '<%= utilizedAmunt %>';
	
	exchangeRateINRCal();
	<%}}}%>


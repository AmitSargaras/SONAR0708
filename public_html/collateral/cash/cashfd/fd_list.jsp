<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>

<%
String fixed_dep_date="",mat_date="",yyyy="",mm="",dd="";
SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat format2 = new SimpleDateFormat("dd/MMM/yyyy");

String fdWebServiceFlag=(String)request.getAttribute("fdWebServiceFlag");
DefaultLogger.debug(this,"fdWebServiceFlag:"+fdWebServiceFlag);
 %>
 <% if(fdWebServiceFlag!=null && "N".equalsIgnoreCase(fdWebServiceFlag)){ %>
	
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
<thead>
<tr>
<td>Select</td>
<td>Party Name</td>
<td>Depositor Name</td>
<td>Security ID</td>
<td>Deposit Amount</td>
<td>Lien Amount</td>
<td>Deposit Date</td>
<td>Maturity Date</td>
<td>Interest Rate</td>
</tr>
</thead>
<%
List l=(List)request.getAttribute("fdList");
Iterator it=l.iterator();
String st="";
if(null!=l){
while(it.hasNext()){
st=(String)it.next();
%>
 <tr>
 <td><input type="radio" name="radio" onclick="fillFD(this.value)" value="<%=st.split(",")[0]%>"/></td>
  <td>
<%
String party_name="-";
if(null==st.split(",")[8]||st.split(",")[8].equals("null")){
%>
<%= party_name %>
<%}else{ %>
<%= st.split(",")[8] %>
<%} %>
 </td>
 <td>
<%
String depositor_name="-";
if(null==st.split(",")[1]||st.split(",")[1].equals("null")){
%>
<%= depositor_name %>
<%}else{ %>
<%= st.split(",")[1] %>
<%} %>
 </td>
 <td><%=st.split(",")[2]%></td>
 <td><%=UIUtil.formatWithCommaAndDecimal(st.split(",")[3])%></td> 
 <td><%=st.split(",")[4]%></td> 
 <td>
 <%
 fixed_dep_date=st.split(",")[5];
yyyy=fixed_dep_date.split("-")[0];
mm=fixed_dep_date.split("-")[1];
dd=fixed_dep_date.split("-")[2];
dd=dd.replace(' ','-');
dd=dd.replace('.','-');
dd=dd.split("-")[0];
fixed_dep_date=yyyy+"-"+mm+"-"+dd;
Date d=format1.parse(fixed_dep_date);
fixed_dep_date=format2.format(d).toString();%>
<%= fixed_dep_date %>
 <td><%
 mat_date=st.split(",")[6];
yyyy=mat_date.split("-")[0];
mm=mat_date.split("-")[1];
dd=mat_date.split("-")[2];
dd=dd.replace(' ','-');
dd=dd.replace('.','-');
dd=dd.split("-")[0];
mat_date=yyyy+"-"+mm+"-"+dd;
d=format1.parse(mat_date);
mat_date=format2.format(d).toString();%>
<%= mat_date %>
 </td>
 <td><%=st.split(",")[7]%></td>
 </tr>
<%}}%>
<%if(null==l||l.isEmpty()){ %>
<tr class="odd"><td width="100%" colspan="9" align="center">No records found</td></tr>
<%} %>
</table>
 <% }%>
 <% if(fdWebServiceFlag!=null && "Y".equalsIgnoreCase(fdWebServiceFlag)){ %>
 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
 <%
 //HashMap fdMap=(HashMap)session.getAttribute("fdMap");
 //Map fdMap=(HashMap)request.getAttribute("fdMap");
 Map fdMap=(HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.fdMap");
 DefaultLogger.debug(this,"fdMap:"+fdMap);
 /*pageContext.setAttribute("newfdMap",fdMap,PageContext.SESSION_SCOPE);
 session.setAttribute("newfdMap",fdMap); */

 if(fdMap!=null && !fdMap.isEmpty()){%>
	 
	 <thead>
		<tr>
		<td>Select</td>
		<td>Depositor Name</td>
		<td>Deposit No.</td>
		<td>Deposit Amount</td>
		<td>Deposit Date</td>
		<td>Maturity Date</td>
		<td>Interest Rate</td>
		</tr>
	</thead>
	 
	 <%if(null!=fdMap.get("errorMessage") && "".equals(fdMap.get("errorMessage")) ){
 %>

 <tr>
 <td><input type="button" name="Confirm" onclick="fillDetailForFD('<%=fdMap.get("depositorNo")%>','<%=fdWebServiceFlag %>')" value="Confirm"/></td>
 <td><%=fdMap.get("depositorName")%></td>
<td><%=fdMap.get("depositorNo")%></td>
<td><%=fdMap.get("depositeAmt")%></td>
<td><%=fdMap.get("issueDate")%></td> 
<td><%=fdMap.get("depositeMaturityDate")%></td> 
<td><%=fdMap.get("depositeInterestRate")%></td>
</tr>
<%} else{
	String errorMessage=(String)fdMap.get("errorMessage"); %>
	<tr class="odd"><td width="100%" colspan="9" align="center"><%=fdMap.get("errorMessage") %></td></tr>
<% }}else{%>
	
	<thead>
	<tr>
	<td>Select</td>
	<td>Party Name</td>
	<td>Depositor Name</td>
	<td>Security ID</td>
	<td>Deposit Amount</td>
	<td>Lien Amount</td>
	<td>Deposit Date</td>
	<td>Maturity Date</td>
	<td>Interest Rate</td>
	</tr>
	</thead>
	<%
	List l=(List)request.getAttribute("fdList");
	Iterator it=l.iterator();
	String st="";
	if(null!=l){
	while(it.hasNext()){
	st=(String)it.next();
	%>
	 <tr>
	 <td><input type="radio" name="radio" onclick="fillFD(this.value)" value="<%=st.split(",")[0]%>"/></td>
	  <td>
	<%
	String party_name="-";
	if(null==st.split(",")[8]||st.split(",")[8].equals("null")){
	%>
	<%= party_name %>
	<%}else{ %>
	<%= st.split(",")[8] %>
	<%} %>
	 </td>
	 <td>
	<%
	String depositor_name="-";
	if(null==st.split(",")[1]||st.split(",")[1].equals("null")){
	%>
	<%= depositor_name %>
	<%}else{ %>
	<%= st.split(",")[1] %>
	<%} %>
	 </td>
	 <td><%=st.split(",")[2]%></td>
	 <td><%=st.split(",")[3]%></td> 
	 <td><%=st.split(",")[4]%></td> 
	 <td>
	 <%
	 fixed_dep_date=st.split(",")[5];
	yyyy=fixed_dep_date.split("-")[0];
	mm=fixed_dep_date.split("-")[1];
	dd=fixed_dep_date.split("-")[2];
	dd=dd.replace(' ','-');
	dd=dd.replace('.','-');
	dd=dd.split("-")[0];
	fixed_dep_date=yyyy+"-"+mm+"-"+dd;
	Date d=format1.parse(fixed_dep_date);
	fixed_dep_date=format2.format(d).toString();%>
	<%= fixed_dep_date %>
	 <td><%
	 mat_date=st.split(",")[6];
	yyyy=mat_date.split("-")[0];
	mm=mat_date.split("-")[1];
	dd=mat_date.split("-")[2];
	dd=dd.replace(' ','-');
	dd=dd.replace('.','-');
	dd=dd.split("-")[0];
	mat_date=yyyy+"-"+mm+"-"+dd;
	d=format1.parse(mat_date);
	mat_date=format2.format(d).toString();%>
	<%= mat_date %>
	 </td>
	 <td><%=st.split(",")[7]%></td>
	 </tr>
	<%}}%>
	<%if(null==l||l.isEmpty()){ %>
	<tr class="odd"><td width="100%" colspan="9" align="center">No records found</td></tr>
	<%}} %>
	
</table>
<% }%>

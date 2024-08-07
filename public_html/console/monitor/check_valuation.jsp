<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.component.user.app.bus.*,
				com.integrosys.base.techinfra.beanloader.BeanController,
				com.integrosys.component.user.app.constant.JNDIConstant,
				com.integrosys.cms.app.user.trx.*,
				com.integrosys.cms.app.user.proxy.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
  
  
<html>
<head>
<title>Check Valuation Details</title>
<%@ include file="/console/console_include.jsp" %>

</head>

<body onload="window.scrollTo(0,99999);">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>Check Status of Valuation</strong></td>
  </tr>
</table><br>


<%
	String idtype = request.getParameter("idtype");
	if ((idtype == null) || idtype.equals(""))
	{
		idtype = "*";
	}

	String idno = request.getParameter("idno");
	if ((idno == null) || idno.equals(""))
	{
		idno = "";
	}

%>


<form name="myform" action="check_valuation.jsp" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="160" align="left">Type of ID:</td>
			<td align="left">
				<select name="idtype" size="1">
					<option <%= ("HOST".equals(idtype)) ? "selected" : "" %> value="HOST">HOST</option>
					<option <%= ("CMS".equals(idtype)) ? "selected" : "" %> value="CMS">CMS</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="left">Collateral ID:</td>
			<td align="left"><input type="text" name="idno" size="40" value="<%= idno %>" /></td>
		</tr>
		<tr>
			<td align="left">&nbsp;</td>
			<td align="left">
				<input type="submit" value=" Submit "/>
			</td>
		</tr>
	</table>
</form>

<% 
	int i;
	int j;

	String datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	String schema = "";

	long startIndex = 0;
	long endIndex = 10;	
	Properties connProperties = null;
	
	String queryStr = "";
	String idno_final = "";

	String collateralType = "";
	String collateralTypeDesc = "";
	String collateralSubType = "";
	
	
	//--------------- get data for CMS_SECURITY ---------------

    try {
		if ("CMS".equals(idtype))
		{
			idno_final = "".equals(idno) ? "0" : idno.trim();	//this is because cms_collateral_id is a number
			try {
				long colID = Long.parseLong(idno_final);
	        } catch (NumberFormatException nx) {
				idno_final = "0";
	        }

		}
		else
		{
			queryStr = "select cms_collateral_id from cms_security where SCI_SECURITY_DTL_ID = '" + idno.trim() + "'";
			connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);
			while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
				idno_final = ((java.sql.ResultSet) connProperties.get("rs")).getString(1);
			}
			closeDatabaseConnection(connProperties);
			idno_final = "".equals(idno_final) ? "0" : idno_final.trim();
		}
		queryStr = "select security_sub_type_id, subtype_name, last_remargin_date, next_remargin_date, cmv_currency, cmv, fsv_currency, fsv, type_name, sci_security_type_value, security_location, cms_collateral_id from cms_security where CMS_COLLATERAL_ID = " + idno_final;
		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>

	<hr><br>
	<b>CMS_SECURITY</b> <font size="-2">[need 1 record to exist; cmv, fsv cannot be null]</font><br><br>
	<center>
	<table class="sortable draggable" id="cms_security" width="100%">
		<thead>
		  <tr>

<%	
		j = 0;
		StringBuffer headerString = new StringBuffer ();
		for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnName(i) + "</th>");

		out.println(headerString);
		out.println("			  </tr>");
		out.println("			</thead>");
		out.println("			<tbody>");

        while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
			StringBuffer resultString = new StringBuffer ();
			resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");
			for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			{
				resultString.append("<td>" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(i)) + "</td>");
			}
			resultString.append("</tr>");
        	out.println(resultString);
			j++;
			
			if ("".equals(collateralType))
			{
				collateralType = ((java.sql.ResultSet) connProperties.get("rs")).getString("SCI_SECURITY_TYPE_VALUE");
				collateralTypeDesc = ((java.sql.ResultSet) connProperties.get("rs")).getString("TYPE_NAME");
				collateralSubType = ((java.sql.ResultSet) connProperties.get("rs")).getString("SECURITY_SUB_TYPE_ID");
			}
			
        }

%>
		</tbody>
	</table>
	<br>
	</center>

<%
		if (j == 0)
			out.println("<font color='red'>Sorry, there are no records found.</font><br><br>");
		//else
		//	out.println("<font size='-2'>Total records found: " + j + "</font><br><br>");

    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'>Exception OCCURRED:" + e.getMessage() + "</font>");

    } finally {
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }
    
%>



<% 
	//--------------- get data for specific collateral type tables ---------------

	if (("".equals(collateralType) || collateralType == null))
	{
		out.println("<br>");
		out.println("<font color='red'><b>No valid collateral type found !</b></font><br><br>");
	}
	else
	{
		String collateralTypeTable = "";
		if ("AB".equals(collateralType)) {
			collateralTypeTable = "CMS_ASSET";
		}
		else if ("CL".equals(collateralType)) {
			collateralTypeTable = "CMS_OTHERS";
		}
		else if ("CS".equals(collateralType)) {
			collateralTypeTable = "CMS_CASH";
		}
		else if ("DC".equals(collateralType)) {
			collateralTypeTable = "CMS_DOCUMENT";
		}
		else if ("GT".equals(collateralType)) {
			collateralTypeTable = "CMS_GUARANTEE";
		}
		else if ("IN".equals(collateralType)) {
			collateralTypeTable = "CMS_INSURANCE";
		}
		else if ("MS".equals(collateralType)) {
			collateralTypeTable = "CMS_MARKETABLE_SEC";
		}
		else if ("OT".equals(collateralType)) {
			collateralTypeTable = "CMS_OTHERS";
		}
		else if ("PT".equals(collateralType)) {
			collateralTypeTable = "CMS_PROPERTY";
		}

		queryStr = "select * from " + collateralTypeTable + " where CMS_COLLATERAL_ID = " + idno_final;

	    try {
			connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>
	<br>
	<b><%= collateralTypeTable %></b> <font size="-2">[need 1 record to exist]</font><br><br>
	<center>
	<table class="sortable draggable" id="cms_collateral_table" width="100%">
		<thead>
		  <tr>

<%	
			j = 0;
			StringBuffer headerString = new StringBuffer ();
			for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
				headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnName(i) + "</th>");

			out.println(headerString);
			out.println("			  </tr>");
			out.println("			</thead>");
			out.println("			<tbody>");

	        while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
				StringBuffer resultString = new StringBuffer ();
				resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");
				for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
				{
					resultString.append("<td>" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(i)) + "</td>");
				}
				resultString.append("</tr>");
	        	out.println(resultString);
				j++;
	        }
%>
		</tbody>
	</table>
	<br>
	</center>

<%
			if (j == 0)
				out.println("<font color='red'>Sorry, there are no records found.</font><br><br>");
			//else
			//	out.println("<font size='-2'>Total records found: " + j + "</font><br><br>");

	    } catch (Exception e) {
			e.printStackTrace(System.err);
			out.println("<font color='red'>Exception OCCURRED:" + e.getMessage() + "</font>");

	    } finally {
			closeDatabaseConnection(connProperties);
			connProperties = null;
	    }
	}

%>



<% 
	//--------------- get data for AB collateral subtype tables ---------------

	if ("AB".equals(collateralType) || "CS".equals(collateralType))
	{
		String collateralSubTypeTable = "";

		if ("CS".equals(collateralType))
		{
			collateralSubTypeTable = "CMS_CASH_DEPOSIT";
		}
		else
		{
			if ("AB109".equals(collateralSubType)) {
				collateralSubTypeTable = "CMS_ASSET_AIRCRAFT";
			}
			else if ("AB110".equals(collateralSubType)) {
				collateralSubTypeTable = "CMS_ASSET_GOLD";
			}
			else if ("AB108".equals(collateralSubType)) {
				collateralSubTypeTable = "CMS_ASSET_PDC";
			}
			else if ("AB101".equals(collateralSubType)) {
				collateralSubTypeTable = "CMS_ASSET_PLANT_EQUIP";
			}
			else if ("AB102".equals(collateralSubType)) {
				collateralSubTypeTable = "CMS_ASSET_VEHICLE";
			}
			else if ("AB111".equals(collateralSubType)) {
				collateralSubTypeTable = "CMS_ASSET_VESSEL";
			}
		}

		queryStr = "select * from " + collateralSubTypeTable + " where CMS_COLLATERAL_ID = " + idno_final;

	    try {
			connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>
	<br>
	<b><%= collateralSubTypeTable %></b> <font size="-2">[need 1 record to exist]</font><br><br>
	<center>
	<table class="sortable draggable" id="cms_collateral_sub_table" width="100%">
		<thead>
		  <tr>

<%	
			j = 0;
			StringBuffer headerString = new StringBuffer ();
			for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
				headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnName(i) + "</th>");

			out.println(headerString);
			out.println("			  </tr>");
			out.println("			</thead>");
			out.println("			<tbody>");

	        while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
				StringBuffer resultString = new StringBuffer ();
				resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");
				for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
				{
					resultString.append("<td>" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(i)) + "</td>");
				}
				resultString.append("</tr>");
	        	out.println(resultString);
				j++;
	        }
%>
		</tbody>
	</table>
	<br>
	</center>

<%
			if (j == 0)
				out.println("<font color='red'>Sorry, there are no records found.</font><br><br>");
			//else
			//	out.println("<font size='-2'>Total records found: " + j + "</font><br><br>");

	    } catch (Exception e) {
			e.printStackTrace(System.err);
			out.println("<font color='red'>Exception OCCURRED:" + e.getMessage() + "</font>");

	    } finally {
			closeDatabaseConnection(connProperties);
			connProperties = null;
	    }
	}

%>


<% 
	//--------------- get data for CMS_VALUATION ---------------

    try {
		queryStr = "select valuation_date, valuation_currency, cmv, fsv, valuer, reval_freq, reval_freq_unit, source_type, source_id, valuation_id, cms_collateral_id from cms_valuation where CMS_COLLATERAL_ID = " + idno_final;
		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>

	<hr><br>
	<b>CMS_VALUATION</b> <font size="-2">[at least 1 record exists; values cannot be null]</font><br><br>
	<center>
	<table class="sortable draggable" id="cms_valuation" width="100%">
		<thead>
		  <tr>

<%	
		j = 0;
		StringBuffer headerString = new StringBuffer ();
		for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnName(i) + "</th>");

		out.println(headerString);
		out.println("			  </tr>");
		out.println("			</thead>");
		out.println("			<tbody>");

        while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
			StringBuffer resultString = new StringBuffer ();
			resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");
			for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			{
				resultString.append("<td>" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(i)) + "</td>");
			}
			resultString.append("</tr>");
        	out.println(resultString);
			j++;
        }
%>
		</tbody>
	</table>
	<br>
	</center>

<%
		if (j == 0)
			out.println("<font color='red'>Sorry, there are no records found.</font><br><br>");
		else
			out.println("<font size='-2'>Total records found: " + j + "</font><br><br>");

    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'>Exception OCCURRED:" + e.getMessage() + "</font>");

    } finally {
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }
    
%>


<% 
	//--------------- get data for CMS_SECURITY_PARAMETER ---------------

    try {
		queryStr = "select P.SECURITY_SUB_TYPE_ID, P.THRESHOLD_PERCENT, P.VALUATION_FREQUENCY, P.VALUATION_FREQUENCY_UNIT, P.COUNTRY_ISO_CODE, P.STATUS, P.ID FROM CMS_SECURITY S, CMS_SECURITY_PARAMETER P "
			+ " WHERE S.CMS_COLLATERAL_ID = " + idno_final
			+ " AND S.SECURITY_LOCATION = P.COUNTRY_ISO_CODE  "
			+ " AND S.SCI_SECURITY_SUBTYPE_VALUE = P.SECURITY_SUB_TYPE_ID "
			+ " AND P.STATUS = 'ACTIVE' "
			+ " AND P.THRESHOLD_PERCENT  IS NOT NULL "
			+ " AND P.VALUATION_FREQUENCY IS NOT NULL  "
			+ " AND P.VALUATION_FREQUENCY > 0  "
			+ " AND P.VALUATION_FREQUENCY_UNIT IS NOT NULL "
			+ " AND P.VALUATION_FREQUENCY_UNIT <> '' ";

		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>

	<hr><br>
	<b>CMS_SECURITY_PARAMETER</b> <font size="-2">[need 1 record to exist; frequency, threshold cannot be null, status must be active]</font><br><br>
	<center>
	<table class="sortable draggable" id="cms_security_parameter" width="100%">
		<thead>
		  <tr>

<%	
		j = 0;
		StringBuffer headerString = new StringBuffer ();
		for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnName(i) + "</th>");

		out.println(headerString);
		out.println("			  </tr>");
		out.println("			</thead>");
		out.println("			<tbody>");

        while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
			StringBuffer resultString = new StringBuffer ();
			resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");
			for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			{
				resultString.append("<td>" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(i)) + "</td>");
			}
			resultString.append("</tr>");
        	out.println(resultString);
			j++;
        }
%>
		</tbody>
	</table>
	<br>
	</center>

<%
		if (j == 0)
			out.println("<font color='red'>Sorry, there are no records found.</font><br><br>");
		//else
		//	out.println("<font size='-2'>Total records found: " + j + "</font><br><br>");

    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'>Exception OCCURRED:" + e.getMessage() + "</font>");

    } finally {
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }
    
%>


	<center>
		<hr>
		<a href="javascript: document.myform.submit();"><img src="<%=request.getContextPath()%>/img/refresh1.gif" border="0"></a>
	</center>


</body>
</html>

<%@ page import="java.util.*,
				com.integrosys.cms.ui.common.CommonCodeList,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				com.integrosys.base.techinfra.logger.DefaultLogger,
				org.apache.commons.lang.StringUtils,
				java.io.*,
				java.net.*,
				javax.net.ssl.HostnameVerifier,
				javax.net.ssl.HttpsURLConnection,
				javax.net.ssl.SSLContext,
				javax.net.ssl.SSLSession,
				javax.net.ssl.TrustManager,
				javax.net.ssl.X509TrustManager,
				com.integrosys.base.techinfra.util.PropertyUtil
		"%>

<%!
	public String removeNonAsciiCharacter(String inStr) {
		StringBuffer newStr = new StringBuffer ();
		for (int i=0; i < inStr.length(); i++)
		{
			char c = inStr.charAt(i);
			int ascC = (int)c;
			//if (ascC < 48 || ascC > 122 || (ascC > 57 && ascC < 65) || (ascC > 90 && ascC < 97))
			if (ascC < 32 || ascC > 126)
				newStr.append("&#" + ascC + ";");
			else
				newStr.append(c);
		}
		return (newStr.toString());
	}

	public String removeNonXMLCharacter(String inStr, char c_code, String c_string) {
		StringBuffer newStr = new StringBuffer ();
		for (int i = 0; i < inStr.length(); i++)
		{
			char c = inStr.charAt(i);
			int ascC = (int)c;
			if (c == c_code)
			{
				if (inStr.indexOf(c_string, i) == i)
					newStr.append(c);
				else
					newStr.append(c_string);
			}
			else
				newStr.append(c);
		}
		return (newStr.toString());
	}

	public String makeXMLcompliant(String inStr) {
		inStr = removeNonXMLCharacter(inStr, '&', "&amp;");
		inStr = removeNonXMLCharacter(inStr, '<', "&lt;");
		inStr = removeNonXMLCharacter(inStr, '>', "&gt;");
		inStr = removeNonXMLCharacter(inStr, '"', "&quot;");

		inStr = removeNonAsciiCharacter(inStr);
		//System.out.println(inStr);
		return (inStr);
	}

%>

<%
	//System.out.println(makeXMLcompliant("< hello & &amp; goodbye > \" "));
	System.out.println("\n");

	try {
		String initial = request.getParameter("initial");
		System.out.println("		[initial] initial   : " + initial);

		String country[] = request.getParameterValues ("country");
		if (country != null)
		{
			String stringOfCountries = "";
			for (int i = 0; i < country.length; i++)
			{
				stringOfCountries = stringOfCountries + country[i];
				if (i != country.length-1)
					stringOfCountries = stringOfCountries + ", ";
			}
			System.out.println("		[country] country   : " + stringOfCountries + "      -> size: " + country.length);
		}
		else
			System.out.println("		[country] country   : " + country);

		String source = request.getParameter("source");
		System.out.println("		[source] source     : " + source);

		String categoryCode = request.getParameter("code");
		System.out.println("		[code] categoryCode : " + categoryCode);

		boolean descWithCode = false;
		String desc = request.getParameter("desc");
		if (desc == null || desc.equals(""))
			descWithCode = false;
		else if (desc.equalsIgnoreCase("true"))
			descWithCode = true;

		System.out.println("		[desc] desc         : " + desc + "        -> descWithCode : " + descWithCode);

		String refEntryCode = request.getParameter("ref");
		System.out.println("		[ref] refEntryCode  : " + refEntryCode);

%>

<?xml version="1.0"?>
<optionlist>
<%		
		//CommonCodeList getInstance(String[] countryCodes, String source, String categoryCode, String refEntryCode, boolean descWithCode)
		//CommonCodeList.getInstance(String categoryCode)
		//CommonCodeList.getInstance(null, null, categoryCode, false, null);
		CommonCodeList commonCode = CommonCodeList.getInstance(country, source, categoryCode, refEntryCode, descWithCode);

		boolean toShow;
		for (int i = 0; i < commonCode.getCommonCodeLabels().size(); i++)
		{
			String key = (String)((List)commonCode.getCommonCodeLabels()).get(i);
			String val = (String)((List)commonCode.getCommonCodeValues()).get(i);
			
			toShow = true;
			if (initial != null)
			{

				if (initial.toLowerCase().startsWith("other"))
				{
					int firstChar = (int) key.toUpperCase().charAt(0);
					if (firstChar < 65 || firstChar > 90)
						toShow = true;
					else
						toShow = false;
				}
				else
				{
					if (initial.equalsIgnoreCase(key.substring(0,1)))
						toShow = true;
					else
						toShow = false;
				}
			}
			if (toShow) {
%>
				<option label="<%= makeXMLcompliant(key) %>" value="<%= makeXMLcompliant(val) %>"></option>
<%
			}
		}
	} 
	catch(Exception ee) 
	{
		ee.printStackTrace(new java.io.PrintWriter(out));
	}

%>
</optionlist>

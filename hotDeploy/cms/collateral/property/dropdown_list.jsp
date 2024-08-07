<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%!
	public String removeNonAsciiCharacter(String inStr) {
		StringBuffer newStr = new StringBuffer ();
		for (int i=0; i < inStr.length(); i++)
		{
			char c = inStr.charAt(i);
			int ascC = (int)c;
			if (ascC < 48 || ascC > 122 || (ascC > 57 && ascC < 65) || (ascC > 90 && ascC < 97))
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
		//inStr = removeNonXMLCharacter(inStr, '&', "&amp;");
		inStr = removeNonXMLCharacter(inStr, '<', "&lt;");
		inStr = removeNonXMLCharacter(inStr, '>', "&gt;");
		//inStr = removeNonXMLCharacter(inStr, '"', "&quot;");

		inStr = removeNonAsciiCharacter(inStr);
		//System.out.println(inStr);
		return (inStr);
	}
%>

<?xml version="1.0"?>
<%
	String dropdown_name = (String)request.getAttribute("dropdown_name");
	//System.out.println("Name:"+dropdown_name);
	if(dropdown_name!=null&&!dropdown_name.trim().equals("")){
		/*
		java.util.ArrayList valueList = (java.util.ArrayList)request.getAttribute(dropdown_name);
		if(valueList!=null){
			System.out.println("Name:"+dropdown_name);
			System.out.println("Len:"+valueList.size());			
		}
		*/
%>
	<optionlist>
	 <logic:iterate id="curOp" indexId="curInd" name="<%=dropdown_name%>" scope="request" type="com.integrosys.cms.ui.collateral.CMSLabelValueBean">
		<%--
			//System.out.println("Index:"+curInd+" L:"+curOp.getLabel()+" V:"+curOp.getValue());
			String label= curOp.getLabel();
			label=label.replace('&',' ');
			label=label.replace('\'',' ');
			label=label.replace('\"',' ');
		--%>
	 	<option label="<%= makeXMLcompliant(curOp.getLabel()) %>" value="<%= makeXMLcompliant(curOp.getValue()) %>"></option>	
	 </logic:iterate> 
	</optionlist>
<%
	}
%>
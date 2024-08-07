
<%@ page import="java.util.*"%>

<%!
	public static String _ORANGE = "orange";
	public static String _BLUE = "blue";
	public static String _GREEN = "green";
	public static String _BLACKWHITE = "blackwhite";

	//default style
	String styletitle = _BLUE;

	public Hashtable cookieTable (Cookie[] cookies) 
	{
		Hashtable cookieTable = new Hashtable();
		if (cookies != null) {
			for (int i=0; i < cookies.length; i++) {
				cookieTable.put (cookies[i].getName(), cookies[i].getValue());
			}
		}
		return cookieTable;
	}
	
	public String checkStyle (String myStyle)
	{
		if (myStyle.equals(styletitle))
			return "";
		else
			return "alternate ";
	}

%>


<%
	Hashtable cookies = cookieTable(request.getCookies());

	if (cookies.containsKey("cms_style")) {
		styletitle = (String)cookies.get("cms_style");
	}
	
	//System.out.println("############ Found theme style: " + styletitle);

%>


<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/icon.ico" type="image/x-icon"> 
<link rel="icon" href="<%=request.getContextPath()%>/img/icon.ico" type="image/x-icon"> 

<link href="<%=request.getContextPath()%>/themes/<%=_BLUE%>/css/smartlender.css" rel="<%=checkStyle(_BLUE)%>stylesheet" type="text/css" title="<%=_BLUE%>" />

<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/js/styleswitcher.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/js/itgUtilities.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/sec_layout_tabcontent.js"></script>
<!--
<script type="text/javascript" src="<%=request.getContextPath()%>/js/sec_div_layout_tabcontent.js"></script>
//-->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/globalJS.js"></script>

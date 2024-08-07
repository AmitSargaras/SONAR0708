<%@ include file="/template/charset_template.jsp" %>
<%@ include file="/console/console_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>


<html>
<head>
<title>View Unicode</title>
<%@ include file="/console/console_include.jsp" %>

<STYLE TYPE="text/css" TITLE="">
.asciibox {
	border-left: 1px solid #ddd; 
	border-top: 1px solid #ddd; 
	float: left; 
	font-size: .8em; 
	height: 50px; 
	margin: 2px;
	padding: 2px;
	width: 120px; 
}
.htmlbox {
	border-left: 1px solid #ddd; 
	border-top: 1px solid #ddd; 
	float: left; 
	font-size: .8em; 
	height: 35px; 
	margin: 2px;
	padding: 2px;
	width: 120px; 
}
.asciiletter {
	background: #ddd;
	border-right: 2px solid #bbb; 
	border-bottom: 2px solid #bbb; 
	float: right; 
	font-size: 2em; 
	height: 20px;
	text-align: center;
	width: 30px;
}
</STYLE>


<script type="text/javascript" language="JavaScript">
	function hide_all() {
		var divCollection = document.getElementsByTagName("div");
		for (var i=0; i<divCollection.length; i++) {
			if (divCollection[i].className == "asciibox" || divCollection[i].className == "htmlbox")
				divCollection[i].style.backgroundColor = 'white';
		}
	}

	function find_div_class(myClassName) {
		hide_all();
		var divCollection = document.getElementsByTagName("div");
		for (var i=0; i<divCollection.length; i++) {
			if (divCollection[i].className == myClassName) {
				if (divCollection[i].className == "asciibox" || divCollection[i].className == "htmlbox")
					divCollection[i].style.backgroundColor = 'yellow';
			} 
		}
	}
	
	function find_start_alphabet(myAlphabet) {
		hide_all();
		var divCollection = document.getElementsByTagName("div");
		for (var i=0; i<divCollection.length; i++) {
		//for (var i=20; i<50; i++) {
			if (divCollection[i].className == "asciiletter") {
				myText = divCollection[i-1].innerHTML.toLowerCase();
				loc = myText.indexOf("&amp;");
				if (loc > -1) {
					//alert(i + ": " + loc + " >>" + myAlphabet + "<<  >>>" + myText.substr(loc+5) + "<<<" );
					if (myText.substr(loc+5, 1) == myAlphabet) {
						divCollection[i-1].style.backgroundColor = 'yellow';
					}
				}
			} 
		}
	}
</script>
    	
</head>


<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Check Unicode (UTF-8)</td>
  </tr>
</table><br>

Context Path: <%=request.getContextPath()%>
<br>

<div id="guide" style="width: 100%; display:inline">
<br>
<fieldset>
<legend><strong>Key areas to take note for supporting i18n characters</strong></legend>
<br><font color="blue">a) Using encoding filter to handle response, to be defined in web.xml</font>
<br>
<br>&lt;filter id=&quot;FilterMapping_1045053833781&quot;&gt;
<br>&nbsp;&nbsp;	&lt;filter-name&gt;EncodingFilter&lt;/filter-name&gt;
<br>&nbsp;&nbsp;	&lt;filter-class&gt;com.integrosys.base.uiinfra.common.EncodingFilter&lt;/filter-class&gt;
<br>&nbsp;&nbsp;	...
<br>&nbsp;&nbsp;	...
<br>
<br>Since encoding filter is to use for all resources in the web application, it MUST be defined first.
Any other filters must come after it. <font color="red">Ordering of defining filters is important!</font>
<br>
<br>&lt;filter-mapping id=&quot;FilterMapping_1045053833781&quot;&gt;
<br>&nbsp;&nbsp;	&lt;filter-name&gt;EncodingFilter&lt;/filter-name&gt;
<br>&nbsp;&nbsp;	&lt;url-pattern&gt;/*&lt;/url-pattern&gt;
<br>&lt;/filter-mapping&gt;
<br>&lt;filter-mapping id=&quot;FilterMapping_1045053833782&quot;&gt;
<br>&nbsp;&nbsp;	&lt;filter-name&gt;TraceFilter&lt;/filter-name&gt;
<br>&nbsp;&nbsp;	&lt;url-pattern&gt;*.do&lt;/url-pattern&gt;
<br>&lt;/filter-mapping&gt;
<br>
<br><font color="blue">b) Setting encoding</font>
<br>
<br>For example:
<br>&lt;%@ page language=&quot;java&quot; contentType=&quot;text/html;charset=UTF-8&quot; pageEncoding=&quot;UTF-8&quot; %&gt;
<br>&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot; /&gt;
<br>
<br>For Weblogic, the order of setting context type is not incremental. 
<br>if a call to the API does not includes all the properties required, it will overwrite all previous settings.
<br>
<br>i.e.
<br>&nbsp;&nbsp;&lt;% response.setContentType(&quot;text/html; charset=UTF-8&quot;); %&gt;	
<font color="blue">this will enable support UTF-8</font>
<br>
<br>if we have another line in the JSP:
<br>&nbsp;&nbsp;&lt;% response.setContentType(&quot;text/html&quot;); %&gt;
<font color="blue">this will disable support for UTF-8</font>
</fieldset>
</div>


<p>
<strong>Here are some sample characters to use:</strong>
<blockquote>
Extended Roman: &ecirc; &uuml; &acirc; &Igrave; &Yuml; &#188; &#190; &#191; &#161;
<br>Internationalization: 
I&#241;t&#235;rn&#226;ti&#244;n&#224;liz&#230;ti&#248;n
<br>Chinese:
<font class=chinese>&#20140; &#20165; &#23613; &#24452; &#24778; &#29710; &#30153; &#32039; &#32463; &#35686; &#35880; &#40120;</font>
<br>Esperanto:
&#264; &#265; &#284; &#285; &#292; &#293; &#308; &#309; &#348; &#349; &#364; &#365; 
<br>Russian: 
&#1071; &#1075;&#1086;&#1074;&#1086;&#1088;&#1102; &#1087;&#1086;&#45;&#1088;&#1091;&#1089;&#1089;&#1082;&#1080;.
<br>Greek:
&#913;&#965;&#964;&#959;&#965; &#959;&#953; &#952;&#945;&#957;&#945;&#964;&#959;&#957; &#956;&#951;&#964;&#963;&#959;&#956;&#945;&#953;

</blockquote>
</p>


<form action="testunicode.jsp" METHOD=POST>
<input type="text" name="ZHstr" size="50" />
<input type="submit" value=" Post Data "/>
</form>

<%
	String propname = request.getParameter("ZHstr");

	System.out.println("###### ZHstr: " + propname);

	if ((propname == null) || propname.equals(""))
	{
	
	}
	else
	{
		out.println("<dl>");
		out.println("<br><strong>Post Value</strong>");
		out.println("<br>" + propname + " <br>");
		out.println("</dl>");
		//return;
	}
%>

<br>
<center>
<input type="button" onfocus="this.blur()" value=" html " onclick="javascript:find_div_class('htmlbox');return false;"/>
<input type="button" onfocus="this.blur()" value=" ascii " onclick="javascript:find_div_class('asciibox');return false;"/>
<%
	for (int i=97; i<=122; i++) {
		char ch = (char) i; 
%>
<input type="button" onfocus="this.blur()" value=" <%= ch %> " onclick="javascript:find_start_alphabet('<%= ch %>');return false;"/>
<%
	}
%>
</center>
<br>

<div class='htmlbox'>
<div class='asciiletter'>&aacute;</div>
<code>&amp;aacute;</code><br />
<code>&amp;#225;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Aacute;</div>
<code>&amp;Aacute;</code><br />
<code>&amp;#193;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&acirc;</div>
<code>&amp;acirc;</code><br />
<code>&amp;#226;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Acirc;</div>
<code>&amp;Acirc;</code><br />
<code>&amp;#194;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&acute;</div>
<code>&amp;acute;</code><br />
<code>&amp;#180;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&aelig;</div>
<code>&amp;aelig;</code><br />
<code>&amp;#230;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&AElig;</div>
<code>&amp;AElig;</code><br />
<code>&amp;#198;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&agrave;</div>
<code>&amp;agrave;</code><br />
<code>&amp;#224;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Agrave;</div>
<code>&amp;Agrave;</code><br />
<code>&amp;#192;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&alefsym;</div>
<code>&amp;alefsym;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&alpha;</div>
<code>&amp;alpha;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Alpha;</div>
<code>&amp;Alpha;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&amp;</div>
<code>&amp;amp;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&and;</div>
<code>&amp;and;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ang;</div>
<code>&amp;ang;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&aring;</div>
<code>&amp;aring;</code><br />
<code>&amp;#229;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Aring;</div>
<code>&amp;Aring;</code><br />
<code>&amp;#197;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&asymp;</div>
<code>&amp;asymp;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&atilde;</div>
<code>&amp;atilde;</code><br />
<code>&amp;#227;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Atilde;</div>
<code>&amp;Atilde;</code><br />
<code>&amp;#195;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&auml;</div>
<code>&amp;auml;</code><br />
<code>&amp;#228;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Auml;</div>
<code>&amp;Auml;</code><br />
<code>&amp;#196;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&bdquo;</div>
<code>&amp;bdquo;</code><br />
<code>&amp;#8222;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&beta;</div>
<code>&amp;beta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Beta;</div>
<code>&amp;Beta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&brvbar;</div>
<code>&amp;brvbar;</code><br />
<code>&amp;#166;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&bull;</div>
<code>&amp;bull;</code><br />
<code>&amp;#8226;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&cap;</div>
<code>&amp;cap;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ccedil;</div>
<code>&amp;ccedil;</code><br />
<code>&amp;#231;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Ccedil;</div>
<code>&amp;Ccedil;</code><br />
<code>&amp;#199;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&cedil;</div>
<code>&amp;cedil;</code><br />
<code>&amp;#184;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&cent;</div>
<code>&amp;cent;</code><br />
<code>&amp;#162;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&chi;</div>
<code>&amp;chi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Chi;</div>
<code>&amp;Chi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&circ;</div>
<code>&amp;circ;</code><br />
<code>&amp;#710;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&clubs;</div>
<code>&amp;clubs;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&cong;</div>
<code>&amp;cong;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&copy;</div>
<code>&amp;copy;</code><br />
<code>&amp;#169;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&crarr;</div>
<code>&amp;crarr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&cup;</div>
<code>&amp;cup;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&curren;</div>
<code>&amp;curren;</code><br />
<code>&amp;#164;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&dagger;</div>
<code>&amp;dagger;</code><br />
<code>&amp;#8224;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Dagger;</div>
<code>&amp;Dagger;</code><br />
<code>&amp;#8225;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&darr;</div>
<code>&amp;darr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&dArr;</div>
<code>&amp;dArr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&deg;</div>
<code>&amp;deg;</code><br />
<code>&amp;#176;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&delta;</div>
<code>&amp;delta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Delta;</div>
<code>&amp;Delta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&diams;</div>
<code>&amp;diams;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&divide;</div>
<code>&amp;divide;</code><br />
<code>&amp;#247;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&eacute;</div>
<code>&amp;eacute;</code><br />
<code>&amp;#233;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Eacute;</div>
<code>&amp;Eacute;</code><br />
<code>&amp;#201;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ecirc;</div>
<code>&amp;ecirc;</code><br />
<code>&amp;#234;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Ecirc;</div>
<code>&amp;Ecirc;</code><br />
<code>&amp;#202;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&egrave;</div>
<code>&amp;egrave;</code><br />
<code>&amp;#232;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Egrave;</div>
<code>&amp;Egrave;</code><br />
<code>&amp;#200;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&empty;</div>
<code>&amp;empty;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&emsp;</div>
<code>&amp;emsp;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ensp;</div>
<code>&amp;ensp;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&epsilon;</div>
<code>&amp;epsilon;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Epsilon;</div>
<code>&amp;Epsilon;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&equiv;</div>
<code>&amp;equiv;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&eta;</div>
<code>&amp;eta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Eta;</div>
<code>&amp;Eta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&eth;</div>
<code>&amp;eth;</code><br />
<code>&amp;#240;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ETH;</div>
<code>&amp;ETH;</code><br />
<code>&amp;#208;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&euml;</div>
<code>&amp;euml;</code><br />
<code>&amp;#235;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Euml;</div>
<code>&amp;Euml;</code><br />
<code>&amp;#203;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&euro;</div>
<code>&amp;euro;</code><br />
<code>&amp;#8364;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&exist;</div>
<code>&amp;exist;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&fnof;</div>
<code>&amp;fnof;</code><br />
<code>&amp;#402;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&forall;</div>
<code>&amp;forall;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&frac12;</div>
<code>&amp;frac12;</code><br />
<code>&amp;#189;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&frac14;</div>
<code>&amp;frac14;</code><br />
<code>&amp;#188;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&frac34;</div>
<code>&amp;frac34;</code><br />
<code>&amp;#190;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&frasl;</div>
<code>&amp;frasl;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&gamma;</div>
<code>&amp;gamma;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Gamma;</div>
<code>&amp;Gamma;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ge;</div>
<code>&amp;ge;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&gt;</div>
<code>&amp;gt;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&harr;</div>
<code>&amp;harr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&hArr;</div>
<code>&amp;hArr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&hearts;</div>
<code>&amp;hearts;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&hellip;</div>
<code>&amp;hellip;</code><br />
<code>&amp;#8230;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&iacute;</div>
<code>&amp;iacute;</code><br />
<code>&amp;#237;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Iacute;</div>
<code>&amp;Iacute;</code><br />
<code>&amp;#205;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&icirc;</div>
<code>&amp;icirc;</code><br />
<code>&amp;#238;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Icirc;</div>
<code>&amp;Icirc;</code><br />
<code>&amp;#206;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&iexcl;</div>
<code>&amp;iexcl;</code><br />
<code>&amp;#161;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&igrave;</div>
<code>&amp;igrave;</code><br />
<code>&amp;#236;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Igrave;</div>
<code>&amp;Igrave;</code><br />
<code>&amp;#204;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&image;</div>
<code>&amp;image;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&infin;</div>
<code>&amp;infin;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&int;</div>
<code>&amp;int;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&iota;</div>
<code>&amp;iota;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Iota;</div>
<code>&amp;Iota;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&iquest;</div>
<code>&amp;iquest;</code><br />
<code>&amp;#191;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&isin;</div>
<code>&amp;isin;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&iuml;</div>
<code>&amp;iuml;</code><br />
<code>&amp;#239;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Iuml;</div>
<code>&amp;Iuml;</code><br />
<code>&amp;#207;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&kappa;</div>
<code>&amp;kappa;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Kappa;</div>
<code>&amp;Kappa;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lambda;</div>
<code>&amp;lambda;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Lambda;</div>
<code>&amp;Lambda;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lang;</div>
<code>&amp;lang;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&laquo;</div>
<code>&amp;laquo;</code><br />
<code>&amp;#171;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&larr;</div>
<code>&amp;larr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lArr;</div>
<code>&amp;lArr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lceil;</div>
<code>&amp;lceil;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ldquo;</div>
<code>&amp;ldquo;</code><br />
<code>&amp;#8220;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&le;</div>
<code>&amp;le;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lfloor;</div>
<code>&amp;lfloor;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lowast;</div>
<code>&amp;lowast;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&loz;</div>
<code>&amp;loz;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lrm;</div>
<code>&amp;lrm;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lsaquo;</div>
<code>&amp;lsaquo;</code><br />
<code>&amp;#8249;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lsquo;</div>
<code>&amp;lsquo;</code><br />
<code>&amp;#8216;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&lt;</div>
<code>&amp;lt;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&macr;</div>
<code>&amp;macr;</code><br />
<code>&amp;#175;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&mdash;</div>
<code>&amp;mdash;</code><br />
<code>&amp;#8212;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&micro;</div>
<code>&amp;micro;</code><br />
<code>&amp;#181;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&middot;</div>
<code>&amp;middot;</code><br />
<code>&amp;#183;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&minus;</div>
<code>&amp;minus;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&mu;</div>
<code>&amp;mu;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Mu;</div>
<code>&amp;Mu;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&nabla;</div>
<code>&amp;nabla;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&nbsp;</div>
<code>&amp;nbsp;</code><br />
<code> </code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ndash;</div>
<code>&amp;ndash;</code><br />
<code>&amp;#8211;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ne;</div>
<code>&amp;ne;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ni;</div>
<code>&amp;ni;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&not;</div>
<code>&amp;not;</code><br />
<code>&amp;#172;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&notin;</div>
<code>&amp;notin;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&nsub;</div>
<code>&amp;nsub;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ntilde;</div>
<code>&amp;ntilde;</code><br />
<code>&amp;#241;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Ntilde;</div>
<code>&amp;Ntilde;</code><br />
<code>&amp;#209;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&nu;</div>
<code>&amp;nu;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Nu;</div>
<code>&amp;Nu;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&oacute;</div>
<code>&amp;oacute;</code><br />
<code>&amp;#243;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Oacute;</div>
<code>&amp;Oacute;</code><br />
<code>&amp;#211;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ocirc;</div>
<code>&amp;ocirc;</code><br />
<code>&amp;#244;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Ocirc;</div>
<code>&amp;Ocirc;</code><br />
<code>&amp;#212;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&oelig;</div>
<code>&amp;oelig;</code><br />
<code>&amp;#339;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&OElig;</div>
<code>&amp;OElig;</code><br />
<code>&amp;#338;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ograve;</div>
<code>&amp;ograve;</code><br />
<code>&amp;#242;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Ograve;</div>
<code>&amp;Ograve;</code><br />
<code>&amp;#210;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&oline;</div>
<code>&amp;oline;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&omega;</div>
<code>&amp;omega;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Omega;</div>
<code>&amp;Omega;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&omicron;</div>
<code>&amp;omicron;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Omicron;</div>
<code>&amp;Omicron;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&oplus;</div>
<code>&amp;oplus;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&or;</div>
<code>&amp;or;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ordf;</div>
<code>&amp;ordf;</code><br />
<code>&amp;#170;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ordm;</div>
<code>&amp;ordm;</code><br />
<code>&amp;#186;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&oslash;</div>
<code>&amp;oslash;</code><br />
<code>&amp;#248;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Oslash;</div>
<code>&amp;Oslash;</code><br />
<code>&amp;#216;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&otilde;</div>
<code>&amp;otilde;</code><br />
<code>&amp;#245;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Otilde;</div>
<code>&amp;Otilde;</code><br />
<code>&amp;#213;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&otimes;</div>
<code>&amp;otimes;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ouml;</div>
<code>&amp;ouml;</code><br />
<code>&amp;#246;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Ouml;</div>
<code>&amp;Ouml;</code><br />
<code>&amp;#214;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&para;</div>
<code>&amp;para;</code><br />
<code>&amp;#182;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&part;</div>
<code>&amp;part;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&permil;</div>
<code>&amp;permil;</code><br />
<code>&amp;#8240;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&perp;</div>
<code>&amp;perp;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&phi;</div>
<code>&amp;phi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Phi;</div>
<code>&amp;Phi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&pi;</div>
<code>&amp;pi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Pi;</div>
<code>&amp;Pi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&piv;</div>
<code>&amp;piv;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&plusmn;</div>
<code>&amp;plusmn;</code><br />
<code>&amp;#177;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&pound;</div>
<code>&amp;pound;</code><br />
<code>&amp;#163;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&prime;</div>
<code>&amp;prime;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Prime;</div>
<code>&amp;Prime;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&prod;</div>
<code>&amp;prod;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&prop;</div>
<code>&amp;prop;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&psi;</div>
<code>&amp;psi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Psi;</div>
<code>&amp;Psi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&quot;</div>
<code>&amp;quot;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&radic;</div>
<code>&amp;radic;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rang;</div>
<code>&amp;rang;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&raquo;</div>
<code>&amp;raquo;</code><br />
<code>&amp;#187;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rarr;</div>
<code>&amp;rarr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rArr;</div>
<code>&amp;rArr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rceil;</div>
<code>&amp;rceil;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rdquo;</div>
<code>&amp;rdquo;</code><br />
<code>&amp;#8221;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&real;</div>
<code>&amp;real;</code><br />
<code>R</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&reg;</div>
<code>&amp;reg;</code><br />
<code>&amp;#174;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rfloor;</div>
<code>&amp;rfloor;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rho;</div>
<code>&amp;rho;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Rho;</div>
<code>&amp;Rho;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rlm;</div>
<code>&amp;rlm;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rsaquo;</div>
<code>&amp;rsaquo;</code><br />
<code>&amp;#8250;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&rsquo;</div>
<code>&amp;rsquo;</code><br />
<code>&amp;#8217;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sbquo;</div>
<code>&amp;sbquo;</code><br />
<code>&amp;#8218;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&scaron;</div>
<code>&amp;scaron;</code><br />
<code>&amp;#353;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Scaron;</div>
<code>&amp;Scaron;</code><br />
<code>&amp;#352;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sdot;</div>
<code>&amp;sdot;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sect;</div>
<code>&amp;sect;</code><br />
<code>&amp;#167;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&shy;</div>
<code>&amp;shy;</code><br />
<code>&amp;#173;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sigma;</div>
<code>&amp;sigma;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Sigma;</div>
<code>&amp;Sigma;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sigmaf;</div>
<code>&amp;sigmaf;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sim;</div>
<code>&amp;sim;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&spades;</div>
<code>&amp;spades;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sub;</div>
<code>&amp;sub;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sube;</div>
<code>&amp;sube;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sum;</div>
<code>&amp;sum;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sup;</div>
<code>&amp;sup;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sup1;</div>
<code>&amp;sup1;</code><br />
<code>&amp;#185;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sup2;</div>
<code>&amp;sup2;</code><br />
<code>&amp;#178;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&sup3;</div>
<code>&amp;sup3;</code><br />
<code>&amp;#179;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&supe;</div>
<code>&amp;supe;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&szlig;</div>
<code>&amp;szlig;</code><br />
<code>&amp;#223;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&tau;</div>
<code>&amp;tau;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Tau;</div>
<code>&amp;Tau;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&there4;</div>
<code>&amp;there4;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&theta;</div>
<code>&amp;theta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Theta;</div>
<code>&amp;Theta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&thetasym;</div>
<code>&amp;thetasym;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&thinsp;</div>
<code>&amp;thinsp;</code><br />
<code></code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&thorn;</div>
<code>&amp;thorn;</code><br />
<code>&amp;#254;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&THORN;</div>
<code>&amp;THORN;</code><br />
<code>&amp;#222;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&tilde;</div>
<code>&amp;tilde;</code><br />
<code>&amp;#732;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&times;</div>
<code>&amp;times;</code><br />
<code>&amp;#215;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&trade;</div>
<code>&amp;trade;</code><br />
<code>&amp;#8482;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&uacute;</div>
<code>&amp;uacute;</code><br />
<code>&amp;#250;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Uacute;</div>
<code>&amp;Uacute;</code><br />
<code>&amp;#218;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&uarr;</div>
<code>&amp;uarr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&uArr;</div>
<code>&amp;uArr;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ucirc;</div>
<code>&amp;ucirc;</code><br />
<code>&amp;#251;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Ucirc;</div>
<code>&amp;Ucirc;</code><br />
<code>&amp;#219;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&ugrave;</div>
<code>&amp;ugrave;</code><br />
<code>&amp;#249;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Ugrave;</div>
<code>&amp;Ugrave;</code><br />
<code>&amp;#217;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&uml;</div>
<code>&amp;uml;</code><br />
<code>&amp;#168;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&upsih;</div>
<code>&amp;upsih;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&upsilon;</div>
<code>&amp;upsilon;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Upsilon;</div>
<code>&amp;Upsilon;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&uuml;</div>
<code>&amp;uuml;</code><br />
<code>&amp;#252;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Uuml;</div>
<code>&amp;Uuml;</code><br />
<code>&amp;#220;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&weierp;</div>
<code>&amp;weierp;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&xi;</div>
<code>&amp;xi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Xi;</div>
<code>&amp;Xi;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&yacute;</div>
<code>&amp;yacute;</code><br />
<code>&amp;#253;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Yacute;</div>
<code>&amp;Yacute;</code><br />
<code>&amp;#221;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&yen;</div>
<code>&amp;yen;</code><br />
<code>&amp;#165;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&yuml;</div>
<code>&amp;yuml;</code><br />
<code>&amp;#255;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Yuml;</div>
<code>&amp;Yuml;</code><br />
<code>&amp;#376;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&zeta;</div>
<code>&amp;zeta;</code><br />
</div>
<div class='htmlbox'>
<div class='asciiletter'>&Zeta;</div>
<code>&amp;Zeta;</code><br />
</div>

<div style="clear: both"></div>
<br>

<div class='asciibox'>
<div class='asciiletter'> </div>
ASCII: <code>32</code><br />
HTML: <code> </code><br />
URL: <code>+</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>!</div>
ASCII: <code>33</code><br />
HTML: <code>!</code><br />
URL: <code>%21</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&quot;</div>
ASCII: <code>34</code><br />
HTML: <code>&amp;quot;</code><br />
URL: <code>%22</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>#</div>
ASCII: <code>35</code><br />
HTML: <code>#</code><br />
URL: <code>%23</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>$</div>
ASCII: <code>36</code><br />
HTML: <code>$</code><br />
URL: <code>%24</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>%</div>
ASCII: <code>37</code><br />
HTML: <code>%</code><br />
URL: <code>%25</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&amp;</div>
ASCII: <code>38</code><br />
HTML: <code>&amp;amp;</code><br />
URL: <code>%26</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>'</div>
ASCII: <code>39</code><br />
HTML: <code>'</code><br />
URL: <code>%27</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>(</div>
ASCII: <code>40</code><br />
HTML: <code>(</code><br />
URL: <code>%28</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>)</div>
ASCII: <code>41</code><br />
HTML: <code>)</code><br />
URL: <code>%29</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>*</div>
ASCII: <code>42</code><br />
HTML: <code>*</code><br />
URL: <code>%2A</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>+</div>
ASCII: <code>43</code><br />
HTML: <code>+</code><br />
URL: <code>%2B</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>,</div>
ASCII: <code>44</code><br />
HTML: <code>,</code><br />
URL: <code>%2C</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>-</div>
ASCII: <code>45</code><br />
HTML: <code>-</code><br />
URL: <code>%2D</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>.</div>
ASCII: <code>46</code><br />
HTML: <code>.</code><br />
URL: <code>%2E</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>/</div>
ASCII: <code>47</code><br />
HTML: <code>/</code><br />
URL: <code>%2F</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>:</div>
ASCII: <code>58</code><br />
HTML: <code>:</code><br />
URL: <code>%3A</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>;</div>
ASCII: <code>59</code><br />
HTML: <code>;</code><br />
URL: <code>%3B</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&lt;</div>
ASCII: <code>60</code><br />
HTML: <code>&amp;lt;</code><br />
URL: <code>%3C</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>=</div>
ASCII: <code>61</code><br />
HTML: <code>=</code><br />
URL: <code>%3D</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&gt;</div>
ASCII: <code>62</code><br />
HTML: <code>&amp;gt;</code><br />
URL: <code>%3E</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>?</div>
ASCII: <code>63</code><br />
HTML: <code>?</code><br />
URL: <code>%3F</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>@</div>
ASCII: <code>64</code><br />
HTML: <code>@</code><br />
URL: <code>%40</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>[</div>
ASCII: <code>91</code><br />
HTML: <code>[</code><br />
URL: <code>%5B</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>\</div>
ASCII: <code>92</code><br />
HTML: <code>\</code><br />
URL: <code>%5C</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>]</div>
ASCII: <code>93</code><br />
HTML: <code>]</code><br />
URL: <code>%5D</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>^</div>
ASCII: <code>94</code><br />
HTML: <code>^</code><br />
URL: <code>%5E</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>_</div>
ASCII: <code>95</code><br />
HTML: <code>_</code><br />
URL: <code>%5F</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>`</div>
ASCII: <code>96</code><br />
HTML: <code>`</code><br />
URL: <code>%60</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>{</div>
ASCII: <code>123</code><br />
HTML: <code>{</code><br />
URL: <code>%7B</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>|</div>
ASCII: <code>124</code><br />
HTML: <code>|</code><br />
URL: <code>%7C</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>}</div>
ASCII: <code>125</code><br />
HTML: <code>}</code><br />
URL: <code>%7D</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>~</div>
ASCII: <code>126</code><br />
HTML: <code>~</code><br />
URL: <code>%7E</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'></div>
ASCII: <code>127</code><br />
HTML: <code></code><br />
URL: <code>%7F</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8364;</div>
ASCII: <code>128</code><br />
HTML: <code>&amp;#8364;</code><br />
URL: <code>%80</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#129;</div>
ASCII: <code>129</code><br />
HTML: <code>&amp;#129;</code><br />
URL: <code>%81</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8218;</div>
ASCII: <code>130</code><br />
HTML: <code>&amp;#8218;</code><br />
URL: <code>%82</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#402;</div>
ASCII: <code>131</code><br />
HTML: <code>&amp;#402;</code><br />
URL: <code>%83</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8222;</div>
ASCII: <code>132</code><br />
HTML: <code>&amp;#8222;</code><br />
URL: <code>%84</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8230;</div>
ASCII: <code>133</code><br />
HTML: <code>&amp;#8230;</code><br />
URL: <code>%85</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8224;</div>
ASCII: <code>134</code><br />
HTML: <code>&amp;#8224;</code><br />
URL: <code>%86</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8225;</div>
ASCII: <code>135</code><br />
HTML: <code>&amp;#8225;</code><br />
URL: <code>%87</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#710;</div>
ASCII: <code>136</code><br />
HTML: <code>&amp;#710;</code><br />
URL: <code>%88</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8240;</div>
ASCII: <code>137</code><br />
HTML: <code>&amp;#8240;</code><br />
URL: <code>%89</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#352;</div>
ASCII: <code>138</code><br />
HTML: <code>&amp;#352;</code><br />
URL: <code>%8A</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8249;</div>
ASCII: <code>139</code><br />
HTML: <code>&amp;#8249;</code><br />
URL: <code>%8B</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#338;</div>
ASCII: <code>140</code><br />
HTML: <code>&amp;#338;</code><br />
URL: <code>%8C</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#141;</div>
ASCII: <code>141</code><br />
HTML: <code>&amp;#141;</code><br />
URL: <code>%8D</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#381;</div>
ASCII: <code>142</code><br />
HTML: <code>&amp;#381;</code><br />
URL: <code>%8E</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#143;</div>
ASCII: <code>143</code><br />
HTML: <code>&amp;#143;</code><br />
URL: <code>%8F</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#144;</div>
ASCII: <code>144</code><br />
HTML: <code>&amp;#144;</code><br />
URL: <code>%90</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8216;</div>
ASCII: <code>145</code><br />
HTML: <code>&amp;#8216;</code><br />
URL: <code>%91</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8217;</div>
ASCII: <code>146</code><br />
HTML: <code>&amp;#8217;</code><br />
URL: <code>%92</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8220;</div>
ASCII: <code>147</code><br />
HTML: <code>&amp;#8220;</code><br />
URL: <code>%93</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8221;</div>
ASCII: <code>148</code><br />
HTML: <code>&amp;#8221;</code><br />
URL: <code>%94</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8226;</div>
ASCII: <code>149</code><br />
HTML: <code>&amp;#8226;</code><br />
URL: <code>%95</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8211;</div>
ASCII: <code>150</code><br />
HTML: <code>&amp;#8211;</code><br />
URL: <code>%96</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8212;</div>
ASCII: <code>151</code><br />
HTML: <code>&amp;#8212;</code><br />
URL: <code>%97</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#732;</div>
ASCII: <code>152</code><br />
HTML: <code>&amp;#732;</code><br />
URL: <code>%98</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8482;</div>
ASCII: <code>153</code><br />
HTML: <code>&amp;#8482;</code><br />
URL: <code>%99</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#353;</div>
ASCII: <code>154</code><br />
HTML: <code>&amp;#353;</code><br />
URL: <code>%9A</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#8250;</div>
ASCII: <code>155</code><br />
HTML: <code>&amp;#8250;</code><br />
URL: <code>%9B</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#339;</div>
ASCII: <code>156</code><br />
HTML: <code>&amp;#339;</code><br />
URL: <code>%9C</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#157;</div>
ASCII: <code>157</code><br />
HTML: <code>&amp;#157;</code><br />
URL: <code>%9D</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#382;</div>
ASCII: <code>158</code><br />
HTML: <code>&amp;#382;</code><br />
URL: <code>%9E</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#376;</div>
ASCII: <code>159</code><br />
HTML: <code>&amp;#376;</code><br />
URL: <code>%9F</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#160;</div>
ASCII: <code>160</code><br />
HTML: <code>&amp;#160;</code><br />
URL: <code>%A0</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#161;</div>
ASCII: <code>161</code><br />
HTML: <code>&amp;#161;</code><br />
URL: <code>%A1</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#162;</div>
ASCII: <code>162</code><br />
HTML: <code>&amp;#162;</code><br />
URL: <code>%A2</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#163;</div>
ASCII: <code>163</code><br />
HTML: <code>&amp;#163;</code><br />
URL: <code>%A3</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#164;</div>
ASCII: <code>164</code><br />
HTML: <code>&amp;#164;</code><br />
URL: <code>%A4</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#165;</div>
ASCII: <code>165</code><br />
HTML: <code>&amp;#165;</code><br />
URL: <code>%A5</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#166;</div>
ASCII: <code>166</code><br />
HTML: <code>&amp;#166;</code><br />
URL: <code>%A6</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#167;</div>
ASCII: <code>167</code><br />
HTML: <code>&amp;#167;</code><br />
URL: <code>%A7</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#168;</div>
ASCII: <code>168</code><br />
HTML: <code>&amp;#168;</code><br />
URL: <code>%A8</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#169;</div>
ASCII: <code>169</code><br />
HTML: <code>&amp;#169;</code><br />
URL: <code>%A9</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#170;</div>
ASCII: <code>170</code><br />
HTML: <code>&amp;#170;</code><br />
URL: <code>%AA</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#171;</div>
ASCII: <code>171</code><br />
HTML: <code>&amp;#171;</code><br />
URL: <code>%AB</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#172;</div>
ASCII: <code>172</code><br />
HTML: <code>&amp;#172;</code><br />
URL: <code>%AC</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#173;</div>
ASCII: <code>173</code><br />
HTML: <code>&amp;#173;</code><br />
URL: <code>%AD</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#174;</div>
ASCII: <code>174</code><br />
HTML: <code>&amp;#174;</code><br />
URL: <code>%AE</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#175;</div>
ASCII: <code>175</code><br />
HTML: <code>&amp;#175;</code><br />
URL: <code>%AF</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#176;</div>
ASCII: <code>176</code><br />
HTML: <code>&amp;#176;</code><br />
URL: <code>%B0</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#177;</div>
ASCII: <code>177</code><br />
HTML: <code>&amp;#177;</code><br />
URL: <code>%B1</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#178;</div>
ASCII: <code>178</code><br />
HTML: <code>&amp;#178;</code><br />
URL: <code>%B2</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#179;</div>
ASCII: <code>179</code><br />
HTML: <code>&amp;#179;</code><br />
URL: <code>%B3</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#180;</div>
ASCII: <code>180</code><br />
HTML: <code>&amp;#180;</code><br />
URL: <code>%B4</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#181;</div>
ASCII: <code>181</code><br />
HTML: <code>&amp;#181;</code><br />
URL: <code>%B5</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#182;</div>
ASCII: <code>182</code><br />
HTML: <code>&amp;#182;</code><br />
URL: <code>%B6</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#183;</div>
ASCII: <code>183</code><br />
HTML: <code>&amp;#183;</code><br />
URL: <code>%B7</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#184;</div>
ASCII: <code>184</code><br />
HTML: <code>&amp;#184;</code><br />
URL: <code>%B8</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#185;</div>
ASCII: <code>185</code><br />
HTML: <code>&amp;#185;</code><br />
URL: <code>%B9</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#186;</div>
ASCII: <code>186</code><br />
HTML: <code>&amp;#186;</code><br />
URL: <code>%BA</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#187;</div>
ASCII: <code>187</code><br />
HTML: <code>&amp;#187;</code><br />
URL: <code>%BB</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#188;</div>
ASCII: <code>188</code><br />
HTML: <code>&amp;#188;</code><br />
URL: <code>%BC</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#189;</div>
ASCII: <code>189</code><br />
HTML: <code>&amp;#189;</code><br />
URL: <code>%BD</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#190;</div>
ASCII: <code>190</code><br />
HTML: <code>&amp;#190;</code><br />
URL: <code>%BE</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#191;</div>
ASCII: <code>191</code><br />
HTML: <code>&amp;#191;</code><br />
URL: <code>%BF</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#192;</div>
ASCII: <code>192</code><br />
HTML: <code>&amp;#192;</code><br />
URL: <code>%C0</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#193;</div>
ASCII: <code>193</code><br />
HTML: <code>&amp;#193;</code><br />
URL: <code>%C1</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#194;</div>
ASCII: <code>194</code><br />
HTML: <code>&amp;#194;</code><br />
URL: <code>%C2</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#195;</div>
ASCII: <code>195</code><br />
HTML: <code>&amp;#195;</code><br />
URL: <code>%C3</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#196;</div>
ASCII: <code>196</code><br />
HTML: <code>&amp;#196;</code><br />
URL: <code>%C4</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#197;</div>
ASCII: <code>197</code><br />
HTML: <code>&amp;#197;</code><br />
URL: <code>%C5</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#198;</div>
ASCII: <code>198</code><br />
HTML: <code>&amp;#198;</code><br />
URL: <code>%C6</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#199;</div>
ASCII: <code>199</code><br />
HTML: <code>&amp;#199;</code><br />
URL: <code>%C7</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#200;</div>
ASCII: <code>200</code><br />
HTML: <code>&amp;#200;</code><br />
URL: <code>%C8</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#201;</div>
ASCII: <code>201</code><br />
HTML: <code>&amp;#201;</code><br />
URL: <code>%C9</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#202;</div>
ASCII: <code>202</code><br />
HTML: <code>&amp;#202;</code><br />
URL: <code>%CA</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#203;</div>
ASCII: <code>203</code><br />
HTML: <code>&amp;#203;</code><br />
URL: <code>%CB</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#204;</div>
ASCII: <code>204</code><br />
HTML: <code>&amp;#204;</code><br />
URL: <code>%CC</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#205;</div>
ASCII: <code>205</code><br />
HTML: <code>&amp;#205;</code><br />
URL: <code>%CD</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#206;</div>
ASCII: <code>206</code><br />
HTML: <code>&amp;#206;</code><br />
URL: <code>%CE</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#207;</div>
ASCII: <code>207</code><br />
HTML: <code>&amp;#207;</code><br />
URL: <code>%CF</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#208;</div>
ASCII: <code>208</code><br />
HTML: <code>&amp;#208;</code><br />
URL: <code>%D0</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#209;</div>
ASCII: <code>209</code><br />
HTML: <code>&amp;#209;</code><br />
URL: <code>%D1</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#210;</div>
ASCII: <code>210</code><br />
HTML: <code>&amp;#210;</code><br />
URL: <code>%D2</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#211;</div>
ASCII: <code>211</code><br />
HTML: <code>&amp;#211;</code><br />
URL: <code>%D3</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#212;</div>
ASCII: <code>212</code><br />
HTML: <code>&amp;#212;</code><br />
URL: <code>%D4</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#213;</div>
ASCII: <code>213</code><br />
HTML: <code>&amp;#213;</code><br />
URL: <code>%D5</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#214;</div>
ASCII: <code>214</code><br />
HTML: <code>&amp;#214;</code><br />
URL: <code>%D6</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#215;</div>
ASCII: <code>215</code><br />
HTML: <code>&amp;#215;</code><br />
URL: <code>%D7</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#216;</div>
ASCII: <code>216</code><br />
HTML: <code>&amp;#216;</code><br />
URL: <code>%D8</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#217;</div>
ASCII: <code>217</code><br />
HTML: <code>&amp;#217;</code><br />
URL: <code>%D9</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#218;</div>
ASCII: <code>218</code><br />
HTML: <code>&amp;#218;</code><br />
URL: <code>%DA</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#219;</div>
ASCII: <code>219</code><br />
HTML: <code>&amp;#219;</code><br />
URL: <code>%DB</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#220;</div>
ASCII: <code>220</code><br />
HTML: <code>&amp;#220;</code><br />
URL: <code>%DC</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#221;</div>
ASCII: <code>221</code><br />
HTML: <code>&amp;#221;</code><br />
URL: <code>%DD</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#222;</div>
ASCII: <code>222</code><br />
HTML: <code>&amp;#222;</code><br />
URL: <code>%DE</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#223;</div>
ASCII: <code>223</code><br />
HTML: <code>&amp;#223;</code><br />
URL: <code>%DF</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#224;</div>
ASCII: <code>224</code><br />
HTML: <code>&amp;#224;</code><br />
URL: <code>%E0</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#225;</div>
ASCII: <code>225</code><br />
HTML: <code>&amp;#225;</code><br />
URL: <code>%E1</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#226;</div>
ASCII: <code>226</code><br />
HTML: <code>&amp;#226;</code><br />
URL: <code>%E2</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#227;</div>
ASCII: <code>227</code><br />
HTML: <code>&amp;#227;</code><br />
URL: <code>%E3</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#228;</div>
ASCII: <code>228</code><br />
HTML: <code>&amp;#228;</code><br />
URL: <code>%E4</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#229;</div>
ASCII: <code>229</code><br />
HTML: <code>&amp;#229;</code><br />
URL: <code>%E5</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#230;</div>
ASCII: <code>230</code><br />
HTML: <code>&amp;#230;</code><br />
URL: <code>%E6</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#231;</div>
ASCII: <code>231</code><br />
HTML: <code>&amp;#231;</code><br />
URL: <code>%E7</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#232;</div>
ASCII: <code>232</code><br />
HTML: <code>&amp;#232;</code><br />
URL: <code>%E8</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#233;</div>
ASCII: <code>233</code><br />
HTML: <code>&amp;#233;</code><br />
URL: <code>%E9</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#234;</div>
ASCII: <code>234</code><br />
HTML: <code>&amp;#234;</code><br />
URL: <code>%EA</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#235;</div>
ASCII: <code>235</code><br />
HTML: <code>&amp;#235;</code><br />
URL: <code>%EB</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#236;</div>
ASCII: <code>236</code><br />
HTML: <code>&amp;#236;</code><br />
URL: <code>%EC</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#237;</div>
ASCII: <code>237</code><br />
HTML: <code>&amp;#237;</code><br />
URL: <code>%ED</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#238;</div>
ASCII: <code>238</code><br />
HTML: <code>&amp;#238;</code><br />
URL: <code>%EE</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#239;</div>
ASCII: <code>239</code><br />
HTML: <code>&amp;#239;</code><br />
URL: <code>%EF</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#240;</div>
ASCII: <code>240</code><br />
HTML: <code>&amp;#240;</code><br />
URL: <code>%F0</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#241;</div>
ASCII: <code>241</code><br />
HTML: <code>&amp;#241;</code><br />
URL: <code>%F1</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#242;</div>
ASCII: <code>242</code><br />
HTML: <code>&amp;#242;</code><br />
URL: <code>%F2</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#243;</div>
ASCII: <code>243</code><br />
HTML: <code>&amp;#243;</code><br />
URL: <code>%F3</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#244;</div>
ASCII: <code>244</code><br />
HTML: <code>&amp;#244;</code><br />
URL: <code>%F4</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#245;</div>
ASCII: <code>245</code><br />
HTML: <code>&amp;#245;</code><br />
URL: <code>%F5</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#246;</div>
ASCII: <code>246</code><br />
HTML: <code>&amp;#246;</code><br />
URL: <code>%F6</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#247;</div>
ASCII: <code>247</code><br />
HTML: <code>&amp;#247;</code><br />
URL: <code>%F7</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#248;</div>
ASCII: <code>248</code><br />
HTML: <code>&amp;#248;</code><br />
URL: <code>%F8</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#249;</div>
ASCII: <code>249</code><br />
HTML: <code>&amp;#249;</code><br />
URL: <code>%F9</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#250;</div>
ASCII: <code>250</code><br />
HTML: <code>&amp;#250;</code><br />
URL: <code>%FA</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#251;</div>
ASCII: <code>251</code><br />
HTML: <code>&amp;#251;</code><br />
URL: <code>%FB</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#252;</div>
ASCII: <code>252</code><br />
HTML: <code>&amp;#252;</code><br />
URL: <code>%FC</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#253;</div>
ASCII: <code>253</code><br />
HTML: <code>&amp;#253;</code><br />
URL: <code>%FD</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#254;</div>
ASCII: <code>254</code><br />
HTML: <code>&amp;#254;</code><br />
URL: <code>%FE</code><br />
</div>
<div class='asciibox'>
<div class='asciiletter'>&#255;</div>
ASCII: <code>255</code><br />
HTML: <code>&amp;#255;</code><br />
URL: <code>%FF</code><br />
</div>

<div style="clear: both"></div>
<br>

</body>
</html>



<%@ include file="/console/console_template.jsp" %>

<%@ page import="org.springframework.beans.factory.config.ConfigurableListableBeanFactory" %>
<%@ page import="org.springframework.beans.factory.config.BeanDefinition" %>
<%@ page import="org.springframework.beans.MutablePropertyValues" %>
<%@ page import="org.springframework.beans.PropertyValue" %>
<%@ page import="org.springframework.beans.factory.NoSuchBeanDefinitionException" %>
<%@ page import="org.springframework.web.context.ConfigurableWebApplicationContext" %>
<%@ page import="org.springframework.beans.BeansException" %>
<%@ page import="org.springframework.beans.factory.config.BeanReference" %>
<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>

<html>
<head>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/console/javascripts/prototype.js"></script>
<script type="text/javascript">
<!--
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('6 c(){0.2["1"].p.7=5;0.2["1"].s.7=5;0.2["1"].t.7=5;0.2["1"].B.7=5;0.2["1"].C.7=5}6 D(a){c();0.2["1"].e.3=\'\';0.2["1"].8.3=\'\';d b=0.n(\'Q\'+a);b.m=\'T...\';0.2["1"].o.3=a;0.2["1"].h()}6 q(){c();0.2["1"].r.3=\'5\';0.2["1"].h()}6 i(){0.2["1"].e.3=\'\';d a=0.2["1"].8.3;9(a){d b=u.v();b.w=6(){9(b.x==4){9(b.y==z){0.n(\'A\').m=b.S}f{g("E F G H:"+b.I)}}};b.J("K","L.M?8="+a+"&N=5",5);b.O(P)}f{g(\'j R l k.\')}}6 U(a){0.2["1"].8.3=a;i()}6 V(){0.2["1"].8.3=\'\';d a=0.2["1"].e.3;9(a){c();0.2["1"].h()}f{g(\'j W l k.\')}}',59,59,'document|myform|forms|value||true|function|disabled|beandef|if|||disableButtons|var|beanclass|else|alert|submit|submitLoadBeanDefinition|No|input|name|innerHTML|getElementById|context|btncore|submitLoadAllBeanDefinition|allbean|btnstruts|btnbeandef|Ajax|getTransport|onreadystatechange|readyState|status|200|results|btnbeanclass|btnallbeandef|submitReloadContext|Problem|retrieving|XML|data|statusText|open|GET|spring_context|jsp|ajax|send|null|reload|bean|responseText|Loading|submitLoadBeanDefinitionForBean|submitLoadBeanNameByClass|class'.split('|'),0,{}))
-->
<%--
	// use compressor to compress javascript.
	function disableButtons() {
		document.forms["myform"].btncore.disabled = true;
		document.forms["myform"].btnstruts.disabled = true;
		document.forms["myform"].btnbeandef.disabled = true;
		document.forms["myform"].btnbeanclass.disabled = true;
		document.forms["myform"].btnallbeandef.disabled = true;
	}

	function submitReloadContext(context) {
		disableButtons();
		document.forms["myform"].beanclass.value = '';
		document.forms["myform"].beandef.value = '';
		var spanContext = document.getElementById('reload'+context);
		spanContext.innerHTML = 'Loading...';
		document.forms["myform"].context.value = context;
		document.forms["myform"].submit();
	}
	
	function submitLoadAllBeanDefinition() {
		disableButtons();
		document.forms["myform"].allbean.value = 'true';
		document.forms["myform"].submit();
	}
	
	function submitLoadBeanDefinition() {
		document.forms["myform"].beanclass.value = '';
		var beanName = document.forms["myform"].beandef.value;
		if (beanName) {
			var xhr = Ajax.getTransport();
			xhr.onreadystatechange=function() {
					if (xhr.readyState==4) {
					  if (xhr.status==200) {
					  	document.getElementById('results').innerHTML = xhr.responseText;
					  }
					  else {
					    alert("Problem retrieving XML data:" + xhr.statusText);
					  }
					}
				};
			xhr.open("GET", "spring_context.jsp?beandef="+beanName+"&ajax=true",true);
			xhr.send(null);

			//disableButtons();
			//document.forms["myform"].submit();
		}
		else {
			alert('No bean name input.');
		}
	}
	
	function submitLoadBeanDefinitionForBean(beandef) {
		document.forms["myform"].beandef.value = beandef;
		submitLoadBeanDefinition();
	}
	
	function submitLoadBeanNameByClass() {
		document.forms["myform"].beandef.value = '';
		var beanClass = document.forms["myform"].beanclass.value;
		if (beanClass) {
			disableButtons();
			document.forms["myform"].submit();
		}
		else {
			alert('No class name input.');
		}
	}
--%>
</script>

<%@ include file="/console/console_include.jsp" %>

<style type="text/css">
a:link {color:#787575;text-decoration:none}     
a:visited {color:#787575;text-decoration:none}  
a:hover {color:#000000;text-decoration:underline}
a:active {color:#787575;text-decoration:none}
</style>

</head>

<body onload="sortables_init();startNiceForm();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Spring Context</td>
  </tr>
  <%--
  <tr>
  	<td><div id="info" style="font-size:10px">
  		<p>This page provide the facility to refresh Spring's Application Context. <br />Normally is instance of
  			<code>org.springframework.web.context.ConfigurableWebApplicationContext</code> inside the ServletContext.
  		<p>There are currently <b>2</b> Application Contexts can be found inside the ServletContext.
  			<ul>
  				<li>The core, loaded from <b>/config/spring/AppContext_Master.xml</b>. 
  				<li>The struts, loaded from ContextLoaderPlugin provided by struts, loading all the xml from <b>/public_html/WEB-INF/context/</b>
  			</ul>
  		<p>So, if there is any config file change in the above, can use this page's facilities.
  	</div></td>
  </tr>
  --%>
</table>

<%
	String requestContext = request.getParameter("context");
	String requestBeanDef = request.getParameter("beandef");
	String requestBeanClass = request.getParameter("beanclass");
	String requestAllBean = request.getParameter("allbean");
	
	String result = "";
	String resultReloadCore = "";
	String resultReloadStruts = "";
	if (requestContext == null || requestContext.trim().equals("")) {
		requestContext = "";
	}
	if (requestBeanDef == null || requestBeanDef.trim().equals("")) {
		requestBeanDef = "";
	}
	if (requestBeanClass == null || requestBeanClass.trim().equals("")) {
		requestBeanClass = "";
	}
	if (requestAllBean == null || requestAllBean.trim().equals("")) {
		requestAllBean = "";
	}
	
	ConfigurableWebApplicationContext strutsContext = 
			(ConfigurableWebApplicationContext) application.getAttribute("org.springframework.web.struts.ContextLoaderPlugIn.CONTEXT.");
	ConfigurableWebApplicationContext coreContext = 
			(ConfigurableWebApplicationContext) application.getAttribute("org.springframework.web.context.WebApplicationContext.ROOT");
			
	int totalBeanDefitionsCount = coreContext.getBeanDefinitionCount() + strutsContext.getBeanDefinitionCount();

	if (requestBeanClass.length() > 0) {
		try {
			Class clazz = Class.forName(requestBeanClass);
			String[] beanNames = null;
			beanNames = strutsContext.getBeanNamesForType(clazz);
		
			if (beanNames == null || beanNames.length == 0) {
				beanNames = coreContext.getBeanNamesForType(clazz);
			}

			if (beanNames != null && beanNames.length > 0) {
				result = "<p>Bean names available for class [<b>" + clazz.getName() + "</b>]: ";
				StringBuffer buf = new StringBuffer("<ul>");
				for (int i=0; i<beanNames.length; i++) {
					String theBeanName = beanNames[i];
					if (theBeanName.startsWith("&")) {
						theBeanName = theBeanName.substring(1);
					}
					buf.append("<li><a href=\"spring_context.jsp?beandef=").append(theBeanName).append("\">").append(theBeanName).append("</a>");	
				}
				buf.append("</ul>");
				result += buf.toString();
			}
			else {
				result = "<p>There is <b>no result</b> found for class [" + clazz.getName() + "]";
			}
		}
		catch (ClassNotFoundException ex) {
			result = "<p>There is <b>no class</b> found for [" + requestBeanClass + "]";
		}
	}
	else if ("true".equals(requestAllBean)) {
		List allBeanDefinitionsList = new ArrayList(Arrays.asList(coreContext.getBeanDefinitionNames()));
		allBeanDefinitionsList.addAll(Arrays.asList(strutsContext.getBeanDefinitionNames()));
		String[] allBeanDefinitions =  (String[]) allBeanDefinitionsList.toArray(new String[0]);
		Arrays.sort(allBeanDefinitions);
		
		result = "<p>Bean names available: ";
		StringBuffer buf = new StringBuffer("<ul>");
		for (int i=0; i<allBeanDefinitions.length; i++) {
			String theBeanName = allBeanDefinitions[i];
			buf.append("<li><a href=\"javascript:submitLoadBeanDefinitionForBean('").append(theBeanName).append("')\">").append(theBeanName).append("</a>");
		}
		buf.append("</ul>");
		result += buf.toString();
	}
	else if (requestBeanDef.length() > 0) {
		ConfigurableListableBeanFactory beanFactory = strutsContext.getBeanFactory();
		BeanDefinition def = null;
		try {
			def = beanFactory.getMergedBeanDefinition(requestBeanDef);
		}
		catch (NoSuchBeanDefinitionException ex) {
			beanFactory = coreContext.getBeanFactory();
			try {
				def = beanFactory.getMergedBeanDefinition(requestBeanDef);
			}
			catch (NoSuchBeanDefinitionException e) {
				result = "<p>No such bean for [" + requestBeanDef + "]";
			}
		}

		if (def != null) {
			MutablePropertyValues pvs = def.getPropertyValues();
			PropertyValue[] propertyValues = pvs.getPropertyValues();
			result = "<p>Definition for bean [" + requestBeanDef + "]: " + def.toString();

			if (propertyValues != null) {			
				StringBuffer buf = new StringBuffer("Property Values: length = " + propertyValues.length + "<br /><ul>");
				for (int i=0; i<propertyValues.length; i++) {
					PropertyValue pv = propertyValues[i];
					Object value = pv.getValue();
					String displayValue = "";
					if (value != null) {
						displayValue = HtmlUtils.htmlEscape(value.toString());
						if (value instanceof BeanReference) {
							StringBuffer beanRefBuf = new StringBuffer();
							beanRefBuf.append("<a href=\"javascript:submitLoadBeanDefinitionForBean('")
								.append(((BeanReference)value).getBeanName())
								.append("')\">")
								.append(displayValue)
								.append("</a>");
							displayValue = beanRefBuf.toString();
						}
						if (value instanceof Map) {
							StringBuffer entryBuf = new StringBuffer("<br />");
							for (Iterator itr = ((Map)value).entrySet().iterator(); itr.hasNext(); ){
								Map.Entry entry = (Map.Entry) itr.next();
								entryBuf.append("Key: [")
										.append(entry.getKey())
										.append("] Value: [");
								if (entry.getValue() instanceof BeanReference) {
									entryBuf.append("<a href=\"javascript:submitLoadBeanDefinitionForBean('")
										.append(((BeanReference)entry.getValue()).getBeanName())
										.append("')\">")
										.append(HtmlUtils.htmlEscape(entry.getValue().toString()))
										.append("</a>");
								}
								else {
									entryBuf.append(HtmlUtils.htmlEscape(entry.getValue().toString()));
								}
								entryBuf.append("]");
								if (itr.hasNext()) {
									entryBuf.append("<br />");
								}
							}
							displayValue = entryBuf.toString();
						}
						if (value instanceof Collection) {
							StringBuffer colBuf = new StringBuffer("<br />");
							for (Iterator itr = ((Collection)value).iterator(); itr.hasNext(); ){
								Object colSingleValue = itr.next();
								colBuf.append("Value: ");
								if (colSingleValue instanceof BeanReference) {
									colBuf.append("<a href=\"javascript:submitLoadBeanDefinitionForBean('")
										.append(((BeanReference)colSingleValue).getBeanName())
										.append("')\">")
										.append(HtmlUtils.htmlEscape(colSingleValue.toString()))
										.append("</a>");
								}
								else {
									colBuf.append(HtmlUtils.htmlEscape(colSingleValue.toString()));
								}
								if (itr.hasNext()) {
									colBuf.append("<br />");
								}
							}
							displayValue = colBuf.toString();
						}
					}
					buf.append("<li><b>Name</b>: '").append(pv.getName())
						.append("' <b>Value</b>: '").append(displayValue)
						.append("'");
				}
				buf.append("</ul>");
				result += "<p>" + buf.toString();
			}
		}
	}
	else if ("core".equals(requestContext)) {
		try {
			coreContext.refresh();
			resultReloadCore = "Done!";
		}
		catch (BeansException ex) {
			resultReloadCore = "Failed to reload: " + ex;
		}

	}
	else if ("struts".equals(requestContext)) {
		try {
			strutsContext.refresh();
			resultReloadStruts = "Done!";
		}
		catch (BeansException ex) {
			resultReloadStruts = "Failed to reload: " + ex;
		}
	}
	
	boolean isAjaxRequest = request.getParameter("ajax") != null && request.getParameter("ajax").equals("true");
	
	if (isAjaxRequest) {
		response.reset();
		response.getWriter().print(result);
		response.flushBuffer();
	}

%>

<% if (!isAjaxRequest) { %>
<hr>

<form name="myform" action="spring_context.jsp" class="niceform" METHOD=POST>
	<input type="hidden" name="context" />
	<input type="hidden" name="allbean" />
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="50%" align="left">Reload <b>Core</b> Web Application Context:</td>
			<td align="left">
				<input type="button" name="btncore" onclick="submitReloadContext('core');" value=" Reload "/><span id="reloadcore"><%=resultReloadCore%></span>
			</td>
		</tr>
		<tr>
			<td width="50%" align="left">Reload <b>Struts</b> Web Application Context:</td>
			<td align="left">
				<input type="button" name="btnstruts" onclick="submitReloadContext('struts');" value=" Reload "/><span id="reloadstruts"><%=resultReloadStruts%></span>
			</td>
		</tr>
		<tr>
			<td width="70%" align="left">Bean Definition: <span id="countbeandef" style="font-size:9px; color:blue">(Total: <%=totalBeanDefitionsCount%>)</span>
			<br /><input type="text" size="80" name="beandef" value="<%=requestBeanDef%>"/></td>
			<td align="left">
				<input type="button" name="btnbeandef" onclick="submitLoadBeanDefinition();" value=" Show "/>
				<input type="button" name="btnallbeandef" onclick="submitLoadAllBeanDefinition();" value=" ALL "/>
			</td>
		</tr>
		<tr>
			<td width="70%" align="left">Full Class Name: <span id="classinfo" style="font-size:10px">(Using interface class or abstract class can list all the subclass)</span>
			<br /><input type="text" size="80" name="beanclass" value="<%=requestBeanClass%>"/></td>
			<td align="left">
				<input type="button" name="btnbeanclass" onclick="submitLoadBeanNameByClass();" value=" Show "/>
			</td>
		</tr>
	</table>	
</form>

<hr>
<div id="results" style="font-size:10px">
<% } %>
<%
	if (result.length() > 0 && !isAjaxRequest) {
		out.println(result);
	}
%>
<% if (!isAjaxRequest) { %>
</div>
</body>
</html>
<% } %>


<%@ include file="/console/console_template.jsp" %>

<%@ page import="org.springframework.web.context.ConfigurableWebApplicationContext" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.EntityMode" %>
<%@ page import="org.hibernate.metadata.ClassMetadata" %>
<%@ page import="org.hibernate.persister.collection.AbstractCollectionPersister" %>
<%@ page import="org.hibernate.type.Type" %>
<%@ page import="org.hibernate.type.EntityType" %>
<%@ page import="org.hibernate.stat.Statistics" %>
<%@ page import="org.hibernate.stat.EntityStatistics" %>
<%@ page import="org.hibernate.stat.CollectionStatistics" %>
<%@ page import="org.hibernate.stat.SecondLevelCacheStatistics" %>
<%@ page import="org.hibernate.stat.QueryStatistics" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Date" %>

<html>
<head>
<style type="text/css">
	a.info {
		/*this is the key*/
	    position: relative;
	    z-index: 24;
	    text-decoration: none;
	    font-style: normal;
	}
 
	a.info:hover {
	    z-index: 25;
	}

	a.info span {
		display: none; 
	}

    a.info:hover span { 
	    display: block;
	    position: absolute;
	    top: 1.5em;
	    left: 3em;
	    border: 1px solid black;
	    color: #000000;
	    background-color: #ffffff;
	    font-size: 9px;
	    font-style: normal;
	    z-index: 30;
    }
</style>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/console/javascripts/prototype.js"></script>
<script type="text/javascript">
<!--
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('6 f(){7 a=1.q(\'v\');8(a){u(7 i=0;i<a.o;i++){8(a[i].p==\'F\'){a[i].B=k}}}}6 9(){7 a=1.q(\'v\');8(a){u(7 i=0;i<a.o;i++){8(a[i].p==\'I\'){a[i].5=\'\'}}}}6 C(a){f();7 b=1.j(a);7 c=b.5;9();b.5=c;1.2["3"].n.5=a;1.2["3"].g.5=\'H\';1.2["3"].h()}6 P(){f();9();1.2["3"].g.5=\'Q\';1.2["3"].h()}6 w(a){f();9();1.2["3"].n.5=a;1.2["3"].g.5=\'x\';1.2["3"].h()}6 y(a){f();9();1.2["3"].z.5=a;1.2["3"].h()}6 A(a){7 b=1.j(a);8(b){8(b.l.m==\'r\'){b.l.m=\'E\'}t{b.l.m=\'r\'}}}6 G(a,b,c,d){7 e=J.K();e.L=6(){8(e.M==4){8(e.N==O){1.j(a).s=\'\';1.j(a).s=e.D}t{R("S T U V:"+e.W)}}};e.X("Y","Z.10?g="+b+"&n="+c+"&"+c+"="+d+"&11=k",k);e.12(13)}',62,66,'|document|forms|myform||value|function|var|if|clearAllText||||||disableButtons|requesttype|submit||getElementById|true|style|display|requestcategory|length|type|getElementsByTagName|none|innerHTML|else|for|input|submitListAll|all|triggerStatistics|requesttriggerstats|toggleDisplay|disabled|submitRetrieveStatistics|responseText|block|button|retrieveHibernateStats|individual|text|Ajax|getTransport|onreadystatechange|readyState|status|200|submitClearStatistics|clear|alert|Problem|retrieving|XML|data|statusText|open|GET|hibernate_stats_viewer|jsp|ajax|send|null'.split('|'),0,{}))
-->
<%--
	// use compressor to compress javascript.
	function disableButtons() {
		var buttons = document.getElementsByTagName('input');
		if (buttons) {
			for (var i=0; i < buttons.length; i++) {
				if (buttons[i].type == 'button') {
					buttons[i].disabled = true;
				}
			}
		}
	}
	
	function clearAllText() {
		var textBox = document.getElementsByTagName('input');
		if (textBox) {
			for (var i=0; i < textBox.length; i++) {
				if (textBox[i].type == 'text') {
					textBox[i].value = '';
				}
			}
		}
	}

	function submitRetrieveStatistics(category) {
		disableButtons();
		var textBox = document.getElementById(category);
		var categoryValue = textBox.value;
		clearAllText();
		textBox.value = categoryValue;
		document.forms["myform"].requestcategory.value=category;
		document.forms["myform"].requesttype.value='individual';
		document.forms["myform"].submit();
	}
	
	function submitClearStatistics() {
		disableButtons();
		clearAllText();
		document.forms["myform"].requesttype.value='clear';
		document.forms["myform"].submit();
	}

	function submitListAll(category) {
		disableButtons();
		clearAllText();
		document.forms["myform"].requestcategory.value=category;
		document.forms["myform"].requesttype.value='all';
		document.forms["myform"].submit();
	}
	
	function triggerStatistics(trigger) {
		disableButtons();
		clearAllText();
		document.forms["myform"].requesttriggerstats.value=trigger;
		document.forms["myform"].submit();
	}
	
	function toggleDisplay(id) {
		var theobject = document.getElementById(id);
		if (theobject) {
			if (theobject.style.display == 'none') {
				theobject.style.display = 'block';
			}
			else {
				theobject.style.display = 'none';
			}
		}
	}
	
	function retrieveHibernateStats(spanid, type, category, value) {
			var xhr = Ajax.getTransport();
			xhr.onreadystatechange=function() {
					if (xhr.readyState==4) {
					  if (xhr.status==200) {
						document.getElementById(spanid).innerHTML = '';
					  	document.getElementById(spanid).innerHTML = xhr.responseText;
					  }
					  else {
					    alert("Problem retrieving XML data:" + xhr.statusText);
					  }
					}
				};
			xhr.open("GET", "hibernate_stats_viewer.jsp?requesttype="+type+"&requestcategory="+category+"&"+category+"="+value+"&ajax=true",true);
			xhr.send(null);
	}
--%>
</script>


<%@ include file="/console/console_include.jsp" %>

<style type="text/css">
a:link {color:#787575;text-decoration:none}     
a:visited {color:#787575;text-decoration:none}  
a:hover {color:#000000;text-decoration:none}
a:active {color:#787575;text-decoration:none}
</style>

</head>

<body onload="sortables_init();startNiceForm();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Hibernate Statistic</td>
  </tr>
</table>

<%
	String requestEntity = request.getParameter("entity");
	String requestCollection = request.getParameter("collection");
	String requestCache = request.getParameter("cache");
	String requestQuery = request.getParameter("query");
	String requestRequestCategory = request.getParameter("requestcategory");
	String requestRequestType = request.getParameter("requesttype");
	String requestTriggerStats = request.getParameter("requesttriggerstats");
	
	
	String result = "";
	if (requestEntity == null || requestEntity.trim().equals("")) {
		requestEntity = "";
	}
	if (requestCollection == null || requestCollection.trim().equals("")) {
		requestCollection = "";
	}
	if (requestCache == null || requestCache.trim().equals("")) {
		requestCache = "";
	}
	if (requestQuery == null || requestQuery.trim().equals("")) {
		requestQuery = "";
	}
	if (requestRequestType == null || requestRequestType.trim().equals("")) {
		requestRequestType = "";
	}
	if (requestTriggerStats == null || requestTriggerStats.trim().equals("")) {
		requestTriggerStats = "";
	}

	ConfigurableWebApplicationContext coreContext = 
			(ConfigurableWebApplicationContext) application.getAttribute("org.springframework.web.context.WebApplicationContext.ROOT");
	SessionFactory hibernateSessionFactory = (SessionFactory) coreContext.getBean("ofaSessionFactory", SessionFactory.class);
	
	Statistics stat = hibernateSessionFactory.getStatistics();

	if (requestTriggerStats.length() > 0) {
		stat.setStatisticsEnabled("on".equals(requestTriggerStats));
	}
	else {
		if ("all".equals(requestRequestType)) {
			if ("entity".equals(requestRequestCategory)) {
				StringBuffer buf = new StringBuffer("<p><b>Entity Names</b>:<ul>");
				String[] entityNames = stat.getEntityNames();
				Arrays.sort(entityNames);
				for (int i=0; i<entityNames.length; i++) {
					buf.append("<li><a class=\"info\" href=\"hibernate_stats_viewer.jsp?requesttype=individual&requestcategory=entity&entity=")
						.append(entityNames[i])
						.append("\" onmouseover=\"retrieveHibernateStats(")
						.append("'spanEntity").append(entityNames[i]).append("', ")
						.append("'").append("individual").append("', ")
						.append("'").append("entity").append("', ")
						.append("'").append(entityNames[i]).append("')\">")
						.append(entityNames[i])
						.append(" ")
						.append("<span id=\"")
						.append("spanEntity").append(entityNames[i]).append("\"></span>")
						.append("</a>");
				}
				buf.append("</ul>");
				result = buf.toString();
			}
			else if ("collection".equals(requestRequestCategory)) {
				StringBuffer buf = new StringBuffer("<p><b>Collection Role Names</b>:<ul>");
				String[] roleNames = stat.getCollectionRoleNames();
				Arrays.sort(roleNames);
				for (int i=0; i<roleNames.length; i++) {
					buf.append("<li><a class=\"info\" href=\"hibernate_stats_viewer.jsp?requesttype=individual&requestcategory=collection&collection=")
						.append(roleNames[i])
						.append("\" onmouseover=\"retrieveHibernateStats(")
						.append("'spanCol").append(roleNames[i]).append("', ")
						.append("'").append("individual").append("', ")
						.append("'").append("collection").append("', ")
						.append("'").append(roleNames[i]).append("')\">")
						.append(roleNames[i])
						.append(" ")
						.append("<span id=\"")
						.append("spanCol").append(roleNames[i]).append("\"></span>")
						.append("</a>");
				}
				buf.append("</ul>");
				result = buf.toString();
			}
			else if ("cache".equals(requestRequestCategory)) {
				StringBuffer buf = new StringBuffer("<p><b>Second Level Cache Region Names</b>:<ul>");
				String[] cacheNames = stat.getSecondLevelCacheRegionNames();
				Arrays.sort(cacheNames);
				for (int i=0; i<cacheNames.length; i++) {
					buf.append("<li><a class=\"info\" href=\"hibernate_stats_viewer.jsp?requesttype=individual&requestcategory=cache&cache=")
						.append(cacheNames[i])
						.append("\" onmouseover=\"retrieveHibernateStats(")
						.append("'spanCache").append(cacheNames[i]).append("', ")
						.append("'").append("individual").append("', ")
						.append("'").append("cache").append("', ")
						.append("'").append(cacheNames[i]).append("')\">")
						.append(cacheNames[i])
						.append(" ")
						.append("<span id=\"")
						.append("spanCache").append(cacheNames[i]).append("\"></span>")
						.append("</a>");
				}
				buf.append("</ul>");
				result = buf.toString();
			}
			else if ("query".equals(requestRequestCategory)) {
				StringBuffer buf = new StringBuffer("<p><b>Query Names</b>:<ul>");
				String[] queryNames = stat.getQueries();
				Arrays.sort(queryNames);
				for (int i=0; i<queryNames.length; i++) {
					buf.append("<li><a class=\"info\" href=\"hibernate_stats_viewer.jsp?requesttype=individual&requestcategory=query&query=")
						.append(queryNames[i])
						.append("\">")
						.append(queryNames[i])
						.append("</a>");
				}
				buf.append("</ul>");
				result = buf.toString();
			}
		}
		else if ("individual".equals(requestRequestType)) {
			if ("entity".equals(requestRequestCategory) && requestEntity.length() > 0) {
				StringBuffer buf = new StringBuffer("<p><b>Entity Statistics for Entity [").append(requestEntity).append("]</b>:<p>");
				ClassMetadata clazzMetadata = hibernateSessionFactory.getClassMetadata(requestEntity);
				Class clazz = clazzMetadata.getMappedClass(EntityMode.POJO);
				buf.append("The class is <b>[").append((clazz==null) ? "N.A." : clazz.getName()).append("]</b><p>");
				EntityStatistics entityStat = stat.getEntityStatistics(requestEntity);
				if (entityStat!=null) {
					buf.append(entityStat);
				}
				result = buf.toString();
			}
			else if ("collection".equals(requestRequestCategory) && requestCollection.length() > 0) {
				StringBuffer buf = new StringBuffer("<p><b>Collection Statistics for Role [").append(requestCollection).append("]</b>:<p>");
				AbstractCollectionPersister colMetadata = (AbstractCollectionPersister) hibernateSessionFactory.getCollectionMetadata(requestCollection);
				
				String ownerEntityName = colMetadata.getOwnerEntityName();
				ClassMetadata ownerClazzMetadata = hibernateSessionFactory.getClassMetadata(ownerEntityName);
				Class ownerClazz = ownerClazzMetadata.getMappedClass(EntityMode.POJO);
				buf.append("The <b>owner</b> entity name is <b>[")
					.append(ownerEntityName)
					.append("]</b>, class is <b>[")
					.append((ownerClazz==null) ? "N.A." : ownerClazz.getName())
					.append("]</b><p>");
				Type colElementType = colMetadata.getElementType();
				if (colElementType instanceof EntityType) {
					String colEntityName = colElementType.getName();
					ClassMetadata colClazzMetadata = hibernateSessionFactory.getClassMetadata(colEntityName);
					Class colClazz = colClazzMetadata.getMappedClass(EntityMode.POJO);
					buf.append("The <b>element</b> entity name is <b>[")
						.append(colEntityName)
						.append("]</b>, class is <b>[").append((colClazz==null) ? "N.A." : colClazz.getName())
						.append("]</b><p>");
				}
				CollectionStatistics collectionStat = stat.getCollectionStatistics(requestCollection);
				if (collectionStat!=null) {
					buf.append(collectionStat);
				}
				result = buf.toString();
			}
			else if ("cache".equals(requestRequestCategory) && requestCache.length() > 0) {
				StringBuffer buf = new StringBuffer("<p><b>Cache Statistics for Region [").append(requestCache).append("]</b>:<p>");
				SecondLevelCacheStatistics cacheStat = stat.getSecondLevelCacheStatistics(requestCache);
				if (cacheStat!=null) {
					buf.append(cacheStat);
				}
				result = buf.toString();
			}
			else if ("query".equals(requestRequestCategory) && requestQuery.length() > 0) {
				StringBuffer buf = new StringBuffer("<p><b>Query Statistics for Query [").append(requestQuery).append("]</b>:<p>");
				QueryStatistics queryStat = stat.getQueryStatistics(requestQuery);
				if (queryStat!=null) {
					buf.append(queryStat);
				}
				result = buf.toString();
			}
		}
		else if ("clear".equals(requestRequestType)) {
			stat.clear();	
		}
	}
	boolean isStatisticsEnabled = stat.isStatisticsEnabled();
	
	boolean isAjaxRequest = request.getParameter("ajax") != null && request.getParameter("ajax").equals("true");
	
	if (!isAjaxRequest) {
		result = new StringBuffer("<p>")
				.append("<span style=\"cursor:pointer\" ")
				.append("onclick=\"toggleDisplay('genstatsinfo');\" >")
				.append("<b>General statistics information: </b>[click to display/hide]</span>")
				.append("<div style=\"display:none\" id=\"genstatsinfo\" >")
				.append("<ul><li>Start time : ").append(new Date(stat.getStartTime()))
				.append("<li>Sessions opened : ").append(stat.getSessionOpenCount())
				.append("<li>Sessions closed : ").append(stat.getSessionCloseCount())
				.append("<li>Transactions : ").append(stat.getTransactionCount())
				.append("<li>Successful transactions : ").append(stat.getSuccessfulTransactionCount())
				.append("<li>Optimistic lock failures : ").append(stat.getOptimisticFailureCount())
				.append("<li>Flushes : ").append(stat.getFlushCount())
				.append("<li>Connections obtained : ").append(stat.getConnectCount())
				.append("<li>Statements prepared : ").append(stat.getPrepareStatementCount())
				.append("<li>Statements closed : ").append(stat.getCloseStatementCount())
				.append("<li>Second level cache puts : ").append(stat.getSecondLevelCachePutCount())
				.append("<li>Second level cache hits : ").append(stat.getSecondLevelCacheHitCount())
				.append("<li>Second level cache misses : ").append(stat.getSecondLevelCacheMissCount())
				.append("<li>Entities loaded : ").append(stat.getEntityLoadCount())
				.append("<li>Entities updated : ").append(stat.getEntityUpdateCount())
				.append("<li>Entities inserted : ").append(stat.getEntityInsertCount())
				.append("<li>Entities deleted : ").append(stat.getEntityDeleteCount())
				.append("<li>Entities fetched (minimize this)  : ").append(stat.getEntityFetchCount())
				.append("<li>Collections loaded : ").append(stat.getCollectionLoadCount())
				.append("<li>Collections updated : ").append(stat.getCollectionUpdateCount())
				.append("<li>Collections removed : ").append(stat.getCollectionRemoveCount())
				.append("<li>Collections recreated : ").append(stat.getCollectionRecreateCount())
				.append("<li>Collections fetched (minimize this) : ").append(stat.getCollectionFetchCount())
				.append("<li>Queries executed to database : ").append(stat.getQueryExecutionCount())
				.append("<li>Query cache puts : ").append(stat.getQueryCachePutCount())
				.append("<li>Query cache hits : ").append(stat.getQueryCacheHitCount())
				.append("<li>Query cache misses : ").append(stat.getQueryCacheMissCount())
				.append("<li>Max query time : ").append(stat.getQueryExecutionMaxTime()).append(" ms")
				.append("<li>Max query time query string: ").append((stat.getQueryExecutionMaxTimeQueryString()==null)?"N.A.":stat.getQueryExecutionMaxTimeQueryString())
				.append("</ul></div>")
				.append(result)
				.toString();
	}
	
	
	if (isAjaxRequest) {
		response.reset();
		response.getWriter().print(result);
		response.flushBuffer();
	}
%>
<% if (!isAjaxRequest) { %>
<hr>
<p>
Statistics Collection: <span id="spanstats" style="font-weight:bold; font-size:10px; color:<%=isStatisticsEnabled?"#00aa00":"red"%>"><%=isStatisticsEnabled? "ON" : "OFF"%></span>
<span id="spantriggerstats" style="font-size:9px">
<a href="javascript:triggerStatistics('<%=isStatisticsEnabled? "off" : "on"%>')" title="<%=isStatisticsEnabled? "off" : "on"%>">[click here to turn it <%=isStatisticsEnabled? "off" : "on"%>]</a>
</span>
<p>
<span style="font-size:10px">
Click the <b>ALL</b> button to list all the available names used for retrieving statistics information.
</span>
<form name="myform" action="hibernate_stats_viewer.jsp" class="niceform" method="post">
	<input type="hidden" name="requesttype" />
	<input type="hidden" name="requestcategory" />
	<input type="hidden" name="requesttriggerstats" />
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="70%" align="left">Entity Statistics: <span id="spanentity" style="font-size:9px; color:blue">
			(Total: <%=stat.getEntityNames().length%>)
			(Either full class name or entity-name in hbm.xml)</span>
			<br /><input type="text" size="80" id="entity" name="entity" value="<%=requestEntity%>"/></td>
			<td align="left">
				<input type="button" name="btnentity" onclick="submitRetrieveStatistics('entity');" value=" Show "/>
				<input type="button" name="btnentityall" onclick="submitListAll('entity');" value=" All "/>
			</td>
		</tr>
		<tr>
			<td width="70%" align="left">Collection Role Statistics: <span id="spancollection" style="font-size:9px; color:blue">(Total: <%=stat.getCollectionRoleNames().length%>) </span>
			<br /><input type="text" size="80" id="collection" name="collection" value="<%=requestCollection%>"/></td>
			<td align="left">
				<input type="button" name="btncollection" onclick="submitRetrieveStatistics('collection');" value=" Show "/>
				<input type="button" name="btncollectionall" onclick="submitListAll('collection');" value=" All "/>
			</td>
		</tr>
		<tr>
			<td width="70%" align="left">Second Level Cache Statistics: <span id="spancache" style="font-size:9px; color:blue">(Total: <%=stat.getSecondLevelCacheRegionNames().length%>) </span>
			<br /><input type="text" size="80" id="cache" name="cache" value="<%=requestCache%>"/></td>
			<td align="left">
				<input type="button" name="btncache" onclick="submitRetrieveStatistics('cache');" value=" Show "/>
				<input type="button" name="btncacheall" onclick="submitListAll('cache');" value=" All "/>
			</td>
		</tr>
		<tr>
			<td width="70%" align="left">Query Statistics: <span id="spancache" style="font-size:9px; color:blue">(Total: <%=stat.getQueries().length%>) </span>
			<br /><input type="text" size="80" id="query" name="query" value="<%=requestQuery%>"/></td>
			<td align="left">
				<input type="button" name="btnquery" onclick="submitRetrieveStatistics('query');" value=" Show "/>
				<input type="button" name="btnqueryall" onclick="submitListAll('query');" value=" All "/>
			</td>
		</tr>
		<tr>
			<td width="50%" align="left"><span style="color:red">Clear Statistics:</span>
			<td align="left">
				<input type="button" name="btnclear" onclick="submitClearStatistics();" value=" Clear "/>
			</td>
		</tr>
	</table>
</form>

<hr>
<div id="results" style="font-size:10px">
<%  } %>
<%
	if (result.length() > 0 && !isAjaxRequest) {
		out.println(result);
	}
%>
<% if (!isAjaxRequest) { %>
</div>
</body>
</html>
<%  } %>
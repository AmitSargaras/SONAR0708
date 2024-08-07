<%@ include file="/console/console_template.jsp"%>

<%@ page import="java.util.*,
				org.apache.commons.lang.StringUtils,
				java.io.*,
				java.net.*"%>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<%@page import="org.apache.struts.util.PropertyMessageResources"%>

<html>
<head>
<title>List of All Properties Values</title>
<%@ include file="/console/console_include.jsp" %>

</head>		

<%
	List keys = new ArrayList();
	for (Enumeration e = PropertyManager.getAllNameList(); e.hasMoreElements() ;) 
		keys.add((String)e.nextElement());
	
	Collections.sort(keys);
%>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;List of All Property Values</td>
  </tr>
</table><br>


<form action="reload_pm.jsp" METHOD=POST>
<input type="hidden" name="task" value="">
<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
	<TR>
		<TD><input type="submit" value=" Back " class="buttonstyle" /></TD>
	</TR>
</table>
</form>
<br>

<form>
	<strong>Filter: </strong><input name="filter" id="filter" onkeyup="filter2(this, 'all-props', 1)" type="text" size="40" class="macstyle">
	<a href="javascript:resetfilter('all-props')" style="font-size: 9px;">[Clear Filter]</a><br>
	<span style="color: blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For example: dashboard, financial, integrosys, sidebar, slidepanel, theme</span>
	<br><br>
</form>


	<table class="sortable draggable" id="all-props">
		<thead>
			<tr>
				<th style="width: 5%" onmouseout="mouseout(this,'header-over')" onmouseover="mouseover(this,'header-over')">S/N</th>
				<th style="width: 30%" onmouseout="mouseout(this,'header-over')" onmouseover="mouseover(this,'header-over')">Key</th>
				<th style="width: 65%" onmouseout="mouseout(this,'header-over')" onmouseover="mouseover(this,'header-over')">Values</th>
			</tr>
		</thead>
		<tbody>
			<%
				int idx=0;

				//for (String key : keys)
				for (int i=0; i<keys.size(); i++)
		        {
					String key = (String)keys.get(i);
					
					String value = PropertyManager.getValue(key);
					idx++;
			%>
			<tr onmouseout="highlight_row(this,'')" onmouseover="highlight_row(this,'row-highlight')">
				<td style="width:5%;text-align:center"><%=idx%></td>
				<td><%=key%></td>
				<td style="width:65%;text-align:left"><span class="editable_pm" id="<%=key%>"><%=value.trim()%></span></td>
			<%
		        }
			%>
		</tbody>
	</table>

<br>

<form action="reload_pm.jsp" METHOD=POST>
<input type="hidden" name="task" value="">
<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
	<TR>
		<TD><input type="submit" value=" Back " class="buttonstyle" /></TD>
	</TR>
</table>
</form>

<br>

<script>
  $(".editable_pm").editable("reload_pm.jsp", { 
      indicator : '<img src="../../images/spinner.gif">',
      type : 'textarea',
	  id : 'name',
      name : 'propdata',
      submit : 'OK',
      cancel : 'Cancel',
	  submitdata : {task: "updateedit"},
	  tooltip : 'Click to edit...',
	  data: function(value, settings) {
			//var retval = value.replace(/<br[\s\/]?>/gi, '\n');	/* Convert <br> to newline. */
			var retval = value;
			return retval;
		},
	  callback : function(value, settings) {
         //console.log(this);
         //console.log(value);
         //console.log(settings);
	    },
      style : 'inherit',
	  placeholder: '',
	  height: 80,
	  width: 480
  });
</script>

</body>
</html>

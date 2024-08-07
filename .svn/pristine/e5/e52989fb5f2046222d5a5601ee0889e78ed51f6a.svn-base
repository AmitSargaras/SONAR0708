<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="java.util.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				java.io.*,
				java.net.*
		"%>

<%!
	javax.naming.InitialContext ctx = null;

	boolean plainJDBC = false;

	public boolean checkIfPlainJDBC(String inText) {
		if ((inText == null) || inText.equals("") || inText.equals("null"))
			plainJDBC = true;
		else
		{
			if (inText.indexOf("Apache Tomcat") > -1)
				plainJDBC = true;
			else
				plainJDBC = false;
		}

		return (plainJDBC);
	}

	public Properties getDatabaseQuery(String datasourcename, String schema, String queryStr, long startIndex, long endIndex) {
	    javax.sql.DataSource ds = null;
	    java.sql.Connection con = null;

		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;
		java.sql.ResultSetMetaData metaData = null;
	
	    try {
			if (plainJDBC == false)
			{			
				ctx = new javax.naming.InitialContext();
				ds = (javax.sql.DataSource) ctx.lookup(datasourcename);
				con = ds.getConnection();
			}
			else
			{
				String dbDriver = PropertyManager.getValue("dbconfig.batch.database.driver", "com.ibm.db2.jcc.DB2Driver");
				try {
					Class.forName(dbDriver);
		        } catch (ClassNotFoundException e) {
					System.out.println("###### Cannot find driver for " + dbDriver);
		        }

				Properties connProperties = new Properties();
				connProperties.put("user", PropertyManager.getValue("dbconfig.batch.userId", "db2admin"));         // Set user ID for connection
				connProperties.put("password", PropertyManager.getValue("dbconfig.batch.password", "db2admin"));
				if (PropertyManager.getValue("dbconfig.batch.database.schema") != null) {
					connProperties.put("currentFunctionPath", PropertyManager.getValue("dbconfig.batch.database.schema", "db2admin"));
					connProperties.put("currentSchema", PropertyManager.getValue("dbconfig.batch.database.schema", "db2admin"));
				}
				con = java.sql.DriverManager.getConnection(PropertyManager.getValue("dbconfig.batch.database.url"), connProperties);
			}
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(queryStr);
			metaData = rs.getMetaData();
	    } catch (Exception e) {
			e.printStackTrace(System.err);

	    } finally {

	    }
		Properties connProperties = new Properties();
		if (plainJDBC == false) connProperties.put("ds", ds);
		if (con != null) connProperties.put("con", con);
		if (stmt != null) connProperties.put("stmt", stmt);
		if (rs != null) connProperties.put("rs", rs);

		return (connProperties);
	}

	public Properties performDatabaseInsertUpdate(String datasourcename, String schema, String queryStr) {
	    javax.sql.DataSource ds = null;
	    java.sql.Connection con = null;
		
		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;
		java.sql.ResultSetMetaData metaData = null;
		
		int resultN = 0;
	
	    try {
			if (plainJDBC == false)
			{
		        ctx = new javax.naming.InitialContext();
		        ds = (javax.sql.DataSource) ctx.lookup(datasourcename);
		        con = ds.getConnection();
			}
			else
			{
				String dbDriver = PropertyManager.getValue("dbconfig.batch.database.driver", "com.ibm.db2.jcc.DB2Driver");
				try {
					Class.forName(dbDriver);
		        } catch (ClassNotFoundException e) {
					System.out.println("###### Cannot find driver for " + dbDriver);
		        }

				Properties connProperties = new Properties();
				connProperties.put("user", PropertyManager.getValue("dbconfig.batch.userId", "db2admin"));         // Set user ID for connection
				connProperties.put("password", PropertyManager.getValue("dbconfig.batch.password", "db2admin"));
				if (PropertyManager.getValue("dbconfig.batch.database.schema") != null) {
					connProperties.put("currentFunctionPath", PropertyManager.getValue("dbconfig.batch.database.schema", "db2admin"));
					connProperties.put("currentSchema", PropertyManager.getValue("dbconfig.batch.database.schema", "db2admin"));
				}
				con = java.sql.DriverManager.getConnection(PropertyManager.getValue("dbconfig.batch.database.url"), connProperties);
			}

	        stmt = con.createStatement();
	        resultN = stmt.executeUpdate(queryStr);
			//metaData = rs.getMetaData();
	    } catch (Exception e) {
			e.printStackTrace(System.err);

	    } finally {

	    }
		Properties connProperties = new Properties();
		if (plainJDBC == false) connProperties.put("ds", ds);
		if (con != null) connProperties.put("con", con);
		if (stmt != null) connProperties.put("stmt", stmt);
		//connProperties.put("rs", rs);
		connProperties.put("updated", new Long(resultN));

		return (connProperties);
	}

	public boolean closeDatabaseConnection(Properties connProperties) {
	    javax.sql.DataSource ds = null;
	    java.sql.Connection con = null;
		
		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;
		java.sql.ResultSetMetaData metaData = null;
		
		if (connProperties == null) return (false);

	    try {
			if (connProperties.get("rs") != null)
				((java.sql.ResultSet) connProperties.get("rs")).close();

			if (connProperties.get("stmt") != null)
				((java.sql.Statement) connProperties.get("stmt")).close();

			if (connProperties.get("con") != null)
				((java.sql.Connection) connProperties.get("con")).close();

	    } catch (Exception e) {
			e.printStackTrace(System.err);

	    } finally {
			Object temp; 
			temp = connProperties.get("ds");
			temp = null;
			temp = connProperties.get("rs");
			temp = null;
			temp = connProperties.get("con");
			temp = null;
			temp = connProperties.get("stmt");
			temp = null;
			connProperties = null;
	    }
		return (true);
	}

	public String formatText(String inText) {
		if ((inText == null) || inText.equals("") || inText.equals("null"))
			return ("-");
		else
			return (inText);
	}

	public String formatTime(String inText) {
		if ((inText == null) || inText.equals("") || inText.equals("null"))
			return ("-");
		else
		{
			if (inText.indexOf(".") == -1)
				return (inText);
			else
				return (inText.substring(1, inText.indexOf(".")));
		}
	}

	public List splitList(String listStr, String separator) {
		List menu = new ArrayList();
		if (listStr != null)
		{
			StringTokenizer st = new StringTokenizer(listStr, separator);
			while (st.hasMoreTokens()) {
				menu.add(st.nextToken());
			}
		}
		return menu;
	}
	
	public String getJavascriptArrayStringForHeaderByResultSet(java.sql.ResultSet rs) {
		StringBuffer header = new StringBuffer();
		try {
			for (int i=1; i<=rs.getMetaData().getColumnCount(); i++) {
				header.append("\"" + rs.getMetaData().getColumnName(i) + "\"");
				if (i <rs.getMetaData().getColumnCount()) {
					header.append(",");
				}
			}
		}
		catch (java.sql.SQLException ex) {
			ex.printStackTrace(System.err);
		}
		
		return header.toString();
	}

	public String getJavascriptArrayStringForDataByResultSet(java.sql.ResultSet rs) {
		StringBuffer data = new StringBuffer();
		try {
			while (rs.next()) {
				data.append("[");
				for (int i=1; i<=rs.getMetaData().getColumnCount(); i++) {
					String value = rs.getString(i);
					if (value != null) {
						value = value.replaceAll("\n", "<br>");
						value = value.replace('"', '\'');
					}
					data.append("\"").append((value==null) ? "-" : value).append("\"");
					if (i < rs.getMetaData().getColumnCount()) {
						data.append(",");
					}
				}
				data.append("],");
			}
		}
		catch (java.sql.SQLException ex) {
			ex.printStackTrace(System.err);
		}

		return (data.length() > 0) ? data.substring(0, data.length()-1) : "";
	}
	
	
%>

<%
	System.out.println("----------------------------------------------------------------------------------------------");

	System.out.println ("*** Using plain JDBC: " + checkIfPlainJDBC(application.getServerInfo()));

	System.out.println("Requesting for: " + request.getRequestURI());
	List pathList = splitList(request.getRequestURI(), "/");
	
	String func = (String) pathList.get(pathList.size()-2);
	String subfuncLink = (String) pathList.get(pathList.size()-1);	
	System.out.println("Function [" + func + "] is identified with sub func url [" + subfuncLink + "]");

	System.out.println("----------------------------------------------------------------------------------------------");
	
	String subfunc = "";
	String subfuncTemp = "";
	String sfLink = "";

	List subFuncList = splitList(PropertyManager.getValue("console.func." + func), "|");
	Iterator subfuncItr = subFuncList.iterator();
	
	while (subfuncItr.hasNext())
	{
		subfuncTemp = (String) subfuncItr.next();
		sfLink = PropertyManager.getValue("console.func." + func + "." + subfuncTemp + ".link");
		//System.out.println(subfuncTemp);
		//System.out.println(sfLink);
		
		if (sfLink.equals(subfuncLink))
		{
			subfunc = subfuncTemp;
		}
	}

	//try those only server defined function
	if (subfunc.equals(""))
	{
		String triggerAction = request.getParameter("trigger");
		if (triggerAction == null || "".equals(triggerAction.trim())) {
			triggerAction = "";
		}

		sfLink = PropertyManager.getValue("console.func." + func + "." + triggerAction + ".link");
		System.out.println("**** Server defined function");
		System.out.println("\t" + triggerAction);
		System.out.println("\t" + sfLink);
		if (subfuncLink.equals(sfLink))
		{
			subfunc = triggerAction;
		}
	}

	System.out.println("func found: [" + subfunc + "]");
	
	String username = (String) session.getAttribute("global.logon_username");
	////String password = (String) session.getAttribute("global.logon_password");

	List sfDenyList = splitList(PropertyManager.getValue("console.func." + func + "." + subfunc + ".deny"), "|");
	//System.out.println("deny list: " + sfDenyList + " " + username + " -> " + sfDenyList.contains(username));

	if (!sfDenyList.contains(username) && !sfDenyList.contains("*"))
	{

		List sfAclList = splitList(PropertyManager.getValue("console.func." + func + "." + subfunc + ".acl"), "|");
		//System.out.println("access list: " + sfAclList + " " + username + " -> " + sfAclList.contains(username));

		if (!sfAclList.contains(username) && !sfAclList.contains("*")) {
			//System.out.println("sfAclList: " + sfAclList);
			//System.out.println("username: " + username);

			RequestDispatcher dispatcher = application.getRequestDispatcher("/console/logon.jsp");
			dispatcher.forward(request, response);	
			return;
		}
		else if (sfAclList.contains("*")) {
			System.out.println("**** public func ****");
		}
	}
	else {
		System.out.println("**** deny func ****");
		RequestDispatcher dispatcher = application.getRequestDispatcher("/console/logon.jsp");
		dispatcher.forward(request, response);
		return;
	}

%>


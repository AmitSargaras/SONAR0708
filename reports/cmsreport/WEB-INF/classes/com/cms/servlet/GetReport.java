package com.cms.servlet;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.net.ssl.*;

public class GetReport extends HttpServlet {

    private static String PDF_TYPE;
    private static String EXCEL_TYPE;
    private static String JPG_TYPE;
    private static String fullPath;
    private static String servletPath;
    private static String urlStr;
    private static String transactionDenied;
    private static String accessDenied;

    //private static boolean debugFlag;

    //public void init(ServletConfig config) throws ServletException  {
    //	super.init(config);
    //}

    public void init()
    {
    	//debugFlag = getServletConfig().getInitParameter("debug");
    	System.out.println("*******************************************************");
    	
	fullPath = getServletContext().getInitParameter("reportPath");
	System.out.println("\t reportPath: " + fullPath);
	servletPath = getServletConfig().getServletContext().getRealPath("");
	System.out.println("\t servletconfig.getRealPath(): " + servletPath);

	PDF_TYPE = getServletContext().getInitParameter("pdf");
	System.out.println("\t PDF type: " + PDF_TYPE);
	EXCEL_TYPE = getServletContext().getInitParameter("xls");
	System.out.println("\t XLS type: " + EXCEL_TYPE);
	JPG_TYPE = getServletContext().getInitParameter("jpg");
	System.out.println("\t JPG type: " + JPG_TYPE);

	urlStr = getServletContext().getInitParameter("securityCheck");
	System.out.println("\t security URL: " + urlStr);
	accessDenied = getServletContext().getInitParameter("accessDenied");
	System.out.println("\t accessDenied URL: " + accessDenied);
	transactionDenied = getServletContext().getInitParameter("transactionDenied");
	System.out.println("\t transactionDenied URL: " + transactionDenied);

	System.out.println();
	try {
		Class.forName("com.sun.net.ssl.internal.ssl.Provider");
	} catch (Exception e) {
		System.out.println("JSSE is NOT installed correctly!");
	}

	System.out.println("JSSE is installed correctly!");  

	System.out.println("*******************************************************");
	System.out.println();

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

	String param = request.getParameter("param");
	
	if (param != null && param.equals("time")) {
		long currentTime = System.currentTimeMillis();
		System.out.println("Getting system time of Crystal Report: "+currentTime);
		PrintWriter out = response.getWriter();
		out.println(String.valueOf(currentTime));
		out.flush();
		out.close();
		return;
	}
	
	String requestedFileName = request.getParameter("name");	//filename sent over by user
	String displayName = request.getParameter("save");		//display filename required by user

	if ("".equals(requestedFileName) || requestedFileName == null) {
		System.out.println("*********** No file requested");
	}
	else
	{
		long sidValue = 0;

		String usePath = fullPath;
		String fileName = requestedFileName;
		String fileExt = "";
		String fileType;
		String sid = "";
    		String sidReturnValue;

		String filePath = request.getParameter("path");
		if (filePath == null) {
			filePath = "";
		}

		sid = request.getParameter("sid");	//this is the unique id passed over
		if (sid == null)
			sid = "0";

		try {
			sidValue = Long.parseLong(sid);
		}
		catch (Exception numE) {
			//invalid sid is passed over
			sidValue = 0;	
		}

		//this is used to check if server returned correct verified string
		sidReturnValue = String.valueOf(sidValue * 3.142857142857142857 + 2.302585092994);

		//performs a check with server to see if user is authorised to view document
		if (!doSecurityCheck("&sid=" + sid, sidReturnValue))
		{
			//do not show requested document
			usePath = servletPath;
			filePath = "img";
			fileName = accessDenied;
			fileType = JPG_TYPE;
			fileExt = ".jpg";
		}
		else
		{
			fileType = request.getParameter("type");
			if ("".equals(fileType) || fileType == null) {
	
				if (fileName.indexOf(".pdf") != -1)
					fileType = PDF_TYPE;
				else if (fileName.indexOf(".xls") != -1)
					fileType = EXCEL_TYPE;
				else if ((fileName.indexOf(".jpg") != -1) || (fileName.indexOf(".jpeg") != -1))
					fileType = JPG_TYPE;
				else
					fileType = JPG_TYPE;
			}
		}

		System.out.println("\t loading " + filePath + "\\" + fileName);
		System.out.println("\t type: " + fileType);

		File file = null;
		FileInputStream fis = null;
		long fileLength = 0;

		try {
			file = new File (usePath + "\\" + filePath + "\\" + fileName);
			fis = new FileInputStream (file);
		}
		catch (Exception e) { 
			System.out.println ("\n**** File error: " + e + "\n");

			//file not found, so load in error page
			usePath = servletPath;
			filePath = "img";
			fileName = transactionDenied;
			fileType = JPG_TYPE;
			fileExt = ".jpg";
			
			file = null;
			try {
				file = new File (usePath + "\\" + filePath + "\\" + fileName);
				fis = new FileInputStream (file);
			}
			catch (Exception de) { 
				System.out.println ("\n**** Default file error: " + e + "\n");
				return;
			}
		}

		fileLength = file.length();
		//String onlyName = file.getName().substring(file.getName().lastIndexOf("/") + 1, file.getName().length());

		//found something in the file
		if (fileLength > 0)
		{
			try {
				response.setContentType (fileType);
				//response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
				
				//use the displayName if it exists, otherwise use the filename on disk
				if ("".equals(displayName) || displayName == null)
					response.setHeader("Content-Disposition","attachment; filename=\"" + requestedFileName + fileExt + "\"");
				else
					response.setHeader("Content-Disposition","attachment; filename=\"" + displayName + fileExt + "\"");
				
				response.setContentLength(new Long(fileLength).intValue());
				
				ServletOutputStream sos = response.getOutputStream();
				int c = 0;
				while ((c=fis.read()) != -1)
					sos.write(c);
				
				sos.flush();
				fis.close();
			}
			catch (Exception e) { 
				System.out.println ("**** Stream error: " + e);
			}
		}

		if (fis != null)
		{
			fis.close();
			fis = null;
		}
		file = null;
	}
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

	doGet (request, response);

    }


    private String doWork(String[] args, String parameter) throws Exception {
	
	if (urlStr.startsWith("https"))
	{
		System.out.println("---- setting up SSL trust manager ----");
		// Create a trust manager that does not validate certificate chains
		TrustManager[] trustAllCerts = new TrustManager[]{
			new X509TrustManager() {
			    public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return null;
			    }
			    public void checkClientTrusted(
			    	java.security.cert.X509Certificate[] certs, String authType) {
			    }
			    public void checkServerTrusted(
				java.security.cert.X509Certificate[] certs, String authType) {
			    }
			}
		};
		// Install the all-trusting trust manager
		try {
			SSLContext sc = SSLContext.getInstance("SSL");
			sc.init(null, trustAllCerts, new java.security.SecureRandom());
			HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
			HttpsURLConnection.setDefaultHostnameVerifier(getHostNameVreifier());
		} catch (Exception e) {
			System.out.println("Cannot install trust manager");	
		}
		System.out.println("---- completed setting up SSL trusted manager ----");
	}

	//System.out.println("---- start connection ----");
	URLConnection con = getURLConnection(parameter);
	//System.out.println("\n---- got connection ----");
	
	//System.out.println("---- start streaming ----");
	ObjectOutputStream objStream = new ObjectOutputStream(con.getOutputStream());
	objStream.writeObject(args);
	objStream.flush();
	objStream.close();
	objStream = null;

	System.out.print("sending security check request: ");
	BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
	String line;
	//while ((line = reader.readLine()) != null) {
	//	System.out.println(line);
	//}
	line = reader.readLine();
	reader.close();
	reader = null;
	con = null;

	return line;
    }
	
	private HostnameVerifier getHostNameVreifier() {
		HostnameVerifier verifier = new HostnameVerifier() {
			public boolean verify(String urlHostName, SSLSession session) {
				System.out.println("URL Host: " + urlHostName + " vs. "
						+ session.getPeerHost());
				return true;
			}
		};
		return verifier;
	}
	
    private URLConnection getURLConnection(String parameter) throws Exception {

	//if (urlStr.startsWith("https"))
	//{
		//System.setProperty("java.protocol.handler.pkgs", "com.sun.net.ssl.internal.www.protocol");
   		//java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
   	//}

	URL url = new URL(urlStr + parameter);
	URLConnection con = url.openConnection();
	con.setDoInput(true);
	con.setDoOutput(true);
	con.setRequestProperty("Content-type", "application/octet-stream");
	return con;
    }


    private boolean doSecurityCheck(String parameter, String verifiedString) {

	String checkResult = "";
	boolean result;
	
	try {
		checkResult = doWork (null, parameter);
	} catch (Exception e) {
		e.printStackTrace();
	}

	if (verifiedString.equals(checkResult))
	{
		//check is okay
		//do something if needed
		System.out.println("passed");
		result = true;
	}
	else
	{
		//not a valid code returned
		//failed check
		System.out.println("-- failed --");
		result = false;
	}

	System.out.println("\t parameter: " + parameter);
	return (result);


    }

}
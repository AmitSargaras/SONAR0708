<%@ include file="/console/console_template.jsp" %>

<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.integrosys.cms.host.eai.MessageReader"%>
<%@page import="com.integrosys.cms.host.eai.EAIMessage"%>
<%@page import="com.integrosys.cms.host.eai.support.MessageHandlerInvoker"%>
<%@page import="com.integrosys.cms.host.eai.EAIMessageException"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
<%@page import="java.text.SimpleDateFormat,
				com.integrosys.base.techinfra.propertyfile.PropertyManager"%>

<html>

<head>
<title>SI Message Publish</title>

<%@ include file="/console/console_include.jsp" %>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;XML Publish Utility</td>
  </tr>
</table><br>

<%
	String savePath = "", filepath = "", filename = "";
	String contentType = "", fileData = "", strLocalFileName = "";
	String successFileName;
	String failFileName;
	String processingFileName;
	int startPos = 0;
	int endPos = 0;
%>

<%!void copyFile(File in, File out) throws Exception {
		FileInputStream fis = new FileInputStream(in);
		FileOutputStream fos = new FileOutputStream(out);
		try {
			byte[] buf = new byte[1024];
			int i = 0;
			while ((i = fis.read(buf)) != -1) {
				fos.write(buf, 0, i);
			}
		}
		catch (Exception e) {
			throw e;
		}
		finally {
			if (fis != null)
				fis.close();
			if (fos != null)
				fos.close();
		}
	}

	//copy specified number of bytes from main data buffer to temp data buffer  

	void copyByte(byte[] fromBytes, byte[] toBytes, int start, int len) {
		for (int i = start; i < (start + len) && i < fromBytes.length; i++) {
			toBytes[i - start] = fromBytes[i];
		}
	}%>
<%
	int BOF = 0, EOF = 0;
	contentType = request.getContentType();
	//out.println("<br>Content type is :: " + contentType);
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
		DataInputStream in = new DataInputStream(request.getInputStream());
		DataInputStream in1 = in;
		int formDataLength = request.getContentLength();
		out.println("<br>content length: "+formDataLength);
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		while (totalBytesRead < formDataLength) {
			byteRead = in1.read(dataBytes, totalBytesRead, formDataLength);
			totalBytesRead += byteRead;
		}
		//out.println("<br>totalBytesRead : " + totalBytesRead + "   :  formDataLength = " + formDataLength);  

		String file = new String(dataBytes);
		//for saving the file name
		strLocalFileName = file.substring(file.indexOf("filename=\"") + 10);
		strLocalFileName = strLocalFileName.substring(0, strLocalFileName.indexOf("\n"));
		filename = strLocalFileName.substring(strLocalFileName.lastIndexOf("\\")+ 1,strLocalFileName.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1, contentType.length());
		int pos;
		//extracting the index of file 
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		startPos = ((file.substring(0, pos)).getBytes()).length;
		endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		// creating a new file with the same name and writing the content in new file


		out.println("<br><br>Local File Name = " + strLocalFileName);
		out.println("<br><br>Filename = " + filename);
		//create destination path & save file there  
		String appPath = application.getRealPath("/");
		out.println("<br>appPath = " + appPath);

		String destFolder = PropertyManager.getValue("eai.message.destination.temp.dir").toString();
		String successFolder = PropertyManager.getValue("eai.message.destination.success.dir").toString();
		String failFolder = PropertyManager.getValue("eai.message.destination.fail.dir").toString();
		
		Date todaysDate = new java.util.Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String formattedDate = formatter.format(todaysDate);
				
		processingFileName = formattedDate+"-"+filename;
		filename = destFolder + "/" + filename;
		successFileName = successFolder + "/" + processingFileName;

		failFileName = failFolder + "/" + processingFileName;
		out.println("<br>Temp folder = " + destFolder);
		out.println("<br>Fail Messages Folder = " + failFolder);
		out.println("<br>Successful Messages Folder = " + successFolder);
					
		FileOutputStream fileOut = new FileOutputStream(filename);
		ByteArrayOutputStream barOut = new ByteArrayOutputStream();
		barOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();		
		
		try {
			String responseMsg = MessageHandlerInvoker.processXmlMsg(barOut.toString().trim());

			File temp = new File(filename);
			File success = new File(successFileName);
			copyFile(temp, success);
			temp.delete();
			out.println("<p>Message processed successfully, response as follow: ");
			out.println("<p>");
			out.println("<font style=\"color:blue\">" + StringEscapeUtils.escapeXml(responseMsg) + "</font>");
		}
		catch (Throwable t) {
			File temp = new File(filename);
			File fail = new File(failFileName);
			copyFile(temp, fail);
			temp.delete();
			out.println("<br> Error in uploading ");
			
			out.println("<br><br><b>Exceptions as below </b><hr>");
			StringWriter sw = new StringWriter();
			t.printStackTrace(new PrintWriter(sw));
			out.println(sw);
			sw.close();
			out.println("<br><hr><br>");
		}

	}
	else {
		
	}
%>
<form method="post" action="rtoc_si_test.jsp" name="upform" enctype="multipart/form-data">

<table width="90%" border="0" cellspacing="1" cellpadding="1"
	align="center">
	<tr>
		<td align="left"><b>Select a file to upload :</b></td>
	</tr>
	<tr>
		<td align="left"><input type="file" name="uploadfile" id="upload" size="50">
		</td>
	</tr>
	<tr>
		<td align="left"><input type="hidden" name="todo" value="upload">
		<input type="submit" name="Submit" value=" Upload "> <input
			type="reset" name="Reset" value=" Cancel "></td>
	</tr>
</table>
</form>

</body>
</html>

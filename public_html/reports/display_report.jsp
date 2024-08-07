<%@ page import="com.integrosys.cms.batch.reports.OBReport"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/reports/display_report.jsp,v 1.3 2004/07/06 02:18:34 jtan Exp $
     * @author $Author: jtan $<br>
     * @version $Revision: 1.3 $
     * @since $Date: 2004/07/06 02:18:34 $
     * Tag: $Name:  $
     */
%>

<%
    /********************************************************************************************
     *				Exporting the report to desired format and destination
     ********************************************************************************************/
    System.out.println("************************");
    System.out.println("Start download");

    OBReport report= (OBReport)request.getAttribute("OBReport");
    String formatType= (String)request.getAttribute("reportType");
    String fileName= report.getFileName();

    byte[] byteArray = null;
    char[] charArray = null;

    try {
        // Retrieve export format from form
        String strMime = "";	// Mime Type

        // Set up mime types and extensions
        if (formatType.equals("CSV")) {
        // Separated Values Text
            strMime = "application/vnd.ms-excel";
            charArray = report.getCsvContents();

        } else if (formatType.equals("XLS")) {
        // MS Excel
            strMime = "application/vnd.ms-excel";
            byteArray = report.getXlsContents();

        } else if (formatType.equals("PDF")) {
        // Portable Document Format
            strMime = "application/pdf";
            byteArray = report.getPdfContents();

        } else if (formatType.equals("DOC")) {
            strMime = "application/msword";
            byteArray = report.getWordContents();
        }
        // Clear out response stream
        response.reset();

        // Set the browser's mime type
        response.setContentType(strMime);

        // Ensure the browser's page to expect a file
        response.setHeader("Expires", "0");
        response.addHeader("Content-disposition", "attachment; filename="+fileName);

        // Use the SevletOutputStream to send the byteArray's data to the browser
        if (formatType.equals("PDF")||formatType.equals("XLS")||formatType.equals("DOC")) {
            response.getOutputStream().write(byteArray);
        } else if (formatType.equals("CSV")) {
            response.getWriter().write(charArray);
        }

        response.flushBuffer();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error has occurred while exporting the report.<BR>" + e.toString());
    }

%>


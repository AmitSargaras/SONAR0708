package com.integrosys.cms.host;
import java.sql.*;

/**
 * C:\dev\eoncms-doc\technical\supporting doc\on AS400\SSO>javac JDBCtoAS400SIBSUtils.java
 * C:\dev\eoncms-doc\technical\supporting doc\on AS400\SSO>java -cp .;jt400.jar JDBCtoAS400SIBSUtils
 */
public class SIBSParamTest {

    // Format a string so that it has the specified width.
    private static String format(String s, int width) {

        String formattedString;
        // The string is shorter than specified width,
        // so we need to pad with blanks.
        if (s.length() < width) {

            StringBuffer buffer = new StringBuffer(s);

            for (int i = s.length(); i < width; ++i) {
                buffer.append(" ");
            }
            formattedString = buffer.toString();
        }
        // Otherwise, we need to truncate the string.
        else {
            formattedString = s.substring(0, width);
        }
        return formattedString;
    }

    public static void main(String[] param) throws Exception {

        //System.out.println("********* this is the start of JDBCtoAS400SIBSUtils() : main *********\r");
        String host = "172.28.252.1";

        // Load the AS/400 Toolbox for Java JDBC driver.
        // com.ibm.as400.access.AS400JDBCDriver
        DriverManager.registerDriver(new com.ibm.as400.access.AS400JDBCDriver());

        // Get a connection to the database.Since we do not
        // provide a user id or password, a prompt will appear.
        Connection connection = null;
        connection = DriverManager.getConnection("jdbc:as400://" + host + ";user=UA2CMS00;password=UA2CMS00;driver=toolbox");
        DatabaseMetaData dmd = connection.getMetaData();
        // Execute the query.
        Statement select = connection.createStatement();
        String sql = "SELECT * from PUATRBS.SSCLBR a";
		System.out.println("Sql=" + sql);        
        ResultSet rs = select.executeQuery(sql);

        // Get information about the result set.Set the column
        // width to whichever is longer: the length of the label
        // or the length of the data.
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
        String[] columnLabels = new String[columnCount];
        int[] columnWidths = new int[columnCount];

        for (int i = 1; i <= columnCount; ++i) {
            columnLabels[i - 1] = rsmd.getColumnLabel(i);
            columnWidths[i - 1] = Math.max(columnLabels[i - 1].length(),
                    rsmd.getColumnDisplaySize(i));
            System.out.println("Column Name=" + columnLabels[i-1] +"   Data Type="+ rsmd.getColumnTypeName(i));
        }

        // Output the column headings.
        for (int i = 1; i <= columnCount; ++i) {
            System.out.print(format(rsmd.getColumnLabel(i), columnWidths[i - 1]) + " ");
        }

        System.out.println();
        // Output a dashed line.
        StringBuffer dashedLine;

        for (int i = 1; i <= columnCount; ++i) {
            for (int j = 1; j <= columnWidths[i - 1]; ++j) {
                System.out.print("-");
            }
            System.out.print(" ");
        }
        
        // Iterate throught the rows in the result set and output
        // the columns for each row.
        System.out.println();
        while (rs.next()) {
            for (int i = 1; i <= columnCount; ++i) {
                String value = rs.getString(i);

                if (rs.wasNull()) {
                    value = "<null>";
                }

                System.out.print(format(value, columnWidths[i - 1]));
                System.out.print(" ");
            }
            System.out.println();
        }
    } // end of main
}

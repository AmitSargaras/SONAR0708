<%@ page import="com.integrosys.cms.host.mq.EAITester"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<html>
<header>
<title>CMS SI Message Test</title>
</header>
<body>
<%

if (request.getParameter("submit")!=null){
// Processing
    String file = request.getParameter("file");
    String loadType = request.getParameter("loadType");
    String xml = request.getParameter("xml");
    String folder= request.getParameter("folder");
    System.out.println("**********************************************************");    
    System.out.println(xml);
        System.out.println("**********************************************************");    
    if (folder!=null&&!folder.equals("")){
    	java.io.File dir=new File(folder);
    	FilenameFilter filenameFilter=new FilenameFilter(){
    	public boolean accept(File file ,String s){
			//System.out.println(file + ":" + s);
    		if (s.toLowerCase().endsWith(".xml"))
    		return true;
    		else return false;
    	}
    	};

    	File[] files=dir.listFiles(filenameFilter);
    	Comparator c=new Comparator(){
    		public int compare(Object o1, Object o2){
				try{
					return (((File)o1).lastModified()>((File)o2).lastModified())?1:0;
				} catch(Throwable e){

				return 0;}
    		}
    	};
		Arrays.sort(files,c);
    	
    	for (int i=0;i<files.length;i++){
    		System.out.println(files[i].getAbsolutePath());
    		
    				out.println(files[i].getAbsolutePath());
				    				out.println("<BR>");
    			
    			final String filepath=files[i].getAbsolutePath();
    			
				try{
//					new Thread(){
//					public void run(){
			    		EAITester.processFile(filepath);
//		    		}
//		    		}.start();
		    		
                    Thread.sleep(100);

				} catch(Throwable e){

				e.printStackTrace();
				
				out.println(e.getMessage());
				
				}    		
				


    	}
    	
    	
		
    
    }
    else
    if (file != null && !"".equals(file)){
        System.out.println("Processing local server xml file : " + file);
        
 		try{
        			EAITester.processFile(file);
				} catch(Throwable e){

				e.printStackTrace();
				
								out.println(e.getMessage());
				
				}    
    }
    else 
    {
        System.out.println("Process direct xml file");
  		try{
        EAITester.processXmlMsg(xml);
				} catch(Throwable e){

				e.printStackTrace();
				
								out.println(e.getMessage());
				
				}    
    }
    %>
   Done !!!. 
   <% 
}        
%>



<form method="POST" action="xml_test.jsp">
Please run 1) or 2)
<br>
1) Server XML Filename (full path)
<br><input type="text" name="file" size="50">
<br><br>
2) XML Content
<%--XML Test type <select name="loadType">--%>
<%--                <option value="receive">Message Received From Source</option> --%>
<%--                <option value="send">Message Send To Source</option> --%>
<%--              </select>--%>
<%--<br>--%>
<br><textarea name="xml" cols="80" rows="20"></textarea>
<br>
1) By Folder : (full path)
<br><input type="text" name="folder" size="50">
<br><br>


<input type="Submit" name="submit">
</form>
</body>
</html>
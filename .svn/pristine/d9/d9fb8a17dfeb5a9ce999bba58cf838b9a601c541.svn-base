<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import=" java.text.DateFormat,
            java.util.Date"  %>
<?xml version="1.0"?>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="docList" scope="request" type="com.integrosys.cms.app.checklist.bus.OBCheckListItem">
   <%String date="-";
   String docDate="-";
   DateFormat defaultDf = DateFormat.getDateTimeInstance();
   if(null!=curOp){
         if(null!=curOp.getReceivedDate()){
        	 System.out.println("curOp.getReceivedDate() ==>"+curOp.getReceivedDate());
             //date=curOp.getReceivedDate().toGMTString();
             date = defaultDf.format(curOp.getReceivedDate());
             date=date.substring(0,12);
            // System.out.println("\n\ndate ==>"+date);
                                      }
         if(null!=curOp.getDocDate()){
             //docDate=curOp.getDocDate().toGMTString();
             docDate = defaultDf.format(curOp.getDocDate());
             docDate=docDate.substring(0,12);
                                      } 
         
          if(null==curOp.getItemStatus()){
             curOp.setItemStatus("-");
                                      }  
          
          if(null==curOp.getDocAmt()){
              curOp.setDocAmt("-");
                                       }  
          if(null!=curOp.getItemStatus() && "awaiting".equalsIgnoreCase(curOp.getItemStatus()))
              curOp.setItemStatus("PENDING");                                                     
       }
   %>
   <option docStatus="<%= curOp.getItemStatus() %>" receivedDate="<%= date %>"  docDate="<%=docDate %>"   docAmt= "<%= curOp.getDocAmt()%>"></option>
 </logic:iterate> 
</optionlist>

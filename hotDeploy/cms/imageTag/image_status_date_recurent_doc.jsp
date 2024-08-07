<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import=" java.text.DateFormat,
            java.util.Date"  %>
<?xml version="1.0"?>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="docList" scope="request" type="com.integrosys.cms.app.recurrent.bus.OBRecurrentCheckListSubItem">
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
         if(null!=curOp.getDueDate()){
             //docDate=curOp.getDocDate().toGMTString();
             docDate = defaultDf.format(curOp.getDueDate());
             docDate=docDate.substring(0,12);
                                      } 
         
          if(null==curOp.getStatus()){
             curOp.setStatus("-");
                                      }  
         
          if(null!=curOp.getStatus() && "awaiting".equalsIgnoreCase(curOp.getStatus()))
              curOp.setStatus("PENDING");                                                     
       }
   %>
   <option docStatus="<%= curOp.getStatus() %>" receivedDate="<%= date %>"  docDate="<%=docDate %>"   docAmt= "-"></option>
 </logic:iterate> 
</optionlist>

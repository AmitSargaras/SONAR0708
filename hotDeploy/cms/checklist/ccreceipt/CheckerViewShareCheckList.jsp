<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.checklist.bus.IShareDoc,
                 com.integrosys.cms.app.checklist.bus.OBShareDoc,
                 java.util.ArrayList,
                 java.util.Arrays,
                 java.util.List"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
        <tr> <td>&nbsp;</td></tr>
        <tr>
            <td valign="middle" align="left">
                <b>Shared Document  Checklist(s)</b></td>
        </tr>
    </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
         <thead>
         <tr>
            <td class="fieldname" width="05%" align="left" >S/N</td>
            <td class="fieldname" width="18%" align="left" >ChecklistID</td>
            <td class="fieldname" width="10%" align="left" >LE ID</td>
            <td class="fieldname" width="35%" align="left">LE Name</td>
            <td class="fieldname" width="35%" align="left">Details</td>
         </tr>
          </thead>
          <tbody>
         <%
            ICheckListItem stageICheckListItem = (ICheckListItem)request.getAttribute("stagingOb");
            IShareDoc[]  staging =  stageICheckListItem.getShareCheckList();
            ICheckListItem actualICheckListItem = (ICheckListItem)request.getAttribute("actualOb");
            IShareDoc[]  actual = actualICheckListItem.getShareCheckList();

            //System.out.println(">>>>>>>> No of record from actual : "+(actual==null?0:actual.length));
            //System.out.println(">>>>>>>> No of record from staging : "+(staging==null?0:staging.length));

           CompareResult[] resultList = new CompareResult[0];
            if(staging != null || actual != null) {        //required for situations where there is no share checklists
                List res = CompareOBUtil.compOBArray(staging, actual);
                resultList = (CompareResult[])res.toArray(new CompareResult[0]);
            }
            ArrayList list = new ArrayList(Arrays.asList(resultList));
            pageContext.setAttribute("sltList",list);

            if(list == null || list.size() == 0){
            %>
             <tr >
                  <td colspan="5" align="center"  ><p align=center>There is no share checklist</p></td>
               </tr>
            <%
	  	}else{
            int index = 0;
            %>
            <logic:present name="sltList" >
                <logic:iterate id="compResult" name="sltList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
                  <%
                     OBShareDoc obj = (OBShareDoc) compResult.getObj();
                     //obj.setLeNameFromDB();
                 %>
                 <tr class="<%=index%2==0?"odd":"even"%>">
                            <td class="<bean:write name="compResult" property="key" />" width="8%"><%=index + 1%></td>
                            <td valign="top"><%=obj.getCheckListId()%>&nbsp;</td>
                            <td valign="top"><integro:empty-if-null value="<%=obj.getLeID()%>"/>&nbsp;</td>
                            <td valign="top"><integro:empty-if-null value="<%=obj.getLeName()%>"/>&nbsp;</td>
                            <td valign="top"><integro:empty-if-null value="<%=obj.getDetails()%>"/>&nbsp;</td>
                      <%index++;%>
               </tr>
                </logic:iterate>
            </logic:present>
      <% } %>
    </tbody>
 </table>
<br>
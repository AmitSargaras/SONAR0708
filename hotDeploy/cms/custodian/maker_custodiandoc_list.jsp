<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header:
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.7 $
 * @since $Date: 2006/10/27 08:42:56 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.integrosys.base.businfra.search.SearchResult,
                 java.util.Vector,
                 com.integrosys.cms.app.custodian.bus.ICustodianDocSearchResult,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>

 <%
    SearchResult sr = (SearchResult)request.getAttribute("docList");
    Vector custodianDocList = null;
    if(sr!=null){
        custodianDocList = (Vector)sr.getResultList();
    }
    if(custodianDocList!=null && custodianDocList.size()>0){
        pageContext.setAttribute("docList",custodianDocList);
    }
    int sno=0;
 %>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Update Custodian Doc</h3></td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
          <td width="49%">Description</td>
          <td width="9%">Status</td>
          <td width="18%">Action</td>
            </tr>
          </thead>
          <tbody>
                <logic:present name="docList">
                    <logic:iterate id="ob" name="docList"  type="com.integrosys.cms.app.custodian.bus.ICustodianDocSearchResult" scope="page">
                        <%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                    %>
            <tr class=<%=rowClass%>>
              <td class="index" ><%=sno%></td>
              <td ><%=ob.getDocDescription()%></td>
              <td style="text-align:center"><%=ob.getStatus()%></td>
              <td style="text-align:center"> <select name="menu1" onchange="MM_jumpMenu('self',this,0)">
                  <option value="#" selected="selected">Please Select</option>
                  <option value="custodian.do?event=prepare_custodian_maker&trxId=<%=ob.getTrxId()%>&forId=custodian&opcode=<%=ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE%>">Lodge</option>
                  <option value="custodian.do?event=prepare_custodian_maker&trxId=<%=ob.getTrxId()%>&forId=custodian&opcode=<%=ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE%>">Re-lodge</option>
                  <option value="custodian.do?event=prepare_custodian_maker&trxId=<%=ob.getTrxId()%>&forId=custodian&opcode=<%=ICMSUIConstant.CUSTODIAN_OP_CODE_PERMUPLIFT%>">Perm Uplift</option>
                  <option value="custodian.do?event=prepare_custodian_maker&trxId=<%=ob.getTrxId()%>&forId=custodian&opcode=<%=ICMSUIConstant.CUSTODIAN_OP_CODE_TEMPUPLIFT%>">Temp Uplift</option>
                  <option value="custodian.do?event=prepare_custodian_maker&trxId=<%=ob.getTrxId()%>&forId=custodian&opcode=<%=ICMSUIConstant.CUSTODIAN_OP_CODE_VIEW%>">View</option>
                </select></td>
            </tr>
            </logic:iterate>
                        </logic:present>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.ArrayList,java.util.Date,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.cccertificate.trx.ICCCertificateTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    CountryList cList = CountryList.getInstance();
    List l = (List)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.certSummary");
    if(l!=null){
        pageContext.setAttribute("certSummary",l);
    }
//    ArrayList cert1=(ArrayList)request.getAttribute("dateGenerated");

//    ArrayList trxValueList=(ArrayList)request.getAttribute("trxValueID");
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

function generate(ind) {
    document.forms[0].event.value="generate_ccc";
    document.forms[0].index.value=ind;
    document.forms[0].submit();

}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="GenerateCCC" >
<html:hidden property="limitProfileId" />
<input type="hidden" name="event" />
<input type="hidden" name="index" />

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Generate Constitutional / Contractual Doc</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="12%">Customer Category</td>
              <td width="10%">LE ID/Pledgor ID</td>
              <td width="20%">Legal Name</td>
              <td width="10%">Documentation Originating Location</td>
              <td width="15%">Organisation Code</td>
              <td width="8%">Governing Law</td>
              <td width="8%">Status</td>
              <td width="6%">Last Update Date of Certificate</td>
              <td width="6%">Action</td>              
            </tr>
          </thead>
          <tbody>
<logic:present name="certSummary"  >
<%    System.out.println("inside iterate");%>
   <logic:iterate id="OB" name="certSummary"  type="com.integrosys.cms.app.cccertificate.bus.CCCertificateSummary"  >

<%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    String countryName = cList.getCountryName(OB.getDomicileCtry());
    String orgCode = OB.getOrgCode();
    orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,orgCode);
    boolean isGen = OB.allowGenerateCCC();
   %>
        <tr class="<%=rowClass%>">
              <td class="index" valign="top" ><%=row%></td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="custCategory" /></td>
              <% if ((OB.getLegalID() == null) || (OB.getLegalID().equals("0")))
                 {%>
              <td valign="top" >&nbsp;<%= "-"%>
              <% } else { %>
              <td valign="top" >&nbsp;<%=OB.getLegalID()%>
              <% } 
                if (OB.getPledgorReference() != null)
                {
              %><br><%= OB.getPledgorReference()%>
              <%}%>
              </td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="legalName" /></td>
              <td valign="top" >&nbsp;<integro:empty-if-null value="<%=countryName%>" /></td>
              <td valign="top" >&nbsp;<integro:empty-if-null value="<%=orgCode%>" /></td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="governLaw" /></td>
              
              <td valign="top" >&nbsp;<bean:write name="OB" property="checkListStatus" /></td>
              
              <td valign="top" ><integro:date object="<%=OB.getLastCCCUpdateDate()%>" />&nbsp;</td>
             <% if(isGen && OB.getSameCountryInd()) { %>
	                  <td valign="top"><a href="#" onClick="generate('<%=row-1%>')" >Generate</a></td>
		<%}else if(isGen && OB.getCccTrxID() != null && OB.getLastCCCUpdateDate()!=null){%>
		<td valign="top">
		<a href="GenerateCCC.do?event=view_print_doc&trxValueID=<%=OB.getCccTrxID()%>">View</a>   
		
		</td>
              <% } else {%>
              <td valign="top">&nbsp;</td>
              <%}%>
              
             
              
            </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="certSummary" >
            <tr class="odd">
              <td colspan="10">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

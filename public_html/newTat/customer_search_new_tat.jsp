<%@ page import="com.integrosys.cms.ui.imageTag.ImageTagForm,
                 java.util.Collection,
                 java.util.Vector,
                 java.util.Iterator,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%!
    int records_per_page = 10;
%>
<%
NewTatForm aForm;
aForm = (NewTatForm) request.getAttribute("NewTatForm");
int startIndexInner = 0;
int startIndex = 0;
String ind= (String) request.getAttribute("startIndexInner");

if(ind!=null && (!ind.equals("")))
	 startIndexInner = Integer.parseInt(ind);
String index= (String) request.getAttribute("startIndex");

if(index!=null && (!index.equals("")))
	 startIndex = Integer.parseInt(index);

Collection results = aForm.getSearchResult();
int count =0;
if(results!=null){
 	count =results.size();
}
CustomerSearchCriteria search = (CustomerSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMERSEARCHCRITERIA_OBJ);
if (search != null) {
    aForm.setStartIndex(search.getStartIndex());
}
int sno = 0;
if(startIndexInner==0)
{
	sno = 0;
}
else{
	sno = startIndexInner;
}
sno = aForm.getStartIndex();
int prev = aForm.getStartIndex() - aForm.getNumItems();
if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}
HashMap regionMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.regionMap");
if(results!=null) {
   pageContext.setAttribute("customerList",results);
}
%>
<%@page import="com.integrosys.cms.ui.newTat.NewTatForm"%>
<%@page import="com.integrosys.cms.ui.common.CountryList"%>
<%@page import="com.integrosys.cms.app.customer.bus.CustomerSearchCriteria"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.IContact"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBContact"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%><script>


    var submitCustomerSearch = function submitPage(params) {
    var gobutton = params;
       // var gobutton = params[0];
        document.forms[0].gobutton.value = gobutton;
        if (gobutton == 1) {
            //document.forms[0].leIDType.value="";
            document.forms[0].lspLeIdListSearch.value = "";
            //document.forms[0].idNO.value = "";
            //document.forms[0].aaNumber.value = "";
            //document.forms[0].idCountry.value="";
        } else if (gobutton == 2) {
            document.forms[0].lspShortNameListSearch.value = "";
            //document.forms[0].idNO.value = "";
            //document.forms[0].aaNumber.value = "";
            //document.forms[0].idCountry.value="";
        } 
        else {
        }

        if (document.forms[0].source.value != "") {
            document.forms[0].action = "MICustomerSearch.do?event=list_customer";
        }
        document.forms[0].submit();
    }

    function submitEnterWrapper(event, gobutton) {
        var params = new Array();
        params[0] = gobutton;
        
        submitEnter(event, submitCustomerSearch, params);
    }

    function cancelPage(){
        document.forms[0].action="NewTat.do?event=list_cancel&startIndex="+<%=startIndex%>;
        
        document.forms[0].submit();
    }

    
    function submitDocument(customerName,legalRef,legalRef,subProfileId,instrId,startIndex){

    	var lspLeIdListSearch = document.forms[0].lspLeIdListSearch.value
    	 var lspShortNameListSearch = document.forms[0].lspShortNameListSearch.value
        
  	  document.forms[0].action="NewTat.do?event=prepare_submit_documents&customerName="+customerName+"&legalName="+legalRef+"&custId="+legalRef+"&customerID="+subProfileId+"&limitProfileID="+instrId+"&custLimitProfileID="+instrId+"&startIndex="+startIndex+"&lspLeIdListSearch="+lspLeIdListSearch;
  	    document.forms[0].submit();
  	    
    } 
</script>
<body>
<html:form action="NewTat.do?event=list_customer"><!--
    <input type="hidden" name="event" value="prepare">
    --><input type="hidden" value="" name="gobutton">
<%
        String source = request.getParameter("source");
        if (source == null) {
            source = "";
        }
    %>
    <input type="hidden" name="source" value="<%= source %>"/>
   <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
       <tr>
        <td>
         <h3> Document Submit </h3>
        </td>
        </tr>
        <tr>
            <td>
                <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                   <tr>
                            <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.party.name"/></td>
                            <td>
                                <html:text property="lspShortNameListSearch" maxlength="40" onkeypress="submitEnterWrapper(event, 1);" />
								<html:errors property="customerNameError"/>
							</td>
                            <td><input onclick="submitCustomerSearch(1)" name="AddNew3" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.party.id"/></td>
                            <td>                   
                                <html:text property="lspLeIdListSearch" maxlength="20" onkeypress="submitEnterWrapper(event, 2);" />
                                <html:errors property="legalIDError"/>
                            </td>
							<td> <input onclick="submitCustomerSearch(2)" name="AddNew2" type="button" id="AddNew2" value="Go"
                                       class="btnNormal"   style="margin-right:5px;margin-left:10;width:50px"/>
							</td>
                        </tr>
                  
          <tr>
           <td colspan="3">
            <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
             <thead>
              <tr>
               <td width="4%"><bean:message key="label.global.sn"/></td>
               <td width="15%"><bean:message key="label.list.party.name"/><br/>
               <%if(PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")){%>
                <bean:message key="label.customer.subprofile.name"/>
                <%}%>
                </td>
               <td width="10%"><bean:message key="label.list.party.id"/><br/>
               <% if(PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")){%>
                <bean:message key="label.customer.subprofile.id"/></td>
                <% } %>
                <td width="7%">Segment</td>
                <td width="7%">Region</td>
                <td width="7%">Status</td>
              <td width="12%"><bean:message key="label.global.action"/></td>
              </tr>
             </thead>
             <tbody>
       <% if(results!=null)  {%>
              <logic:present name="customerList">
               <logic:iterate id="OB" name="customerList"  type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
<%               
				 boolean isISDACSADeal = false;
				 boolean isGMRADeal = false;
				 long agreementID = ICMSConstant.LONG_INVALID_VALUE;
				 long subprofileID = OB.getSubProfileID();
				 long instrID = OB.getInstructionID();
				 boolean isNoLimits = OB.getNoLimitsInd();
                 boolean hasContractFinance = OB.getHasContractFinance();
                 boolean hasBridgingLoan = OB.getHasBridgingLoan();
                 boolean isDeleted = false;
				 String searchLEID = OB.getLegalReference();
				 String searchCustomerName = OB.getCustomerName();
                 String aaType = OB.getLmtProfileType();
				 if( aaType != null && aaType.equals( ICMSConstant.AA_TYPE_TRADE ) )
				 {				 
					String type = OB.getAgreementType();
					agreementID = OB.getAgreementID();
					if( type != null && type.equals( ICMSConstant.GMRA_TYPE ) )
					{
						isGMRADeal = true;
					}
					else if( type != null && type.equals( ICMSConstant.ISDA_CSA_TYPE ) )
					{
						isISDACSADeal = true;
					}
				 }
				 IContact[] contact = null;
if(OB!=null && OB.getCustomer()!=null && OB.getCustomer().getCMSLegalEntity()!=null){
				 contact = OB.getCustomer().getCMSLegalEntity().getRegisteredAddress();
}
					OBContact address = new OBContact();
					if(contact != null)
					{
					for (int i = 0; contact.length > i; i++) {
						if (contact[i].getContactType().equals("CORPORATE")) {
							address = (OBContact) contact[i];
	//						System.out.println("address is "+address.getRegion());
						}
					}
					}
					String regionId = "";
					if(address!=null && address.getRegion()!=null){
				    regionId = address.getRegion();
					}
				 String rowClass="";
				 sno++;
				 if(sno%2!=0){
					rowClass="odd";
				 }else{
					rowClass="even";
				 }
 			 %>
                  <tr class="<%=rowClass%>">
                  <td style="text-align:center" class="index"><%=sno%></td>
                  <td>
                  <integro:htmltext value="<%=OB.getCustomerName()%>"/>&nbsp;<br>
                  <%if(PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")){%>
                  <integro:htmltext value="<%=OB.getCustomerName()%>"/>&nbsp;
                  <%}%>
                  </td>
                  <td><integro:empty-if-null value="<%=OB.getLegalReference()%>"/>&nbsp;<br>
                  <%if(PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")){ %>
                  <integro:empty-if-null value="<%=OB.getSubProfileReference()%>"/>&nbsp;
                  <%}%>
                  </td>
                  <td>
                  <%
                  String str = "";
                  if(OB!=null && OB.getCustomer()!=null){
                  str = OB.getCustomer().getCustomerSegment();
                  }
                  %>
                  	<integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"  descWithCode="false" display="true" entryCode="<%=str %>"  />				
                  </td>
                  <td>
                  <integro:empty-if-null value="<%=regionMap.get(regionId) %>"/>
                  </td>
                  <td>
                   <%
                  String sts = "";
                  if(OB!=null && OB.getCustomer()!=null){
                  sts = OB.getCustomer().getStatus();
                  }
                  %>
                  <%=sts%> 
                  </td>
                  <td>
                <a href="javascript:submitDocument('<%=OB.getCustomerName()%>','<%=OB.getLegalReference()%>','<%=OB.getLegalReference()%>','<%=subprofileID%>','<%=instrID%>','<%=aForm.getStartIndex()%>');">Submit Document  </a>       
                    </td>
                 </tr>
               
	            </logic:iterate>
               </logic:present>
               <%} else {%>
			   <td colspan="7" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
			   <%}%>
              </tbody>
			</table>
		   </td>
		  </tr>
		 
                       
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>


    </table>
    	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="65">&nbsp;</td>
			<td width="65">&nbsp;</td>
		</tr>
		<tr>
			
			<td colspan="4" align="center"><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
				src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
			</a> </td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		 <tr>
<td>
 <% String alphaURL="/NewTat.do?event=list_customer";%>
			<table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr align="left">
                     <td>
                         <integro:pageindex pageIndex='<%=new PageIndex(startIndex,records_per_page,aForm.getNumItems())%>' url='<%="NewTat.do?event=list_customer&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
                        </td>
                      </tr>
               </table>
</td>
</tr>
	</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->




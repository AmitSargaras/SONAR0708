<%@ page import="	com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                    com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                    com.integrosys.cms.app.collateral.bus.IValuation,
                    com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle,				    
                    com.integrosys.cms.app.common.constant.ICMSConstant,
                    com.integrosys.cms.app.limit.bus.ILimitProfile,
                    com.integrosys.base.businfra.currency.Amount,
                    com.integrosys.base.techinfra.util.DateUtil,
                    com.integrosys.base.uiinfra.common.ICommonEventConstant,
                    com.integrosys.component.commondata.app.CommonDataSingleton,
                    com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.AssetSpecVehiclesForm,                    
                    com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                    com.integrosys.cms.ui.collateral.CollateralConstant,
                    com.integrosys.cms.ui.collateral.InsurerNameList,
                    com.integrosys.cms.ui.common.constant.IGlobalConstant,
                    com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                    com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeTypeList
                    "%>
<%@ page import="java.util.*,
                 com.integrosys.cms.ui.common.CountryList"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<% 
 
   ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
   IAssetPostDatedCheque iCol = (IAssetPostDatedCheque) itrxValue.getStagingCollateral();
   String classtype ="";
   AssetPostDatedChqsForm colForm = (AssetPostDatedChqsForm) request.getAttribute("AssetPostDatedChqsForm");
   List otherBankList = (List) request.getAttribute("otherBankList");
   String otherBankCode = (String)request.getAttribute("bankCode");
   DateFormat dt=new SimpleDateFormat("dd/MM/yyyy");
   if (otherBankList != null) {
      pageContext.setAttribute("otherBankList",otherBankList);
    }
   String context = request.getContextPath() + "/";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.AssetPostDatedChqsForm"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IPostDatedCheque"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IAssetPostDatedCheque"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeForm"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />


<script type="text/javascript" src="js/emulation.js"></script>
<script type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
<script type="text/javascript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">
function getBankCode(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'bankCode';
 var url = '/cms/AssetPostDatedChqsCollateral.do?event=bank_code_population&bankId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function submitPage(num, index) {
    enableAllFormElements();

        if (num == 1) {
            document.forms[0].event.value = "submit";
        }
        if (num == 2) {
            document.forms[0].event.value = "update";
        }
        if (num == 3) {
            document.forms[0].event.value = "itemDelete";
            document.forms[0].itemType.value = "CHEQUE";
        }
        if (num == 4) {
            document.forms[0].event.value = "prepare";
            document.getElementById("indexID").value= "-1";
           document.getElementById("itemType").value= "CHEQUE";
         }
        if (num == 5) {
            document.forms[0].event.value = "prepare_update_sub";
            document.forms[0].indexID.value = index;
            document.forms[0].itemType.value = "CHEQUE";
        }
        if (num == 6) {
            document.forms[0].event.value = "viewChequeDetails";
            document.forms[0].indexID.value = "-1";
            document.forms[0].itemType.value = "CHEQUE";
        }
        if (num == 7) {
            document.forms[0].event.value = "prepare_update_sub";
            document.forms[0].indexID.value = index;
            document.forms[0].itemType.value = "CHEQUE";
        }

        if (num == 8) {
            document.forms[0].event.value = "create_bankDetail";
        }
         document.forms[0].submit();
    }

  </script>   
</head>
	
	<html:form action="AssetPostDatedChqsCollateral.do">
	
	</br>
 <table align="right" width="98%" cellpadding="0" cellspacing="0" border="0" >
  <tr>
    
	<td align=left ><h3>  Add Bank Details</h3></td>
  </tr>

  
</table>
 
	</br>&nbsp;

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" 
 style="margin-top:30px">

<tbody>
	<tr>
		<td >
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			     <tbody>
					
					  <tr class="even">
	                     <td width="20%" class="fieldname">
		                      Bank Name
	                     </td>
    	                  <td width="30%" >
                               <html:select name="AssetPostDatedChqsForm" property="draweeBank" onchange="javascript:getBankCode(this)">
                               <option value="" >select</option>
                               <html:options collection="otherBankList" labelProperty="label" property="value" />
                               </html:select>
                          </td>

                           <td width="20%"class="fieldname">
		                        Bank Code
                           </td>
 	                       <td width="30%">
 	                       <input type="text" name="bankCode" maxlength="20" size="20" value="">  
		                       
                           </td>
 	
                      </tr>
                      
                     
					
					  <tr class="odd">
	                         <td width="20%" class="fieldname">
		                           Packet Number
		                        
	                          </td>
    	                      <td width="30%" >
	                         <input type="text" name="packetNumber" maxlength="20" size="20" value="">       </td>

                               <td width="20%" class="fieldname">
		                               Loanable
                               </td>
 	                            <td width="30%" >
		                            <html:radio property="loanable" value="<%=ICMSConstant.TRUE_VALUE%>">Yes</html:radio>&nbsp
				                    <html:radio property="loanable" value="<%=ICMSConstant.FALSE_VALUE%>">No</html:radio> </html>
				               </td>
 	
                      </tr>
                      
                       <tr class="odd">
	                         <td width="20%" class="fieldname">
		                          Remarks
	                          </td>
    	                      <td width="30%" colspan="3">
	                    <html:textarea  property="remarks" rows="3" style="width:100%"  onkeyup="limitTextInput(this,40,'Description of Asset ')"/>
	                </td>

                              
                      </tr>
              </tbody>
       </table>
   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
      <thead>
        <tr>
            <td><h3>Cheque Details</h3></td>
               <td align="right" valign="baseline">
                <input type="hidden" name="subtype" value="AssetPostDatedChqs"/>
                <!--<input class="btnNormal" type="button" name="chequeSubmit1" value="Add New" onclick="javascript:submitPage(4, -1)"/> &nbsp; -->
               <input class="btnNormal" type="button" name="chequeSubmit1" value="Add New" onclick="javascript:submitPage(4, -1)"/> &nbsp;
                 </td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </thead>
    <tr>
        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
            <thead>
                <tr>
                    <td width="5%">Cheque number</td>
                    <td width="25%">Deposit date</td>
                    <td width="15%">Expiry date</td>
                    <td width="20%">Cheque amount</td>
                    <td width="20%">Action</td>
                      </tr>
            </thead>
            <tbody>
                <%
                    IPostDatedCheque[] cheque = iCol.getPostDatedCheques();
                    classtype = "odd";
                    if (cheque != null) {
                        if (cheque.length == 0) {
                %>
                <tr class="<%=classtype%>">
                    <td colspan="7">There is no cheque detail.</td>
                </tr>
                <% }
                    for (int counter = 0; counter < cheque.length; counter++) {
                    	
                    	ChequeForm obj=new ChequeForm();
                        if (cheque[counter] == null)
                            continue;
                %>
                <tr class="<%=classtype%>">
                    
                    <td width="25%">
                        <integro:empty-if-null value="<%= cheque[counter].getChequeNumber()%>"/>&nbsp;
                    </td>
                    <td width="15%" valign="right">
                        <integro:empty-if-null value="<%= dt.format(cheque[counter].getIssueDate())%>"/>&nbsp;
                    </td>
                     <td width="15%" valign="right">
                        <integro:empty-if-null value="<%= dt.format(cheque[counter].getExpiryDate())%>"/>&nbsp;
                    </td>
                    <td width="20%">
                        <% if (cheque[counter].getChequeAmount() != null && cheque[counter].getChequeAmount().getCurrencyCode() != null) { 
                        	obj.setChequeAmt( String.valueOf(cheque[counter].getChequeAmount().getAmount()));
                        
                        %>
                            <integro:empty-if-null value="<%= obj.getChequeAmt()%>"/>&nbsp;
                    </td>
                        <% } %>&nbsp; </td>
       
                        
                     <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <option value='AssetPostDatedChqsCollateral.do?event=view_chequeDetail&indexID=<%=counter%>&itemType=CHEQUE'>View</option>
                             	      <option value='AssetPostDatedChqsCollateral.do?event=prepare_update_sub&indexID=<%=counter%>&itemType=CHEQUE'>Edit</option>
								      <option value='AssetPostDatedChqsCollateral.do?event=delete_chequeDetail&indexID=<%=counter%>&itemType=CHEQUE'>Delete</option>
         							
                                    </select> </td>
                   
               </tr>
                <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                }
                }
                } else { %>
                <tr class="<%=classtype%>">
                    <td colspan="7">There is no cheque detail.</td>
                </tr>
                <% } %>
				
            </tbody>
        </table></td>
    </tr>
</table>
      <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                 <tr>
                         <td valign="baseline" align="center">&nbsp;</td>
                         <td valign="baseline" align="center">&nbsp;</td>
                 </tr>
                  <tr>
                          <td width="100" valign="baseline" align="center">
                          <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                          <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
                          <td width="100" valign="baseline" align="center">
                          <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                           <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
                 </tr>
                 <tr>
                           <td valign="baseline" align="center">&nbsp;</td>
                           <td valign="baseline" align="center">&nbsp;</td>
                 </tr>
	               <tr><td height="70">&nbsp;</td></tr>
         </table>
                      <input type="hidden" name="event">
                      <input type="hidden" name="indexID"/>
                      <input type="hidden" name="itemType"/>       
  </td>
</tr>
</tbody>

</table>
</html:form>
</html>


<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header:
 * @author $Author: jzhai $<br>
 * @version $Revision: 1.38 $
 * @since $Date: 2006/11/16 08:54:20 $
 * Tag: $Name: DEV_20061123_B286V1 $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.businfra.search.SearchResult,
					com.integrosys.base.techinfra.util.DateUtil,
					java.util.*,
					com.integrosys.cms.app.custodian.bus.ICustodianDocSearchResult,
					com.integrosys.cms.ui.common.constant.ICMSUIConstant,
					com.integrosys.base.techinfra.logger.DefaultLogger,
					com.integrosys.base.uiinfra.common.ICommonEventConstant,
					com.integrosys.component.commondata.app.CommonDataSingleton,
					com.integrosys.cms.ui.custodian.CustodianForm,
					com.integrosys.cms.ui.common.constant.IGlobalConstant,
					com.integrosys.cms.ui.common.UIUtil,
					com.integrosys.cms.app.common.constant.ICMSConstant,
					com.integrosys.cms.app.checklist.bus.ICheckList,
					com.integrosys.cms.app.customer.bus.ICMSCustomer,
					com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
					com.integrosys.cms.app.checklist.bus.ICheckListItem,
					com.integrosys.cms.app.customer.proxy.CustomerProxyFactory,
					com.integrosys.cms.app.customer.bus.ICMSLegalEntity,
					com.integrosys.cms.app.collateral.proxy.CollateralProxyFactory,
					com.integrosys.cms.app.collateral.bus.*,
					com.integrosys.base.techinfra.propertyfile.PropertyManager,
                    			com.integrosys.cms.app.custodian.bus.ICustodianDocItemSearchResult"%>
 <%
    SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.docList");
    CustodianForm form = (CustodianForm)request.getAttribute("CustodianForm");
    //DefaultLogger.debug("withdrawl_list.jsp","sr is "+sr);
    
    ArrayList custodianDocList = null;
    
    String envCab = (String)request.getParameter("envCab");
    String envDrw = (String)request.getParameter("envDrw");
    String envBarCode = (String)request.getParameter("envBarCode");
    String envItemAddr = (String)request.getParameter("envItemAddr");
    
    List secEnvListing = (List)request.getAttribute("secEnvListing");
    
    if(secEnvListing != null)
    {
		Iterator it = secEnvListing.iterator();
		while (it.hasNext())
		{
			Object [] obj = (Object [])it.next();
			envCab = (String)obj[0];
			envDrw = (String)obj[1];
			envBarCode = (String)obj[2];
			envItemAddr = (String)obj[3];
		}
    }
    String checkListStatus = "";
    int mCounter = 0;
    int nbCounter = 0;
    if(sr!=null){
        custodianDocList = (ArrayList)sr.getResultList();
    }

        Vector mainBorrowerVect = new Vector();
        Vector coBorrowerVect = new Vector();
        Vector coBorrowerVects = new Vector();
        Vector pledgorVect = new Vector();
        Vector pledgorVects = new Vector();
        Vector nonBorrowerVect = new Vector();
        Vector securitiesVect = new Vector();
        Vector uniqueSecTypeVect = new Vector(); //stores unique concatenation of security types and sub-types
        //Vector uniqueSecID = new Vector(); //stores unique Security IDs
       	Vector uniqueCoBorrowerIDVect = new Vector(); //stores unique subprofile IDs
       	Vector uniquePledgorIDVect = new Vector(); //stores unique pledgor IDs
        if (custodianDocList!=null)
        {
        	//iterates through custodianDocList and splits into the various sub-categories
        	for (int i=0; i<custodianDocList.size(); i++)
        	{
        		ICustodianDocSearchResult custSearchResult = (ICustodianDocSearchResult)custodianDocList.get(i);
	        	String category = custSearchResult.getCategory();
        		String subCategory = custSearchResult.getSubCategory();
                //DefaultLogger.debug("withdrawl_list.jsp","cat="+custSearchResult.getCategory()+", subCat="+custSearchResult.getSubCategory());
//                DefaultLogger.debug("withdrawl_list.jsp","docItemRef="+custSearchResult.getDocItemRef()+", cat="+custSearchResult.getCategory()+", subCat="+custSearchResult.getSubCategory());
				if (category.equals("S"))
        		{
        			securitiesVect.add(custSearchResult);
					ICollateral collateral = CollateralProxyFactory.getProxy().getCollateral(custSearchResult.getCollateralID(), false);
					if (collateral!=null)
					{
						String securityIDLong =collateral.getSCISecurityID();   //edit
						String securityID = "";
						if (!securityIDLong.trim().equals("0") && !securityIDLong.trim().equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE)))
							securityID = securityIDLong;
						ICollateralType collateralType = collateral.getCollateralType();
						ICollateralSubType collateralSubType = collateral.getCollateralSubType();
						String secType = collateralType.getTypeName();
						secType = secType==null ? secType="" : secType;
						String secSubType = collateralSubType.getSubTypeName();
						secSubType = secSubType==null ? secSubType="" : secSubType;

            Vector uniqueSecDetailVect = new Vector(); //stores details of a security types and sub-types
            uniqueSecDetailVect.add(securityID);
            uniqueSecDetailVect.add(secType);
            uniqueSecDetailVect.add(secSubType);
			uniqueSecDetailVect.add(custSearchResult.getSubCategory());

						String combinedSecType = securityID + "/" + secType + "/" + secSubType; //concatenates type and sub-type to form unique string
						if (!uniqueSecTypeVect.contains(uniqueSecDetailVect))
						{
							uniqueSecTypeVect.add(uniqueSecDetailVect);
                            //DefaultLogger.debug("withdrawl_list.jsp","unique securityID/secType/secSubType="+combinedSecType);
							//uniqueSecID.add(securityID);
						}
					}

        		}
        		else if (subCategory!=null)
        		{
	        		if(subCategory.equals("MAIN_BORROWER"))
	        			mainBorrowerVect.add(custSearchResult);
	        		else if (subCategory.equals("CO_BORROWER"))
	        		{
	        			coBorrowerVect.add(custSearchResult);
	        			long coBorrowerID = custSearchResult.getSubProfileID();
	        			if (coBorrowerID!=0 && coBorrowerID!=ICMSConstant.LONG_INVALID_VALUE
	        				&& !uniqueCoBorrowerIDVect.contains(new Long(coBorrowerID)))
	        				uniqueCoBorrowerIDVect.add(new Long(coBorrowerID));
                        //DefaultLogger.debug("withdrawl_list.jsp","no. of unique co-borrowers="+uniqueCoBorrowerIDVect.size());
	        		}
	        		else if (subCategory.equals("PLEDGOR"))
	        		{
	        			pledgorVect.add(custSearchResult);
	        			long pledgorID = custSearchResult.getPledgorID();
	        			if (pledgorID!=0 && pledgorID!=ICMSConstant.LONG_INVALID_VALUE
	        				&& !uniquePledgorIDVect.contains(new Long(pledgorID)))
	        				uniquePledgorIDVect.add(new Long(pledgorID));
                        //DefaultLogger.debug("withdrawl_list.jsp","no. of unique pledgors="+uniquePledgorIDVect.size());
	        		}
	        		else if (subCategory.equals("NON_BORROWER"))
	        			nonBorrowerVect.add(custSearchResult);
        		}
        	}
		}


    if(custodianDocList!=null && custodianDocList.size()>0){
        pageContext.setAttribute("docList",custodianDocList);
    }
    int sno=0;
     boolean printFlag=false;
     String[] itemRef = form.getCheckListItemRef();
     int index=0;
     ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
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

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function checkedPledgorAll(){
   var a =0;
	if(document.getElementById("print").checked){
	for(var s=0;s<document.getElementsByName("checkListItemRef").length;s++){
	   document.getElementsByName("checkListItemRef")[s].checked=true;
	}
	}else{
	for(var s=0;s<document.getElementsByName("checkListItemRef").length;s++){
	   document.getElementsByName("checkListItemRef")[s].checked=false;
	}
	}
}
function submitPage() {
    document.forms[0].memoType.value="withdrawal";
    document.forms[0].submit();
    //onclick="MM_openBrWindow('ProCust(Printwdrwmemo,print,cpcCustMaker).htm','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=400,left=5,top=5')"
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='custodian.do?event=print_withdrawl_memo'>
<!-- hidden field indicates that this is a withdrawal (instead of lodgement) memo -->
<input type="hidden" name="memoType" />
<input type="hidden" name="envCab" value="<%=envCab%>"/>
<input type="hidden" name="envDrw" value="<%=envDrw%>"/>
<input type="hidden" name="envBarCode" value="<%=envBarCode%>"/>
<input type="hidden" name="envItemAddr" value="<%=envItemAddr%>"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<body onLoad="MM_preloadImages('img/print2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Print Withdrawal Memo</h3></td>
      </tr>
    <tr>
      <td> <h3> Constitutional / Contractual Doc</h3></td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>
<%		boolean sectionPrinted = false;
    ICustodianDocSearchResult ob2 = null;
%>
<!-- start of Main Borrower block -->
<%		if (mainBorrowerVect.size()>0)
		{
			if (sectionPrinted) //provide spacing if 1st row has been printed
			{
%>				<tr>
					<td align="center">&nbsp;</td>
				</tr>
<%			}
			for (int i=0; i<mainBorrowerVect.size(); i++)
            {
            	if(mCounter==i)
               	{
                   	 ob2 = (ICustodianDocSearchResult)mainBorrowerVect.get(i);
                   	checkListStatus = ob2.getCheckListStatus();
                }	
            }
			sectionPrinted = true;
			sno=0;
%>
			<tr>
		      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		          <tbody>
		            <tr class="odd">
						<td width="20%" class="fieldname">Customer Category </td>
                        <td width="40%">Main Borrower</td>
                        <td width="20%" class="fieldname">CIF</td>
                        <td width="20%"><%=cust.getCMSLegalEntity().getLEReference()%></td>
		            </tr>
		            <tr class="even">
		              <td class="fieldname">Customer Name<br /> </td>
		              <td><integro:empty-if-null value="<%=cust.getCMSLegalEntity().getLegalName()%>"/></td>
		              <td class="fieldname">Checklist Status</td>
    				  <td><%=checkListStatus.equals("") ? "-" : checkListStatus%></td>
		            </tr>
		          </tbody>
		        </table></td>
		    </tr>
		    <tr>
		      <td align="center">&nbsp;</td>
		    </tr>
		    <tr>
		      <td>
		      	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
		          <thead>
		            <tr>
		              <td>S/N</td>
		              <td>Code<br>(Doc No)</td>
		              <td>Description</td>
		              <td>Doc Status</td>
		              <td>Cust Status</td>
		              <td>Date of Transaction</td>
		              <td>Doc Date</td>
		              <td>Expiry Date</td>
		              <td>Security Location</td>
		              <td>Security Cabinet</td>
		              <td>Security Drawers</td>
		              <td>Security Envelope No.</td>
		              <td>Print Withdrawal<br><input type="checkbox" name="print" id="print" onClick="checkedPledgorAll()"
          value="Check All" <%if((ob2.getCustodianDocItems()==null)||(ob2.getCustodianDocItems().length==0)){ %>disabled <%} %>/> Select All </td>
		            </tr>
		          </thead>
		          <tbody>

<%				for (int i=0; i<mainBorrowerVect.size(); i++)
                {
                    ICustodianDocSearchResult ob = (ICustodianDocSearchResult)mainBorrowerVect.get(i);
                    ICustodianDocItemSearchResult[] itemArr = ob.getCustodianDocItems();
                    for (int ind = 0; ind < itemArr.length; ind++)
                    {
                        ICustodianDocItemSearchResult item = itemArr[ind];
                       	if(item.getDocType().equals(com.integrosys.cms.app.common.constant.ICMSConstant.DOC_TYPE_CC))
						{
							mCounter++;
							printFlag=true;
							String rowClass="";
							sno++;
							if(sno%2!=0){
								rowClass="odd";
							}else{
							    rowClass="even";
							}

						 //bernard - added for CMS-465
							String custStatus = item.getDisplayStatus();
                            if ((custStatus == null) ||
                                (custStatus != null && custStatus.equals(ICMSConstant.STATE_RECEIVED))) {
                                custStatus = ICMSConstant.STATE_ITEM_AWAITING;
                            }
							
                            // CMS-2480
                            Date cpcTrxDate = UIUtil.getLaterDate(item.getCPCCustDate(), item.getStageCPCDate());
                            
                            //CR-130 Display Narration - display from custodian search instead of checklist item
/*
							long checkListItemRef = item.getDocItemRef();
							ICheckListItem checkListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(checkListItemRef);
							String cpcStatus = item.getCPCDisplayStatus();
							Date docDate = null;
							Date expiryDate = null;
							if (checkListItem!=null)
							{
								//cpcStatus = checkListItem.getItemStatus();
								docDate = checkListItem.getDocDate();
								expiryDate = checkListItem.getExpiryDate();
                                //DefaultLogger.debug("withdrawl_list.jsp","checkListItem.getParentItemID()="+checkListItem.getParentItemID());
                                //DefaultLogger.debug("withdrawl_list.jsp","checkListItem.getItem().getItemID()="+checkListItem.getItem().getItemID());
							}
*/
		%>
							<tr class=<%=rowClass%>>
								<td class="index"><%=sno%></td>
								<td><%=item.getDocNo()!=null?item.getDocNo():" "%><br>(<%=item.getDocItemRef()%>)</td>
								<td><%=item.getDocDescription()!=null?item.getDocDescription():" "%></td>
								<td style="text-align:center"><%=(item.getCPCDisplayStatus() ==null || item.getCPCDisplayStatus() .equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
								<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
								<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
								<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
								<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>
								<td style="text-align:center">&nbsp;<%if(item.getSecEnvAdd()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false" /> <%} else {%>-<% } %></td>
                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvCab()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>
                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvDrw()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>                   
								<td style="text-align:center">&nbsp;<%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():"-"%></td>

								<td style="text-align:center"><input type="checkbox" name="checkListItemRef" value="<%=item.getCheckListItemID()%>@<%=ob.getCheckListID()%>"
		<%
								if ((itemRef != null)  && (itemRef.length > 0))
								{
									for (int ii=0; ii<itemRef.length; ii++)
									{
										if ((""+ item.getDocItemRef() + "@" + ob.getCheckListID()).equals(itemRef[ii]))
										{
		%>									checked
		<%								}
									}
								}
		%>
								/></td>
							</tr>
		<%					index++;
						} //end if
                    }//end item for loop
                } //end for loop
		%>
		          </tbody>
		        </table>
		      </td>
		    </tr>
<%		}
%>
<!-- end of Main Borrower block -->

<!-- start of Co-Borrower block -->
<%		if (uniqueCoBorrowerIDVect.size()>0)
		{
			for (int j=0; j<uniqueCoBorrowerIDVect.size(); j++)
			{
				if (sectionPrinted) //provide spacing if 1st row has been printed
				{
%>					<tr>
						<td align="center">&nbsp;</td>
					</tr>
<%				}
				 ob2 = (ICustodianDocSearchResult)coBorrowerVect.get(j);
                checkListStatus = ob2.getCheckListStatus();
                sectionPrinted = true;
				sno=0;
				Long customerIDLong = (Long)uniqueCoBorrowerIDVect.get(j); //gets the subprofile ID to filter by

				//this block gets the header fields for co-borrower section
				ICMSCustomer customerOB = CustomerProxyFactory.getProxy().getCustomer(customerIDLong.longValue());
				String legalID = null;
				String legalName = null;
				if (customerOB!=null)
				{
					ICMSLegalEntity legalEntityOB = customerOB.getCMSLegalEntity();
					legalID = legalEntityOB.getLEReference();
					legalName = legalEntityOB.getLegalName();
				}
%>
				<tr>
			      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			          <tbody>
			            <tr class="odd">
                            <td width="20%"class="fieldname">Customer Category </td>
                            <td width="40%">Co-Borrower</td>
                            <td width="20%"class="fieldname">CIF</td>
                            <td width="20%"><%=legalID==null ? "-" : legalID%></td>
			            </tr>
			            <tr class="even">
			              <td class="fieldname">Customer Name<br /> </td>
			              <td><%=legalName==null ? "-" : legalName%></td>
			              <td class="fieldname">Checklist Status</td>
						  <td><%=checkListStatus.equals("") ? "-" : checkListStatus%></td>
			            </tr>
			          </tbody>
			        </table></td>
			    </tr>
			    <tr>
			      <td align="center">&nbsp;</td>
			    </tr>
			    <tr>
			      <td>
			      	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
			          <thead>
			            <tr>
			              <td>S/N</td>
			              <td>Code<br>(Doc No)</td>
			              <td>Description</td>
			              <td>Doc Status</td>
			              <td>Cust Status</td>
			              <td>Date of Transaction</td>
			              <td>Doc Date</td>
			              <td>Expiry Date</td>
						  <td>Security Location</td>
						  <td>Security Cabinet</td>
						  <td>Security Drawers</td>
						  <td>Security Envelope No.</td>
			              <td>Print Withdrawal<br><input type="checkbox" name="print" id="print" onClick="checkedPledgorAll()"
          value="Check All" <%if((ob2.getCustodianDocItems()==null)||(ob2.getCustodianDocItems().length==0)){ %>disabled <%} %>/> Select All </td>
			            </tr>
			          </thead>
			          <tbody>

<%					for (int i=0; i<coBorrowerVect.size(); i++)
                    {
                        ICustodianDocSearchResult ob = (ICustodianDocSearchResult)coBorrowerVect.get(i);
                        ICustodianDocItemSearchResult[] itemArr = ob.getCustodianDocItems();
                        for (int ind = 0; ind < itemArr.length; ind++)
                        {
                            ICustodianDocItemSearchResult item = itemArr[ind];
							Long subProfileIDLong = (Long)uniqueCoBorrowerIDVect.get(j); //gets the subprofile ID to filter by
							//if document type is C/C and current iteration's subProfileID is the same as the subProfileID to filter by
							if(item.getDocType().equals(com.integrosys.cms.app.common.constant.ICMSConstant.DOC_TYPE_CC)
								&& ob.getSubProfileID()==subProfileIDLong.longValue())
							{
								printFlag=true;
								String rowClass="";
								sno++;
								if(sno%2!=0){
									rowClass="odd";
								}else{
								    rowClass="even";
								}

								//bernard - added for CMS-465
								String custStatus = item.getDisplayStatus();
                                if ((custStatus == null) ||
                                    (custStatus != null && custStatus.equals(ICMSConstant.STATE_RECEIVED))) {
                                    custStatus = ICMSConstant.STATE_ITEM_AWAITING;
                                }
								
                                // CMS-2480
                            	Date cpcTrxDate = UIUtil.getLaterDate(item.getCPCCustDate(), item.getStageCPCDate());
                            
                                //CR-130 Display Narration - display from custodian search instead of checklist item
/*
								long checkListItemRef = item.getDocItemRef();
								ICheckListItem checkListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(checkListItemRef);
								String cpcStatus = item.getCPCDisplayStatus();
								Date docDate = null;
								Date expiryDate = null;
								if (checkListItem!=null)
								{
									//cpcStatus = checkListItem.getItemStatus();
									docDate = checkListItem.getDocDate();
									expiryDate = checkListItem.getExpiryDate();
                                    //DefaultLogger.debug("withdrawl_list.jsp","checkListItem.getParentItemID()="+checkListItem.getParentItemID());
                                    //DefaultLogger.debug("withdrawl_list.jsp","checkListItem.getItem().getItemID()="+checkListItem.getItem().getItemID());
								}
*/
%>
								<tr class=<%=rowClass%>>
									<td class="index"><%=sno%></td>
									<td><%=item.getDocNo()!=null?item.getDocNo():" "%><br>(<%=item.getDocItemRef()%>)</td>
									<td><%=item.getDocDescription()!=null?item.getDocDescription():" "%></td>
									<td style="text-align:center"><%=(item.getCPCDisplayStatus() ==null || item.getCPCDisplayStatus() .equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
									<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
									<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
									<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
									<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>
									<td style="text-align:center">&nbsp;<%if(item.getSecEnvAdd()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false" /> <%} else {%>-<% } %></td>
	                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvCab()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>
	                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvDrw()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>                   
									<td style="text-align:center">&nbsp;<%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():"-"%></td>

									<td style="text-align:center"><input type="checkbox" name="checkListItemRef" value="<%=item.getCheckListItemID()%>@<%=ob.getCheckListID()%>"
<%
									if ((itemRef != null)  && (itemRef.length > 0))
									{
										for (int ii=0; ii<itemRef.length; ii++)
										{
											if ((""+ item.getDocItemRef() + "@" + ob.getCheckListID()).equals(itemRef[ii]))
											{
%>												checked
<%											}
										}
									}
%>
									/></td>
								</tr>
<%								index++;
							} // end if
                        }//end item for loop
                    } //end for loop
%>
			          </tbody>
			        </table>
			      </td>
			    </tr>
<%			} //end of for loop for unique co-borrower IDs
		}
%>
<!-- end of Co-Borrower block -->

<!-- start of Pledgor block -->
<%		if (uniquePledgorIDVect.size()>0)
		{
			for (int j=0; j<uniquePledgorIDVect.size(); j++)
			{
				if (sectionPrinted) //provide spacing if 1st row has been printed
				{
%>					<tr>
						<td align="center">&nbsp;</td>
					</tr>
<%				}
				 ob2 = (ICustodianDocSearchResult)pledgorVect.get(j);
                checkListStatus = ob2.getCheckListStatus();
				sectionPrinted = true;
				sno=0;
				Long pledgorIDLong = (Long)uniquePledgorIDVect.get(j); //gets the pledgorID to filter by

				//this block gets the header fields for pledgor section
				IPledgor pledgorOB = CollateralProxyFactory.getProxy().getPledgor(pledgorIDLong.longValue());
				long legalID = 0;
				String legalName = null;
				long pledgorID = 0;
				long sciPledgorID = 0;
				if (pledgorOB!=null)
				{
					legalID =Long.parseLong(pledgorOB.getLegalID()) ;      //
					legalName = pledgorOB.getPledgorName();
					pledgorID = pledgorOB.getPledgorID();
					sciPledgorID = pledgorOB.getSysGenPledgorID();
				}
%>
				<tr>
			      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			          <tbody>
			            <tr class="odd">
                            <td width="20%" class="fieldname">Customer Category </td>
                            <td width="40%">Pledgor</td>
                            <td width="20%" class="fieldname">CIF</td>
                            <td width="20%"><%=(legalID==0 || legalID==ICMSConstant.LONG_INVALID_VALUE) ? "-" : String.valueOf(legalID)%></td>
			            </tr>
			            <tr class="even">
			              <td class="fieldname">Customer Name<br /> </td>
			              <td><%=legalName==null ? "-" : legalName%></td>
			              <td class="fieldname">Pledgor ID</td>
			              <td><%=(sciPledgorID==0 || sciPledgorID==ICMSConstant.LONG_INVALID_VALUE) ? "-" : String.valueOf(sciPledgorID)%></td>
			            </tr>
			            <tr class="odd">
                            <td class="fieldname">Checklist Status</td>
							<td><%=checkListStatus.equals("") ? "-" : checkListStatus%></td>
                            <td class="fieldname">&nbsp</td>
                            <td>&nbsp</td>
                        </tr>
			          </tbody>
			        </table></td>
			    </tr>
			    <tr>
			      <td align="center">&nbsp;</td>
			    </tr>
			    <tr>
			      <td>
			      	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
			          <thead>
			            <tr>
			              <td>S/N</td>
			              <td>Code<br>(Doc No)</td>
			              <td>Description</td>
			              <td>Doc Status</td>
			              <td>Cust Status</td>
			              <td>Date of Transaction</td>
			              <td>Doc Date</td>
			              <td>Expiry Date</td>
			              <td>Security Location</td>
						  <td>Security Cabinet</td>
						  <td>Security Drawers</td>
						  <td>Security Envelope No.</td>
			              <td>Print Withdrawal<br><input type="checkbox" name="print" id="print" onClick="checkedPledgorAll()"
          value="Check All" <%if((ob2.getCustodianDocItems()==null)||(ob2.getCustodianDocItems().length==0)){ %>disabled <%} %>/> Select All </td>
			            </tr>
			          </thead>
			          <tbody>

<%					for (int i=0; i<pledgorVect.size(); i++)
                    {
                        ICustodianDocSearchResult ob = (ICustodianDocSearchResult)pledgorVect.get(i);
                        //if document type is C/C and current iteration's pledgorID is the same as the pledgorID to filter by
                        ICustodianDocItemSearchResult[] itemArr = ob.getCustodianDocItems();
                        for (int ind = 0; ind < itemArr.length; ind++)
                        {
                            ICustodianDocItemSearchResult item = itemArr[ind];
							if(item.getDocType().equals(com.integrosys.cms.app.common.constant.ICMSConstant.DOC_TYPE_CC)
								&& ob.getPledgorID()==pledgorIDLong.longValue())
							{
								printFlag=true;
								String rowClass="";
								sno++;
								if(sno%2!=0){
									rowClass="odd";
								}else{
								    rowClass="even";
								}

								//bernard - added for CMS-465
								String custStatus = item.getDisplayStatus();
                                if ((custStatus == null) ||
                                    (custStatus != null && custStatus.equals(ICMSConstant.STATE_RECEIVED))) {
                                    custStatus = ICMSConstant.STATE_ITEM_AWAITING;
                                }
								
                                // CMS-2480
                            	Date cpcTrxDate = UIUtil.getLaterDate(item.getCPCCustDate(), item.getStageCPCDate());
                            
                                //CR-130 Display Narration - display from custodian search instead of checklist item
/*
								long checkListItemRef = item.getDocItemRef();
								ICheckListItem checkListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(checkListItemRef);
								String cpcStatus = item.getCPCDisplayStatus();
								Date docDate = null;
								Date expiryDate = null;
								if (checkListItem!=null)
								{
									//cpcStatus = checkListItem.getItemStatus();
									docDate = checkListItem.getDocDate();
									expiryDate = checkListItem.getExpiryDate();
                                    //DefaultLogger.debug("withdrawl_list.jsp","checkListItem.getParentItemID()="+checkListItem.getParentItemID());
                                    //DefaultLogger.debug("withdrawl_list.jsp","checkListItem.getItem().getItemID()="+checkListItem.getItem().getItemID());
								}
*/
%>
								<tr class=<%=rowClass%>>
									<td class="index"><%=sno%></td>
									<td><%=item.getDocNo()!=null?item.getDocNo():" "%><br>(<%=item.getDocItemRef()%>)</td>
									<td><%=item.getDocDescription()!=null?item.getDocDescription():" "%></td>
									<td style="text-align:center"><%=(item.getCPCDisplayStatus() ==null || item.getCPCDisplayStatus() .equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
									<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
									<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
									<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
									<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>
									<td style="text-align:center">&nbsp;<%if(item.getSecEnvAdd()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false" /> <%} else {%>-<% } %></td>
	                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvCab()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>
	                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvDrw()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>                   
									<td style="text-align:center">&nbsp;<%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():"-"%></td>

									<td style="text-align:center"><input type="checkbox" name="checkListItemRef" value="<%=item.getCheckListItemID()%>@<%=ob.getCheckListID()%>"
<%
									if ((itemRef != null)  && (itemRef.length > 0))
									{
										for (int ii=0; ii<itemRef.length; ii++)
										{
											if ((""+ item.getDocItemRef() + "@" + ob.getCheckListID()).equals(itemRef[ii]))
											{
%>												checked
<%											}
										}
									}
%>
									/></td>
								</tr>
<%								index++;
							} //end if
                        } //end item for loop
                    } //end for loop
%>
			          </tbody>
			        </table>
			      </td>
			    </tr>
<%			} //end of for loop for unique pledgor IDs
		}
%>
<!-- end of Pledgor block -->

<!-- start of Non-Borrower block -->
<%		if (nonBorrowerVect.size()>0)
		{
			if (sectionPrinted) //provide spacing if 1st row has been printed
			{
%>				<tr>
					<td align="center">&nbsp;</td>
				</tr>
<%			}
				for (int i=0; i<nonBorrowerVect.size(); i++)
                    {
                    	if(nbCounter==i)
                    	{
                            ob2 = (ICustodianDocSearchResult)nonBorrowerVect.get(i);
                        	checkListStatus = ob2.getCheckListStatus();
                        }	
                    }
			sectionPrinted = true;
			sno=0;
%>
			<tr>
		      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		          <tbody>
		            <tr class="odd">
                        <td width="20%" class="fieldname">Customer Category </td>
                        <td width="40%">Non-Borrower</td>
                        <td width="20%" class="fieldname">CIF</td>
                        <td width="20%"><%=cust.getCMSLegalEntity().getLEReference()%></td>
		            </tr>
		            <tr class="even">
		              <td class="fieldname">Customer Name<br /> </td>
		              <td><integro:empty-if-null value="<%=cust.getCMSLegalEntity().getLegalName()%>"/></td>
		              <td class="fieldname">Checklist Status</td>
					  <td><%=checkListStatus.equals("") ? "-" : checkListStatus%></td>
		            </tr>
		          </tbody>
		        </table></td>
		    </tr>
		    <tr>
		      <td align="center">&nbsp;</td>
		    </tr>
		    <tr>
		      <td>
		      	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
		          <thead>
		            <tr>
		              <td>S/N</td>
		              <td>Code<br>(Doc No)</td>
		              <td>Description</td>
		              <td>Doc Status</td>
		              <td>Cust Status</td>
		              <td>Date of Transaction</td>
		              <td>Doc Date</td>
		              <td>Expiry Date</td>
	              	  <td>Security Location</td>
					  <td>Security Cabinet</td>
					  <td>Security Drawers</td>
					  <td>Security Envelope No.</td>
		              <td>Print Withdrawal<br><input type="checkbox" name="print" id="print" onClick="checkedPledgorAll()"
          value="Check All" <%if((ob2.getCustodianDocItems()==null)||(ob2.getCustodianDocItems().length==0)){ %>disabled <%} %>/> Select All </td>
		            </tr>
		          </thead>
		          <tbody>

<%				for (int i=0; i<nonBorrowerVect.size(); i++)
                {
                    ICustodianDocSearchResult ob = (ICustodianDocSearchResult)nonBorrowerVect.get(i);
                    ICustodianDocItemSearchResult[] itemArr = ob.getCustodianDocItems();
                    for (int ind = 0; ind < itemArr.length; ind++)
                    {
                        ICustodianDocItemSearchResult item = itemArr[ind];
						if(item.getDocType().equals(com.integrosys.cms.app.common.constant.ICMSConstant.DOC_TYPE_CC))
						{
							nbCounter++;
							printFlag=true;
							String rowClass="";
							sno++;
							if(sno%2!=0){
								rowClass="odd";
							}else{
							    rowClass="even";
							}

							//bernard - added for CMS-465
							String custStatus = item.getDisplayStatus();
                            if ((custStatus == null) ||
                                (custStatus != null && custStatus.equals(ICMSConstant.STATE_RECEIVED)))  {
                                custStatus = ICMSConstant.STATE_ITEM_AWAITING;
                            }
							
                            // CMS-2480
                            Date cpcTrxDate = UIUtil.getLaterDate(item.getCPCCustDate(), item.getStageCPCDate());
                            
                            //CR-130 Display Narration - display from custodian search instead of checklist item
/*
							long checkListItemRef = item.getDocItemRef();
							ICheckListItem checkListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(checkListItemRef);
							String cpcStatus = item.getCPCDisplayStatus();
							Date docDate = null;
							Date expiryDate = null;
							if (checkListItem!=null)
							{
								//cpcStatus = checkListItem.getItemStatus();
								docDate = checkListItem.getDocDate();
								expiryDate = checkListItem.getExpiryDate();
                                //DefaultLogger.debug("withdrawl_list.jsp","checkListItem.getParentItemID()="+checkListItem.getParentItemID());
                                //DefaultLogger.debug("withdrawl_list.jsp","checkListItem.getItem().getItemID()="+checkListItem.getItem().getItemID());
							}
 */
		%>
							<tr class=<%=rowClass%>>
								<td class="index"><%=sno%></td>
								<td><%=item.getDocNo()!=null?item.getDocNo():" "%><br>(<%=item.getDocItemRef()%>)</td>
								<td><%=item.getDocDescription()!=null?item.getDocDescription():" "%></td>
								<td style="text-align:center"><%=(item.getCPCDisplayStatus() ==null || item.getCPCDisplayStatus() .equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
								<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
								<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
								<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
								<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>
								<td style="text-align:center">&nbsp;<%if(item.getSecEnvAdd()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false" /> <%} else {%>-<% } %></td>
                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvCab()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>
                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvDrw()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>                   
								<td style="text-align:center">&nbsp;<%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():"-"%></td>

								<td style="text-align:center"><input type="checkbox" name="checkListItemRef" value="<%=item.getCheckListItemID()%>@<%=ob.getCheckListID()%>"
		<%
								if ((itemRef != null)  && (itemRef.length > 0))
								{
									for (int ii=0; ii<itemRef.length; ii++)
									{
										if ((""+ item.getDocItemRef() + "@" + ob.getCheckListID()).equals(itemRef[ii]))
										{
		%>									checked
		<%								}
									}
								}
		%>
								/></td>
							</tr>
		<%					index++;
						} //end if
                    } //end item for loop
                } //end for loop
		%>
		          </tbody>
		        </table>
		      </td>
		    </tr>
<%		}
%>
<!-- end of Non-Borrower block -->

<%	if (!printFlag)
	{
%>
		<tr>
			<td colspan=9 class="odd">
				<B>There are no C/C Documents for withdrawal.</B>
			</td>
		</tr>
<%	} else {
		sno=0;
		printFlag=false;
	}
%>
  </tbody>
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3> Security Doc</h3></td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>
<%		sectionPrinted = false;
		for (int j=0; j<uniqueSecTypeVect.size(); j++)
		{
			//String securityID = (String)uniqueSecID.get(j);
			/*String combinedSecType = (String)uniqueSecTypeVect.get(j);
			StringTokenizer secTypeTokenizer = new StringTokenizer(combinedSecType, "/");
			String securityID = "";
			String secType = "";
			String secSubType = "";
			if (secTypeTokenizer.hasMoreTokens())
				securityID = secTypeTokenizer.nextToken();
			if (secTypeTokenizer.hasMoreTokens())
				secType = secTypeTokenizer.nextToken();
			if (secTypeTokenizer.hasMoreTokens())
				secSubType = secTypeTokenizer.nextToken();*/

      		Vector secTypeDetail = (Vector)uniqueSecTypeVect.get(j);
		    ob2 = (ICustodianDocSearchResult)securitiesVect.get(j);
		    checkListStatus = ob2.getCheckListStatus();
            String securityID = "";
			String secType = "";
			String secSubType = "";
		    String customerCategory="";
			
      securityID = (String)secTypeDetail.get(0);
      secType = (String)secTypeDetail.get(1);
      secSubType = (String)secTypeDetail.get(2);
      customerCategory=(String)secTypeDetail.get(3);
	  
			securityID = securityID==null ? "" : securityID;
			secType = secType==null ? "" : secType;
			secSubType = secSubType==null ? "" : secSubType;
				
			if (sectionPrinted) //provide spacing if 1st row has been printed
			{
%>
				<tr>
					<td align="center">&nbsp;</td>
				</tr>
<%			}
			sectionPrinted = true;
			sno=0;
%>
				
			<tr>
				<td align="center">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
					<tbody>
						<tr class="odd">
							<td width="20%" class="fieldname">Security Type</td>
                            <td width="30%"><%=secType.equals("") ? "-" : secType%></td>
                            <td width="20%" class="fieldname">Security Sub-Type</td>
                            <td width="30%"><%=secSubType.equals("") ? "-" : secSubType%></td>
						</tr>
						<tr class="even">
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
							<td width="20%" class="fieldname">Customer Category</td>
                            <td width="30%"><%=(customerCategory==null || customerCategory.equals("")) ? "-" : customerCategory%></td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Security ID</td>
							<td><%=(securityID==null || securityID.equals("")) ? "-" : securityID%></td>
                            <td width="20%" class="fieldname">Checklist Status</td>
                            <td width="30%"><%=checkListStatus.equals("") ? "-" : checkListStatus%></td>
						</tr>
					</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">&nbsp;</td>
			</tr>

			<tr>
				<td>
					<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
					<thead>
						<tr>
							<td>S/N</td>
							<td>Code<br>(Doc No)</td>
							<td>Description</td>
							<td>Doc Status</td>
							<td>Cust Status</td>
							<td>Date of Transaction</td>
							<td>Doc Date</td>
							<td>Expiry Date</td>
							<td>Security Location</td>
						    <td>Security Cabinet</td>
						    <td>Security Drawers</td>
						    <td>Security Envelope No.</td>
							<td>Print Withdrawal<br><input type="checkbox" name="print" id="print" onClick="checkedPledgorAll()"
          value="Check All" <%if((ob2.getCustodianDocItems()==null)||(ob2.getCustodianDocItems().length==0)){ %>disabled <%} %>/> Select All
                            </td>
						</tr>
					</thead>
					<tbody>
	<%
                for (int i=0; i<securitiesVect.size(); i++)
                {
                	ICustodianDocSearchResult ob = (ICustodianDocSearchResult)securitiesVect.get(i);
                    long collateralID = ob.getCollateralID();
                    ICollateral collateral = CollateralProxyFactory.getProxy().getCollateral(ob.getCollateralID(), false);
                    String currSecIDLong = collateral.getSCISecurityID(); //edit
                    ICollateralType collateralType = collateral.getCollateralType();
                    ICollateralSubType collateralSubType = collateral.getCollateralSubType();
                    String currSecID = (!currSecIDLong.trim().equals("0") && !currSecIDLong.trim().equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? currSecIDLong : "";
                    String currType = collateralType==null ? "" : collateralType.getTypeName()==null ? "" : collateralType.getTypeName();
                    String currSubType = collateralSubType==null ? "" : collateralSubType.getSubTypeName()==null ? "" : collateralSubType.getSubTypeName();

                    //DefaultLogger.debug("withdrawl_list.jsp","security docItemRef="+item.getDocItemRef()+", type="+collateralType.getTypeName()+", subType="+collateralSubType.getSubTypeName());
                    ICustodianDocItemSearchResult[] itemArr = ob.getCustodianDocItems();
                    for (int ind = 0; ind < itemArr.length; ind++)
                    {
                        ICustodianDocItemSearchResult item = itemArr[ind];
						if(item.getDocType().equals(com.integrosys.cms.app.common.constant.ICMSConstant.DOC_TYPE_SECURITY)
							&& currSecID.equals(securityID) && currType.equals(secType) && currSubType.equals(secSubType))
						{
							printFlag=true;
							String rowClass="";
							sno++;
							if(sno%2!=0){
							    rowClass="odd";
							}else{
							    rowClass="even";
							}

							//bernard - added for CMS-465
							String custStatus = item.getDisplayStatus();
                            if ((custStatus == null) ||
                                (custStatus != null && custStatus.equals(ICMSConstant.STATE_RECEIVED))) {
                                custStatus = ICMSConstant.STATE_ITEM_AWAITING;
                            }
                            
							// CMS-2480
                            Date cpcTrxDate = UIUtil.getLaterDate(item.getCPCCustDate(), item.getStageCPCDate());
                            
                            //CR-130 Display Narration - display from custodian search instead of checklist item
/*
							long checkListItemRef = item.getDocItemRef();
							ICheckListItem checkListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(checkListItemRef);
							String cpcStatus = item.getCPCDisplayStatus();
							Date docDate = null;
							Date expiryDate = null;
							if (checkListItem!=null)
							{
								//cpcStatus = checkListItem.getItemStatus();
								docDate = checkListItem.getDocDate();
								expiryDate = checkListItem.getExpiryDate();
							}
 */
	%>
							<tr class=<%=rowClass%>>
								<td class="index"><%=sno%></td>
								<td ><%=item.getDocNo()!=null?item.getDocNo():" "%><br>(<%=item.getDocItemRef()%>)</td>
								<td ><%=item.getDocDescription()!=null?item.getDocDescription():" "%></td>
								<td style="text-align:center"><%=(item.getCPCDisplayStatus() ==null || item.getCPCDisplayStatus() .equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
								<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
								<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
								<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
								<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>
								<td style="text-align:center">&nbsp;<%if(item.getSecEnvAdd()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false" /> <%} else {%>-<% } %></td>
                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvCab()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>
                                <td style="text-align:center">&nbsp;<%if(item.getSecEnvDrw()!=null ){%><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /><%} else {%>-<% } %></td>                   
								<td style="text-align:center">&nbsp;<%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():"-"%></td>
								<td style="text-align:center"><input type="checkbox" name="checkListItemRef" value="<%=item.getCheckListItemID()%>@<%=ob.getCheckListID()%>"
	<%
								if ((itemRef != null)  && (itemRef.length > 0))
								{
									for (int ii=0; ii<itemRef.length; ii++)
									{
										if ((""+ item.getDocItemRef() + "@" + ob.getCheckListID()).equals(itemRef[ii]))
										{
	%>										checked
	<%									}
									}
								}
	%>
								/></td>
							</tr>
	<%					} //end if
                    } //end item for loop
              
                }
                 //end of for loop
	%>
					</tbody>
					</table>
				</td>
			</tr>
<%		} //end of for loop for unique security type/sub-type
%>
<%		if(!printFlag)
		{
%>
			<tr>
				<td colspan=6 class="odd">
					<B>There are no Security Documents for withdrawal.</B>
				</td>
			</tr>
<%		}
%>
  </tbody>
</table>

<br>

<table width="91%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
          <tr>
            <td class="fieldname">Requested by</td>
            <td class="odd"><span class="even">
              <input name="requestedBy" type="text" size="50" value="<%=form.getRequestedBy()%>"/>
            </span></td>
          </tr>
          <tr>
            <td class="fieldname">Released To </td>
            <td class="even"><input name="releasedTo" type="text" size="50" value="<%=form.getReleasedTo()%>"/></td>
          </tr>
          <tr class="odd">
            <td class="fieldname">Reason / Remarks</td>
            <td><textarea name="reason" rows="5" style="width:100%" value="<%=form.getReason()%>"></textarea></td>
          </tr>
        </tbody>
      </table>      
      <h4>&nbsp;</h4></td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td><hr /></td>
    </tr>
    <tr> 
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Authorised Personnel 1</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name&nbsp;<font color="#0000FF">* </font></td>
              <td>
                <input name="authzName1" type="text" size="30" value="<%=form.getAuthzName1()%>" />
                <html:errors property="authzName1Error" />
              </td>
              <td class="fieldname">Signing Number&nbsp;<font color="#0000FF">* </font></td>
              <td>
                <input name="signNum1" type="text" size="30" value="<%=form.getSignNum1()%>" />
                <html:errors property="signNum1Error" />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Authorised Personnel 2</td>
            </tr>
          </thead>
          <tbody>
            <tr class="even">
              <td class="fieldname">Name</td>
              <td>
                <input name="authzName2" type="text" size="30" value="<%=form.getAuthzName2()%>" /><html:errors property="authzName2Error" />
                    <html:errors property="printErrror" /></td>
              <td class="fieldname">Signing Number</td>
              <td><input name="signNum2" type="text" size="30" value="<%=form.getSignNum2()%>" /><html:errors property="signNum2Error" /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;<html:errors property="selectIdError" /></td>
    </tr>
  </tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/print2.gif',1)" ><img src="img/print1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>
<script language="JavaScript" type="text/JavaScript">
<!--
<%
    if(request.getAttribute("memoREQ")!=null){
%>
    MM_openBrWindow('custodian/memo.jsp?event=w&a1=<%=form.getAuthzName1()%>&a2=<%=form.getAuthzName2()%>&n1=<%=form.getSignNum1()%>&n2=<%=form.getSignNum2()%>&rb=<%=form.getRequestedBy()%>&rt=<%=form.getReleasedTo()%>&rea=<%=form.getReason()%>','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=400,left=5,top=5');
<%}%>
//-->
</script>
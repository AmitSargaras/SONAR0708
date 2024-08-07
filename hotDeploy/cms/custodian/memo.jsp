<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header:
     * @author $Author: jzhai $<br>
     * @version $Revision: 1.39 $
     * @since $Date: 2006/11/21 06:15:06 $
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
					com.integrosys.base.uiinfra.common.ICommonEventConstant,
					com.integrosys.cms.ui.common.constant.IGlobalConstant,
					com.integrosys.cms.ui.common.UIUtil,
					com.integrosys.cms.app.custodian.bus.IMemo,
					com.integrosys.component.commondata.app.CommonDataSingleton,
					com.integrosys.cms.app.common.constant.ICMSConstant,
					com.integrosys.cms.app.customer.bus.ICMSCustomer,
					com.integrosys.cms.app.checklist.bus.ICheckListItem,
					com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
					com.integrosys.cms.app.checklist.bus.ICheckListItem,
					com.integrosys.cms.app.customer.proxy.CustomerProxyFactory,
					com.integrosys.cms.app.customer.bus.ICMSLegalEntity,
					com.integrosys.cms.app.collateral.proxy.CollateralProxyFactory,
                    			com.integrosys.cms.app.custodian.bus.ICustodianDocItemSearchResult,
					com.integrosys.cms.app.collateral.bus.*,
					com.integrosys.base.techinfra.propertyfile.PropertyManager,
					com.integrosys.cms.app.checklist.bus.*"%>

<%
	SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.printDocList");
	//SearchResult sr = (SearchResult)request.getAttribute("docList");
	IMemo memo = (IMemo)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.memo");
	List doclist = Arrays.asList(memo.getCustodianDocList());
	String checkListStatus = "";
    int mCounter = 0;
    int nbCounter = 0;
    if(doclist!=null && doclist.size()>0){
		pageContext.setAttribute("docList",doclist);
	}

	ArrayList custodianDocList = null;
	if(sr!=null){
        custodianDocList = (ArrayList)sr.getResultList();
	}

	Vector mainBorrowerVect = new Vector();
	Vector coBorrowerVect = new Vector();
//	Vector coBorrowerVects = new Vector();
	Vector pledgorVect = new Vector();
//	Vector pledgorVects = new Vector();
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
			String customerCategory=custSearchResult.getSubCategory();
			if (category.equals("S"))
			{
				securitiesVect.add(custSearchResult);
				ICollateral collateral = CollateralProxyFactory.getProxy().getCollateral(custSearchResult.getCollateralID(), false);
				ArrayList   customerList=custSearchResult.getCustomerList();
				if (collateral!=null)
				{
					String securityID = collateral.getSCISecurityID();
					ICollateralType collateralType = collateral.getCollateralType();
					ICollateralSubType collateralSubType = collateral.getCollateralSubType();
					String secType = collateralType.getTypeName();
					secType = secType==null ? secType="" : secType;
					String secSubType = collateralSubType.getSubTypeName();
					secSubType = secSubType==null ? secSubType="" : secSubType;
					String combinedSecType = securityID + "," + secType + "," + secSubType; //concatenates type and sub-type to form unique string

					// form uniqueSecDetailVect
                    Vector uniqueSecDetailVect = new Vector(); //stores details of a security types and sub-types
                    uniqueSecDetailVect.add(securityID);
                    uniqueSecDetailVect.add(secType);
                    uniqueSecDetailVect.add(secSubType);
                    uniqueSecDetailVect.add(customerCategory);
                    uniqueSecDetailVect.add(customerList);
					

					if (!uniqueSecTypeVect.contains(uniqueSecDetailVect))
					{
						uniqueSecTypeVect.add(uniqueSecDetailVect);
						//System.out.println("unique securityID,secType,secSubType="+combinedSecType);
						//uniqueSecID.add(securityID);
					}
					//System.out.println("unique secType/secSubType="+combinedSecType);
				}

			}
			else if (subCategory!=null)
			{
	    		if(subCategory.equals("MAIN_BORROWER")){
                    mainBorrowerVect.add(custSearchResult);
                } else if (subCategory.equals("CO_BORROWER")){
	    			coBorrowerVect.add(custSearchResult);
	    			long coBorrowerID = custSearchResult.getSubProfileID();
	    			if (coBorrowerID!=0 && coBorrowerID!=ICMSConstant.LONG_INVALID_VALUE
	    				&& !uniqueCoBorrowerIDVect.contains(new Long(coBorrowerID)))
	    				uniqueCoBorrowerIDVect.add(new Long(coBorrowerID));
	    			//System.out.println("> memo.jsp: no. of unique co-borrowers="+uniqueCoBorrowerIDVect.size());
	    		} else if (subCategory.equals("PLEDGOR")){
	    			pledgorVect.add(custSearchResult);
	    			long pledgorID = custSearchResult.getPledgorID();
	    			if (pledgorID!=0 && pledgorID!=ICMSConstant.LONG_INVALID_VALUE
	    				&& !uniquePledgorIDVect.contains(new Long(pledgorID)))
	    				uniquePledgorIDVect.add(new Long(pledgorID));
	    			//System.out.println("> memo.jsp: no. of unique pledgors="+uniquePledgorIDVect.size());
	    		} else if (subCategory.equals("NON_BORROWER")) {
                   nonBorrowerVect.add(custSearchResult);
                }

			}
		}
	}


	int sno=0;
	boolean printFlag=false;
	String event = request.getParameter("event");
    String event1 = "";
    if(event.equals("w")){event1="Withdrawal";}
    else if(event.equals("r")){event1="Reversal";}
    else if(event.equals("l")){event1="Lodgement";}
    //DefaultLogger.debug("memo.jsp","Memo is "+memo+event);
	int index=0;
	ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title><bean:message key="label.system.title" /></title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
.header { font-family:verdana; font-size:18px; color: #017AA7; font-weight:bold;}
.docHeader { font-family:verdana; font-size: 17px; font-weight:bold; text-align:left;}
.fieldname { font-weight:bold;}
.rowHeader TD { font-weight:bold; text-align:center;}
.tblinfo {}
.resultTable {
	border-width: 1px;
	border-style: solid ;
	border-color: black;
	border-collapse: collapse;
}
.resultTable th {
	border-width: 1px;
	border-style: solid ;
	border-color: black;
}
.resultTable td {
	border-width: 1px;
	border-style: solid ;
	border-color: black;
}
</style>
<!-- InstanceEndEditable -->
</head>

<body style="width:100%;overflow:auto;" >
<!-- InstanceBeginEditable name="Content" -->
<table width="97%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp; </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="header" align="center">Memorandum - <%=event1%></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="25%"  class="fieldname">To<br /> </td>
              <td>Custodian </td>
            </tr>
            <tr class="even">
              <td class="fieldname">From<br /> </td>
              <td>CDT Maker/Checker</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Date</td>
              <td><integro:date object="<%=memo.getMemoDate()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Ref</td>
              <td><integro:empty-if-null value="<%=memo.getFAMCode()%>"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Subject</td>
              <%
                String sub = "";
                if(event.equals("w")){
                    sub="Withdrawal of Securing Documentation";
                }else{
                    sub="Lodgement of Securing Documentation";
                }
              %>
              <td><%=sub%></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
<%		boolean sectionPrinted = false;
%>
<%
    List sgmtCodeLbls = (List)CommonDataSingleton.getCodeCategoryLabels(ICMSConstant.BIZ_SGMT);   //get category code
    List sgmtCodeVals = (List)CommonDataSingleton.getCodeCategoryValues(ICMSConstant.BIZ_SGMT);
    String bizSgmt = "";
    for(int i=0; i<sgmtCodeLbls.size();i++){
        if(sgmtCodeVals.get(i).equals(memo.getCustomer().getCMSLegalEntity().getCustomerSegment())){
            bizSgmt=(String)sgmtCodeLbls.get(i);
        }
    }
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
                   	ICustodianDocSearchResult ob2 = (ICustodianDocSearchResult)mainBorrowerVect.get(i);
                   	checkListStatus = ob2.getCheckListStatus();
                }	
            }
			sectionPrinted = true;
			sno=0;
%>
            <tr>
                <td class="docHeader"> Constitutional &#47; Contractual Doc &nbsp;<hr/></td>
            </tr>
			<tr>
		      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		          <tbody>
		            <tr class="odd">
                        <td width="20%" class="fieldname">Customer Category </td>
                        <td width="30%" >Main Borrower</td>
                        <td width="20%" class="fieldname">CIF</td>
                        <td width="30%"><%=cust.getCMSLegalEntity().getLEReference()%></td>
		            </tr>
		            <tr class="even">
		              <td class="fieldname">Customer Name<br /> </td>
		              <td><integro:empty-if-null value="<%=cust.getCMSLegalEntity().getLegalName()%>"/></td>
		              <td class="fieldname">Business Segment</td>
    				  <td><integro:empty-if-null value="<%=bizSgmt%>"/></td>
		            </tr>
		          </tbody>
		        </table></td>
		    </tr>
		    <tr>
		      <td align="center">&nbsp;</td>
		    </tr>
		    <tr>
		      <td>
		      	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo resultTable" style="margin-top:0">
		          <thead>
		            <tr class="rowHeader">
		              <td>S/N</td>
			          <td>Doc Code<br>
                      <td>Doc No</td>
			          <td>Description</td>
			          <td>Doc Status</td>
			          <td>Cust Status</td>
			          <td>Date of Transaction</td>
			          <td>Doc Date</td>
			          <td>Expiry Date</td>
                            <% if(event1=="Reversal") { %>
                            <td>Security <br> Envelope <br> Address</td>
                            <td>Security <br> Envelope <br> Cabinet</td>
                            <td>Security <br> Envelope <br> drawer</td>
                            <td>Security <br> Envelope <br> No.</td>
                          <% } %>
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
								//System.out.println("> lodgement_list.jsp: checkListItem.getParentItemID()="+checkListItem.getParentItemID());
								//System.out.println("> lodgement_list.jsp: checkListItem.getItem().getItemID()="+checkListItem.getItem().getItemID());
							}
*/

		%>
							<tr class=<%=rowClass%>>
								<td class="index" rowspan="2" align="center"><%=sno%></td>
								<td><%=item.getDocNo()!=null?item.getDocNo():""%></td>
                                <td><%=item.getDocItemRef()%></td>
								<td><%=item.getDocDescription()!=null?item.getDocDescription():""%></td>
								<td style="text-align:center"><%=(item.getCPCDisplayStatus()==null || item.getCPCDisplayStatus().equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
								<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
								<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
								<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
								<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>

                            <% if(event1=="Reversal") { %>
                                <td><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false"/></td>
                                <td><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /></td>
                                <td><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /></td>
                                <td><%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():" "%></td>
                                                  <% } %>
                            </tr>                          
                           <tr class=<%=rowClass%>>
                                <td class="fieldname" style="padding-left:1px">
                                Remark
                              </td>
                              <td colspan="<%=event1=="Reversal"?11:7%>" style="padding-left:1px">
                                <% if (item.getDocItemNarration() == null){%>
                                  -
                                <%}else{%>
                                   <integro:htmltext value="<%=item.getDocItemNarration()%>" lineLength="95"/><%}%>&nbsp;
                              </td>
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
               	ICustodianDocSearchResult ob2 = (ICustodianDocSearchResult)coBorrowerVect.get(j);
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
                            <td width="20%" class="fieldname">Customer Category </td>
                            <td width="30%">Co-Borrower</td>
                            <td width="20%" class="fieldname">CIF</td>
                            <td width="30%"><%=legalID==null ? "-" : legalID%></td>
			            </tr>
			            <tr class="even">
			              <td class="fieldname">Customer Name<br /> </td>
			              <td><%=legalName==null ? "-" : legalName%></td>
			              <td class="fieldname">Business Segment</td>
						  <td><integro:empty-if-null value="<%=bizSgmt%>"/></td>
			            </tr>
			          </tbody>
			        </table></td>
			    </tr>
			    <tr>
			      <td align="center">&nbsp;</td>
			    </tr>
			    <tr>
			      <td>
			      	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo resultTable" style="margin-top:0">
			          <thead>
			            <tr class="rowHeader">
			              <td>S/N</td>
			              <td>Code </td>
                          <td>Doc No</td>
			              <td>Description</td>
			              <td>CPC Status</td>
			              <td>Cust Status</td>
			              <td>Date of CPC Transaction</td>
			              <td>Doc Date</td>
			              <td>Expiry Date</td>
                              <% if(event1=="Reversal") { %>
                            <td>Security Envelope Address</td>
                            <td>Security Envelope Cabinet</td>
                            <td>Security Envelope drawer</td>
                            <td>Security Envelope No.</td>
                          <% } %>
                        </tr>
			          </thead>
			          <tbody>

<%				    for (int i=0; i<coBorrowerVect.size(); i++)
                    {
                        ICustodianDocSearchResult ob = (ICustodianDocSearchResult)coBorrowerVect.get(i);
                        Long subProfileIDLong = (Long)uniqueCoBorrowerIDVect.get(j); //gets the subprofile ID to filter by
                        ICustodianDocItemSearchResult[] itemArr = ob.getCustodianDocItems();
                        for (int ind = 0; ind < itemArr.length; ind++)
                        {
                            ICustodianDocItemSearchResult item = itemArr[ind];

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
									//System.out.println("> lodgement_list.jsp: checkListItem.getParentItemID()="+checkListItem.getParentItemID());
									//System.out.println("> lodgement_list.jsp: checkListItem.getItem().getItemID()="+checkListItem.getItem().getItemID());
								}
*/

%>
								<tr class=<%=rowClass%>>
									<td class="index" rowspan="2" align="center"><%=sno%></td>
									<td><%=item.getDocNo()!=null?item.getDocNo():""%></td>
                                    <td><%=item.getDocItemRef()%></td>
									<td><%=item.getDocDescription()!=null?item.getDocDescription():""%></td>
									<td style="text-align:center"><%=(item.getCPCDisplayStatus()==null || item.getCPCDisplayStatus().equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
									<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
									<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
									<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
									<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>

                            <% if(event1=="Reversal") { %>
                                    <td><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false"/></td>
                                                            <td><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /></td>
                                                            <td><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /></td>
                                                            <td><%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():" "%></td>
                                                                                                                                                               <% } %>
										</tr>
                                  <tr class=<%=rowClass%>>
                                    <td class="fieldname" style="padding-left:1px">
                                    Remark
                                  </td>
                                  <td colspan="<%=event1=="Reversal"?11:7%>" style="padding-left:1px">
                                    <% if (item.getDocItemNarration() == null){%>
                                      -
                                    <%}else{%>
                                       <integro:htmltext value="<%=item.getDocItemNarration()%>" lineLength="95"/><%}%>&nbsp;
                                  </td>
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
               	ICustodianDocSearchResult ob2 = (ICustodianDocSearchResult)pledgorVect.get(j);
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
					legalID = Long.parseLong(pledgorOB.getLegalID());
					legalName = pledgorOB.getPledgorName();
					pledgorID = pledgorOB.getPledgorID();
					sciPledgorID = pledgorOB.getSysGenPledgorID();
				}
%>                             
				<tr>
			      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			          <tbody>
			            <tr class="odd">
                            <td width="20%" class="fieldname">Customer Category</td>
                            <td width="30%">Pledgor</td>
                            <td width="20%" class="fieldname">CIF</td>
                            <td width="30%"><%=(legalID==0 || legalID==ICMSConstant.LONG_INVALID_VALUE) ? "-" : String.valueOf(legalID)%></td>
			            </tr>
			            <tr class="even">
			              <td class="fieldname">Customer Name<br /> </td>
			              <td><%=legalName==null ? "-" : legalName%></td>
			              <td class="fieldname">Business Segment</td>
			              <td><integro:empty-if-null value="<%=bizSgmt%>"/></td>
			            <tr class="odd">
                          <td class="fieldname">Pledgor ID</td>
						  <td><%=(sciPledgorID==0 || sciPledgorID==ICMSConstant.LONG_INVALID_VALUE) ? "-" : String.valueOf(sciPledgorID)%></td>
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
			      	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo resultTable" style="margin-top:0">
			          <thead>
			            <tr class="rowHeader">
			              <td>S/N</td>
			              <td>Code</td>
                          <td>Doc No</td>
			              <td>Description</td>
			              <td>CPC Status</td>
			              <td>Cust Status</td>
			              <td>Date of CPC Transaction</td>
			              <td>Doc Date</td>
			              <td>Expiry Date</td>
                              <% if(event1=="Reversal") { %>
                            <td>Security Envelope Address</td>
                            <td>Security Envelope Cabinet</td>
                            <td>Security Envelope drawer</td>
                            <td>Security Envelope No.</td>
                          <% } %>
                        </tr>
			          </thead>
			          <tbody>

<%					for (int i=0; i<pledgorVect.size(); i++)
                    {
                        ICustodianDocSearchResult ob = (ICustodianDocSearchResult)pledgorVect.get(i);
                        ICustodianDocItemSearchResult[] itemArr = ob.getCustodianDocItems();
                        for (int ind = 0; ind < itemArr.length; ind++)
                        {
                            ICustodianDocItemSearchResult item = itemArr[ind];

							//if document type is C/C and current iteration's pledgorID is the same as the pledgorID to filter by
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
									//System.out.println("> lodgement_list.jsp: checkListItem.getParentItemID()="+checkListItem.getParentItemID());
									//System.out.println("> lodgement_list.jsp: checkListItem.getItem().getItemID()="+checkListItem.getItem().getItemID());
								}
*/

%>
								<tr class=<%=rowClass%>>
									<td class="index" rowspan="2" align="center"><%=sno%></td>
									<td><%=item.getDocNo()!=null?item.getDocNo():""%></td>
                                    <td><%=item.getDocItemRef()%></td>
									<td><%=item.getDocDescription()!=null?item.getDocDescription():""%></td>
									<td style="text-align:center"><%=(item.getCPCDisplayStatus()==null || item.getCPCDisplayStatus().equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
									<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
									<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
									<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
									<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>

                            <% if(event1=="Reversal") { %>
                                    <td><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false"/></td>
                                                            <td><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /></td>
                                                            <td><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /></td>
                                                            <td><%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():" "%></td>
                                                                                                                                                                       <% } %>
								</tr>
                                <tr class=<%=rowClass%>>
                                    <td class="fieldname" style="padding-left:1px">
                                    Remark
                                  </td>
                                  <td colspan="<%=event1=="Reversal"?11:7%>" style="padding-left:1px">
                                    <% if (item.getDocItemNarration() == null){%>
                                      -
                                    <%}else{%>
                                       <integro:htmltext value="<%=item.getDocItemNarration()%>" lineLength="95"/><%}%>&nbsp;
                                  </td>
                                </tr>
<%								index++;
							} // end if
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
                   	ICustodianDocSearchResult ob2 = (ICustodianDocSearchResult)nonBorrowerVect.get(i);
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
                        <td width="30%">Non-Borrower</td>
                        <td width="20%" class="fieldname">CIF</td>
                        <td width="30%"><%=cust.getCMSLegalEntity().getLEReference()%></td>
		            </tr>
		            <tr class="even">
		              <td class="fieldname">Customer Name<br /> </td>
		              <td><integro:empty-if-null value="<%=cust.getCMSLegalEntity().getLegalName()%>"/></td>
		              <td class="fieldname">Business Segment</td>
					  <td><integro:empty-if-null value="<%=bizSgmt%>"/></td>
		            </tr>
		          </tbody>
		        </table></td>
		    </tr>
		    <tr>
		      <td align="center">&nbsp;</td>
		    </tr>
		    <tr>
		      <td>
		      	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo resultTable" style="margin-top:0">
		          <thead>
		            <tr class="rowHeader">
		              <td>S/N</td>
		              <td>Code</td>
                      <td>Doc No</td>
		              <td>Description</td>
		              <td>CPC Status</td>
		              <td>Cust Status</td>
		              <td>Date of CPC Transaction</td>
		              <td>Doc Date</td>
		              <td>Expiry Date</td>
                          <% if(event1=="Reversal") { %>
                            <td>Security Envelope Address</td>
                            <td>Security Envelope Cabinet</td>
                            <td>Security Envelope drawer</td>
                            <td>Security Envelope No.</td>
                          <% } %>
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
								//System.out.println("> lodgement_list.jsp: checkListItem.getParentItemID()="+checkListItem.getParentItemID());
								//System.out.println("> lodgement_list.jsp: checkListItem.getItem().getItemID()="+checkListItem.getItem().getItemID());
							}
*/

		%>
							<tr class=<%=rowClass%>>
								<td class="index" rowspan="2" align="center"><%=sno%></td>
								<td><%=item.getDocNo()!=null?item.getDocNo():""%></td>
                                <td><%=item.getDocItemRef()%></td>
								<td><%=item.getDocDescription()!=null?item.getDocDescription():""%></td>
								<td style="text-align:center"><%=(item.getCPCDisplayStatus()==null || item.getCPCDisplayStatus().equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
								<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
								<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
								<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
								<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>

                            <% if(event1=="Reversal") { %>
                                <td><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false"/></td>
                                                        <td><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /></td>
                                                        <td><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /></td>
                                                        <td><%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():" "%></td>
                                                                                                                                                                               <% } %>
                            </tr>
                            <tr class=<%=rowClass%>>
                                <td class="fieldname" style="padding-left:1px">
                                Remark
                              </td>
                              <td colspan="<%=event1=="Reversal"?11:7%>" style="padding-left:1px">
                                <% if (item.getDocItemNarration() == null){%>
                                  -
                                <%}else{%>
                                   <integro:htmltext value="<%=item.getDocItemNarration()%>" lineLength="95"/><%}%>&nbsp;
                              </td>
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
<!-- start of Security block -->
<!--   </tbody>
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	<tbody> -->
<%		for (int j=0; j<uniqueSecTypeVect.size(); j++)
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
            String securityID = (String)secTypeDetail.get(0);
            String secType = (String)secTypeDetail.get(1);
            String secSubType = (String)secTypeDetail.get(2);
			String customerCategory=(String)secTypeDetail.get(3);
		    ArrayList coCustomerList=(ArrayList)secTypeDetail.get(4);

			
			securityID = securityID==null ? "" : securityID;
			secType = secType==null ? "" : secType;
			secSubType = secSubType==null ? "" : secSubType;
			if (sectionPrinted) //provide spacing if 1st row has been printed
			{
%>
				<tr>
					<td align="left">&nbsp;</td>
				</tr>
<%			}
           	ICustodianDocSearchResult ob2 = (ICustodianDocSearchResult)securitiesVect.get(j);
           	checkListStatus = ob2.getCheckListStatus();
			sectionPrinted = true;
			sno=0;
%>
<tr>
    <td class="docHeader">Security Doc&nbsp;<hr/></td>
</tr>
<tr>
<td>
<table  width="100%" border="0"  align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead> 
        <tr> 
          <td width="20%" class="fieldname">Customer Name</td>
          <td width="80%"><integro:empty-if-null value="<%=memo.getCustomer().getCustomerName()%>"/></td>
        </tr>
        </thead> 
        <%
		String backColor = "even";
        for(int k=0;k<coCustomerList.size();k++){
	      ISecurityCustomer aCustomer=(OBSecurityCustomer)coCustomerList.get(k);
		  backColor = backColor.equals("odd") ? "even" : "odd";
	    %>       
        <tr class="<%=backColor%>">
		<td><integro:empty-if-null value="<%=String.valueOf(aCustomer.getLeID())%>"/></td>
        <td><integro:empty-if-null value="<%=aCustomer.getLeName()%>"/></td>
        </tr>
        <%}%>
</table>
</td>				
</tr>
							
			<tr>
				<td align="center">&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">

					<tbody>
						<tr class="odd">
                            <td width="20%" class="fieldname">Customer Category</td>
                            <td width="30%"><%=customerCategory.equals("") ? "-" : customerCategory%></td>
                            <td width="20%"class="fieldname">Security ID</td>
                            <td width="30%"><%=(securityID==null || securityID.equals("")) ? "-" : securityID%></td>
						</tr>
						<tr class="even">
							<td class="fieldname">Security Type</td>
							<td><%=secType.equals("") ? "-" : secType%></td>
							<td class="fieldname">Business Segment</td>
							<td><integro:empty-if-null value="<%=bizSgmt%>"/></td>
						</tr>
						<tr class="odd">
						<td class="fieldname">Security Sub-Type</td>
						<td><%=secSubType.equals("") ? "-" : secSubType%></td>
						<td class="fieldname">&nbsp;</td>
						<td>&nbsp;</td>
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
					<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo resultTable" style="margin-top:0">
					<thead>
						<tr class="rowHeader">
                          <td>S/N</td>
			              <td>Doc Code<br>
                          <td>Doc No</td>
			              <td>Description</td>
			              <td>Doc Status</td>
			              <td>Cust Status</td>
			              <td>Date of Transaction</td>
			              <td>Doc Date</td>
			              <td>Expiry Date</td>  <% if(event1=="Reversal") { %>
                            <td>Security <br />Envelope<br />Address</td>
                            <td>Security <br />Envelope <br />Cabinet</td>
                            <td>Security <br />Envelope <br />drawer</td>
                            <td>Security <br />Envelope <br />No.</td>
                          <% } %>
                        </tr>
					</thead>
					<tbody>
    <%
                for (int i=0; i<securitiesVect.size(); i++)
                {
                    ICustodianDocSearchResult ob = (ICustodianDocSearchResult)securitiesVect.get(i);
                    long collateralID = ob.getCollateralID();
                    ICollateral collateral = CollateralProxyFactory.getProxy().getCollateral(ob.getCollateralID(), false);                   // ICollateral collateral = CollateralProxyFactory.getProxy().getCollateral(Long.valueOf("20070101000001").longValue(), false);     //test code
                    ICollateralType collateralType = collateral.getCollateralType();
                    ICollateralSubType collateralSubType = collateral.getCollateralSubType();
                    String currSecID = collateral.getSCISecurityID();
                    String currType = collateralType==null ? "" : collateralType.getTypeName()==null ? "" : collateralType.getTypeName();
                    String currSubType = collateralSubType==null ? "" : collateralSubType.getSubTypeName()==null ? "" : collateralSubType.getSubTypeName();
                    ICustodianDocItemSearchResult[] itemArr = null;
                    itemArr = ob.getCustodianDocItems();
                    for (int ind = 0; ind < itemArr.length; ind++)
                    {
                        ICustodianDocItemSearchResult item = itemArr[ind];
						//System.out.println("> lodgement_list.jsp: security docItemRef="+item.getDocItemRef()+", type="+collateralType.getTypeName()+", subType="+collateralSubType.getSubTypeName());
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
								<td rowspan="2" class="index" align="center"><%=sno%></td>
								<td ><%=item.getDocNo()!=null?item.getDocNo():""%></td>
                                <td><%=item.getDocItemRef()%></td>
								<td ><%=item.getDocDescription()!=null?item.getDocDescription():""%></td>
								<td style="text-align:center"><%=(item.getCPCDisplayStatus()==null || item.getCPCDisplayStatus().equals("")) ? "-" : item.getCPCDisplayStatus()%></td>
								<td style="text-align:center"><%=(custStatus==null || custStatus.equals("")) ? "-" : custStatus%></td>
								<td style="text-align:center"><%=cpcTrxDate==null ? "-" : DateUtil.formatDate("d MMM yyyy",cpcTrxDate)%></td>
								<td style="text-align:center"><%=item.getDocDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocDate())%></td>
								<td style="text-align:center"><%=item.getDocExpiryDate()==null ? "-" : DateUtil.formatDate("d MMM yyyy",item.getDocExpiryDate())%></td>

                            <% if(event1=="Reversal") { %>
                                <td><integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode='<%=item.getSecEnvAdd()!=null?item.getSecEnvAdd():" "%>' display="true" descWithCode="false"/></td>
                                <td><integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode='<%=item.getSecEnvCab()!=null?item.getSecEnvCab():" "%>' display="true" descWithCode="false" /></td>
                                <td><integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode='<%=item.getSecEnvDrw()!=null?item.getSecEnvDrw():" "%>' display="true" descWithCode="false" /></td>
                                <td><%=item.getSecEnvBarcode()!=null?item.getSecEnvBarcode():" "%></td>
                                 <% } %>
                            </tr>
                            <tr class=<%=rowClass%>>
                                <td class="fieldname" style="padding-left:1px">
                                Remark
                              </td>
                              <td colspan="<%=event1=="Reversal"?11:7%>" style="padding-left:1px">
                                <% if (item.getDocItemNarration() == null){%>
                                  -
                                <%}else{%>
                                   <integro:htmltext value="<%=item.getDocItemNarration()%>" lineLength="95"/><%}%>&nbsp;
                              </td>
                            </tr>
	<%					} //end if
                    } //end item for loop
                } //end of for loop
	%>
					</tbody>
					</table>
				</td>
			</tr>
<%		} //end of for loop for unique security type/sub-type
%>

    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>

    <tr>
      <td><hr /></td>
    </tr>
    <tr>
    <td>
     <table width="100%" border="0" align="left"  cellpadding="0" cellspacing="0" class="tblInfo resultTable">
        <tbody>
        <% if(!event.equals("l")) {%>
          <tr>
            <td  width="20%" class="fieldname">Requested by</td>
            <td class="odd">
                <% if (request.getParameter("rb") != null){ %>
                      <%=request.getParameter("rb")%>
                <% } %> &nbsp;
          </tr>
          <tr>
            <td class="fieldname">Released To </td>
            <td class="even">
                 <% if(request.getParameter("rt") != null){ %>
                    <%=request.getParameter("rt")%>
               <%  } %> &nbsp;
              </td>
          </tr>
        <%  } %>
          <tr class="odd">
            <td width="20%" class="fieldname">Reason / Remarks</td>
            <td style="width:100%; max-width:100%; display:block;">
                <% if(request.getParameter("rea") != null){ %>
                <%=request.getParameter("rea")%>
               <% } %> &nbsp;
            </td>
          </tr>
        </tbody>
      </table>
    </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput resultTable">
            <tr>
              <td colspan="4" style="text-align:left" class="fieldname">Authorised Personnel 1</td>
            </tr>
            <tr class="odd">
              <td width="20%" class="fieldname">Name</td>
              <td width="30%" ><%=request.getParameter("a1")%>&nbsp;</td>
              <td width="20%" class="fieldname">Signing Number</td>
              <td width="30%" ><%=request.getParameter("n1")%>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" style="text-align:left" class="fieldname">Authorised Personnel 2</td>
            </tr>
            <tr class="even">
              <td width="20%" class="fieldname">Name</td>
              <td width="30%" ><%=request.getParameter("a2")%>&nbsp;</td>
              <td width="20%" class="fieldname">Signing Number</td>
              <td width="30%" ><%=request.getParameter("n2")%>&nbsp;</td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
                <td colspan="4" class="fieldname">
                I / We hereby acknowledge receipt of the above mentioned document(s),
                </td>
            </tr>
            <tr>
            <td width=30% class="fieldname">
                <br/>
                Name:
                <br/>
                <br/>
                Signature:
                <br/>
                <br/>
                Date:
             </td>
             <td width="20%">&nbsp;
             </td>
             <td width="30%" class="fieldname">
                <br/>
                Name:
                <br/>
                <br/>
                Signature:
                <br/>
                <br/>
                Date:
             </td>
             <td width="20%">&nbsp;
             </td>
            </tr>
           </table>
       </td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>

    <tr>
      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
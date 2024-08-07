<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.IDocumentItem,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 com.integrosys.cms.ui.ccglobal.CCGlobalForm,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.ui.systemparameters.autoval.AutoValuationParameterForm,
                 java.util.Arrays,
                 com.integrosys.cms.app.propertyparameters.trx.IPrPaTrxValue,
                 com.integrosys.cms.app.propertyparameters.trx.OBPrPaTrxValue,
                 com.integrosys.cms.app.propertyparameters.bus.OBPropertyParameters,
                 com.integrosys.cms.ui.common.CountryList"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:$
*
* Describe this JSP.
* Purpose: For Checker to view Auto Valuation Parameters
* Description: view the details of Auto Valuation Parameters
*
* @author $Author:$<br>
* @version $Revision:$
* Date: $Date:$
* Tag: $Name:$
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    IPrPaTrxValue trxVal = (OBPrPaTrxValue)session.getAttribute("com.integrosys.cms.ui.systemparameters.autoval.AutoValuationParameterAction.IPrPaTrxValue");

    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    OBPropertyParameters stageOb = (OBPropertyParameters)trxVal.getStagingPrPa();
    OBPropertyParameters ob = (OBPropertyParameters)trxVal.getPrPa();

    String event = request.getParameter("event");
    DefaultLogger.debug("checker_auto_valuation_params_view.jsp","event from getParameter is > "+event);

    DefaultLogger.debug("checker_auto_valuation_params_view.jsp","Common Data ......... > ");
    List collateralSubTypeFullList = (List)request.getAttribute("collateralSubTypeFullList");
    List collateralSubTypeFullListLabel = (List)request.getAttribute("collateralSubTypeFullListLabel");
    List stateFullList = (List)request.getAttribute("stateFullList");
    List stateFullListLabel = (List)request.getAttribute("stateFullListLabel");
    List districtFullList = (List)request.getAttribute("districtFullList");
    List districtFullListLabel = (List)request.getAttribute("districtFullListLabel");
    List mukimFullList = (List)request.getAttribute("mukimFullList");
    List mukimFullListLabel = (List)request.getAttribute("mukimFullListLabel");

    List countryListValue = (List)request.getAttribute("countryListValue");
    List countryListLabel = (List)request.getAttribute("countryListLabel");
    List omvMeasureValue = (List)request.getAttribute("omvMeasureValue");
    List omvMeasureLabel = (List)request.getAttribute("omvMeasureLabel");
    List omvIndicatorValue = (List)request.getAttribute("omvIndicatorValue");
    List omvIndicatorLabel = (List)request.getAttribute("omvIndicatorLabel");

    String approveEvent=null;
    String rejectEvent=null;
    String headingLable="Process ";

    if(event.equals("checker_process_create")||event.equals("checker_confirm_approve_create")){
        approveEvent="checker_confirm_approve_create";
        rejectEvent="checker_confirm_reject_create";
//        headingLable="Process - Create ";
    }else if(event.equals("checker_process_edit")||event.equals("checker_confirm_approve_edit")){
        approveEvent="checker_confirm_approve_edit";
        rejectEvent="checker_confirm_reject_edit";
//        headingLable="Process - Edit ";
    }else if(event.equals("checker_process_delete")){
        approveEvent="checker_confirm_approve_delete";
        rejectEvent="checker_confirm_reject_edit";
//        headingLable="Process - Delete ";
    }

    CountryList countryList = CountryList.getInstance();
    AutoValuationParameterForm autoValParamForm = (AutoValuationParameterForm)request.getAttribute("AutoValuationParameterForm");
    DefaultLogger.debug("checker_auto_valuation_params_view.jsp","autoValParamForm : "+autoValParamForm.getSelectedDistrict().length);
    String[] selectedColSubTypeVals = autoValParamForm.getSelectedSecuritySubType();
    String[] selectedStateVals = autoValParamForm.getSelectedState();
    String[] selectedDistrictVals = autoValParamForm.getSelectedDistrict();
    String[] selectedMukimVals = autoValParamForm.getSelectedMukim();

    boolean landAreaFromUnitMatched = false;
    boolean landAreaToUnitMatched = false;
    boolean builtUpAreaFromUnitMatched = false;
    boolean builtUpAreaToUnitMatched = false;
    boolean omvIndicatorMatched = false;
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->


<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<style>
.fixedSelectLength {
    width: 276px;
    COLOR: #000000;
}

.btnHighlight {
	border : 1px solid Purple;
	background-color : #FAF0E6;
	text-align : center;
    width : 85px;
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
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

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value='<%=approveEvent%>';
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value='<%=rejectEvent%>';
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="AutoValParam.do">
<input type="hidden" name="event" />
<!-- InstanceBeginEditable name="Content" -->
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=headingLable%><bean:message key="title.auto.valuation.property.parameters"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>

  <tbody>

    <tr>
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
            <tr class="odd">
              <td width="20%" class="<%=CompareOBUtil.compOB(stageOb,ob,"propertyType")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.collateral.type"/>
              </td>
              <td colspan="3"><integro:empty-if-null value="<%=autoValParamForm.getSecurityType()%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"collateralSubType")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.collateral.subtype"/>
              </td>
              <td width="38%" height="171">
<%--                &nbsp; <br/>--%>
                <html:select name="AutoValuationParameterForm" property="unselectedSecuritySubType" size="10" disabled="true" multiple="true" styleClass="fixedSelectLength">
                    <% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
                         if(selectedColSubTypeVals==null || !Arrays.asList(selectedColSubTypeVals).contains(collateralSubTypeFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option ><%=collateralSubTypeFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                </html:select>
              </td>
              <td width="2%">
                <br/><br/><br/><br/>
                <input name="AddSubType" type="button" class="btnHighlight" value="<bean:message key="label.autovalparam.button.add"/>&gt;&gt;"
                    disabled="true"  onclick="addOption(this.form.unselectedSecuritySubType, this.form.selectedSecuritySubType, '')"/>
                <br/>
                <input name="RemoveSubType" type="button" class="btnHighlight" value="&lt;&lt;<bean:message key="label.autovalparam.button.remove"/>"
                    disabled="true" onclick="addOption(this.form.selectedSecuritySubType, this.form.unselectedSecuritySubType, '')"/>
                <br/><br/><br/><br/><br />
              </td>
              <td width="38%">
<%--                Selected Fields <br/>--%>
                <html:select name="AutoValuationParameterForm" property="selectedSecuritySubType" size="10" disabled="true" multiple="true" styleClass="fixedSelectLength">
                    <% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
                         if(selectedColSubTypeVals!=null && Arrays.asList(selectedColSubTypeVals).contains(collateralSubTypeFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option ><%=collateralSubTypeFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                </html:select>
              </td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"countryCode")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.country"/>
              </td>
              <td colspan="3" class="tblInput">
                <integro:empty-if-null value="<%=countryList.getCountryName(autoValParamForm.getCountry())%>"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"stateCode")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.state"/>
              </td>
              <td height="171">
<%--                  &nbsp; <br/>--%>
                  <html:select property="unselectedState" size="7" disabled="true" multiple="true" styleClass="fixedSelectLength">
                    <% for(int i=0; i<stateFullListLabel.size(); i++){
                         if(selectedStateVals==null || !Arrays.asList(selectedStateVals).contains(stateFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option ><%=stateFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
              <td>
                  <br/><br/><br/><br/>
                  <input name="AddState" type="button" class="btnHighlight" value="<bean:message key="label.autovalparam.button.add"/>&gt;&gt;"
                        disabled="true" onclick="addOption(this.form.unselectedState, this.form.selectedState, 'search_district')"/>
                  <br/>
                  <input name="RemoveState" type="button" class="btnHighlight" value="&lt;&lt;<bean:message key="label.autovalparam.button.remove"/>"
                        disabled="true" onclick="addOption(this.form.selectedState, this.form.unselectedState, 'search_district')"/>
                  <br/><br/><br/><br/><br/>
              </td>
              <td>
<%--                  Selected Fields <br/>--%>
                  <html:select name="AutoValuationParameterForm" property="selectedState" size="7" disabled="true" multiple="true" styleClass="fixedSelectLength">
                    <% for(int i=0; i<stateFullListLabel.size(); i++){
                         if(selectedStateVals!=null && Arrays.asList(selectedStateVals).contains(stateFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option ><%=stateFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"districtCode")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.district"/>
              </td>
              <td height="171">
<%--                  &nbsp; <br/>--%>
                  <html:select property="unselectedDistrict" size="7" multiple="true" disabled="true" styleClass="fixedSelectLength">
                    <% for(int i=0; i<districtFullListLabel.size(); i++){
                         if(selectedDistrictVals==null || !Arrays.asList(selectedDistrictVals).contains(districtFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option ><%=districtFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
              <td>
                  <br/><br/><br/><br/>
                  <input name="AddDistrict" type="button" class="btnHighlight" value="<bean:message key="label.autovalparam.button.add"/>&gt;&gt;"
                        disabled="true" onclick="addOption(this.form.unselectedDistrict, this.form.selectedDistrict, '')"/>
                  <br/>
                  <input name="RemoveDistrict" type="button" class="btnHighlight" value="&lt;&lt;<bean:message key="label.autovalparam.button.remove"/>"
                        disabled="true" onclick="addOption(this.form.selectedDistrict, this.form.unselectedDistrict, '')"/>
                  <br/><br/><br/><br/><br/>
              </td>
              <td>
<%--                  Selected Fields <br/>--%>
                  <html:select name="AutoValuationParameterForm" property="selectedDistrict" size="7" multiple="true" disabled="true" styleClass="fixedSelectLength">
                    <% for(int i=0; i<districtFullListLabel.size(); i++){
                         if(selectedDistrictVals!=null && Arrays.asList(selectedDistrictVals).contains(districtFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option ><%=districtFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"mukimCode")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.mukim"/>
              </td>
              <td height="171">
<%--                  &nbsp; <br/>--%>
                  <html:select property="unselectedMukim" size="7" multiple="true" disabled="true" styleClass="fixedSelectLength">
                    <% for(int i=0; i<mukimFullListLabel.size(); i++){
                         if(selectedMukimVals==null || !Arrays.asList(selectedMukimVals).contains(mukimFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option ><%=mukimFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
              <td>
                  <br/><br/><br/><br/>
                  <input name="AddMukim" type="button" class="btnHighlight" value="<bean:message key="label.autovalparam.button.add"/>&gt;&gt;"
                        disabled="true" onclick="addOption(this.form.unselectedMukim, this.form.selectedMukim, '')"/>
                  <br/>
                  <input name="RemoveMukim" type="button" class="btnHighlight" value="&lt;&lt;<bean:message key="label.autovalparam.button.remove"/>"
                        disabled="true" onclick="addOption(this.form.selectedMukim, this.form.unselectedMukim, '')"/>
                  <br/><br/><br/><br/><br/>
              </td>
              <td>
<%--                  Selected Fields <br/>--%>
                  <html:select name="AutoValuationParameterForm" property="selectedMukim" size="7" multiple="true" disabled="true" styleClass="fixedSelectLength">
                    <% for(int i=0; i<mukimFullListLabel.size(); i++){
                         if(selectedMukimVals!=null && Arrays.asList(selectedMukimVals).contains(mukimFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option ><%=mukimFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>

            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"postcode")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.postcode"/>
              </td>
              <td colspan="3" class="tblInput" colspan="8">
                <integro:empty-if-null value="<%=autoValParamForm.getPostCode()%>"/>&nbsp;
              </td>
            </tr>

            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"landAreaValueFrom") && CompareOBUtil.compOB(stageOb,ob,"landAreaUnitFrom")
                && CompareOBUtil.compOB(stageOb,ob,"landAreaValueTo") && CompareOBUtil.compOB(stageOb,ob,"landAreaUnitTo")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.land.area"/>
              </td>
              <td colspan="3">
                <%
                  if (autoValParamForm.getFromLandArea() == null || ("").equals(autoValParamForm.getFromLandArea())) {
                %>
                    <integro:empty-if-null value="<%=null%>"/>&nbsp;
                <% } else { %>
                    <b><bean:message key="label.autovalparam.from"/></b>&nbsp;&nbsp;&nbsp;
                    <integro:empty-if-null value="<%=autoValParamForm.getFromLandArea()%>"/>&nbsp;&nbsp;
    <%--                <bean:write name="AutoValuationParameterForm" scope="request" property="fromLandAreaMeasure" />--%>
                    <% for(int i=0; i<omvMeasureLabel.size(); i++){
                        if(autoValParamForm.getFromLandAreaMeasure()!=null
                                && (omvMeasureValue.get(i)).equals(autoValParamForm.getFromLandAreaMeasure())) {
                            landAreaFromUnitMatched = true;
                        %>
                            <%=omvMeasureLabel.get(i)%>
                        <%
                            break;
                        }
                      }
                    %>

                    <% if (!landAreaFromUnitMatched) { %>
                        <integro:empty-if-null value="<%=null%>"/>
                    <% } %>
                    &nbsp;&nbsp;&nbsp;<b><bean:message key="label.autovalparam.to"/></b>&nbsp;&nbsp;&nbsp;
                    <integro:empty-if-null value="<%=autoValParamForm.getToLandArea()%>"/>&nbsp;&nbsp;
    <%--                <bean:write name="AutoValuationParameterForm" scope="request" property="toLandAreaMeasure" />--%>
                    <% for(int i=0; i<omvMeasureLabel.size(); i++){
                        if(autoValParamForm.getToLandAreaMeasure()!=null
                                && (omvMeasureValue.get(i)).equals(autoValParamForm.getToLandAreaMeasure())) {
                            landAreaToUnitMatched = true;
                        %>
                            <%=omvMeasureLabel.get(i)%>
                        <%
                            break;
                        }
                      }
                    %>

                    <% if (!landAreaToUnitMatched) { %>
                        <integro:empty-if-null value="<%=null%>"/>
                    <% } %>
                <% } %>
              </td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"buildupAreaValueFrom") && CompareOBUtil.compOB(stageOb,ob,"buildupAreaUnitFrom")
                && CompareOBUtil.compOB(stageOb,ob,"buildupAreaValueTo") && CompareOBUtil.compOB(stageOb,ob,"buildupAreaUnitTo")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.built.up.area"/>
              </td>
              <td colspan="3">
                <%
                  if (autoValParamForm.getFromBuiltUpArea() == null || ("").equals(autoValParamForm.getFromBuiltUpArea())) {
                %>
                    <integro:empty-if-null value="<%=null%>"/>&nbsp;
                <% } else { %>
                    <b><bean:message key="label.autovalparam.from"/></b>&nbsp;&nbsp;&nbsp;
                    <integro:empty-if-null value="<%=autoValParamForm.getFromBuiltUpArea()%>"/>&nbsp;&nbsp;
    <%--                <bean:write name="AutoValuationParameterForm" scope="request" property="fromBuiltUpAreaMeasure" />--%>
                    <% for(int i=0; i<omvMeasureLabel.size(); i++){
                        if(autoValParamForm.getFromBuiltUpAreaMeasure()!=null
                                && (omvMeasureValue.get(i)).equals(autoValParamForm.getFromBuiltUpAreaMeasure())) {
                            builtUpAreaFromUnitMatched = true;
                        %>
                            <%=omvMeasureLabel.get(i)%>
                        <%
                            break;
                        }
                      }
                    %>

                    <% if (!builtUpAreaFromUnitMatched) { %>
                        <integro:empty-if-null value="<%=null%>"/>
                    <% } %>
                    &nbsp;&nbsp;&nbsp;<b><bean:message key="label.autovalparam.to"/></b>&nbsp;&nbsp;&nbsp;
                    <integro:empty-if-null value="<%=autoValParamForm.getToBuiltUpArea()%>"/>&nbsp;&nbsp;
    <%--                <bean:write name="AutoValuationParameterForm" scope="request" property="toBuiltUpAreaMeasure" />--%>
                    <% for(int i=0; i<omvMeasureLabel.size(); i++){
                        if(autoValParamForm.getToBuiltUpAreaMeasure()!=null
                                && (omvMeasureValue.get(i)).equals(autoValParamForm.getToBuiltUpAreaMeasure())) {
                            builtUpAreaToUnitMatched = true;
                        %>
                            <%=omvMeasureLabel.get(i)%>
                        <%
                            break;
                        }
                      }
                    %>

                    <% if (!builtUpAreaToUnitMatched) { %>
                        <integro:empty-if-null value="<%=null%>"/>
                    <% } %>
                <% } %>
              </td>
            </tr>

            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"minimumCurrentOmv")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.minimum.current.omv"/>
              </td>
              <td colspan="3" colspan="8">
                <integro:empty-if-null value="<%=autoValParamForm.getMinCurrentOMV()%>"/>&nbsp;
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td colspan="2" align="center">&nbsp;</td>
    </tr>
</table>
<table width="80%" align="center" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><h3><bean:message key="label.autovalparam.variation"/></h3></td>
      <td width="9%"><label>
        <div align="right"></div>
      </label></td>
    </tr>
    <tr>
      <td colspan="2">
        <hr></td>
    </tr>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
            <tr class="even">
              <td width="20%" class="<%=CompareOBUtil.compOB(stageOb,ob,"omvType") && CompareOBUtil.compOB(stageOb,ob,"VariationOMV")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.omv"/>
              </td>
              <td>
                <%
                  if (autoValParamForm.getOmvValue() == null || ("").equals(autoValParamForm.getOmvValue())) {
                %>
                    <integro:empty-if-null value="<%=null%>"/>&nbsp;
                <% } else { %>
<%--                <bean:write name="AutoValuationParameterForm" scope="request" property="omvIndicator" />--%>
                    <% for(int i=0; i<omvIndicatorLabel.size(); i++){
                        if(autoValParamForm.getOmvIndicator()!=null
                                && (omvIndicatorValue.get(i)).equals(autoValParamForm.getOmvIndicator())) {
                            omvIndicatorMatched = true;
                        %>
                            <%=omvIndicatorLabel.get(i)%>
                        <%
                            break;
                        }
                      }
                    %>

                    <% if (!omvIndicatorMatched) { %>
                        <integro:empty-if-null value="<%=null%>"/>
                    <% } %>
                    &nbsp;&nbsp;
                    <integro:empty-if-null value="<%=autoValParamForm.getOmvValue()%>"/>
                    %
                <% } %>
              </td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"valuationDescription")? "fieldname":"fieldnamediff"%>">
                <bean:message key="label.autovalparam.valuation.description"/>
              </td>
              <td>
                <integro:empty-if-null value="<%=autoValParamForm.getValuationDescription()%>"/>&nbsp;
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
  </tbody>
</table>
<p/>
<p/>
<p/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
    <tr>
      <td class="fieldname"><bean:message key="label.remarks"/></td>
      <td class="odd"><textarea name="remarks" rows="4" cols="80"></textarea></td>
    </tr>
    <tr>
      <td class="fieldname"><bean:message key="label.last.action.by"/></td>
      <td class="even">&nbsp;<%=lastActionBy%></td>
    </tr>
    <tr class="odd">
      <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
      <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
    </tr>
  </tbody>
</table>

<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>

<!-- InstanceEnd --></html>

<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 com.integrosys.cms.ui.ccglobal.CCGlobalForm,
                 com.integrosys.cms.ui.systemparameters.autoval.AutoValuationParameterForm,
                 java.util.Arrays,
                 com.integrosys.cms.app.propertyparameters.trx.IPrPaTrxValue,
                 com.integrosys.cms.app.propertyparameters.trx.OBPrPaTrxValue"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Describe this JSP.
* Purpose: For Maker to resubmit rejected Auto Valuation Parameters
* Description: resubmit the rejected Auto Valuation Parameters
*
* @author $Author$<br>
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    IPrPaTrxValue trxVal = (OBPrPaTrxValue)session.getAttribute("com.integrosys.cms.ui.systemparameters.autoval.AutoValuationParameterAction.IPrPaTrxValue");

    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    boolean isDisabled = false;
    String fromState = trxVal.getFromState();

    DefaultLogger.debug(this, "from State ======= " + fromState);
    if ((ICMSConstant.STATE_PENDING_DELETE).equals(fromState))
    {
        isDisabled = true;
    }
    DefaultLogger.debug(this, "field disabled ======= " + isDisabled);

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

    String submitEvent=null;
//    String rejectEvent=null;
    String changeListEvent=null;
    String headingLabel="Process ";
    boolean isRemarksNedded = true;

    if(event.equals("maker_prepare_resubmit_create")||event.equals("maker_resubmit_change_list_create")
        ||event.equals("maker_confirm_resubmit_create")){
        submitEvent="maker_confirm_resubmit_create";
//        rejectEvent="checker_confirm_reject_create";
        changeListEvent="maker_resubmit_change_list_create";
//        headingLabel="Re Process - Create ";
    }else if(event.equals("maker_prepare_resubmit_edit")||event.equals("maker_resubmit_change_list_edit")
        ||event.equals("maker_confirm_resubmit_edit")){
        if ((ICMSConstant.STATE_PENDING_DELETE).equals(fromState))
        {
            submitEvent="maker_confirm_resubmit_delete";
        } else {
            submitEvent="maker_confirm_resubmit_edit";
        }
//        rejectEvent="checker_confirm_reject_edit";
        changeListEvent="maker_resubmit_change_list_edit";
//        headingLabel="Re Process - Edit ";
    }

    AutoValuationParameterForm autoValParamForm = (AutoValuationParameterForm)request.getAttribute("AutoValuationParameterForm");
    DefaultLogger.debug("jsp_page","autoValParamForm : "+autoValParamForm.getSelectedDistrict().length);
    String[] selectedColSubTypeVals = autoValParamForm.getSelectedSecuritySubType();
    String[] selectedStateVals = autoValParamForm.getSelectedState();
    String[] selectedDistrictVals = autoValParamForm.getSelectedDistrict();
    String[] selectedMukimVals = autoValParamForm.getSelectedMukim();

    String paramTrxId = (String)request.getParameter("paramTrxId");
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>


<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}

.fixedSelectLength {
    width: 276px;
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

function submitPage () {
    selectAll(document.forms[0]);
    document.forms[0].event.value='<%=submitEvent%>';
	document.forms[0].submit();
}

function addOption(original,selection,searchItem)
{
    var i=0,j=0,or_length=original.length,index=0;
    var newitem=true;
    var newItemCount = 0;

    for (i=0;i<or_length;i++)
    {
        if (original.options[i].selected)
        {
            for (j=0;j<selection.length;j++)
            {
                if (original.options[i].value==selection.options[j].value)
                {
                    newitem=false;
                    break;
                }
            }

            if (newitem)
            {
                var op = new Option(original.options[i].text, original.options[i].value);
                if(selection.length == 1 && selection.options[0].value == "")
                {
                    selection.options[0] = op;
                }
                else
                    selection.options[selection.length] = op;

                newItemCount ++ ;
            }
        }
    }
	delOption(original);

    if (searchItem != ""  && newItemCount > 0)
    {
        document.forms[0].searchItem.value=searchItem;
        document.forms[0].event.value="<%=changeListEvent%>";
        selectAll(document.forms[0]);

        document.forms[0].submit();
    }
}

function delOption(selection)
{
    var length=selection.length, i=0, index=0;
    for(i=(length-1);i>=0;i--)
    {
        if (selection.options[i].selected)
        {
            selection.options[i].selected=false;
            selection.options[i]=null;
        }
    }
}

function selectAll(form)
{
    for(var i=0;i<form.unselectedSecuritySubType.length;i++)
    {
        form.unselectedSecuritySubType[i].selected= true;
    }

    for(var i=0;i<form.selectedSecuritySubType.length;i++)
    {
        form.selectedSecuritySubType[i].selected= true;
    }

    for(var i=0;i<form.unselectedState.length;i++)
    {
        form.unselectedState[i].selected= true;
    }

    for(var i=0;i<form.selectedState.length;i++)
    {
        form.selectedState[i].selected= true;
    }

    for(var i=0;i<form.unselectedDistrict.length;i++)
    {
        form.unselectedDistrict[i].selected= true;
    }

    for(var i=0;i<form.selectedDistrict.length;i++)
    {
        form.selectedDistrict[i].selected= true;
    }

    for(var i=0;i<form.unselectedMukim.length;i++)
    {
        form.unselectedMukim[i].selected= true;
    }

    for(var i=0;i<form.selectedMukim.length;i++)
    {
        form.selectedMukim[i].selected= true;
    }
}

function changeCountry()
{
    document.forms[0].searchItem.value="search_state";
    document.forms[0].event.value="<%=changeListEvent%>";

    selectAll(document.forms[0]);
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="AutoValParam.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="searchItem" value="" />
<input type="hidden" name="paramTrxId" value="<%=paramTrxId%>"/>
<html:hidden name="AutoValuationParameterForm" property="securityType"/>

<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=headingLabel%><bean:message key="title.auto.valuation.property.parameters"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>

    <tr>
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname"><bean:message key="label.autovalparam.collateral.type"/></td>
              <td colspan="3">Property</td>
            </tr>
            <tr class="even">
              <td class="fieldname">
                <bean:message key="label.autovalparam.collateral.subtype"/>&nbsp;<font color="#0000FF">*</font>
              </td>
              <td width="38%" height="171">
                <html:select name="AutoValuationParameterForm" property="unselectedSecuritySubType" size="10" multiple="true" disabled="<%=isDisabled%>" styleClass="fixedSelectLength">
                    <% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
                         if(selectedColSubTypeVals==null || !Arrays.asList(selectedColSubTypeVals).contains(collateralSubTypeFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=collateralSubTypeFullList.get(i)%>'><%=collateralSubTypeFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                </html:select>
                <br><html:errors property="securitySubTypeError"/>
              </td>
              <td>
                <br/><br/><br/><br/>
                <html:button property="AddSubType" styleClass="btnHighlight" value="Add&gt;&gt;"
                    disabled="<%=isDisabled%>" onclick="addOption(this.form.unselectedSecuritySubType, this.form.selectedSecuritySubType, '')"/>
                <br/>
                <html:button property="RemoveSubType" styleClass="btnHighlight" value="&lt;&lt;Remove"
                    disabled="<%=isDisabled%>" onclick="addOption(this.form.selectedSecuritySubType, this.form.unselectedSecuritySubType, '')"/>
                <br/><br/><br/><br/><br />
              </td>
              <td width="38%">
                <html:select name="AutoValuationParameterForm" property="selectedSecuritySubType"  size="10" multiple="true" disabled="<%=isDisabled%>" styleClass="fixedSelectLength">
                    <% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
                         if(selectedColSubTypeVals!=null && Arrays.asList(selectedColSubTypeVals).contains(collateralSubTypeFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=collateralSubTypeFullList.get(i)%>'><%=collateralSubTypeFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                </html:select>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.autovalparam.country"/>&nbsp;<font color="#0000FF">*</font></td>
              <td colspan="3" class="tblInput">
                <html:select name="AutoValuationParameterForm" property="country" disabled="<%=isDisabled%>" onchange="changeCountry()" >
                  <option value=""><bean:message key="label.please.select"/></option>
                  <html:options name="countryListValue" labelName="countryListLabel" />
                </html:select>
                <html:errors property="countryError"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.autovalparam.state"/>&nbsp;<font color="#0000FF">*</font></td>
              <td>
                  <html:select property="unselectedState" size="7" multiple="true" disabled="<%=isDisabled%>" styleClass="fixedSelectLength">
                    <% for(int i=0; i<stateFullListLabel.size(); i++){
                         if(selectedStateVals==null || !Arrays.asList(selectedStateVals).contains(stateFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=stateFullList.get(i)%>'><%=stateFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
                  <br><html:errors property="stateError"/>
              </td>
              <td>
                  <br/><br/><br/><br/>
                  <html:button property="AddState" styleClass="btnHighlight" value="Add&gt;&gt;"
                        disabled="<%=isDisabled%>" onclick="addOption(this.form.unselectedState, this.form.selectedState, 'search_district')"/>
                  <br/>
                  <html:button property="RemoveState" styleClass="btnHighlight" value="&lt;&lt;Remove"
                        disabled="<%=isDisabled%>" onclick="addOption(this.form.selectedState, this.form.unselectedState, 'search_district')"/>
                  <br/><br/><br/><br/><br/>
              </td>
              <td>
                  <html:select property="selectedState" size="7" multiple="true" disabled="<%=isDisabled%>" styleClass="fixedSelectLength">
                    <% for(int i=0; i<stateFullListLabel.size(); i++){
                         if(selectedStateVals!=null && Arrays.asList(selectedStateVals).contains(stateFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=stateFullList.get(i)%>'><%=stateFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.autovalparam.district"/>&nbsp;<font color="#0000FF">*</font> </td>
              <td>
                  <html:select property="unselectedDistrict" size="7" multiple="true" disabled="<%=isDisabled%>" styleClass="fixedSelectLength">
                    <% for(int i=0; i<districtFullListLabel.size(); i++){
                         if(selectedDistrictVals==null || !Arrays.asList(selectedDistrictVals).contains(districtFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=districtFullList.get(i)%>'><%=districtFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
                  <br><html:errors property="districtError"/>
              </td>
              <td>
                  <br/><br/><br/><br/>
                  <html:button property="AddDistrict" styleClass="btnHighlight" value="Add&gt;&gt;"
                        disabled="<%=isDisabled%>" onclick="addOption(this.form.unselectedDistrict, this.form.selectedDistrict, '')"/>
                  <br/>
                  <html:button property="RemoveDistrict" styleClass="btnHighlight" value="&lt;&lt;Remove"
                        disabled="<%=isDisabled%>" onclick="addOption(this.form.selectedDistrict, this.form.unselectedDistrict, '')"/>
                  <br/><br/><br/><br/><br/>
              </td>
              <td>
                  <html:select property="selectedDistrict" size="7" multiple="true" disabled="<%=isDisabled%>" styleClass="fixedSelectLength">
                    <% for(int i=0; i<districtFullListLabel.size(); i++){
                         if(selectedDistrictVals!=null && Arrays.asList(selectedDistrictVals).contains(districtFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=districtFullList.get(i)%>'><%=districtFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.mukim"/>&nbsp;<font color="#0000FF">*</font></td>
              <td>
                  <html:select property="unselectedMukim" size="7" multiple="true" disabled="<%=isDisabled%>" styleClass="fixedSelectLength">
                    <% for(int i=0; i<mukimFullListLabel.size(); i++){
                         if(selectedMukimVals==null || !Arrays.asList(selectedMukimVals).contains(mukimFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=mukimFullList.get(i)%>'><%=mukimFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
                  <br><html:errors property="mukimError"/>
              </td>
              <td>
                  <br/><br/><br/><br/>
                  <html:button property="AddMukim" styleClass="btnHighlight" value="Add&gt;&gt;"
                        disabled="<%=isDisabled%>" onclick="addOption(this.form.unselectedMukim, this.form.selectedMukim, '')"/>
                  <br/>
                  <html:button property="RemoveMukim" styleClass="btnHighlight" value="&lt;&lt;Remove"
                        disabled="<%=isDisabled%>" onclick="addOption(this.form.selectedMukim, this.form.unselectedMukim, '')"/>
                  <br/><br/><br/><br/><br/>
              </td>
              <td>
                  <html:select property="selectedMukim" size="7" multiple="true" disabled="<%=isDisabled%>" styleClass="fixedSelectLength">
                    <% for(int i=0; i<mukimFullListLabel.size(); i++){
                         if(selectedMukimVals!=null && Arrays.asList(selectedMukimVals).contains(mukimFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=mukimFullList.get(i)%>'><%=mukimFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.autovalparam.postcode"/></td>
              <td colspan="3" class="tblInput">
                <html:text property="postCode" size="20" maxlength="10" disabled="<%=isDisabled%>" />
                <html:errors property="postCodeError"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.autovalparam.land.area"/></td>
              <td colspan="3">
                <bean:message key="label.autovalparam.from"/>&nbsp;&nbsp;&nbsp;
                <html:text property="fromLandArea" size="20" maxlength="13" disabled="<%=isDisabled%>"/>&nbsp;&nbsp;
                <html:select property="fromLandAreaMeasure" disabled="<%=isDisabled%>">
                  <option value=""><bean:message key="label.please.select"/></option>
                  <html:options name="omvMeasureValue" labelName="omvMeasureLabel" />
                </html:select>
                &nbsp;&nbsp;&nbsp;<bean:message key="label.autovalparam.to"/>&nbsp;&nbsp;&nbsp;
                <html:text property="toLandArea" size="20" maxlength="13" disabled="<%=isDisabled%>"/>&nbsp;&nbsp;
                <html:select property="toLandAreaMeasure" disabled="<%=isDisabled%>">
                  <option value=""><bean:message key="label.please.select"/></option>
                  <html:options name="omvMeasureValue" labelName="omvMeasureLabel" />
                </html:select>
                <html:errors property="landAreaError"/>&nbsp;
                <html:errors property="landAreaMeasureError"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.autovalparam.built.up.area"/></td>
              <td colspan="3">
                <bean:message key="label.autovalparam.from"/>&nbsp;&nbsp;&nbsp;
                <html:text property="fromBuiltUpArea" size="20" maxlength="13" disabled="<%=isDisabled%>"/>&nbsp;&nbsp;
                <html:select property="fromBuiltUpAreaMeasure" disabled="<%=isDisabled%>">
                    <option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="omvMeasureValue" labelName="omvMeasureLabel" />
                </html:select>
                &nbsp;&nbsp;&nbsp;<bean:message key="label.autovalparam.to"/>&nbsp;&nbsp;&nbsp;
                <html:text property="toBuiltUpArea" size="20" maxlength="13" disabled="<%=isDisabled%>"/>&nbsp;&nbsp;
                <html:select property="toBuiltUpAreaMeasure" disabled="<%=isDisabled%>">
                    <option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="omvMeasureValue" labelName="omvMeasureLabel" />
                </html:select>
                <html:errors property="builtUpAreaError"/>&nbsp;
                <html:errors property="builtUpAreaMeasureError"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">
                <bean:message key="label.autovalparam.minimum.current.omv"/>&nbsp;<font color="#0000FF">*</font>
              </td>
              <td colspan="3">
                <html:text property="minCurrentOMV" size="20" maxlength="13" disabled="<%=isDisabled%>"/>
                <html:errors property="minCurrentOMVError"/>
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
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
            <tr class="even">
              <td width="20%" class="fieldname"><bean:message key="label.autovalparam.omv"/></td>
              <td>
                <html:select property="omvIndicator" disabled="<%=isDisabled%>">
                  <option value=""><bean:message key="label.please.select"/></option>
                  <html:options name="omvIndicatorValue" labelName="omvIndicatorLabel" />
                </html:select>&nbsp;&nbsp;
                <html:text property="omvValue" size="12" maxlength="8" disabled="<%=isDisabled%>"/>
                %
                <html:errors property="omvIndicatorError"/>&nbsp;<html:errors property="omvValueError"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.autovalparam.valuation.description"/></td>
              <td><label>
                <html:textarea property="valuationDescription" cols="50" rows="4" disabled="<%=isDisabled%>"></html:textarea>
                <html:errors property="valuationDescriptionError"/>
              </label></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
</table>

<%if(isRemarksNedded){%>
      <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
      <thead>
      </thead>
        <tbody>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                  <tbody>
                    <tr>
                      <td class="fieldname"><bean:message key="label.remarks"/></td>
                      <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
                    </tr>
                    <tr>
                      <td class="fieldname"><bean:message key="label.last.action.by"/></td>
                      <td class="even">&nbsp;<%=lastActionBy%></td>
                    </tr>
                    <tr class="odd">
                      <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                      <td><%=remarks!=null?remarks:""%>&nbsp;</td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
        </tbody>
</table>
<%}else{//DefaultLogger.debug("maker_add_edit_team.jsp"," In Add/Edit mode: Remarks are >> "+remarks);%>
<%}%>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="85">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>

<!-- InstanceEnd --></html>

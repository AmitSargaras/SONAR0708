<%@ page import="com.integrosys.cms.ui.srp.country.SRPCountryConstants,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralParameter,
                 com.integrosys.cms.app.collateral.trx.parameter.OBCollateralParameterTrxValue,
                 java.util.HashMap,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

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

function submitPage(plength) {
	var str1 = "max" ;
	var alertneeded=0;
	var str2 = "valuationFrequency";
	if( plength > 1){
	   for (i = 0; i < plength; i++) {
		 if (!isNaN(document.forms[0].thresholdPercents[i].value)) {
	      	if((eval(document.forms[0].thresholdPercents[i].value)) > (eval("document.forms[0].max"+i+".value"))) {
	       		if((eval(document.forms[0].thresholdPercents[i].value)) != (eval(document.forms[0].indicator[i].value))) {
					alertneeded=alertneeded+1;
		   		}
		 	}
	 	 }
	   }
	}else{
		 if (!isNaN(document.forms[0].thresholdPercents.value)) {		
	   		if((eval(document.forms[0].thresholdPercents.value))>(eval("document.forms[0].max0.value")))	{
	   			if((eval(document.forms[0].thresholdPercents.value))!=(eval(document.forms[0].indicator.value))) {
	   				alertneeded=alertneeded+1;
	   			}
   			}
		}
	}
	
   if(alertneeded>0)
      alert("The Country SRP value is more than the specified Global value.");
    document.forms[0].action='<%=SRPCountryConstants.ACTION_URL+"?event=maker_edit_srpcountry"%>';
    document.forms[0].submit();
}

function gotoPreparePage() {
    document.forms[0].action='<%=SRPCountryConstants.ACTION_URL+"?event=maker_prepare_srpcountry"%>';
    document.forms[0].submit();
}


-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action="SRPCountry.do?">
<body>

<%
    ICollateralParameter[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.srp.country.SRPCountryAction.CollateralParameterTrxValue");
    com.integrosys.cms.ui.srp.country.SRPCountryForm aForm = (com.integrosys.cms.ui.srp.country.SRPCountryForm) request.getAttribute("SRPCountryForm");
    System.out.println("entered srpcountry_edit.jsp");
     HashMap countryMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.srp.country.SRPCountryAction.countries.map");

    OBCollateralParameterTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;

    if( obj!=null ) {
        obTrxValue = (OBCollateralParameterTrxValue)obj;

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if(isRejected)
        parametersArray = obTrxValue.getStagingCollateralParameters();
        else
        parametersArray = obTrxValue.getCollateralParameters();
    }
%>

<!-- InstanceBeginEditable name="Content" -->
<%@include file="/common/mandatory_for_submission_note.jsp" %>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>&nbsp;</td>
    </tr>
  <tr>
      <td><h3>SRP - Country Specific Parameters - 
                <%=obTrxValue.getCollateralParameters()[0]!=null?countryMap.get(obTrxValue.getCollateralParameters()[0].getCountryIsoCode()):" "%>
                - 
                <%=obTrxValue.getCollateralParameters()[0]!=null?obTrxValue.getCollateralParameters()[0].getTypeName():" "%>
      </h3></td>
  </tr>
  <tr><td><hr /></td></tr>
  </thead>
  <tbody>
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="8%">S/N</td>
              <td width="41%">Description</td>
              <td width="9%" align="center">Max Haircut %</td>
              <td width="12%" nowrap="nowrap">Cty Haircut %&nbsp;<font color="#00AAFF">* </font></td>
              <td width="30%">Valuation Frequency&nbsp;<font color="#00AAFF">* </font></td>
            </tr>
          </thead>
          <tbody>
          <%
              String threshold[] = new String[parametersArray.length];
              threshold =aForm.getThresholdPercents();
              String valuationFrequency[] = new String[parametersArray.length];
              valuationFrequency = aForm.getValuationFrequencies();
              String valuationFrequencyUnit[] = new String[parametersArray.length];
              valuationFrequencyUnit = aForm.getValuationFrequencyUnits();
              String indicator[] = new String[parametersArray.length];
              indicator = aForm.getIndicator();
              boolean note=false;
              for (int i = 0; i < parametersArray.length; i++) {
                  ICollateralParameter iCollateralParameter = parametersArray[i];
             %>
          <html:hidden property="countryIsoCodes" value='<%=""+iCollateralParameter.getCountryIsoCode()%>'/>
          <html:hidden property="securitySubTypeIds" value='<%=""+iCollateralParameter.getSecuritySubTypeId()%>'/>

            <tr class='<%=(i%2==0?"even":"odd")%>'>
              <td class="index"><%=(i+1)%></td>
              <td>
                <%=iCollateralParameter.getSubTypeDesc()%><br />
              </td>
              <td style="text-align:center;padding-right:10px">
                <%=ConvertFloatToString.getInstance().convertDouble(iCollateralParameter.getMaxValue())%>
                <input type="hidden" value="<%=ConvertFloatToString.getInstance().convertDouble(iCollateralParameter.getMaxValue())%>" name="max<%=i%>">

              </td>
              <td style="text-align:center;padding-right:5px">
              <input type="hidden" value="<%=i%>" name="index">
               <%if(!threshold[i].equals("-1")) {%>
               <html:text  property="thresholdPercents"  value="<%=threshold[i]%>"   maxlength="3" size="3" /> &nbsp;
              <html:hidden  property="indicator" value="<%=indicator[i]%>" />

              <%
              	} else { 
	              	String strMaxValue = ConvertFloatToString.getInstance().convertDouble(iCollateralParameter.getMaxValue());
	          %>
              <html:text  property="thresholdPercents"  value="<%=strMaxValue%>"   maxlength="3" size="3" /> &nbsp;
              <html:hidden  property="indicator" value="<%=strMaxValue%>" />
              <% note=true;%>
              <%}%>
                  <%	String errorString = "maxValues" + i; %>
                    	<html:errors property="<%=errorString%>" />
              </td>
              <td style="text-align:center" nowrap="nowrap">
              <input type="hidden" value="<%=valuationFrequency[i]%>"  name="valuationFrequency<%=i%>">

                <html:text property="valuationFrequencies" value="<%=valuationFrequency[i]%>"  size="3" maxlength="3" style="text-align:right"/>
				<%
                  String valuFreq ="";
                    if(valuationFrequencyUnit!=null)
                           valuFreq=valuationFrequencyUnit[i];
                %>
                <html:select property="valuationFrequencyUnits" style="width:150px" value="<%=valuFreq%>">
                    <option value="">Please Select</option>
                    <html:options name="timefrequency.values" labelName="timefrequency.labels"/>
                </html:select>
                        <%	String errorString1 = "maxFreq" + i; %>
                    	<html:errors property="<%=errorString1%>" />    &nbsp;&nbsp;
                        <%	String errorString2 = "maxFreqUnit" + i; %>
                    	<html:errors property="<%=errorString2%>" />
              </td>
            </tr>
            <%
              }
            %>
          </tbody>
        </table></td>
  </tr>
<%
  if(isRejected ) {
%>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
      <jsp:include page="../srp_remarks_section_include.jsp" flush="true" >
        <jsp:param name="UID" value='<%=obTrxValue.getUserInfo()%>' />
        <jsp:param name="remarks" value='<%=obTrxValue.getRemarks()%>' />
      </jsp:include>
    </td>
  </tr>
<%
  }
%>  
  </tbody>
</table>

<%if(note) {%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <font color="#0000FF">Note : The country specific values are default values and have not been submitted for approval.</font>
</tr>
<%}%>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2">&nbsp;</td></tr> 
  <tr><td colspan="2">&nbsp;</td></tr>   
  <tr>
    <td><a href="javascript:submitPage(<%=parametersArray.length%>)"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td><a href='<%=isRejected?"ToDo.do":"javascript:gotoPreparePage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  </tr>
  <tr><td colspan="2">&nbsp;</td></tr> 
  <tr><td colspan="2">&nbsp;</td></tr> 
  <tr><td colspan="2">&nbsp;</td></tr>     
</table>

<!-- InstanceEndEditable -->

</html:form>
</body>
<!-- InstanceEnd --></html>

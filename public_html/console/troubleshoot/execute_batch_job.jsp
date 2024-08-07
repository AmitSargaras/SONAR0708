<%@ include file="/console/console_template.jsp"%>

<%@ page
	import="com.integrosys.base.techinfra.context.BeanHouse,
				com.integrosys.cms.app.eventmonitor.collateralevaluationdue.MonEvaluationDue,
				com.integrosys.cms.app.eventmonitor.collateralmaturity.MonCollateralMaturity,
				com.integrosys.cms.app.eventmonitor.coverageexcess.MonCoverageExcess,
				com.integrosys.cms.app.eventmonitor.coverageshortfall.MonCoverageShortfall,
				com.integrosys.cms.app.eventmonitor.documentexpiry.MonDocumentExpiry,
				com.integrosys.cms.app.eventmonitor.enabledisableuser.MonEnableDisableUser,
				com.integrosys.cms.app.eventmonitor.marketindex.MonMarketIndex,
				com.integrosys.cms.app.eventmonitor.marketindexdown.MonMarketIndexDown,
				com.integrosys.cms.app.eventmonitor.riskparamexceed.MonRiskParamExceed,
				com.integrosys.cms.batch.collateralthreshold.CollateralThresholdMain,
				com.integrosys.cms.batch.exposure.ExposureAggregationMain,
				com.integrosys.cms.batch.feeds.vehicle.VehicleFeedsLoader,
				com.integrosys.cms.batch.eod.EndOfDaySyncMastersMain "%>
<%@ page
	import="com.integrosys.cms.batch.recurrent.RecurrentDueDateMain"%>
<%@ page import="com.integrosys.cms.batch.rv.RealisableValueMain"%>
<%@ page
	import="com.integrosys.cms.batch.sibs.parameter.ParameterBusManagerImpl"%>
<%@ page import="com.integrosys.cms.batch.valuation.ValuationMain"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page
	import="com.integrosys.cms.batch.feeds.property.PropertyFileLoader"%>
<%@ page
	import="com.integrosys.cms.batch.feeds.vehicle.VehicleFeedsLoader"%>
<html>
<head>

<%@ include file="/console/console_include.jsp"%>

</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Batch
				execution [local]</td>
		</tr>
	</table>
	<script>

    function checkMandatoryCountryParameter(event){
        if(event == "monEnableDisableUserBatchJob" || event == "recurrentDueDateBatchJob" ||
        	event == "valuationBatchJob" ||
        	event == "marketIndexUpBatchJob" || 
        	event == "marketIndexDownBatchJob" || 
        	event == "monRiskParamExceedBatchJob" || 
        	event == "securityCoverageExcessBatchJob" || 
        	event == "securityCoverageShortfallBatchJob" ||
        	event == "collateralMaturityBatchJob" ||
            event == "collateralEvaluationDueBatchJob" //||
            ){
            return true;
        }else{
            return false;
        }
    }

    function checkMandatorycolTypeParameter(event){
        if(event == "valuationBatchJob"){
            return true;
        }else{
            return false;
        }
    }

    function checkMandatorysourceTypeParameter(event){
        if(event == "backDateValuationDateJob"){
            return true;
        }else{
            return false;
        }
    }

    function checkMandatoryField(){
        var event = document.getElementById("event").value;
        var country = document.getElementById("country").value;
        var colType = document.getElementById("colType").value;
        var sourceType = document.getElementById("sourceType").value;

        if(event == null || event == ""){
            alert("Please select the batch job");
            return false;
        }else if((country == null || country == "") && checkMandatoryCountryParameter(event)){
            alert("Please select the country");
            return false;
        }else if((colType == null || colType == "") && checkMandatorycolTypeParameter(event)){
            alert("Please select the Collateral Type");
            return false;
        }else if((sourceType == null || sourceType == "") && checkMandatorysourceTypeParameter(event)){
            alert("Please select the Source Type");
            return false;
        }

        return true;
    }
</script>
	<%
	String syncDirection = null;
	String reqEvent = null;
	String reqCountry = null;
    String reqColType = null;
    String reqColSubType = null;
    String reqSourceType = null;
    String reqCmsColId = null;
	String realServerName = null;
    String input1 = null;
    String input2 = null;

	try {
		syncDirection = request.getParameter("syncDirection") == null ? "" : request.getParameter("syncDirection");
		
		reqEvent = request.getParameter("event");
		if (reqEvent == null)
			reqEvent = "";
		System.out.println("		reqEvent : " + reqEvent);

        reqCountry = request.getParameter("country");
		if (reqCountry == null)
            reqCountry = "";
		System.out.println("		country : " + reqCountry);

        reqColType = request.getParameter("colType");
        if (reqColType == null)
            reqColType = "";
        System.out.println("		colType : " + reqColType);

        reqColSubType = request.getParameter("secsubtype");
        if (reqColSubType == null)
            reqColSubType = "";
        System.out.println("		secsubtype : " + reqColSubType);

        reqSourceType = request.getParameter("sourceType");
        if (reqSourceType == null)
            reqSourceType = "";
        System.out.println("		sourceType : " + reqSourceType);

        reqCmsColId = request.getParameter("cmsColId");
        if (reqCmsColId == null)
            reqCmsColId = "";
        System.out.println("		cmsColId : " + reqCmsColId);
	
	input1 = request.getParameter("input1");
        if (input1 == null)
            input1 = "";
        System.out.println("		input1 : " + input1);

        input2 = request.getParameter("input2");
        if (input2 == null)
            input2 = "";
        System.out.println("		input2 : " + input2);
	} 
	catch(Exception ee) {
		ee.printStackTrace(new java.io.PrintWriter(out));
	}
%>

	<form action="execute_batch_job.jsp" class="niceform" METHOD=POST>
		<table width="90%" border="0" cellspacing="1" cellpadding="1"
			align="center" class="style1">
			<tr>
				<td width="70" align="left">Batch Job:</td>
				<td align="left"><select id="event" name="event" size="1">
						<option value="">Please Select</option>
						<option value="endOfDaySyncMastersBatchJob">EOD Sync Masters</option>
				</select></td>
			</tr>
			<tr>
				<td align="left">EOD Sync Direction:</td>
				<td align="left"><select id="syncDirection" name="syncDirection" size="1">
						<option>Please Select</option>
						<option value="CLIMSTOCPS">CLIMS to CPS</option>
						<option value="CPSTOCLIMS">CPS to CLIMS</option>
				</select>
			</tr>
			<tr>
				<td align="left">Country:</td>
				<td align="left"><select id="country" name="country" size="1">
						<option value="">Please Select</option>
						<option value="VN">VIETNAM</option>
						<option value="MY">MALAYSIA</option>
						<option value="AF">AFGHANISTAN</option>
						<option value="AX">ALAND ISLANDS</option>
						<option value="AL">ALBANIA</option>
						<option value="DZ">ALGERIA</option>
						<option value="AS">AMERICAN SAMOA</option>
						<option value="AD">ANDORRA</option>
						<option value="AO">ANGOLA</option>
						<option value="AI">ANGUILLA</option>
						<option value="AQ">ANTARTICA</option>
						<option value="AG">ANTIGUA</option>
						<option value="AR">ARGENTINA</option>
						<option value="AM">ARMENIA</option>
						<option value="AW">ARUBA</option>
						<option value="AU">AUSTRALIA</option>
						<option value="AT">AUSTRIA</option>
						<option value="AZ">AZERBAIJAN</option>
						<option value="BS">BAHAMAS</option>
						<option value="BH">BAHRAIN</option>
						<option value="BD">BANGLADESH</option>
						<option value="BB">BARBADOS</option>
						<option value="BE">BELGIUM</option>
						<option value="BZ">BELIZE</option>
						<option value="BJ">BENIN</option>
						<option value="BM">BERMUDA</option>
						<option value="BT">BHUTAN</option>
						<option value="BO">BOLIVIA</option>
						<option value="BA">BOSNIA &amp; HERZEGOVINA</option>
						<option value="BW">BOTSWANA</option>
						<option value="BV">BOUVET ISLAND</option>
						<option value="BR">BRAZIL</option>
						<option value="IO">BRITISH INDIAN OCEAN</option>
						<option value="BN">BRUNEI DARUSSALAM</option>
						<option value="BG">BULGARIA</option>
						<option value="BF">BURKINO FASO</option>
						<option value="BU">BURMA</option>
						<option value="BI">BURUNDI</option>
						<option value="BY">BYELORUSSIAN SSR</option>
						<option value="CM">CAMEROON UNITED REP</option>
						<option value="CA">CANADA</option>
						<option value="CT">CANTON AND ENDERBURY</option>
						<option value="CV">CAPE VERDE</option>
						<option value="KY">CAYMAN ISLANDS</option>
						<option value="CF">CENTRAL AFRICAN REP</option>
						<option value="TD">CHAD</option>
						<option value="CL">CHILE</option>
						<option value="CN">CHINA</option>
						<option value="CX">CHRISTMAS ISLAND</option>
						<option value="CC">COCOS(KEELING)ISLAND</option>
						<option value="CO">COLOMBIA</option>
						<option value="KM">COMOROS</option>
						<option value="CG">CONGO</option>
						<option value="CD">CONGO</option>
						<option value="CK">COOK ISLANDS</option>
						<option value="CR">COSTA RICA</option>
						<option value="HR">CROTIA (HRVATSKA)</option>
						<option value="CU">CUBA</option>
						<option value="CY">CYPRUS</option>
						<option value="CZ">CZECH REPUBLIC</option>
						<option value="CS">CZECHOSLAVAKIA</option>
						<option value="DK">DENMARK</option>
						<option value="DJ">DJIBOUTI</option>
						<option value="DM">DOMINICA</option>
						<option value="DO">DOMINICAN REPUBLIC</option>
						<option value="NQ">DRONING MAUD LAND</option>
						<option value="TP">EAST TIMOR</option>
						<option value="EC">ECUADOR</option>
						<option value="EG">EGYPT</option>
						<option value="SV">EL SALVADOR</option>
						<option value="GQ">EQUATORIAL GUINEA</option>
						<option value="ER">ERITREA</option>
						<option value="EE">ESTONIA</option>
						<option value="ET">ETHIOPIA</option>
						<option value="FO">FAEROE ISLANDS</option>
						<option value="FK">FALKLAND ISLANDS</option>
						<option value="FJ">FIJI</option>
						<option value="FI">FINLAND</option>
						<option value="FR">FRANCE</option>
						<option value="FX">FRANCE, METROPOLITAN</option>
						<option value="GF">FRENCH GUIANA</option>
						<option value="PF">FRENCH POLYNESIA</option>
						<option value="TF">FRENCH STN TERRITORY</option>
						<option value="GA">GABON</option>
						<option value="GM">GAMBIA</option>
						<option value="GE">GEORGIA</option>
						<option value="GS">GEORGIA &amp; SANDWICH</option>
						<option value="DD">GERMAN D&#39;CRATIC REP</option>
						<option value="DE">GERMANY</option>
						<option value="GH">GHANA</option>
						<option value="GI">GIBRALTAR</option>
						<option value="GR">GREECE</option>
						<option value="GL">GREENLAND</option>
						<option value="GD">GRENADA</option>
						<option value="GP">GUADALOUPE</option>
						<option value="GU">GUAM</option>
						<option value="GT">GUATEMALA</option>
						<option value="GN">GUINEA</option>
						<option value="GW">GUINEA-BISSAU</option>
						<option value="GY">GUYANA</option>
						<option value="HT">HAITI</option>
						<option value="HM">HEARD &amp; MC DONALD</option>
						<option value="HN">HONDURAS</option>
						<option value="HK">HONG KONG</option>
						<option value="HU">HUNGARY</option>
						<option value="IS">ICELAND</option>
						<option value="IN">INDIA</option>
						<option value="ID">INDONESIA</option>
						<option value="IR">IRAN</option>
						<option value="IQ">IRAQ</option>
						<option value="IE">IRELAND</option>
						<option value="IL">ISRAEL</option>
						<option value="IT">ITALY</option>
						<option value="CI">IVORY COAST</option>
						<option value="JM">JAMAICA</option>
						<option value="JP">JAPAN</option>
						<option value="JT">JOHNSTON ISLAND</option>
						<option value="JO">JORDAN</option>
						<option value="KH">KAMPUCHEA,DEMOCRATIC</option>
						<option value="KZ">KAZAKHSTAN</option>
						<option value="KE">KENYA</option>
						<option value="KI">KIRIBATI</option>
						<option value="KP">KOREA, NORTH</option>
						<option value="KR">KOREA, SOUTH</option>
						<option value="KW">KUWAIT</option>
						<option value="KG">KYRGYZSTAN</option>
						<option value="LN">LABUAN</option>
						<option value="LA">LAOS</option>
						<option value="LV">LATVIA</option>
						<option value="LB">LEBANON</option>
						<option value="LS">LESOTHO</option>
						<option value="LR">LIBERIA</option>
						<option value="LY">LIBYAN ARAB JAMAHIRI</option>
						<option value="LI">LIECHTENSTEN</option>
						<option value="LT">LITHUANIA</option>
						<option value="LU">LUXEMBOURG</option>
						<option value="MO">MACAU</option>
						<option value="MK">MACEDONIA</option>
						<option value="MG">MADAGASCAR</option>
						<option value="MW">MALAWI</option>
						<option value="MV">MALDIVES</option>
						<option value="ML">MALI</option>
						<option value="MT">MALTA</option>
						<option value="MH">MARSHALL ISLANDS</option>
						<option value="MQ">MARTINIQUE</option>
						<option value="MR">MAURITANIA</option>
						<option value="MU">MAURITIUS</option>
						<option value="YT">MAYOTTE</option>
						<option value="MX">MEXICO</option>
						<option value="FM">MICRONESIA</option>
						<option value="MI">MIDWAY ISLANDS</option>
						<option value="UM">MINOR OUTLYING ISLAN</option>
						<option value="MD">MOLDOVA</option>
						<option value="MC">MONACO</option>
						<option value="MN">MONGOLIA</option>
						<option value="MS">MONTSERRAT</option>
						<option value="MA">MOROCCO</option>
						<option value="MZ">MOZAMBIQUE</option>
						<option value="MM">MYANMAR</option>
						<option value="NA">NAMIBIA</option>
						<option value="NR">NAURU</option>
						<option value="NP">NEPAL</option>
						<option value="NL">NETHERLANDS</option>
						<option value="AN">NETHERLANDS ANTILLES</option>
						<option value="NT">NEUTRAL ZONE</option>
						<option value="NC">NEW CALENDONIA</option>
						<option value="NZ">NEW ZEALAND</option>
						<option value="NI">NICARAGUA</option>
						<option value="NE">NIGER</option>
						<option value="NG">NIGERIA</option>
						<option value="NU">NIUE</option>
						<option value="NF">NORFOLK ISLAND</option>
						<option value="NO">NORWAY</option>
						<option value="MP">NR MARIANA ISLANDS</option>
						<option value="OM">OMAN</option>
						<option value="OO">OTHERS</option>
						<option value="OT">OTHERS</option>
						<option value="PC">PACIFIC ISLANDS</option>
						<option value="PK">PAKISTAN</option>
						<option value="PW">PALAU</option>
						<option value="PS">PALESTINIAN</option>
						<option value="PA">PANAMA</option>
						<option value="PG">PAPUA NEW GUINEA</option>
						<option value="PY">PARAGUAY</option>
						<option value="PE">PERU</option>
						<option value="PH">PHILIPPINES</option>
						<option value="PN">PITCAIRN ISLAND</option>
						<option value="PL">POLAND</option>
						<option value="PT">PORTUGAL</option>
						<option value="PR">PUERTO RICO</option>
						<option value="QA">QATAR</option>
						<option value="RE">REUNION</option>
						<option value="RO">ROMANIA</option>
						<option value="RU">RUSSIAN FEDERATION</option>
						<option value="RW">RWANDA</option>
						<option value="LC">SAINT LUCIA</option>
						<option value="VC">SAINT VINCENT &amp; THE</option>
						<option value="WS">SAMOA</option>
						<option value="SM">SAN MARINO</option>
						<option value="ST">SAO TOME &amp; PRINCIPE</option>
						<option value="SA">SAUDI ARABIA</option>
						<option value="SN">SENEGAL</option>
						<option value="SC">SEYCHELLES</option>
						<option value="SL">SIERRA LEONE</option>
						<option value="SG">SINGAPORE</option>
						<option value="SK">SLOVAKIA</option>
						<option value="SI">SLOVENIA</option>
						<option value="SB">SOLOMON ISLANDS</option>
						<option value="SO">SOMALIA</option>
						<option value="SF">SOUTH AFRICA</option>
						<option value="ZA">SOUTH AFRICA</option>
						<option value="ES">SPAIN</option>
						<option value="LK">SRI LANKA</option>
						<option value="SH">ST HELENA</option>
						<option value="KN">ST KITIS-NEVIS-ANGUI</option>
						<option value="PM">ST PIERRE &amp; MIQUELON</option>
						<option value="SD">SUDAN</option>
						<option value="SR">SURINAM</option>
						<option value="SJ">SVALBARD &amp; JAN MAYEN</option>
						<option value="SZ">SWAZILAND</option>
						<option value="SE">SWEDEN</option>
						<option value="CH">SWITERLAND</option>
						<option value="SY">SYRIAN ARAB REPUBLIC</option>
						<option value="TW">TAIWAN</option>
						<option value="TJ">TAJIKISTAN</option>
						<option value="TZ">TANZANIA UNITED REP</option>
						<option value="TH">THAILAND</option>
						<option value="TL">TIMOR-LESTE</option>
						<option value="TG">TOGO</option>
						<option value="TK">TOKELAU</option>
						<option value="TO">TONGA</option>
						<option value="TT">TRINIDAD AND TOBAGO</option>
						<option value="TN">TUNISIA</option>
						<option value="TR">TURKEY</option>
						<option value="TM">TURKMENISTAN</option>
						<option value="TC">TURKS &amp; CAICOS ISLAN</option>
						<option value="TV">TUVALU</option>
						<option value="UG">UGANDA</option>
						<option value="UA">UKRAINIAN SSR</option>
						<option value="PP">UNIDENTIFIED CITIZEN</option>
						<option value="AE">UNITED ARAB EMIRATES</option>
						<option value="GB">UNITED KINGDOM</option>
						<option value="US">UNITED StateS</option>
						<option value="PU">UNITED StateS MISC</option>
						<option value="VI">UNITED StateS VIEGIN</option>
						<option value="HV">UPPER VOLTA</option>
						<option value="UY">URUGUAY</option>
						<option value="SU">USSR</option>
						<option value="UZ">UZBEKISTAN</option>
						<option value="VU">VANUATU</option>
						<option value="VA">VATICAN CITY State</option>
						<option value="VE">VENEZUELA</option>
						<option value="VG">VIRGIN ISLAND(BRIT)</option>
						<option value="WK">WAKE ISLAND</option>
						<option value="WF">WALLIS AND FUTUNA</option>
						<option value="EH">WESTERN SAHARA</option>
						<option value="YE">YEMEN</option>
						<option value="YD">YEMEN DEMOCRATIC</option>
						<option value="YU">YUGOSLAVIA</option>
						<option value="ZR">ZAIRE</option>
						<option value="ZM">ZAMBIA</option>
						<option value="ZW">ZIMBABWE</option>
				</select></td>
			</tr>
			<tr>
				<td width="70" align="left">Collateral Type (Valuation Batch
					only):</td>
				<td align="left"><select id="colType" name="colType" size="1">
						<option value="">Please Select</option>
						<option value="AB">Asset Based</option>
						<option value="CS">Deposit</option>
						<option value="GT">Guarantee</option>
						<!--<option value="IN">Insurance</option>-->
						<option value="MS">Marketable Security</option>
						<option value="PT">Property</option>
				</select></td>
			</tr>
			<tr>
				<td width="70" align="left">Collateral Sub Type (Valuation
					Batch only):</td>
				<td align="left"><select id="secsubtype" name="secsubtype"
					size="1">
						<option value="">Please Select</option>
						<option value="AB101">Plant and Equipment</option>
						<option value="AB102">Vehicle</option>
						<option value="AB109">Aircraft</option>
						<option value="AB111">Vessel</option>
						<option value="AB110">Gold</option>
				</select></td>
			</tr>
			<tr>
				<td width="70" align="left">Source Type (Backdate Valuation
					only):</td>
				<td align="left"><select id="sourceType" name="sourceType"
					size="1">
						<option value="">Please Select</option>
						<option value="A">System Valuation Block</option>
						<option value="S">LOS / Souce Valuation Block</option>
						<option value="M">Manual Valuation Block</option>
						<option value="A+M">System and Manual Valuation Block</option>
						<option value="ALL">All</option>
				</select></td>
			</tr>
			<tr>
				<td width="70" align="left">CMS Collateral ID (Backdate
					Valuation only):</td>
				<td align="left"><input id="cmsColId" name="cmsColId"
					type="text" /></td>
			</tr>
			<tr>
				<td width="70" align="left">User Login List (Seperate by ,)</td>
				<td align="left"><input type="text" name="input1" id="input1" />
				</td>
			</tr>
			<tr>
				<td width="70" align="left">Default Password</td>
				<td align="left"><input type="text" name="input2" id="input2" />
				</td>
			</tr>
			<tr>
				<td align="left"></td>
				<td align="left"><input type="submit" value=" Submit "
					onclick="return checkMandatoryField();" /></td>
			</tr>
		</table>
	</form>
	<hr>
	<%
	try {
		if ("endOfDaySyncMastersBatchJob".equals(reqEvent)) {
			EndOfDaySyncMastersMain job = (EndOfDaySyncMastersMain) BeanHouse.get("endOfDaySyncMastersBatchJob");
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			if(StringUtils.isNotBlank(syncDirection))
				paramMap.put("syncDirection", syncDirection);
			job.execute(paramMap);
		}

		out.println("<font color='blue'><b>Batch Execute Done</b></font><br>");
	} catch (Exception ee) {
		out.println("<font color='blue'><b>Error found: " + "</b></font><br>");
		ee.printStackTrace(new java.io.PrintWriter(out));
		ee.printStackTrace();

	}
	%>

</body>
</html>


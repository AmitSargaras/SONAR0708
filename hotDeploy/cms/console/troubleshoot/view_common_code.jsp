<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				org.apache.commons.lang.StringUtils,
				java.io.*,
				java.net.*,
				javax.net.ssl.HostnameVerifier,
				javax.net.ssl.HttpsURLConnection,
				javax.net.ssl.SSLContext,
				javax.net.ssl.SSLSession,
				javax.net.ssl.TrustManager,
				javax.net.ssl.X509TrustManager,
				com.integrosys.base.techinfra.util.PropertyUtil
		"%>


<html>
<head>
<%@ include file="/template/stylesheet_template.jsp" %>

<%@ include file="/console/console_include.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/console/css/console.css"/>

<STYLE type=text/css>
BODY {
	overflow: auto;
	margin-bottom: 10px;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 10px;
}
</STYLE>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/ajaxDropdown.js"></script>

<script type="text/javascript">
	function refreshDevName(dropdown){	
		var currVal = "";
		for(i=0; i<dropdown.options.length; i++){
			if (dropdown.options[i].selected == true)
			{
				currVal = dropdown.options[i].value;
			}
		}	
		var dep = 'developerName';
		var url = '<%=request.getContextPath()%>/commoncode/' + 'get_common_code.jsp'+'?code=DEVELOPER_CODE&initial='+currVal;
		//alert(url);
		sendLoadDropdownReq(dep, url);	
	}
</script>


<script type="text/javascript">

	function getCommonCodeList(formobj)
	{
		var currVal = "";

		if (document.all||document.getElementById) 
		{
			var aCode = "";
			var codeobj = formobj.elements["code"];
			if (codeobj.value != "" && codeobj.value != null)
				aCode = "code=" + codeobj.value;
			else
				aCode = "code=";

			var aSource = "";
			var sourceobj = formobj.elements["source"];
			if (sourceobj.value != "" && sourceobj.value != null)
				aSource = "&source=" + sourceobj.value;

			var aRef = "";
			var refobj = formobj.elements["ref"];
			if (refobj.value != "" && refobj.value != null)
				aRef = "&ref=" + refobj.value;

			var aDesc = "";
			var descobj = formobj.elements["desc"];
			if (descobj.selectedIndex != -1 && descobj.options[descobj.selectedIndex].value != "")
				aDesc = "&desc=" + descobj.options[descobj.selectedIndex].value;
			
			var aInitial = "";
			var initialobj = formobj.elements["initial"];
			if (initialobj.selectedIndex != -1 && initialobj.options[initialobj.selectedIndex].value != "")
				aInitial = "&initial=" + initialobj.options[initialobj.selectedIndex].value;

			var aCountry = "";
			var countryobj = formobj.elements["country"];
			if (countryobj.selectedIndex != -1)
			{
			    for (var i = 0; i < countryobj.length; i++) {
			        if (countryobj.options[i].selected)
			            aCountry += "&country=" + countryobj.options[i].value;
			    }
			}

			var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp?";
			url += aCode;

			if (aSource != null && aSource != "")
				url += aSource;
			if (aRef != null && aRef != "")
				url += aRef;
			if (aDesc != null && aDesc != "")
				url += aDesc;
			if (aInitial != null && aInitial != "")
				url += aInitial;
			if (aCountry != null && aCountry != "")
				url += aCountry;

			//alert("aCode: " + aCode);
			//alert("aSource: " + aSource);
			//alert("aRef: " + aRef);
			//alert("aDesc: " + aDesc);
			//alert("aInitial: " + aInitial);
			//alert("aCountry: " + aCountry);

			document.getElementById("urldiv").innerHTML = "<b>URL:</b> " + url;

		<%--
			the simplest call is to just pass in the categoryCode
			i.e.
				get_common_code.jsp?code=LAND_USE_CAT
			
		--%>
		
			var listName = 'resultcode';
			sendLoadDropdownReq(listName, url);

		}

	}
</script>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;View Common Code [via /commoncode/get_common_code.jsp]</td>
  </tr>
</table><br>


<br>

<table border="0">

	<tr class="odd">
		<td class="fieldname" width="120">
			<b><font color="red">Result Code</font></b>
		</td>
		<td>
			<select name="resultcode" size="1">
				<option value="" >Please Select</option>
			</select>
		</td>
	</tr>
</table>

<form onSubmit="getCommonCodeList(this);return false;" class="niceform" METHOD=POST>

<table style="border-style: dotted">
	<tr class="odd">
		<td class="fieldname" width="120">
			Code
		</td>
		<td>
			<input type="text" name="code" size="40" />
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname">
			Source
		</td>
		<td>
			<input type="text" name="source" size="40" />
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname">
			refEntryCode
		</td>
		<td>
			<input type="text" name="ref" size="40" />
		</td>
	</tr>	
	<tr class="odd">
		<td class="fieldname">
			descWithCode
		</td>
		<td>
			<select name="desc" size="1">
				<option value="" >Please Select</option>
				<option value="true">true</option>
				<option value="false">false</option>
			</select>
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname">
			Initial
		</td>
		<td>
			<select name="initial" size="1">
				<option value="">Please Select</option>
				<option value="A" >A(a)</option>										
				<option value="B" >B(b)</option>						
				<option value="C" >C(c)</option>						
				<option value="D" >D(d)</option>						
				<option value="E" >E(e)</option>						
				<option value="F" >F(f)</option>						
				<option value="G" >G(g)</option>						
				<option value="H" >H(h)</option>						
				<option value="I" >I(i)</option>						
				<option value="J" >J(j)</option>						
				<option value="K" >K(k)</option>						
				<option value="L" >L(l)</option>						
				<option value="M" >M(m)</option>						
				<option value="N" >N(n)</option>						
				<option value="O" >O(o)</option>						
				<option value="P" >P(p)</option>						
				<option value="Q" >Q(q)</option>						
				<option value="R" >R(r)</option>						
				<option value="S" >S(s)</option>						
				<option value="T" >T(t)</option>						
				<option value="U" >U(u)</option>						
				<option value="V" >V(v)</option>						
				<option value="W" >W(w)</option>						
				<option value="X" >X(x)</option>						
				<option value="Y" >Y(y)</option>						
				<option value="Z" >Z(z)</option>						
				<option value="Others" >Others</option>
			</select>
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname">
			Country
		</td>
		<td>
			<select multiple="multiple" name="country" size="8">
				<option value="" >Please Select</option>
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
				<option value="US">UNITED STATES</option>
				<option value="PU">UNITED STATES MISC</option>
				<option value="VI">UNITED STATES VIEGIN</option>
				<option value="HV">UPPER VOLTA</option>
				<option value="UY">URUGUAY</option>
				<option value="SU">USSR</option>
				<option value="UZ">UZBEKISTAN</option>
				<option value="VU">VANUATU</option>
				<option value="VA">VATICAN CITY STATE</option>
				<option value="VE">VENEZUELA</option>
				<option value="VN">VIETNAM</option>
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
			</select>
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname">
			&nbsp;
		</td>
		<td>
			<input type="submit" value=" Submit "/>
		</td>
	</tr>

</table>
	
</form>

<div id="urldiv">
	URL: -
</div>



<br><br>
<hr>
<b>Example on Usage</b>
<br><br>

<table border="0">
	<tr class="odd">
		<td class="fieldname">
			Developer Name
		</td>
		<td>
			<select name="developerNameIDX" onchange="refreshDevName(this)" size="1">
				<option value="-">Please Select</option>
				<option value="A" >A(a)</option>										
				<option value="B" >B(b)</option>						
				<option value="C" >C(c)</option>						
				<option value="D" >D(d)</option>						
				<option value="E" >E(e)</option>						
				<option value="F" >F(f)</option>						
				<option value="G" >G(g)</option>						
				<option value="H" >H(h)</option>						
				<option value="I" >I(i)</option>						
				<option value="J" >J(j)</option>						
				<option value="K" >K(k)</option>						
				<option value="L" >L(l)</option>						
				<option value="M" >M(m)</option>						
				<option value="N" >N(n)</option>						
				<option value="O" >O(o)</option>						
				<option value="P" >P(p)</option>						
				<option value="Q" >Q(q)</option>						
				<option value="R" >R(r)</option>						
				<option value="S" >S(s)</option>						
				<option value="T" >T(t)</option>						
				<option value="U" >U(u)</option>						
				<option value="V" >V(v)</option>						
				<option value="W" >W(w)</option>						
				<option value="X" >X(x)</option>						
				<option value="Y" >Y(y)</option>						
				<option value="Z" >Z(z)</option>						
				<option value="Others" >Others</option>
			</select>
			<select name="developerName" size="1"><option value="" >Please Select </option></select>
		</td>
	</tr>
</table>

<br>
<%
	out.println("<br><hr><br>");



%>

</body>
</html>


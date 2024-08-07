<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 java.util.Collection,
                 com.integrosys.base.businfra.currency.ICurrency,
                 java.util.Enumeration,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Iterator" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.feed.mutualfunds.item.MutualFundsItemForm"%>
<%@page import="com.integrosys.cms.ui.feed.mutualfunds.item.MutualFundsItemAction"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    
    <!-- InstanceBeginEditable name="CssStyle" -->
    
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>

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

function submitForm() {
document.forms[0].submit();
}

function cancelForm() {
    document.forms[0].event.value = "<%=MutualFundsItemAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}


function toggleRow(dropdown) {

	var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 if(curSel == "CLOSE"){
	   document.getElementById("expiryDateId").style.display = '';
	 }else{
		document.getElementById("expiryDateId").style.display = 'none';
	 }	 
}


function setPhysInsp(dropdown){
	
	var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 if(curSel == "CLOSE"){
		document.getElementById("spanPIF11").style.display = "none";
	    document.getElementById("spanPIF12").style.display = '';
        document.getElementById("spanPIF").style.visibility = "visible";
        document.getElementById("spanPIF1").style.visibility = "hidden";
        document.getElementById("spanPIF2").style.visibility = "visible";
        //document.getElementById("expiryDateRead").style.display = "none";
        //document.getElementById("expiryDateEdit").style.display = '';
        
     } else {
    	 document.getElementById("spanPIF11").style.display = '';
         document.getElementById("spanPIF12").style.display = "none";
         document.getElementById("spanPIF").style.visibility = "hidden";
        document.getElementById("spanPIF1").style.visibility = "hidden";
        document.getElementById("spanPIF2").style.visibility = "hidden";
        //document.getElementById("expiryDateEdit").style.display = "none";
        //document.getElementById("expiryDateRead").style.display = '';
        //document.getElementById("expiryDate").value = "";
        
    }
}

//-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>

<%
    MutualFundsItemForm actionForm = (MutualFundsItemForm) pageContext.findAttribute("mutualFundsItemForm");
	boolean isExpiryDate = false; 
	String str = actionForm.getExpiryDate();
	if(str!=null && str.trim().length() >0){
		isExpiryDate = true;
	}

    CurrencyList currencyList = CurrencyList.getInstance();
    Collection currencyLabels = currencyList.getCurrencyLabels();
    Collection currencyValues = currencyList.getCountryValues();
    pageContext.setAttribute("currencyLabels", currencyLabels);
    pageContext.setAttribute("currencyValues", currencyValues);
	
	

%>
<script type="text/javascript">
</script>
<html:form action="feed_mutual_funds_item.do">
    <input type="hidden" name="event" value="<%=MutualFundsItemAction.EVENT_SAVE%>"/>

    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><h3>Mutual Funds - New</h3></td>
            </tr>
            <tr>
                <td><hr/></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                        <thead>
                        </thead>
                        <tbody>
                            <tr class="odd">
                                <td class="fieldname" width="35">Scheme Code&nbsp;<font color="red">* </font></td>
                                <td><html:text property="schemeCode" size="30" maxlength="30"/>
                                    <br/><html:errors property="schemeCodeError"/>
                                    <br/><html:errors property="spaceError"/>
				                    <br/><html:errors property="specialCharacterCodeError"/></td>
                            </tr>
                            <tr class="even">
                                <td class="fieldname">Scheme Name&nbsp;<font color="red">*</font>
                                <br/><bean:message key="error.string.stockmutualfund.name"/></td>
                                <td><html:text property="schemeName" size="30" maxlength="30"/>
                                    <br/><html:errors property="schemeNameError"/>
                                    <br/><html:errors property="specialCharacterNameError"/></td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname">Scheme Type&nbsp;<font color="red">* </font></td>
                                <td>
                                	<html:select property="schemeType" onchange="setPhysInsp(this)">
	                                	<integro:common-code
	                                    		categoryCode="<%=CategoryCodeConstant.HDFC_SCRIPT_TYPE%>" descWithCode="false"/>
	                                </html:select>
                                    <html:errors property="schemeTypeError"/></td>
                            </tr>
                            <tr class="even">
                                <td class="fieldname">Current NAV&nbsp;(INR) <font color="red">* </font></td>
                                <td><html:text property="currentNAV" maxlength="8" size="13" styleId="currentNAV" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                                    <html:errors property="currentNAVError"/></td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname">Start Date&nbsp;
                                	<span id="spanPIF" style="visibility:hidden"><font color="red">*</font></span>
                                </td>
                                <td><html:text property="startDate" maxlength="11" readonly="true" />
                                    <img src="img/calendara.gif" name="ImageCal11" border="0" id="ImageCal1" onclick="return showCalendar('startDate', 'dd/mm/y');"
                                         onmouseover="MM_swapImage('ImageCal11','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                    <html:errors property="startDateError"/>
                                </td>
                            </tr>
                            
                            <tr id="expiryDateRead" class="even" style="display:">
                                <td class="fieldname">Expiry Date&nbsp;
                                	<span id="spanPIF1" style="visibility:hidden"><font color="red">*</font></span>
                                </td>
                                <td><html:text property="expiryDate" maxlength="11" readonly="true" />
                                <%if(!"CLOSE".equalsIgnoreCase(actionForm.getSchemeType())) {%>
                                
                                    <span id="spanPIF11" style="display:">       
                                    <img src="img/calendara.gif" name="ImageCal12" border="0" id="ImageCal2" 
                                         onmouseover="MM_swapImage('ImageCal12','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                         </span>
                                    <span id="spanPIF12" style="display:none">       
                                    
	                                    <img src="img/calendara.gif" name="ImageCal123" border="0" id="ImageCal23" onclick="return showCalendar('expiryDate', 'dd/mm/y');"
	                                         onmouseover="MM_swapImage('ImageCal123','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
	                                    <html:errors property="expiryDateError"/>
                                         </span>     
                                    
                                <%}else{ %>
                                    <span id="spanPIF11" style="display:none">      
                                    <img src="img/calendara.gif" name="ImageCal12" border="0" id="ImageCal2" 
                                         onmouseover="MM_swapImage('ImageCal12','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                         </span>
                                    <span id="spanPIF12" >       
                                    
	                                    <img src="img/calendara.gif" name="ImageCal123" border="0" id="ImageCal23" onclick="return showCalendar('expiryDate', 'dd/mm/y');"
	                                         onmouseover="MM_swapImage('ImageCal123','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
	                                    <html:errors property="expiryDateError"/>
                                         </span>     
                                <%} %>
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
	
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="91">&nbsp;</td>
            <td width="59">&nbsp;</td>
        </tr>
        <tr>
            <td><a href="#" onClick="submitForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1" width="60"
                                                                                                                                                  height="22" border="0" id="Image1"/></a></td>
            <td><a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3" width="70"
                                                                                                                                                      height="20" border="0" id="Image3"/></a></td>
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
<%@ page import="java.util.ArrayList,
				 com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerForm,                
                 com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    ManualInputCustomerForm aForm = (ManualInputCustomerForm) request.getAttribute("ManualInputCustomerForm");
    String event = request.getParameter("event");    
    System.out.println("event "+event);
    ArrayList LEIDTypeID = (ArrayList) request.getAttribute("LEIDTypeID");
    ArrayList LEIDTypeValue = (ArrayList) request.getAttribute("LEIDTypeValue");

%>

<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Manual Input Customer</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script>
<!--

function submitPage() {
  document.forms[0].submit()
}

var firstSearch = true;
var legalIdSearch = "";
var legalSourceSearch = "";
var maxCnt = <%=PropertyManager.getInt(ManualInputCustomerAction.SEARCH_CIF_COUNT_KEY)%>;
var freq = <%=PropertyManager.getInt(ManualInputCustomerAction.SEARCH_CIF_FREQUENCY_KEY)%>;
function checkCIFviaAJAX()
{
    legalIdSearch = document.getElementById("legalId").value;
    legalSourceSearch = document.getElementById("leIDType").value;
	if( legalIdSearch == "" )
	{
		alert("Please enter a LE ID No");
		return false;
	}
	if( legalSourceSearch == "" )
	{	
		/* Sandeep Shinde has Commented on 25-Feb-2011
		alert("Please select a LE ID Type");
		return false;	*/
	}
    if (firstSearch) {
        //alert('Going First Search');
        searchCount = 0;
        //alert(legalIdSearch);
        firstCIFSearch();
    }
    else
    {
        //alert('Subsequent Search');
        subsequentCIFSearch();
    }
}

function firstCIFSearch()
{
     if (firstSearch) {
       legalIdSearch = document.getElementById("legalId").value;
       legalSourceSearch = document.getElementById("leIDType").value;
       ajaxpack.postAjaxRequestNormal('/cms/ManualInputCustomer.do?event=first_search', 'event=first_search&legalId='+legalIdSearch+'&legalSource='+legalSourceSearch, processGetPostFirstSearch, 'txt', 'responseLabel', 1);
       document.getElementById(ajaxpack.writeDiv).innerHTML = "Searching... Please wait...";
       document.getElementById("AddNew").disabled=true;
     }

}
var submitCustomerSearch = function submitPage(params) {
    var gobutton = params[0];
   
    document.forms[0].gobutton.value = gobutton;
    if (gobutton == 1) {
        //document.forms[0].leIDType.value="";
        document.forms[0].legalID.value = "";
        document.forms[0].systemId.value = "";
     //   document.forms[0].leIDType.value = "";
       
        //document.forms[0].idCountry.value="";
    } else if (gobutton == 2) {
        document.forms[0].customerNameShort.value = "";
        document.forms[0].systemId.value = "";
        //document.forms[0].idCountry.value="";
    }else if(gobutton == 3){
    	 document.forms[0].legalID.value = "";
    	  document.forms[0].customerNameShort.value = "";       
    }else {
    }
    document.forms[0].action = "MICustomerSearch.do?event=list_customer";
    document.forms[0].submit();
}

function submitEnterWrapper(event, gobutton) {
    var params = new Array();
    params[0] = gobutton;
    
    submitEnter(event, submitCustomerSearch, params);
}
var searchCount = 0;
function subsequentCIFSearch()
{
     if (!firstSearch) {
       //window.location.reload();
       ajaxpack.postAjaxRequestNormal('/cms/ManualInputCustomer.do', 'event=subsequent_search&legalId='+legalIdSearch+'&legalSource='+legalSourceSearch, processGetPostFirstSearch, 'txt', 'responseLabel', 1);

       if (searchCount > maxCnt )
       {
            // Give up and show error
            firstSearch = true;
       }
       else
       {
           if (searchCount % 2 == 0)
           {
                document.getElementById(ajaxpack.writeDiv).innerHTML = "Searching...";
           }
           else
           {
                document.getElementById(ajaxpack.writeDiv).innerHTML = "Searching... Please wait...";
           }
       }
     }

}

function processGetPostFirstSearch()
{
    firstSearch = false;
    var myajax=ajaxpack.ajaxobj
    var myfiletype=ajaxpack.filetype
    var mycountindex=ajaxpack.countIndex

        if (myajax.readyState == 4) { //if request of file completed

            //alert(myajax.status)
            //alert(myajax.responseText)
            if (myajax.status==200 || window.location.href.indexOf("http")==-1) { //if request was successful or running script locally

                if (ajaxpack.writeDiv != null) {
                    //document.getElementById(ajaxpack.writeDiv).innerHTML = myajax.responseText
                    if (myajax.responseText == "<%=ICMSConstant.TRUE_VALUE%>")
                    {
                        //alert('Customer Found');
                        firstSearch = true; //reset
                        // actual submission
                        submitPage();
                        //document.getElementById(ajaxpack.writeDiv).innerHTML = "Found!";

                    }else
                    {
                        //alert('Customer Not Found, need to recheck');
                        // set timer to recheck subsequent search
                        searchCount += 1
                        //alert(searchCount);
                        if (searchCount <= maxCnt )
                        {
                            // Frequency to recheck DB
                            setTimeout("subsequentCIFSearch()", freq );
                        }
                        else
                        {
                            document.getElementById(ajaxpack.writeDiv).innerHTML = "Sorry, LE ID No is not valid.";
                            document.getElementById("AddNew").disabled=false;
                            searchCount = 0;
                            firstSearch = true; //reset
                        }
                    }
                }
                else
                {
                    countDownTime = parseInt(countDownInterval) - 1;
                }
            } //end for - //if request was successful or running script locally
        } //end for - if request of file completed
}

//-->
</script>
</head>

<html:form action="CustomerSearch.do?event=list_customers" >
<body>
<!-- InstanceBeginEditable name="Content" -->


  <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  id="custsearch">
    <tr>
      <td>
        <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td colspan="3">Please enter search criteria</td>
            </tr>
          </thead>
          <tbody>
           <tr class="odd">
              <td width="37%" class="fieldname">
                <bean:message key="label.partyname.id"/> : 
              </td>
              <td width="48%">
             <html:text property="customerNameShort" maxlength="20" />  &nbsp;
              </td>
              <td rowspan=1>
              	<input onclick="submitPage(1)" name="AddNew" type="submit" id="AddNew" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
              </td>              
            </tr>
            <tr class="odd">
              <td width="37%" class="fieldname">
                System  : 
              </td>
              <td width="48%">
              
             <html:select property="systemName">
                           <integro:common-code
												categoryCode="<%=CategoryCodeConstant.OTHER_SYSTEM%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
              </td>
              <td rowspan="2">
              	<input onclick="submitPage(2)" name="AddNew" type="submit" id="AddNew" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
              </td>              
            </tr>
            <tr class="even">
              <td class="fieldname">
                <bean:message key="label.system.id.source"/> : 
              </td>
              
                <td width="48%">
              	<html:text property="systemId" maxlength="20" /> 
              	<html:errors property="systemId" />
              </td>
               
            </tr>
             
          </tbody>
        </table>
      
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <html:hidden property="customerNameShort"/>
  </table>

</body>
</html:form>
<!-- InstanceEndEditable -->
<!-- InstanceEnd -->
</html>
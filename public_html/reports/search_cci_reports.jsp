<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html><!-- InstanceBegin template="/Templates/ContentLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="Cssstyle" -->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="javascript">
        <!--
        function gotoPage (aLocation) {
        document.location = aLocation;
        }
        -->
    </script>
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->

    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>

    <script type="text/javascript" src="js/itgUtilities.js"></script>

    <!-- InstanceEndEditable -->

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

        function submitPage() {
            preventDoubleSubmit(0, "button");
            document.forms[0].submit()
        }

        //-->
    </script>


</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="/common/mandatory_for_submission_note.jsp" %>
<br>

<html:form action="CCIReportSearch.do?event=search_reports">

    <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                    <thead>
                        <tr>
                            <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td width="60%" class="fieldname">Date&nbsp;<font color="#0000FF">* </font></td>
                            <td width="40%">
                                    <html:text property="searchDate" style="width:90px" size="15" maxlength="10"/>
                                        <img src="img/calendara.gif" name="Image721" border="0" id="Image2" onclick="return showCalendar('searchDate', 'dd/mm/y');"
                                            onmouseover="MM_swapImage('Image721','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                &nbsp; <html:errors property="searchDate"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
               <input onclick="javascript:submitPage()" name="AddNew1" type="button" id="AddNew1" value="Go" class="btnNormal"
                                                   style="margin-right:5px;margin-left:10;width:50px"/>
            </td>
        </tr>
    </table>
</html:form>
</body>

<!-- InstanceEnd --></html>

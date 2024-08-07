<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commodityglobal.commodityuom.list.CommodityUOMListAction,
                 com.integrosys.cms.app.commodity.main.trx.uom.IUnitofMeasureTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.uom.IUnitofMeasure,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityuom/list/update_commodityuom_list.jsp,v 1.14 2006/11/06 10:11:54 nkumar Exp $
     *
     * Purpose:
     * Description:
     *
     * @author $Author: nkumar $<br>
     * @version $Revision: 1.14 $
     * Date: $Date: 2006/11/06 10:11:54 $
     * Tag: $Name:  $
     */
%>
<%
    IUnitofMeasureTrxValue trxValue = (IUnitofMeasureTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityUOMTrxValue");
    String category = (String) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityCategory");
    String productType = (String) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityProductType");
    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
    productType = categoryList.getCommProductItem(category, productType);
    category = categoryList.getCommCategoryItem(category);
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->

    <!-- InstanceEndEditable -->
    
    <!-- InstanceBeginEditable name="CssStyle" -->

    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>

    <script language="JavaScript" type="text/JavaScript">
        <!--
        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p,i,x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() { //v3.0
            var i,j = 0,x,a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }

        function submitPage(num) {
            if (num == 1) {
                document.forms[0].event.value = "<%=CommodityUOMListAction.EVENT_SUBMIT%>";
            }
            if (num == 2) {
                document.forms[0].event.value = "<%=CommodityUOMListAction.EVENT_UPDATE%>";
            }

            if (num == 3) {
                document.forms[0].event.value = "prepare_add";
                document.forms[0].indexID.value = "-1";
            }

            if (num == 4) {
                var delObj = document.forms[0].chkDeletes;
                var valid = false;
                if (delObj != null) {
                    if (!delObj.length) {
                        valid = delObj.checked;
                    } else {
                        for (i = 0; i < delObj.length; i++) {
                            if (delObj[i].checked) {
                                valid = true;
                            }
                        }
                    }
                } else {
                    alert('At least one unit of measure must be checked');
                    return false;
                }

                if (!valid) {
                    alert('At least one unit of measure must be checked');
                    return false;
                }

                document.forms[0].event.value = "<%=CommodityUOMListAction.EVENT_DELETE%>";
            }

            document.forms[0].submit();
        }

        function editItem(index) {
            document.forms[0].event.value = "edit_item";
            document.forms[0].indexID.value = index;

            document.forms[0].submit();
        }

        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif','img/submit2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommodityUOMList.do">
<input type="hidden" name="event" value="<%=CommodityUOMListAction.EVENT_SUBMIT%>"/>
<input type="hidden" name="indexID"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3>Maintain Commodity Unit of Measure</h3></td>
            <td valign="bottom"><html:errors property="commodityUOMList"/></td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                    <tbody>
                        <tr class="even">
                            <td width="20%" class="fieldname"><bean:message key="label.cmdt.profile.cmdt.sub.type"/>
                                : <%=category%></td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>
                                : <%=productType%></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
       style="margin-top:10px">
    <thead>
        <tr>
            <td width="42%" valign="bottom">
                <table width="160" border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="80" valign="baseline" align="center">
                            <input name="Submit2" type="button" class="btnNormal" value="Add New"
                                   onclick="javascript:submitPage(3)"/>
                        </td>
                        <td width="80" valign="baseline" align="center">
                            <input name="Submit2" type="button" class="btnNormal" value="Delete"
                                   onclick="javascript:submitPage(4)"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead>
                        <tr>
                            <td width="3%">S/N</td>
                            <td width="22%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/>&nbsp;<font
                                    color="#00AAFF">* </font></td>
                            <td width="18%">Unit of Measure&nbsp;<font color="#00AAFF">* </font></td>
                            <td width="15%">Market Unit of Measure&nbsp;<font color="#00AAFF">* </font></td>
                            <td width="17%">Metric Unit of Measure&nbsp;<font color="#00AAFF">* </font></td>
                            <td width="12%">Action</td>
                            <td width="13%">Delete</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            IUnitofMeasure[] uomList = trxValue.getStagingUnitofMeasure();
                            if (uomList == null || uomList.length == 0) {
                        %>
                        <tr class="odd">
                            <td colspan="7">There is no Unit of Measure.</td>
                        </tr>
                        <%
                        } else {
                            for (int i = 0; i < uomList.length; i++) {
                                IUnitofMeasure uom = uomList[i];
                                IProfile profile = uom.getCommodityProfile();
                        %>
                        <tr class="<%=i%2==0?"odd":"even"%>">
                            <td class="index" width="3%"><%=i + 1%></td>
                            <td width="22%">
                                <integro:empty-if-null value="<%=profile.getProductSubType()%>"/>
                            </td>
                            <td class="name" width="18%">
                                <integro:empty-if-null value="<%=uom.getName()%>"/>
                            </td>
                            <td style="text-align:center" width="15%">
                                <% if (uom.getMarketQuantity() != null) { %>
                                <integro:empty-if-null
                                        value="<%=UIUtil.formatNumber(uom.getMarketQuantity().getQuantity(), 6 , locale)%>"/>
                                <% if (uom.getMarketQuantity().getUnitofMeasure() != null) { %>
                                <integro:empty-if-null
                                        value="<%=uom.getMarketQuantity().getUnitofMeasure().getLabel()%>"/>
                                <% }
                                } else { %> - <% } %>
                            </td>
                            <td style="text-align:center" width="17%">
                                <%
                                    if (uom.getMetricQuantity() != null) {
                                %>
                                <integro:empty-if-null
                                        value="<%=UIUtil.formatNumber(uom.getMetricQuantity().getQuantity(), 6, locale)%>"/>
                                <% if (uom.getMetricQuantity().getUnitofMeasure() != null) { %>
                                <integro:empty-if-null
                                        value="<%=uom.getMetricQuantity().getUnitofMeasure().getLabel()%>"/>
                                <% }
                                } else { %> - <% } %>
                            </td>
                            <td style="text-align:center" width="12%">
                                <a href="javascript:editItem(<%=i%>)">View/Edit</a>
                            </td>
                            <td style="text-align:center" width="13%">
                                <html:multibox property="chkDeletes" value="<%=String.valueOf(i)%>"/>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
    </tbody>
</table>
<% if (trxValue != null && trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) { %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
        <tr>
            <td class="fieldname" width="39%">Remarks</td>
            <td class="odd" width="61%"><html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
                <html:errors property="remarks"/>
            </td>
        </tr>
        <tr>
            <td class="fieldname">Last Action By</td>
            <td class="even"><%=trxValue != null ? trxValue.getUserInfo() : ""%>&nbsp;</td>
        </tr>
        <tr class="odd">
            <td class="fieldname">Last Remarks Made</td>
            <td><% if (trxValue != null) { %>
                <integro:wrapper value="<%=trxValue.getRemarks()%>"/>
                <% } %>&nbsp;
            </td>
        </tr>
    </tbody>
</table>
<% } %>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image41','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image41"
                                                                                 border="0" id="Image4"/></a></td>
        <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image31','','img/save2.gif',1)"><img src="img/save1.gif" name="Image31"
                                                                               border="0" id="Image3"/></a></td>
        <%
            if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                    ICMSConstant.STATE_DRAFT.equals(trxValue.getStatus())) {
        %>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image21','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image21"
                                                                                 border="0" id="Image2"/></a></td>
        <% } else { %>
        <td><a href="CommodityUOMList.do?event=select" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image21','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image21"
                                                                                 border="0" id="Image2"/></a></td>
        <% } %>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>

<%@ page import="com.integrosys.cms.ui.feed.stock.list.StockListForm,
                 com.integrosys.cms.ui.feed.stock.list.StockListAction,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html>
<head>
    <title>Untitled Document</title>
    
    

    <style>
        table.tblInfo tbody tr td.fieldname {
            width: 150px;
        }
    </style>

    <script language="JavaScript" type="text/JavaScript">
        <!--
        function MM_jumpMenu(targ,selObj,restore){ //v3.0
        eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
        if (restore) selObj.selectedIndex=0;
        }
        //-->
    </script>
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

        function submitForm() {
        	document.forms[0].submit();
        }

        //-->
    </script>


</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>

<%
    // Get the ActionForm
    StockListForm actionForm = (StockListForm) pageContext.findAttribute("stockListForm");

    // Choose which is the next event.
    String event = null;
    if (actionForm.getEvent().equals(StockListAction.EVENT_SELECT) ||
            actionForm.getEvent().equals(StockListAction.EVENT_READ) ||
            actionForm.getEvent().equals(StockListAction.EVENT_READ_NOOP)) {
        event = StockListAction.EVENT_READ;
    } else if (actionForm.getEvent().equals(StockListAction.EVENT_SELECT_MAKER_EDIT)) {
        //event= StockListAction.EVENT_READ_MAKER_EDIT;
        event = StockListAction.EVENT_PREPARE;
    }else if (actionForm.getEvent().equals(StockListAction.EVENT_SELECT_CHECKER_EDIT)) {
        //event= StockListAction.EVENT_READ_MAKER_EDIT;
        event = StockListAction.EVENT_CHECKER_PREPARE;
    }

%>

<html:form action="feed_stock_list.do">
    <input type="hidden" name="event" value="<%=event%>"/>
    <input type="hidden" name="subType" value="IND"/>
    <input type="hidden" name="offset" value="0"/>
    <input type="hidden" name="length" value="10"/>

    <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
        <thead>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                        <thead>
                            <tr>
                                <td colspan="2">Please select the Security Exchange</td>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="even">
                                <td class="fieldname">Shares<font color="red">* </font></td>
                                <td>
                                    <html:select property="stockType">
                                    	<integro:common-code 
                                    		categoryCode="<%=ICMSUIConstant.SHARE_TYPE%>" 
                                    		refEntryCode="<%=ICMSUIConstant.STOCK_TYPE%>" 
                                    		onlyMatchRefEntry="true"/>
                                    </html:select>
                                    <html:errors property="stockType"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </tbody>
    </table>
    <table width="80" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="80">&nbsp;</td>
        </tr>
        <tr>
            <td><a href="javascript:submitForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/edit2.gif',1)"><img src="img/edit1.gif" name="Image1" width="60"
                                                                                                                                                   height="22" border="0" id="Image1"/></a></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>

</html:form>

</body>
</html>

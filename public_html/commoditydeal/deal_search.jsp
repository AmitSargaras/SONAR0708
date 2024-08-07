<%@ page import="java.util.Collection,
                 java.util.Vector,java.util.Iterator,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant
                "%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/deal_search.jsp,v 1.6 2006/10/27 08:38:43 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.6 $
     * @since $Date: 2006/10/27 08:38:43 $
     * Tag: $Name:  $
     */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%!
    int records_per_page = 10;
%>


<!-- InstanceBeginEditable name="head" -->

<script>

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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
    document.forms[0].submit()
}
</script>


<!-- InstanceEndEditable -->
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif');">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommDealSearch.do?event=list">
                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  id="custsearch">
                      <tr>
                                <td><table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                              <tr>
                                <td colspan="3">Please enter search criteria. </td>
                              </tr>
                            </thead>
                            <tbody>
                              <tr class="odd">
                                <td width="37%" class="fieldname">Deal No :</td>
                                <td width="48%"><html:text property="dealNo" maxlength="18"/>
                          <html:errors property="dealNo" /></td>
                              <td width="15%"><input onclick="submitPage()" name="AddNew1" type="button" id="AddNew1" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
                                </td>
                             </tbody>
                          </table></td>
                              </tr>



                          </table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->

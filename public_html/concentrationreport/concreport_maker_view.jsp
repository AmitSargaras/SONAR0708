<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.component.commondata.app.trx.OBBusinessParameterGroupTrxValue,
                 com.integrosys.component.commondata.app.bus.IBusinessParameter,
                 com.integrosys.component.commondata.app.bus.IBusinessParameterGroup,
                 com.integrosys.cms.app.systemparameters.trx.OBSystemParametersTrxValue,
                 com.integrosys.component.commondata.app.Constants,
                 com.integrosys.component.common.constant.ICompConstant"%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->

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
//-->

</script>

<%
    IBusinessParameter[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.systemparameters.MaintainSystemParametersAction.SystemParametersTrxValue");

    if( obj!=null ) {
        System.out.println("@@@Debug:::1 FROM JSP got session.SystemParametersTrxValue ");
        OBSystemParametersTrxValue ob = (OBSystemParametersTrxValue)obj;
        System.out.println( "ob.getStatus() = " +ob.getStatus() );
        IBusinessParameterGroup group = ob.getBusinessParameterGroup();
        parametersArray = group.getBusinessParameters();
        if( parametersArray!=null ) {
            System.out.println("@@@Debug:::2 FROM JSP parameters = "+parametersArray.length);
        }
    }else {
        System.out.println("@@@Debug::: FROM JSP got NULL in session.'SystemParametersTrxValue' ");
    }
%>

<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/submit2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>General Parameters</h3></td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="8%">S/N</td>
              <td width="73%">Description</td>
              <td width="19%">Parameter</td>
            </tr>
          </thead>
          
              <tbody>
              <%
                  for (int i = 0; i < parametersArray.length; i++)
                  {
                      IBusinessParameter parameter = parametersArray[i];
              %>
              <tr class=<%=(i%2==0)?"even":"odd"%> >                
                <td class="index"><%=(i+1)%></td>
                <td><%=parameter.getParameterName()%></td>
                <td><%=parameter.getParameterValue()%></td>
			  </tr>
              <%
                  }
              %>
              </tbody>
              
        </table></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>



<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

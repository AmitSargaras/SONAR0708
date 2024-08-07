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
    document.forms[0].action="MaintainConcReport.do?event=maker_edit_concreport";
    document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action="MaintainConcReport.do?event=maker_cncl_reject_edit";
    document.forms[0].submit();
}

</script>

<%
    IBusinessParameter[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.concentrationreport.MaintainConcReportAction.SystemParametersTrxValue");
     com.integrosys.cms.ui.concentrationreport.MaintainConcReportForm aForm = (com.integrosys.cms.ui.concentrationreport.MaintainConcReportForm) request.getAttribute("MaintainConcReportForm");
    OBSystemParametersTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
     String TrxId = (String)request.getAttribute("TrxId");

    if( obj!=null ) {
        System.out.println("@@@Debug:::1 FROM JSP got session.SystemParametersTrxValue ");
        obTrxValue = (OBSystemParametersTrxValue)obj;
        System.out.println( "ob.getStatus() = " +obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }


        IBusinessParameterGroup group = null;
        if( request.getParameter("event").equalsIgnoreCase("maker_edit_concreport_read_rejected")) {
            // if EditRejected, show Staging values
            group=obTrxValue.getStagingBusinessParameterGroup();
        }else {
            // if Edit origina, show Original values
            group = obTrxValue.getBusinessParameterGroup();
        }
        if(isRejected)
         group=obTrxValue.getStagingBusinessParameterGroup();
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

<body onload="MM_preloadImages('img/submit2.gif','img/close2a.gif')">
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Concentration Reports Parameters</h3></td>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><hr />
      </td>
    </tr>
    <tr>
      <td>

      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="8%">S/N</td>
              <td width="67%">Report Type</td>
              <td width="15%">Frequency of Generation&nbsp;<font color="#00AAFF">* </font></td>
              <td width="10%">Max Rows&nbsp;<font color="#00AAFF">* </font></td>
            </tr>
          </thead>
          <html:form action="MaintainConcReport.do?">
              <tbody>
              <%if(TrxId!=null) {%>
             <input type="hidden" name="TrxId" value=<%=TrxId%>>
             <%}%>
              <%
                  String parameterValue[] = new String[parametersArray.length];
                  String paramCode[] = new String[parametersArray.length];
                  String paramName[] = new String[parametersArray.length];
                  parameterValue =aForm.getParameterValues();
                  paramCode =aForm.getParameterCodes();
                  if(aForm.getParameterNames()!=null)
                  paramName=aForm.getParameterNames();
                  int j=0;
                  int errorForMaxRows=0;
                    for (int i = 0; i< parametersArray.length; i++)
                  {
                      errorForMaxRows=i+1;
                      IBusinessParameter parameter = parametersArray[i];
                    %>

              <tr class=<%=(j%2==0)?"odd":"even"%> >
              <html:hidden property="parameterCodes" value="<%=paramCode[i]%>"/>
              <html:hidden property="parameterNames" value="<%=paramName[i]%>"/>
              <%if(!paramCode[i].endsWith("maxrows")){%>
              <%j++;%>
              <td class="index"><%=j%></td>
              <td><integro:empty-if-null value="<%=paramName[i]%>"/>&nbsp;</td>
              <td>
                  <%



                    if( entries_editable ) {
                  if(parameterValue[i]!=null){

                  }   else{
                       parameterValue[i]="";
                  }
                  %>

                  <html:select property="parameterValues" value="<%=parameterValue[i]%>" style="width:150px" >
                    <option value="">Please Select</option>
                    <html:options name="timefrequency.values" labelName="timefrequency.labels"/>
                </html:select>   <font color="#FF0000" size="1"><%	String errorString = "parametersError" + i; %>
                    	<html:errors property="<%=errorString%>" /></font>

                   <%
                      }else{
                  %>
                    <%=parameterValue[i]%>
                   <html:hidden property="parameterValues" value="<%=parameterValue[i]%>"/>

                  <%
                      }
                  %>
                   </td>
                   <%if((i+1<parametersArray.length)) {%>
                        <%if(paramCode[i+1].endsWith("maxrows")){%>
                            <%if( entries_editable ) {%>
                              <%  if(parameterValue[i+1]!=null){

                  }   else{
                       parameterValue[i+1]="";
                  }    %>
                                <td><html:text size="3" property ="parameterValues" value="<%=parameterValue[i+1]%>"/> &nbsp;
                                 <font color="#FF0000" size="1"><%	String errorString1 = "parametersError" + errorForMaxRows; %>
                    	<html:errors property="<%=errorString1%>" /></font>
                                </td>
                            <%} else {%>
                                <td><integro:empty-if-null value="<%=parameterValue[i+1]%>"/>&nbsp;</td>
                            <%}%>
                        <%} else {%>
                            <td> &nbsp;</td>
                          <%}
                   } else {%>
                      <td> &nbsp;</td>
                   <%}%>
              </tr>
              <%
              }
              }
              %>



              </tbody>
         </table></td>
       </tr>
    </tbody>
  </table>
<table  width="71%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>

</thead>
<tbody>
<br>
              <%
                  if(isRejected ) {
                      %>
                      <tr>
                      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                          <tbody>
                            <tr>
                              <td width="43%" class="fieldname">Remarks</td>
                              <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
                            </tr>
                            <tr>
                              <td class="fieldname">Last Action By</td>
                              <td class="even"><%=obTrxValue.getUserInfo()%>&nbsp;</td>
                            </tr>
                            <tr class="odd">
                              <td class="fieldname">Last Remarks Made</td>
                              <td><integro:wrapper value='<%=(obTrxValue.getRemarks()==null || obTrxValue.getRemarks().equals("null")?" ":obTrxValue.getRemarks())%>' />&nbsp;</td>

                            </tr>


                      <%
                  }
              %>
  </tbody>
</table>
</td>
</tr>
</tbody>
</table>

</html:form>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="148">&nbsp;</td>
  </tr>
  <tr>
    <td>
        <%
        if( entries_editable ) {
        %>
        <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0"/> </a>
        <%
        }
        if( isRejected ) {
            %>
            <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
            <%
        }
        %>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

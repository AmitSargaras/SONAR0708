<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.constant.ICategoryEntryConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.IExemptFacility,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.OBExemptFacilityGroup,
                 com.integrosys.cms.app.creditriskparam.trx.exemptFacility.IExemptFacilityGroupTrxValue,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.IExemptFacilityGroup,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.OBExemptFacility,
                 java.util.Collection,
                 com.integrosys.base.techinfra.util.AccessorUtil,
                 java.util.List,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityUIHelper"%>
                 
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
**
* @author $Author$<br>
* @version $Revision: 1.1 $
* @since $Date: 2007/Mar/08 $
* Tag: $Name:  $
*/
%>
<%

    IExemptFacilityGroupTrxValue obTrxValue = (IExemptFacilityGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityAction.exemptFacilityTrxValue");
    IExemptFacility[] parametersArray=null;
    IExemptFacility[] stagingParametersArray=null;
    //IExemptFacility[] stagingParametersDel=null;
    IExemptFacilityGroup parameter;
    IExemptFacilityGroup staging;

    //IExemptFacility[] stagingJitu =null;
    //IExemptFacility[] actualJitu =null;

    if(obTrxValue != null) {
        staging = obTrxValue.getStagingExemptFacilityGroup();
        parameter = obTrxValue.getExemptFacilityGroup();

//        if (staging != null){
//            stagingJitu = staging.getExemptFacility();
//        }else{
//            System.out.println("staging is null and stagingJitu is null");
//        }

        if (parameter != null){
        	parametersArray = parameter.getExemptFacility();
        }else{
            System.out.println("parameter is null and actualRec is null");
        }

        if (staging != null) {
            stagingParametersArray = staging.getExemptFacility();
	
	        //IExemptFacility[] itemList = staging.getExemptFacility();
	        //Collection newList = new ArrayList();

	        //if (itemList != null)
	        //for (int ii=0; ii<itemList.length; ii++)
	        //{
	        //    if (!(ICMSConstant.STATE_DELETED.equals(itemList[ii].getStatus())))
	        //        newList.add(itemList[ii]);
	        //    System.out.println("itemList[ii].getStatus() = " + itemList[ii].getStatus());
	        //}
	        //stagingParametersDel = (OBExemptFacility[])newList.toArray(new OBExemptFacility[0]);
        }

       // System.out.println("stagingParametersDel = " + stagingParametersDel.length);

        int countStaging =0;
        if (stagingParametersArray !=null &&  stagingParametersArray.length >0 ) {
            countStaging =stagingParametersArray.length;
        }
        int countActual =0;
        if (parametersArray !=null &&  parametersArray.length >0 ) {
            countActual =parametersArray.length;
        }


        try {
            //System.out.println(">>>>>>>>>>>>>>>>>>>>>>>checker_exempt_facility.jsp [ Staging.length] = " +countStaging);
            //System.out.println(">>>>>>>>>>>>>>>>>>>>>>>checker_exempt_facility.jsp [ Actual.length ] = " +countActual);

            List compResult =CompareOBUtil.compOBArray(stagingParametersArray,parametersArray);
            ArrayList list = new ArrayList(compResult);
            
            ExemptFacilityUIHelper helper = new ExemptFacilityUIHelper();
        
        	List sortList = helper.getSortedExemptFacilityMap(compResult);
        
            pageContext.setAttribute("exemptFacList", sortList);
           
        } catch(Exception e) {
            DefaultLogger.debug(this, "<<<<<<>>>>>>>>> Error" + e);
            e.printStackTrace();
        }


    }

   
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
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

function approvePage() {
    document.forms[0].event.value="checker_approve";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].event.value="checker_reject";
    document.forms[0].submit();
}
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action="ExemptFacility.do">
<input type="hidden" name="event"/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index"/>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
    <td><h3><bean:message key="title.crp.exemptfac.list"/></h3></td>
</tr>
<tr>
    <td colspan="2"><hr /> </td>

</tr>
</thead>
</table>

<table id="tblExchange" width="95%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
<tr style="text-align:center">
    <td width="3%"><bean:message key="label.global.sno"/></td>
    <td width="12%"><bean:message key="label.crp.exemptfac.facility.desc"/></td>
    <td width="5%"><bean:message key="label.crp.exemptfac.facility.code"/></td>
    <td width="12%"><bean:message key="label.crp.exemptfac.status.exempted"/>&nbsp;/&nbsp;<bean:message key="label.crp.exemptfac.conditional.perc"/></td>
</tr>
</thead>
<tbody>
<logic:present name="exemptFacList">
  	<logic:empty name="exemptFacList" >
          <tr >
               <td colspan="5" align="center"><bean:message key="label.global.not.found"/>&nbsp;</td>
            </tr>
	</logic:empty>
        <logic:iterate id="result" name="exemptFacList"
                      indexId="counter"                   
                      type="com.integrosys.base.techinfra.diff.CompareResult">                
            <%
               IExemptFacility stage = (IExemptFacility) result.getObj();	
           %>
           <tr class='<%=((counter.intValue()+1)%2==0?"even":"odd")%>' >
               <td class="<%=result.getKey()%>"><%=counter.intValue()+1%></td>
                   <td style="text-align:center">
                       <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICategoryEntryConstant.FACILITY_DESCRIPTION, stage.getFacilityCode())%>"/> &nbsp;
                   </td>
                   <td style="text-align:center">
                       <integro:empty-if-null value="<%=stage.getFacilityCode()%>"/>&nbsp;
                   </td>
                   <td style="text-align:center">
                   <% if (ICMSConstant.EXEMPT_FACILITY_STATUS_EXEMPTED.equals(stage.getFacilityStatusExempted())) {%>
                       Exempted
                   <%}else{%>
                       <%=stage.getFacilityStatusConditionalPerc()%>
                   <%}%>
                   </td>
               </tr>
         </logic:iterate>
</logic:present>

 </tbody>
</table>

    <table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
    <br>
    <tr>
        <td>
	        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	            <tbody>
	                <tr>
	                    <td class="fieldname"><bean:message key="label.remarks"/></td>
	                    <td class="odd"><html:textarea property="remarks" rows="3" cols="120" /><br/>
	                        <html:errors property="remarks"/></td>
	                </tr>
	                <tr>
	                    <td class="fieldname"><bean:message key="label.last.action.by"/></td>
	                    <td class="even">&nbsp;<integro:empty-if-null value="<%=obTrxValue.getUserInfo()%>"/></td>
	                </tr>
	                <tr class="odd">
	                    <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
	                    <td>&nbsp;<integro:wrapper value="<%=obTrxValue.getRemarks()%>"/></td>
	                </tr>
	            </tbody>
	        </table>
        </td>
    </tr>
    </tbody>
    </table>

<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="89">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td width="70">&nbsp;</td>
</tr>
<tr>
    <td><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
</tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>
</html>
<%!
     public static boolean isExist(IExemptFacility[]  actual, long ID) {
        boolean check = false;
        List list = new ArrayList();
        if (ID == ICMSConstant.LONG_INVALID_VALUE){
            check = false;
        } else if (actual == null || actual.length == 0){
            check = false;
        } else {
            for (int index = 0; index < actual.length; index++) {
                IExemptFacility OB = actual[index];
                list.add(OB.getCmsRef() + "");
            }
        }
        if (list != null && !list.isEmpty()){
            if (list.contains(ID + "")){
                check = true;
            }
        }
        return check;
    }
%>
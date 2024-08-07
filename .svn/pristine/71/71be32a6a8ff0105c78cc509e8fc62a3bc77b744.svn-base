
<%@ page import="com.integrosys.cms.ui.otherbankbranch.*,
				com.integrosys.cms.app.systemBank.bus.ISystemBank,	
				com.integrosys.cms.app.checklist.bus.ICheckList"			
                 %>
<%@page import="com.integrosys.cms.app.checklist.trx.ICheckListTrxValue;"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<link href="../css/smartlender.css" rel="stylesheet" type="text/css" />

<%
	String context = request.getContextPath() + "/";
%>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
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
function submitForm() {


        document.forms[0].event.value = "submit";

        document.forms[0].submit();
//    }
}

<%
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.paripassu.MaintainPariPassuCheckListAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.paripassu.MaintainPariPassuCheckListAction.checkList");
   // System.out.println(checkList);
    if(checkList!=null)
        pageContext.setAttribute("checkList",checkList);
	int rowCount=0;
	int ind=1;
	boolean mulOrCons=false;
	String bankingMethod = (String) request.getAttribute("bankingMethod");
	if(bankingMethod==null){
		bankingMethod="";
	}
	System.out.println("bankingMethod : " + bankingMethod);
	if(bankingMethod.contains("MULTIPLE")||bankingMethod.contains("CONSORTIUM"))
		mulOrCons=true;
	IOtherBranch[] objOtherBank=(IOtherBranch[])request.getAttribute("otherbank");
	//System.out.println(objOtherBank.length);

	ISystemBank objSysBank=(ISystemBank)request.getAttribute("systembank");
	//System.out.println(objSysBank.getSystemBankName());
 	pageContext.setAttribute("otherBankData", objOtherBank);
 	pageContext.setAttribute("systemBankData", objSysBank);



%>

//-->
</script>
		<style type="text/css">
<!--
.hiddenDiv {
	display: none;
}

.visibleDiv {
	display: block;
	border: 1px grey solid;
}

.style1 {
	color: #FF0000
}

.style5 {
	color: #FF0000
}

.style11 {
	color: #FF0000
}
-->
</style>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action="/MaintainPariPassuCheckListAction" enctype="multipart/form-data">
	<input type="hidden" name="event"/>
		<body onload="showSpanCustodian()">

			<!-- InstanceBeginEditable name="Content" -->
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Maintain Pari Passu Checklist</h3></td>
      <td align="right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
  </thead>
  <tbody>
  <%if(!mulOrCons){%>
		<tr class="odd">
					<td colspan="10">
					<bean:message key="label.paripassu.notmulorcons" />
					</td>
		</tr>
<%}%>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      
        <table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
                <thead>
                    <tr>
                        <td width="10%">S/N</td>                          
                        <td width="55%">Branch Name</td>                        
                        <td width="55%">Bank Name</td>                
                    </tr>
                    </thead> 
                    <tbody>

					<%
					if(objSysBank!=null)
					{
					%>
					<tr class="even">

                               <td class="index"><%=ind++ %></td>
 							   <td><br/></td>                               
                               <td><%=objSysBank.getSystemBankName()%></td>
            				
                	</tr>
					<%
					}
					%>
		            <logic:iterate id="OB"  name="otherBankData" type="com.integrosys.cms.ui.otherbankbranch.IOtherBranch" indexId="counter">
                    <logic:notEmpty name="OB">
                	<%
															String rowClass = "";
																rowCount=counter.intValue()+1;
																		if (rowCount % 2 != 0) {
																			rowClass = "odd";
																		} else {
																			rowClass = "even";
																			}
					%>
                	<tr class="<%=rowClass%>">

                               <td class="index"><%=ind++ %></td>
                               <td><%=OB.getOtherBranchName()%></td>
                               <td><%=OB.getOtherBankCode().getOtherBankName() %></td>
            				
                	</tr>
                	</logic:notEmpty>
                	</logic:iterate>


                	
 </tbody>


      </table>
      <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>

    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
      
      
      </td>
    </tr>

</table>



			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>

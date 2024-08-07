<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays,
                 java.util.ArrayList,
                 java.util.Iterator,                 
                 com.integrosys.cms.app.rbicategory.bus.OBRbiCodeCategoryMs,
                 com.integrosys.cms.app.rbicategory.bus.OBRbiCodeCategory,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@page import="com.integrosys.cms.ui.rbicategory.RbiCategoryForm"%>                 

<%
	String context = request.getContextPath() + "/";
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
					
	ICommonUser commonUser = (ICommonUser)request.getAttribute("commonUser");
		
	
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function selectLists(){
    List = document.forms[0].rbiCodeCategorys;
    document.forms[0].appendRbiCodeCategoryList.value ="";
    Append = document.forms[0].appendRbiCodeCategoryList;
    //alert("Append==>"+Append);
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
        Append.value = List.options[i].value + "-" + Append.value;
        //alert(Append.value);
    }

}



function showSpanHub()   {
     	document.getElementById("linkedHub").style.visibility = "visible";
}

function hideSpanHub()   {
   document.getElementById("linkedHub").style.visibility = "hidden"; 
}

function showSpanCustodian()   {
	
	if(document.forms[0].isVault.checked==false){
		document.getElementById("cust1").className = "hiddenDiv";
		document.getElementById("cust2").className = "hiddenDiv";
		//document.getElementById("cust1").style.visibility = "hidden"; 
		// document.getElementById("cust2").style.visibility = "hidden"; 
		
		}else if(document.forms[0].isVault.checked==true){
			document.getElementById("cust1").className = "visibleDiv";
			document.getElementById("cust2").className = "visibleDiv";
		//	 document.getElementById("cust1").style.visibility = "visible"; 
		//	 document.getElementById("cust2").style.visibility = "visible"; 
			}
	 
     	//document.getElementById("custodian").style.visibility = "visible";
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
function cancelPage(){
    document.forms[0].action="rbi_category.do?event=redirect_list_rbi_category";
    document.forms[0].submit();
}
function submitForm() {
selectLists();
 	document.forms[0].action="rbi_category.do?event=maker_create_rbi_category";
   document.forms[0].submit();
}


//-->
</script>
<style type="text/css"><!--

.hiddenDiv {
	display: none;
	}
.visibleDiv {
	display: block;
	border: 1px grey solid;
	}
.style1 {color: #FF0000}
.style5 {color: #FF0000}
.style11 {color: #FF0000}
-->
</style>
<!-- InstanceEndEditable -->
</head>


<body>
<html:form action="/rbi_category">
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<!-- InstanceBeginEditable name="Content" -->

 <% ArrayList filterActualRbiCodeCatIds = new ArrayList();
 filterActualRbiCodeCatIds = (ArrayList)request.getAttribute("actualRbiCodeCatIds");

  %>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3>RBI Category Add</h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" id="choiceTable">

          <thead>
          </thead>
          <tbody>
          
            <tr class="odd">
             
              <td class="fieldname" width="20%">Industry Name<font color="#ff0000">*</font>
              
              </td>
              <td width="30%">
               <html:select name="RbiCategoryForm"   property="industryNameId"  >
                       <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_INDUSTRY%>"  />
               </html:select>
               &nbsp;<html:errors property="industryNameId"/>
              </td>
              <td class="fieldname" width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr class="even">
             

              <td class="fieldname" width="20%">RBI Code & Category <font color="#ff0000">*</font></td>
              <td width="30%">
									 <html:select name="RbiCategoryForm" size="10" multiple="multiple" style="width:260" property="allListrbiCodeCategory" >
						               
						               <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>" excludeList="<%=filterActualRbiCodeCatIds %>"  pleaseSelect="false" />
		                			</html:select> 
             		   <td>
		             		<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allListrbiCodeCategory,rbiCodeCategorys, false)" class="btnNormal"/>
			                <br/> <br/> 
							<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(rbiCodeCategorys,allListrbiCodeCategory,false)" class="btnNormal"/>
		               </td>
		               
		               <td>
		               
									 <html:select name="RbiCategoryForm" size="10" multiple="multiple" style="width:260" property="rbiCodeCategorys" >
		                			</html:select> 
		                			&nbsp;</br><html:errors property="rbiCodeCategorys"/>
		                		</td>
              
            </tr> 
 <html:hidden name="RbiCategoryForm" property="appendRbiCodeCategoryList" />        
 <html:hidden name="RbiCategoryForm" property="status" value="ACTIVE"/>
 <html:hidden name="RbiCategoryForm" property="createBy" value="<%=commonUser.getUserName() %>"/>
 <html:hidden name="RbiCategoryForm" property="lastUpdateBy" value="<%=commonUser.getUserName() %>"/>
 <html:hidden name="RbiCategoryForm" property="lastUpdateDate"/>
 <html:hidden name="RbiCategoryForm" property="creationDate"/>
 <html:hidden name="RbiCategoryForm" property="deprecated" value="N"/>
 <html:hidden name="RbiCategoryForm" property="id"/>

          </tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>

   <tr>
  
                    <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
        <!--          
  <td colspan="2">
  <center>
  <a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" 
				border="0" id="ImageSave" /></a>
				
				</center>
				&nbsp;
				</td>
				 -->   
			<td colspan="2">

						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;
					</td>
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</html:form>
</body>

<!-- InstanceEnd --></html>

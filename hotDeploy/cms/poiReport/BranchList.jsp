<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,
	java.util.List,
	com.integrosys.base.businfra.search.SearchResult,
	com.integrosys.base.uiinfra.tag.PageIndex,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.HashMap,java.util.Locale,java.util.Arrays,
	com.integrosys.cms.ui.systemBank.MaintainSystemBankForm"%>
<%

	SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.systemBankBranchList");
	if(sr!=null){
	 List systemBankBranchList = new ArrayList(sr.getResultList());
		pageContext.setAttribute("systemBankBranchList",systemBankBranchList);
	}
%>

<%@page import="com.integrosys.cms.app.systemBank.trx.ISystemBankTrxValue"%>
<html>
	<head>
	</head>

		<body>
			<!-- InstanceBeginEditable name="Content" -->

<%
    String event = request.getParameter("event");
    System.out.println("event" +event);
    int sno = 0;
    int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
%>




<html>
<head>

<title>Untitled Document</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

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
function createSystemBankBranch() {

 	document.forms[0].action="systemBankBranch.do?event=maker_prepare_create_systemBankBranch";
    document.forms[0].submit();
}
 function searchBranch()
	    {	
	    
		    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
			    {
					alert("Please Enter Value For Search" );
			    }	
		    else
			{    
	     
	        var searchText = document.getElementById("searchText").value;
	        var searchBy = document.getElementById("searchByCriteria").value;
	        
	      
	       
	      
	       document.forms[0].action="systemBank.do?event=maker_search_list_systemBankBranch&searchBy="+searchBy+"&searchText="+searchText;
    
    document.forms[0].submit();
			}
	    }

 function searchBankBranch()
 {	
	var BranchCode = document.getElementById("txtBranchCode").value;
    var BranchName = document.getElementById("txtBranchName").value;
    var State = document.getElementById("txtState").value;
    var City = document.getElementById("txtCity").value;
    
	    	document.forms[0].action  = "systemBank.do?event=maker_search_list_systemBankBranch&BranchCode="+BranchCode+"&BranchName="+BranchName+"&State="+State+"&City="+City;
		    document.forms[0].submit();
           
 }
 function searchBankBranchChecker()
 {	
	 var BranchCode = document.getElementById("txtBranchCode").value;
     var BranchName = document.getElementById("txtBranchName").value;
     var State = document.getElementById("txtState").value;
     var City = document.getElementById("txtCity").value;
    
	    	document.forms[0].action  = "systemBank.do?event=checker_search_list_systemBankBranch&BranchCode="+BranchCode+"&BranchName="+BranchName+"&State="+State+"&City="+City;
		    document.forms[0].submit();
           
 }
 function checkerSearchBranch()
 {	
 
	    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
		    {
				alert("Please Enter Value For Search" );
		    }	
	    else
		{    
  
     var searchText = document.getElementById("searchText").value;
     var searchBy = document.getElementById("searchByCriteria").value;
     
   
    
   
    document.forms[0].action="systemBankBranch.do?event=checker_search_list_systemBankBranch&searchBy="+searchBy+"&searchText="+searchText;

document.forms[0].submit();
		}
 }

 function uploadMasterFile() {
		document.forms[0].action="systemBankBranch.do?event=maker_prepare_upload_systemBankBranch";
	    document.forms[0].submit();
	}

 function addItems(){
	    var formObj = document.forms[0];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      if (type == 'radio') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
		      if (type == 'radio') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.itemID[j].value);
					temp = temp + "," + formObj.itemID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
		      if (type == 'radio') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.itemID.value);
					temp = temp + "," + formObj.itemID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
	    if(temp==""){
	        alert('Please select atleast one to save.');
	        return false;
	    }
		temp=temp.substring(1);
//		alert(temp);
		formObj.hiddenItemID.value=temp;
		return true;
	}

	function submitForm(){
		var isadded =addItems();
		if(isadded){
				formObj = document.forms["ReportForm"];
				formObj.event.value = "select_branch";
				formObj.submit();
		}else{
						return false;
		}
	}
	function canclePage(){
			formObj = document.forms["ReportForm"];
		    formObj.event.value = "cancleFilter";
		   	formObj.submit();
	}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="poiReport.do?">
<input type="hidden" name="hiddenItemID" />
<input type="hidden" name="event">

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
                    <table width="87%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3>System Bank Branch</h3></td>
                          <td width="18%" align="right" valign="bottom">
							
						  </td>
						  <td>&nbsp;</td>      
						<% //if (isEditAccess) { %>                    
                          
						<%// } else { %>
						  <td>&nbsp;</td>
						<%// } %>
                        </tr>
                        <tr>
                          <td colspan="4"><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="5%">S/N</td>
                                  <td width="16%">Branch Code</td>
                                  <td width="30%">Branch Name</td>
                                  <td width="16%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="systemBankBranchList">
                    <logic:iterate id="ob" offset="<%=String.valueOf(startIndex)%>" length="10" name="systemBankBranchList"  
                    indexId="counter" type="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch" scope="page">
                        <%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                           // boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
                        %>
                                <tr class="<%=rowClass%>">
                                  <td class="index"><%=counter.intValue()+1%></td>
                                   <td><%=ob.getSystemBankBranchCode()%>&nbsp;</td>
                                  <td><%=ob.getSystemBankBranchName()%>&nbsp;</td>
                                  <td>
                                  <input type="radio"  name="itemID" value="<%=counter.intValue()+1%>" />
                                  </td>
                                </tr>
                                </logic:iterate>
                                <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="4">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <% } %>
                </logic:present>
                <logic:notPresent name="systemBankBranchList">
                                <tr class="odd">
                                	<td colspan="4">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                              </tbody>
                            </table></td>
                        </tr>
                        <tr align="center">
    						<td colspan="4">
    						<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
							  <tr>
							    <td width="75">&nbsp;</td>
							    <td width="75">&nbsp;</td>
							  </tr>
							  <tr>
						    <td>
							    <a href="#" onClick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','img/submit2.gif',1)">
							    	<img src="img/submit1.gif" name="Image12" width="75" height="22" border="0" id="Image12" />
							    </a>
	   						</td>
    						 <td>
							    <a href="javascript:canclePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
									<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
								</a>
							  </td>
							  </tr>
							  <tr>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							  </tr>
							</table>
    						</td>
  						 </tr>
                      </tbody>
                    </table>
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
              <logic:present name="systemBankBranchList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="564" valign="middle">
                        
<!--                            Index:&nbsp;<integro:alphaindex url='<%="systemBankBranch.do?event=checker_list_pagination&loginId="%>' />-->
<!--                             -->
<!--                              Index:&nbsp;<integro:alphaindex url='<%="systemBankBranch.do?event=list_pagination&loginId="%>' />-->
                             
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        
                        <%
                            String pageIndexUrl = "poiReport.do?event=paginate_branch_list&startIndex=";
                        %>
                        
                        <td width="86" valign="middle">
                           &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(startIndex,10,sr.getNItems())%>'
                                url='<%=pageIndexUrl%>' />

                        </td>
                        
                      </tr>
                    </table>
                 </td>
              </tr>
              </logic:present>
</table>

</body>
</html:form>
</html>

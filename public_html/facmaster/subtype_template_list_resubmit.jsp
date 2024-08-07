<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.IDocumentItem,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.FacilityTypeList,
                 com.integrosys.cms.ui.common.FacilitySubTypeList,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicProperty,
                 com.integrosys.cms.app.chktemplate.bus.ITemplateItem,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicPropertySetup,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.List"%>
                   <%@page import="org.apache.struts.util.LabelValueBean"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/secmaster/chk_template_list_view.jsp,v 1.16 2006/10/27 08:47:34 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.16 $
 * @since $Date: 2006/10/27 08:47:34 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%
	HashMap facilityMap =(HashMap)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.facilityMap");
	System.out.println("facilityMap:"+facilityMap);
    ITemplateTrxValue secTrxVal =(ITemplateTrxValue)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.secTrxVal");
    ITemplate iTemplate = (ITemplate)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.template");

    String colType = iTemplate.getCollateralType();
    String subType = iTemplate.getCollateralSubType();
    String cc = colType;
    String ss = subType;
    String status = "";
    if (secTrxVal != null) {
        status = secTrxVal.getStatus();
       
    }
    FacilityTypeList list1 = FacilityTypeList.getInstance();
    //colType = list1.getFacilityTypeValue(colType,request.getLocale());
    //colType = list1.getFacilityTypeValue(colType,request.getLocale());
    FacilitySubTypeList list2 = FacilitySubTypeList.getInstance();
    subType = list2.getFacilitySubTypeValue(subType,request.getLocale());

    String lastActionBy = secTrxVal.getUserInfo();
    String remarks = secTrxVal.getRemarks();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

/*    if(iTemplate!=null)
        pageContext.setAttribute("iTemplate",iTemplate);*/
    int row = 0;

    ITemplateItem array[] = null;
//        System.out.println("Array Length staging"+secTrxVal.getStagingTemplate().getTemplateItemList().length);
    if(secTrxVal.getTemplate()==null){
        array = null;
    }else{
        array = secTrxVal.getTemplate().getTemplateItemList();
//        System.out.println("Array Length actual"+array.length);
    }
    
    String formNumber = "0";
    String event =(String)request.getParameter("event");
    System.out.println("##############$$$$$$$$$$$$$$$#############event="+event);
    ITemplateItem[] stagingItemList = secTrxVal.getStagingTemplate().getTemplateItemList();
    if(!(stagingItemList == null && array == null)) {
        List res = CompareOBUtil.compOBArray(secTrxVal.getStagingTemplate().getTemplateItemList(),array);
        System.out.println("res = " + res);
        ArrayList list = new ArrayList(res);
        pageContext.setAttribute("templates",list);
    }
    String colType1 = list1.getFacilityTypeValue(colType, request.getLocale());
    String subType1 = list2.getFacilitySubTypeValue(subType, request.getLocale());
	boolean isABCheck = false;
   
    //if (ss.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH) || ss.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_PLANT)){
    //	isABCheck = true ;
  //  }
    boolean isPTCheck = false;
    if(cc!=null&&!(cc.equals(""))){
    if (cc.equals(ICMSConstant.SECURITY_TYPE_PROPERTY)){
    	isPTCheck = true ;
    }
    }
    IDynamicPropertySetup[] dynamicPropertySetupList = null;
    int dynamicPropertySetupListSize = 0;
    int comlen1Size = 0;
    int comlen2Size = 0;
    if(isABCheck){
//	    dynamicPropertySetupList = (IDynamicPropertySetup[]) session.getAttribute("com.integrosys.cms.ui.secmaster.FacilityMasterAction.dynamicPropertySetupList");
//	    dynamicPropertySetupListSize = dynamicPropertySetupList.length;
//	    comlen1Size = dynamicPropertySetupList[0].getEntryCodes().length;
//	    comlen2Size = dynamicPropertySetupList[1].getEntryDescription().length;


    }
    
    String category=(String)request.getAttribute("facCategory");
    System.out.println("facCategory............"+category);
    if(category==null)
    	category="";
    String system=(String)request.getAttribute("facSystem");
    System.out.println("system............"+system);
    if(system==null)
    	system="";
    String type=(String)request.getAttribute("facType");
    System.out.println("facType............"+type);
    if(type==null)
    	type="";
    
List facilityCategoryList = (List)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.facilityCategoryList");
List facilityTypeList = (List)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.facilityTypeList");
List systemList = (List)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.systemList");
pageContext.setAttribute("facilityCategoryList",facilityCategoryList);
pageContext.setAttribute("facilityTypeList",facilityTypeList);
pageContext.setAttribute("systemList",systemList);
pageContext.setAttribute("facCategory",category);
pageContext.setAttribute("facType",type);
pageContext.setAttribute("facSystem",system);
%>




<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.HashMap"%><html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
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

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function refreshContent() {
	window.location="CollTemp(sscmaker,prop&res2).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="approve_template_item";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="reject_template_item";
    document.forms[0].submit();
}
function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}

	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}

	function MM_findObj(n, d) { //v4.0
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	  if(!x && document.getElementById) x=document.getElementById(n); return x;
	}

	function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}

	function refreshContent() {
		window.location="CollTemp(sscmaker,prop&res2).htm";
		//parent.location=".htm";
	}

	function gotopage(aLocation) {
		window.location = aLocation ;
	}

	function addNew(){
	    document.forms[0].event.value="add_facility_master_resubmit";
	    document.forms[0].submit();
	}

	function doEdit(act,ind) {
	    if(act=="1") {
	        document.forms[0].event.value="edit_item";
	        document.forms[0].index.value=ind;
	        document.forms[0].submit();
	    }
	}

	function remove(){
	    var formObj = document.forms[0];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'removeID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'removeID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.removeID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'removeID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.removeID.value;
				}
		      }
			}
		}
		temp=temp.substring(1);
//	    alert(temp);
	    if(temp==""){
	        alert('Please select items to remove.');
	        return false;
	    }
		formObj.removeIndex.value=temp;
	    document.forms[0].event.value="remove_item";
	    document.forms[0].submit();
	}

	function formCheckWithTitle() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'withTitleID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'withTitleID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.withTitleID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'withTitleID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.withTitleID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.withTitle.value=temp;
	}

	function formCheckMandatoryDisplay() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'tempDisplayID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'tempDisplayID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.tempDisplayID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'tempDisplayID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.tempDisplayID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.mandatoryDisplayID.value=temp;
	}


	function formCheckWithoutTitle() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'withoutTitleID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'withoutTitleID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.withoutTitleID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'withoutTitleID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.withoutTitleID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.withoutTitle.value=temp;
	}

	function formCheckCompletedProperty() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'completedPropertyID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'completedPropertyID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.completedPropertyID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'completedPropertyID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.completedPropertyID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.completedProperty.value=temp;
	}


	function formCheckUnderConstruction() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'underConstructionID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'underConstructionID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.underConstructionID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'underConstructionID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.underConstructionID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.underConstruction.value=temp;
	}

	function formCheckNewWithFBR() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'newWithFBRID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'newWithFBRID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.newWithFBRID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'newWithFBRID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.newWithFBRID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.newWithFBR.value=temp;
	}

	function formCheckNewWithoutFBR() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'newWithoutFBRID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'newWithoutFBRID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.newWithoutFBRID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'newWithoutFBRID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.newWithoutFBRID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.newWithoutFBR.value=temp;
	}

	function formCheckUsedWithoutFBR() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'usedWithoutFBRID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'usedWithoutFBRID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.usedWithoutFBRID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'usedWithoutFBRID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.usedWithoutFBRID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.usedWithoutFBR.value=temp;
	}


	function formCheckUsedWithFBR() {
	    var formObj = document.forms[<%=formNumber%>];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'usedWithFBRID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
	          if (type == 'checkbox' && name == 'usedWithFBRID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID[j].value);
					temp = temp + "," + formObj.usedWithFBRID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'usedWithFBRID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.removeID.value);
					temp = temp + "," + formObj.usedWithFBRID.value;
				}
		      }
			}
		}
//	    alert('j'+j);
		temp=temp.substring(1);
//	    alert(temp);
		formObj.usedWithFBR.value=temp;
	}

	function submitPage1() {
		formCheckWithTitle();
		formCheckMandatoryDisplay();
		formCheckWithoutTitle();
		formCheckUnderConstruction();
		formCheckCompletedProperty();
		formCheckUsedWithFBR();
		formCheckUsedWithoutFBR();
		formCheckNewWithFBR();
		formCheckNewWithoutFBR();
	    var formObj = document.forms[0];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox'  && name == 'tempID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox'  && name == 'tempID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
					temp = temp + "," + formObj.tempID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'tempID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
					temp = temp + "," + formObj.tempID.value;
				}
		      }
			}
		}
		temp=temp.substring(1);
		formObj.mandatoryID.value=temp;
	    <% if(ICMSConstant.STATE_REJECTED.equals(status)){ %>
	    document.forms[0].event.value="update_template_item";
	    <% } else {%>
	    document.forms[0].event.value="submit_template_item";
	    <% } %>
		if(document.forms[0].subFlag.value=="1") {
			document.forms[0].submit();
		}else{
			alert('There must be atleast one document item before submitting.');
			return false;
		}
	}

	function submitPage(comlen1Size,comlen2Size,dynamicPropertySetupListSize) {
		formCheckMandatoryDisplay();
		formCheckWithTitle();
		formCheckWithoutTitle();
		formCheckUnderConstruction();
		formCheckCompletedProperty();
		formCheckUsedWithFBR();
		formCheckUsedWithoutFBR();
		formCheckNewWithFBR();
		formCheckNewWithoutFBR();
	    var formObj = document.forms[0];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      var name = formObj.elements[i].name;
	      if (type == 'checkbox'  && name == 'tempID') {
			k++;
		  }
		}
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox'  && name == 'tempID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.tempID[j].value);
					temp = temp + "," + formObj.tempID[j].value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
	          var name = formObj.elements[i].name;
		      if (type == 'checkbox' && name == 'tempID') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.templateItemID.value);
					temp = temp + "," + formObj.tempID.value;
				}
		      }
			}
		}
	    alert('j'+j);
		temp=temp.substring(1);
		alert(temp);
		formObj.mandatoryID.value=temp;
		var allValue = submit2(comlen1Size,comlen2Size,dynamicPropertySetupListSize);
		formObj.checkBoxID.value=allValue;
//	 	alert(allValue);
//	 	return false;
	    <% if(ICMSConstant.STATE_REJECTED.equals(status)){ %>
	    document.forms[0].event.value="update_template_item";
	    <% } else {%>
	    document.forms[0].event.value="submit_template_item";
	    <% } %>

		if(document.forms[0].subFlag.value=="1") {
			document.forms[0].submit();
		}else{
			alert('There must be atleast one document item before submitting.');
			return false;
		}
	    //document.forms[0].submit();
	}

	function cancelPage() {
	    document.forms[0].event.value="prepare_sectype";
	    document.forms[0].submit();
	}

	function submit2(comlen1Size,comlen2Size,dynamicPropertySetupListSize){
		var formObj = document.forms[0];
		var allValue = "";
//	 	alert(comlen1Size+","+comlen2Size+","+dynamicPropertySetupListSize); 

	          for(var a=0; a<dynamicPropertySetupListSize; a++){
	          	if(a<1){
	          		for(var b=0; b<comlen1Size; b++){
	          		  for (var i=0; i<formObj.elements.length; i++) {
						var type = formObj.elements[i].type;
				        var name = formObj.elements[i].name;
				        var id = formObj.elements[i].id;
	          			if (type == 'checkbox' &&id==a&&name==b){
	          					var obj = formObj.elements[i];
	          					if (obj.checked) {
									allValue = allValue + "," + obj.title;
	          					}else{
	          						allValue = allValue + ","
	          					}
	          			}
	          		}
	          		allValue = allValue + "%" ;
	          	  }
				}
				else{
					for(var b=0; b<comlen2Size; b++){
						 for (var i=0; i<formObj.elements.length; i++){
						 	var type = formObj.elements[i].type;
				        	var name = formObj.elements[i].name;
				        	var id = formObj.elements[i].id;
						 	if (type == 'checkbox' &&id==a&&name==b){
	          					var obj = formObj.elements[i];
	          					if (obj.checked) {
									allValue = allValue + "," + obj.title;
	          					}else{
	          						allValue = allValue + ","
	          					}
	          				}
						 }
						 allValue = allValue + "%" ;
					}
				}
			}
	 // 	  	alert(allValue); 
		  	return allValue;
//	 	formObj.checkBoxID.value=allValue;
	}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="DocFacilityMaster" >
<input type="hidden" name="event" />
<input type="hidden" name="mandatoryID" />
<input type="hidden" name="mandatoryDisplayID" />
<input type="hidden" name="index" />
<input type="hidden" name="secType" value='<%=subType%>' />
<input type="hidden" name="subType" value='<%=subType%>'  />
<html:hidden property="secTypeDesc" value='<%=colType1%>'/>
<html:hidden property="subTypeDesc" value='<%=subType1%>'/>
<input type="hidden" name="withTitle" />
<input type="hidden" name="withoutTitle" />
<input type="hidden" name="completedProperty" />
<input type="hidden" name="underConstruction" />
<input type="hidden" name="newWithFBR" />
<input type="hidden" name="usedWithoutFBR" />
<input type="hidden" name="newWithoutFBR" />
<input type="hidden" name="usedWithFBR" />
<input type="hidden" name="removeIndex" />
<input type="hidden" name="checkBoxID" />
<input type="hidden" name="facilityCategoryList" />
<input type="hidden" name="facilityTypeList" />
<input type="hidden" name="systemList" />
<input type="hidden" name="facilityCategory" />
<input type="hidden" name="facilityType" />
<input type="hidden" name="system" />

<!-- InstanceBeginEditable name="Content" -->

 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:10px">
 </table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
  <td colspan="2">
 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:10px">
 
 <tr>
      <TD colSpan=4 width="100%"> <h3><%=ss%> ( <%if(facilityMap!=null){ %><%=facilityMap.get(ss)%><%} %>  )</h3></td>
       </tr>
 <tr><td class="fieldname" >Facility Category</td>
                        <%-- <td>
                        <html:select   name="DocFacilityMasterForm"   property="facilityCategory" styleId="facilityCategory">
												 <html:option value=""> Please Select </html:option> 
                         <%
                         if(null!=category||!"".equalsIgnoreCase(category)){
                         for(int i=0;i<facilityCategoryList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)facilityCategoryList.get(i);
                         if(labelValueBean.getValue().equals(category)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <%
                        }
						}}else{%> 
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="facilityCategoryList" labelProperty="label" property="value"  />
                        <%} %> 
                       				                    </html:select>
                        </td> --%>
                        
                        <td>
                        <%if(category != null){%>
                        <input name="DocFacilityMasterForm" id="facCategory" property="facilityCategory" value="<%=category%>" readOnly/>
                        <%}else{ %>
                        <input name="DocFacilityMasterForm" id="facCategory" property="facilityCategory" value="" readOnly/>
                        <%} %>
                        </td>
                        
                         <td class="fieldname" >Facility Type</td>
                        <%-- <td>
                      						
<html:select  styleId="facType" name="DocFacilityMasterForm"   property="facilityType" >
<<html:option value=""> Please Select </html:option>
                        <%
                        
                         if(null!=type||!"".equalsIgnoreCase(type)){
                        	 
                         for(int i=0;i<facilityTypeList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)facilityTypeList.get(i);

                         System.out.println("inside..facilityType..labelValueBean.........."+labelValueBean.getValue()+"type.."+type);
                         if(labelValueBean.getValue().equals(type)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}else{%> 
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="facilityTypeList" labelProperty="label" property="value"  />
                          <%} %>
                        </html:select>
                        </td> --%>
                        
                        
                        <td>
                         <%if(type != null){%>
                        <input name="DocFacilityMasterForm" id="facType" property="facilityType" value="<%=type%>" readOnly/>
                        <%}else{ %>
                        <input name="DocFacilityMasterForm" id="facType" property="facilityType" value="" readOnly/>
                        <%} %>
                        </td>
                        
                        </tr>
                        
                        <tr><td class="fieldname">System</td>
                        <%-- <td>
                       <html:select styleId="facSys" name="DocFacilityMasterForm"   property="system" >
					  <html:option value=""> Please Select </html:option>
                        <%
                       
                         if(null!=system||!"".equalsIgnoreCase(system)){
                        	 
                         for(int i=0;i<systemList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)systemList.get(i);
                         
                         System.out.println("inside..system......labelValueBean......"+labelValueBean+"system...."+system);
                         if(labelValueBean.getValue().equals(system)){%>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}else{%> 
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="systemList" labelProperty="label" property="value"  />
                            <%} %> 
											   </html:select>
                        </td> --%>
                        
                        <td>
                        <%if(system != null){%>
                        <input name="DocFacilityMasterForm" id="facSys" property="system" value="<%=system%>" readOnly/>
                        <%}else{ %>
                        <input name="DocFacilityMasterForm" id="facSys" property="system" value="<%=system%>" readOnly/>
                        <%} %>
                        </td>
                        
                        
                        </tr>
 
 

  </table>
  </td>
  </tr>
  </thead>
  </table>
  
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
     <td> &nbsp;</td>
       <td valign="bottom"><table width="75"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="75" valign="baseline" align="center"><input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
			</td>
			<td width="4" valign="baseline" align="center">&nbsp;</td>
            <td width="75" valign="baseline" align="center"><input type="button" name="Submit" value="Remove" class="btnNormal" onclick="remove()"/>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td <%if(isABCheck){ %> width="4%" <%}else{ %>width="4%"<%} %>>S/N</td>
			  <td <%if(isABCheck){ %>width="5%" <%}else{ %>width="10%"<%} %> >Critical</td>
			  <td <%if(isABCheck){ %>width="5%" <%}else{ %>width="10%"<%} %> >Mandatory</td>
			  <td <%if(isABCheck){ %>width="10%" <%}else{ %>width="10%"<%} %> >Doc Code</td>
			  <td <%if(isABCheck){ %>width="15%" <%}else{ %>width="44%"<%} %> >Description</td>
			  <td <%if(isABCheck){ %>width="10%" <%}else{ %>width="20%"<%} %> >Tenure</td>
<!--			  <%if(isABCheck){ %>-->
<!--			  <td width="30%">Goods Status</td>-->
<!--			  <%} %>-->
<!--			  <%if(isPTCheck){ %>-->
<!--              <td width="50%">Conditions</td>-->
<!--              <%} %>-->
<td width="10%" >Delete</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="templates"  >
   <logic:iterate id="compResult" name="templates"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
    ITemplateItem OB = (ITemplateItem) compResult.getObj();
    String rowClass = "";
    row++;
    if (row % 2 != 0) {
        rowClass = "odd";
    } else {
        rowClass = "even";
    }
    String isPreApprove = "N";
    if(OB.getItem().getIsPreApprove()){
    	isPreApprove = "Y";
    }
    boolean checked = false;
    if (OB.getIsMandatoryInd()) {
        checked = true;
    }
    boolean checkedDisplay = false;
    if(OB.getIsMandatoryDisplayInd()){
    	checkedDisplay= true;
    }
    int propertySetupID = 0;
    String propertyValue = "PBT";
    IDynamicProperty[] propertyList =null; 
    if(OB.getItem().getPropertyList()!=null){
    	propertyList = OB.getItem().getPropertyList();
    }
    
    boolean withTitle = false;
    boolean withoutTitle = false;
    boolean underConstruction = false;
    boolean completedProperty = false;
    
    boolean usedWithFBR = false;
    boolean usedWithoutFBR = false;
    boolean newWithFBR = false;
    boolean newWithoutFBR = false;
    
    if(OB.getWithTitle()){
    	withTitle = true;
    }
    if(OB.getWithoutTitle()){
    	withoutTitle = true;
    }
    if(OB.getUnderConstruction()){
    	underConstruction = true;
    }
    if(OB.getPropertyCompleted()){
    	completedProperty = true;
    }
    
    if (OB.getNewWithFBR()){
    	newWithFBR = true;
    }
    
    if (OB.getNewWithoutFBR()){
    	newWithoutFBR = true;
    }
    
    if (OB.getUsedWithFBR()){
    	usedWithFBR = true;
    }
    
    if (OB.getUsedWithoutFBR()){
    	usedWithoutFBR = true;
    }
%>
     <tr class=<%=rowClass%>>
              <td class='<bean:write name="compResult" property="key" />'><%=row%></td>
              <td style="text-align:center"><input name="tempID" type="checkbox" value="<%=row-1%>" <%if(checked){ %> checked <% } %>  />
              </td>
              <td style="text-align:center"><input name="tempDisplayID" type="checkbox" value="<%=row-1%>" <%if(checkedDisplay){ %> checked <% } %>  />
              </td>
              <td>&nbsp;<bean:write name="compResult" property="obj.item.itemCode" /></td>
              <td>&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
              <td>&nbsp;<%=OB.getItem().getTenureCount()%> &nbsp; <integro:common-code-single  entryCode="<%=OB.getItem().getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" display="true" descWithCode="false" /></td>
<!--             <%if(isABCheck){ %>-->
<!--              <td nowrap>-->
<!--          		<input name="newWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithFBR){ out.print(" Checked "); }%> DISABLED/>New With FBR-->
<!--          		<input name="newWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithoutFBR){ out.print(" Checked "); }%> DISABLED/>New Without FBR-->
<!--          		<input name="usedWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithFBR){ out.print(" Checked "); }%> DISABLED/>Used With FBR-->
<!--          		<input name="usedWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithoutFBR){ out.print(" Checked "); }%> DISABLED/>Used Without FBR-->
<!--          	</td>-->
<!--          	<%} %>-->
<!--          	  <%if(isPTCheck) {%>-->
<!--          	<td nowrap>-->
<!--          		<input name="withTitleID" type="checkbox" value="<%=(row-1)%>" <%if(withTitle){ out.print(" Checked "); }%> DISABLED/>With Title-->
<!--          		<input name="withoutTitleID" type="checkbox" value="<%=(row-1)%>" <%if(withoutTitle){ out.print(" Checked "); } %> DISABLED/>Without Title-->
<!--          		<input name="completedPropertyID" type="checkbox" value="<%=(row-1)%>" <%if(completedProperty){ out.print(" Checked "); }%> DISABLED/>Completed Property-->
<!--          		<input name="underConstructionID" type="checkbox" value="<%=(row-1)%>" <%if(underConstruction){ out.print(" Checked "); }%> DISABLED/>Under Construction-->
<!--          	</td>-->
<!--          <%} %>	-->
 <td style="text-align:center" height="18" >
 <%if(!(compResult.getKey().equals("indexdel"))){ %>
 <input name="removeID" type="checkbox" value="<%=(row-1)%>" />
  <%}else{ %>
  &nbsp;
  <%} %>
 </td>
            </tr>       
</logic:iterate>
</logic:present>

<logic:notPresent name="templates"  >
            <tr class="odd">
              <td colspan="8"><bean:message key="label.global.not.found"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%if(row==0) { %> 
	<input type="hidden" name="subFlag" value="0" >
<% }else{ %>
	<input type="hidden" name="subFlag" value="1" >
<%} %>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
    <tr>
      <td class="fieldname">Remarks</td>
      <td class="odd"><textarea name="remarks" rows="4" cols="90"></textarea>
      </br><html:errors property="templateRemarksError"></html:errors></td>
    </tr>
    <tr>
      <td class="fieldname">Last Action By</td>
      <td class="even">&nbsp;<%=lastActionBy%></td>
    </tr>
    <tr class="odd">
      <td class="fieldname">Last Remarks Made</td>
      <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
    </tr>
  </tbody>
</table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
   <tr>
    <td width="100" valign="baseline" align="center"> <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/submit2.gif',1)" 
    <%if(isABCheck){ %> onClick="submitPage('<%=comlen1Size %>','<%=comlen2Size %>','<%=dynamicPropertySetupListSize %>')"<%}else { %>
    onClick="submitPage1()"<%} %> ><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>
    <%if(ICMSConstant.STATE_REJECTED.equals(status)) { %>
    <td width="100" valign="baseline" align="center"><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
    <%}else{ %>
    <td width="100" valign="baseline" align="center"> <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4411','','img/cancel2.gif',1)" 
    onClick="cancelPage()" ><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%} %>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
        <td width="100%" align="left"><span class="errormsg">*Expired item will not be shown</span></td>
    </tr>
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

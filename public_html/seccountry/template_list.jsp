<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicPropertySetup,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicProperty,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.seccountry.SecurityCountryForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ITemplateTrxValue itemTrxVal = (com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue) session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.itemTrxVal");
    ITemplate iTemplate = (ITemplate) session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.template");
    String remarks = "";
    String lastActionBy = "";
    if (iTemplate != null)
        pageContext.setAttribute("iTemplate", iTemplate);
    int row = 0;
    String status = "";
    if (itemTrxVal != null) {
        status = itemTrxVal.getStatus();
        remarks = itemTrxVal.getRemarks();
        lastActionBy = itemTrxVal.getUserInfo();
    }

    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";


    String cCode = "";
    String cName = "";
    if (iTemplate != null) {
        cCode = iTemplate.getCountry();
        CountryList cList = CountryList.getInstance();
        cName = cList.getCountryName(cCode);
    }
    if (cName.equals("")) {
        SecurityCountryForm aForm = (SecurityCountryForm) request.getAttribute("SecurityCountryForm");
        cName = aForm.getCountryName();
    }

    String colType = iTemplate.getCollateralType();
    String subType = iTemplate.getCollateralSubType();
    String cc = colType;
    String ss = subType;
//    System.out.println("Col Type"+colType);
//    System.out.println("Sub Type"+subType);
    SecurityTypeList list1 = SecurityTypeList.getInstance();

    colType = list1.getSecurityTypeValue(colType, request.getLocale());
    SecuritySubTypeList list2 = SecuritySubTypeList.getInstance();
    subType = list2.getSecuritySubTypeValue(subType, request.getLocale());
    
    String formNumber = "1";
    String frame = (String) session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.frame");
    if(frame != null){
	    	if (!frame.equals("true")) {
	        formNumber = "0";
    	}
    }
    
    boolean isABCheck = false;
   
    if (ss.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH) || ss.equals(ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_PLANT)){
    	isABCheck = true ;
    }
    
    boolean isPTCheck = false;
    
    if (cc.equals(ICMSConstant.SECURITY_TYPE_PROPERTY)){
    	isPTCheck = true ;
    }
    
    IDynamicPropertySetup[] dynamicPropertySetupList = null;
    int dynamicPropertySetupListSize = 0;
    int comlen1Size = 0;
    int comlen2Size = 0;
    
    if(isABCheck){
	    dynamicPropertySetupList = (IDynamicPropertySetup[]) session.getAttribute("com.integrosys.cms.ui.secmaster.SecurityMasterAction.dynamicPropertySetupList");
	    if (dynamicPropertySetupList != null) {
	    	dynamicPropertySetupListSize = dynamicPropertySetupList.length;
	    	if(dynamicPropertySetupListSize!=0){
	    		comlen1Size = dynamicPropertySetupList[0].getEntryCodes().length;
		    	comlen2Size = dynamicPropertySetupList[1].getEntryDescription().length;
	   	}
	    }
    }
    
   
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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


function refreshContent() {
	window.location="CCDocTemp(sscmaker,cty=hk).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

<%--
function addNew(){
    document.forms[1].event.value="add_template_list";
    document.forms[1].submit();
}
--%>

function create(){
    formObj = document.forms[<%=formNumber%>];
    formObj.event.value="create_item";
    formObj.submit();
}

function edit(ind) {
    formObj = document.forms[<%=formNumber%>];
	formObj.event.value="edit_item";
	formObj.index.value=ind;
	formObj.submit();
}

function remove() {
    var formObj = document.forms[<%=formNumber%>];
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.removeID.value;
			}
	      }
		}
	}
//    alert('j'+j);
    if(temp=="") {
        alert('Please select the records to remove.');
        return false;
    }
    temp=temp.substring(1);
    formObj.event.value="remove";
	formObj.removeIndex.value=temp;
    formObj.submit();

}

function formCheck1(){
    var formObj = document.forms[<%=formNumber%>];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check1') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check1') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.check1[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check1') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.check1.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.mandatoryRows.value=temp;
}

function formCheck2() {
    var formObj = document.forms[<%=formNumber%>];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check2') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check2') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.check2[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check2') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.check2.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.checkedInVault.value=temp;
}

function formCheck3() {
    var formObj = document.forms[<%=formNumber%>];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check3') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check3') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.check3[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check3') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.check3.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.checkedExtCustodian.value=temp;
}
function formCheck4() {
    var formObj = document.forms[<%=formNumber%>];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check4') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check4') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.check4[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check4') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.check4.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.checkedAudit.value=temp;
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.withTitleID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.withTitle.value=temp;
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.withoutTitleID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.completedPropertyID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.underConstructionID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.newWithFBRID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.newWithoutFBRID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.usedWithoutFBRID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
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
//				alert(formObj.removeID[j].value);
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
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.usedWithFBRID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.usedWithFBR.value=temp;
}

function checkMutEx(){
    var formObj = document.forms[<%=formNumber%>];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check2') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check2') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				if(formObj.check3[j].checked) {
					alert('InVault and Ext Custodian are Mutually Excluisve');
					return false;
				}
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check2') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
				if(formObj.check3.checked) {
					alert('InVault and Ext Custodian are Mutually Excluisve');
					return false;
				}
			}
	      }
		}
	}
	return true;

}

function submitForm(comlen1Size,comlen2Size,dynamicPropertySetupListSize) {
    var formObj = document.forms[<%=formNumber%>];
		formCheck1();
		formCheck2();
		formCheck4();
		formCheckWithTitle();
		formCheckWithoutTitle();
		formCheckUnderConstruction();
		formCheckCompletedProperty();
		formCheckUsedWithFBR();
		formCheckUsedWithoutFBR();
		formCheckNewWithFBR();
		formCheckNewWithoutFBR();
		
		var allValue = submit2(comlen1Size,comlen2Size,dynamicPropertySetupListSize);
		formObj.checkBoxID.value=allValue;
		<% if(ICMSConstant.STATE_REJECTED.equals(status)){ %>
		formObj.event.value="update";
		<% } else {%>
		formObj.event.value="submit";
		<% } %>
		if(formObj.subFlag.value=="1") {
			formObj.submit();
		}else{
			alert('There must be atleast one document item before submitting.');
			return false;
		}
		//formObj.submit();
}

function goCancel() {
    var formObj = document.forms[<%=formNumber%>];
    formObj.event.value="cancel";
    formObj.submit();

}

function submit2(comlen1Size,comlen2Size,dynamicPropertySetupListSize){
	var formObj = document.forms[<%=formNumber%>];
	var allValue = "";
// 	alert(comlen1Size+","+comlen2Size+","+dynamicPropertySetupListSize); 

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
//  	  	alert(allValue); 
	  	return allValue;
// 	formObj.checkBoxID.value=allValue;
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<html:form action="SecurityCountry" >
<input type="hidden" name="event" />
<%-- for check boxes--%>
<input type="hidden" name="mandatoryRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />
<input type="hidden" name="checkBoxID" />
<input type="hidden" name="withTitle" />
<input type="hidden" name="withoutTitle" />
<input type="hidden" name="completedProperty" />
<input type="hidden" name="underConstruction" />
<input type="hidden" name="newWithFBR" />
<input type="hidden" name="usedWithoutFBR" />
<input type="hidden" name="newWithoutFBR" />
<input type="hidden" name="usedWithFBR" />
<input type="hidden" name="subType1" value="<%=ss%>" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />

<html:hidden property="secTypeDesc" value='<%=colType%>'/>
<html:hidden property="subTypeDesc" value='<%=subType%>'/>

<%--to display correct country name--%>
<html:hidden property="countryCode" />
<html:hidden property="countryName" />
<html:hidden property="secType" />
<html:hidden property="subType" />



<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td width="90%"> <h3><%=colType%> (<%=subType%>)</h3></td>
          <td valign="baseline" align="left" style="padding-right:5px">
            <input type="button" name="Submit2" value="Create" class="btnNormal" onclick="create()"/>
            <%--<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>--%>
          </td>
          <td valign="baseline" align="right">
            <input type="button" name="Submit" value="Remove" class="btnNormal" onclick="remove()"/>
          </td>
    </tr>
    <tr>
      <td colspan="3"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="3">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
           <tr>
              <td <%if(isABCheck){ %> width="4%" <%}else{ %>width="3%"<%} %> >S/N</td>
              <td <%if(isABCheck){ %> width="5%" <%}else{ %>width="8%"<%} %> >Mandatory</td>
              <td <%if(isABCheck){ %> width="4%" <%}else{ %>width="6%"<%} %> >Code</td>
              <td <%if(isABCheck){ %> width="10%" <%}else{ %>width="30%"<%} %> >Description</td>
              <td <%if(isABCheck){ %> width="5%" <%}else{ %>width="8%"<%} %> >Pre-Approval Document</td>
              <td <%if(isABCheck){ %> width="5%" <%}else{ %>width="8%"<%} %> >Type</td>
              <td <%if(isABCheck){ %> width="5%" <%}else{ %>width="8%"<%} %> >To Vault</td>
              <%if(isABCheck){ %>
			  <td width="30%">Goods Status</td>
              <%} %>
              <%if(isPTCheck){ %>
              <td width="50%">Conditions</td>
              <%} %>
              <td <%if(isABCheck){ %> width="8%" <%}else{ %>width="10%"<%} %> >Expiry Date</td>
              <td <%if(isABCheck){ %> width="8%" <%}else{ %>width="11%"<%} %> >Action</td>
              <td <%if(isABCheck){ %> width="8%" <%}else{ %>width="11%"<%} %> >Delete</td>
            </tr>
          </thead>
          <tbody>
		<logic:present name="iTemplate" property="templateItemList" >
   <logic:iterate id="OB" name="iTemplate"  property="templateItemList" type="com.integrosys.cms.app.chktemplate.bus.ITemplateItem"  >
<%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    boolean inherited = false;
    boolean fromGlobal = false;
    boolean mandatory = false;
    boolean inVault = false;
    boolean extCustodian = false;
    boolean audit = false;
    boolean withTitle = false;
    boolean withoutTitle = false;
    boolean underConstruction = false;
    boolean completedProperty = false;
    boolean usedWithFBR = false;
    boolean usedWithoutFBR = false;
    boolean newWithFBR = false;
    boolean newWithoutFBR = false;
    

    if(OB.isInherited()){
        inherited = true;
    }
    if(OB.isFromGlobal()){
        fromGlobal = true;
    }
    if(OB.getIsMandatoryInd()){
        mandatory = true;
    }
    if(OB.getIsInVaultInd()){
        inVault = true;
    }
    if(OB.getIsExtCustInd()){
        extCustodian = true;
    }
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
    if(OB.getIsAuditInd()){
        audit = true;
    }
    if (OB.getNewWithFBR())
    {
    	newWithFBR = true;
    }
    if (OB.getNewWithoutFBR())
    {
    	newWithoutFBR = true;
    }
    if (OB.getUsedWithFBR())
    {
    	usedWithFBR = true;
    }
    if (OB.getUsedWithoutFBR())
    {
    	usedWithoutFBR = true;
    }
    String isApproval = "N";
    if(OB.getItem().getIsPreApprove()){
    	isApproval = "Y";	
    }
    
    IDynamicProperty[] propertyList =null; 
    if(OB.getItem().getPropertyList()!=null){
    	propertyList = OB.getItem().getPropertyList();
    }

   %>
        <tr class="<%=rowClass%>">
          <td class="index" ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> />
            <%}%>
          </td>
          <td >&nbsp;<bean:write name="OB" property="item.itemCode" /></td>
          <td height="18" >&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
          <td style="text-align:center"><%=isApproval %></td>
      	  <td style="text-align:center" nowrap>
      		<%java.util.Iterator iter = OB.getItem().getCMRDocAppItemList().iterator(); 
          	while (iter.hasNext())
          	{
          		com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem docAppItem = (com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem) iter.next();
          %>
          	&nbsp;<integro:common-code display="true" categoryCode="APPLICATION_TYPE" descWithCode="false" entryCode="<%=docAppItem.getAppType()%>" />
          	<br>
          <%
          	}
          %>      	</td>
          <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%> /></td>
        
          	 <%if(isABCheck) {%>
          	<td nowrap>
          		<input name="newWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithFBR){ out.print(" Checked "); }%>/>New With FBR
          		<input name="newWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithoutFBR){ out.print(" Checked "); }%> />New Without FBR
          		<input name="usedWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithFBR){ out.print(" Checked "); }%>/>Used With FBR
          		<input name="usedWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithoutFBR){ out.print(" Checked "); }%>/>Used Without FBR
          	</td>
          <%} %>
          <%if(isPTCheck) {%>
          	<td nowrap>
          		<input name="withTitleID" type="checkbox" value="<%=(row-1)%>" <%if(withTitle){ out.print(" Checked "); }%>/>With Title
          		<input name="withoutTitleID" type="checkbox" value="<%=(row-1)%>" <%if(withoutTitle){ out.print(" Checked "); }%>/>Without Title
          		<input name="completedPropertyID" type="checkbox" value="<%=(row-1)%>" <%if(completedProperty){ out.print(" Checked "); }%>/>Completed Property
          		<input name="underConstructionID" type="checkbox" value="<%=(row-1)%>" <%if(underConstruction){ out.print(" Checked "); }%> />Under Construction
          	</td>
          <%} %>	        	  
          <!--  <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>/></td> -->
          <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getItem().getExpiryDate())%></td>
          <td style="text-align:center">&nbsp;
          <%if(!(inherited || fromGlobal)) { %>
            <a href="#" onClick="edit('<%=(row-1)%>')">Edit</a>
            <% } %>
          </td>
          <td style="text-align:center" height="18" >&nbsp;
          <%if(!(inherited || fromGlobal)) { %>
            <input name="removeID" type="checkbox" value="<%=(row-1)%>" />
          <% } %>
          </td>
        </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="iTemplate" property="templateItemList" >
            <tr class="odd">
              <td colspan="10">There is no document</td>
            </tr>
</logic:notPresent>
<%if(row==0) { %> 
	<input type="hidden" name="subFlag" value="0" >
<% }else{ %>
	<input type="hidden" name="subFlag" value="1" >
<% }%>

          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>
<%if(ICMSConstant.STATE_REJECTED.equals(status)){ %>
<p/>
<p/>
<p/>
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="90"></textarea></td>
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
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)" onClick="submitForm('<%=comlen1Size %>','<%=comlen2Size %>','<%=dynamicPropertySetupListSize %>')" ><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>
    <td width="100" valign="baseline" align="center"> <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)" ><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<%}else{ %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)" onClick="submitForm('<%=comlen1Size %>','<%=comlen2Size %>','<%=dynamicPropertySetupListSize %>')" ><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>
    <td width="100" valign="baseline" align="center"> <a href="#" onclick = "goCancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)" ><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" >   
    <tr>
        <td width="100%" align="left"><span class="errormsg">*Expired item will not be shown</span></td>
    </tr>
</table>

<% } %>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

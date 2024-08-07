
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.segmentWiseEmail.SegmentWiseEmailForm,
	com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.*,
	java.util.Locale,
	java.util.Arrays,
	com.integrosys.cms.app.segmentWiseEmail.trx.ISegmentWiseEmailTrxValue,
	com.integrosys.cms.app.segmentWiseEmail.trx.OBSegmentWiseEmailTrxValue"%>
<%
	SegmentWiseEmailForm segmentWiseEmailForm = (SegmentWiseEmailForm) request.getAttribute("SegmentWiseEmailForm");
	
	int sno = 0;
	int startIndex = 0;
	int counter = 0;
	
	List emailList = null;
	emailList = (ArrayList) request.getAttribute("emailList");
	pageContext.setAttribute("emailList", emailList);
	
	List allEmailList = null;
	allEmailList = (ArrayList) request.getAttribute("allEmailList");
	
	System.out.println("<<<<<<<<<Size>>>>>>>>> "+allEmailList.size());
	pageContext.setAttribute("allEmailList", allEmailList);
	
	String event = request.getParameter("event");


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
	var emaillist=new Array();
	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}

	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}

	function cancelPage() {
		document.forms[0].action="ToDo.do?event=prepare";
		document.forms[0].submit();
	}
	
	function submitForm() {
		
		var formObj = document.forms[0];
		var k = 0;
		var temp = "";
		  
		for (var i = 0; i < formObj.elements.length; i++) {
			var type = formObj.elements[i].type;
			var name = formObj.elements[i].name;
		    if (type == 'checkbox' && name == 'removeEmail') {
		            k++;
		    }
		}
		 
		var j = 0;
		if (k > 1) {
			for (var i = 0; i < formObj.elements.length; i++) {
		    	var type = formObj.elements[i].type;
		        var name = formObj.elements[i].name;
		        if (type == 'checkbox' && name == 'removeEmail') {
		           var obj = formObj.elements[i];
		           if ((obj.checked)) { 				
		              temp = temp + "," + formObj.removeEmail[j].value;
		           }
		           j++;
		        }
		    }
		} 
		else {
		       for (var i = 0; i < formObj.elements.length; i++) {
		          var type = formObj.elements[i].type;
		          var name = formObj.elements[i].name;
		          if (type == 'checkbox' && name == 'removeEmail') {
		            var obj = formObj.elements[i];
		            if ((obj.checked)) {          
		              temp = temp + "," + formObj.removeEmail.value;
		            }
		          }
		      }
		}
		
		if (temp == "") {
		   alert('Please select Email ID to delete');
		}else{
		    var r=confirm("Are you sure you want to delete the selected Email IDs ?");
		    if(r==true){
				var removeEmailList = temp.substring(1);
				 //alert(" "+removeEmailList);
				document.forms[0].action="segmentWiseEmail.do?event=maker_confirm_resubmit_delete&removeEmailList="+removeEmailList;
				document.forms[0].submit();
		    }
		 } 
	}
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='segmentWiseEmail.do'>
	<html:hidden property="startIndex" />
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="60%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<tr>
					<td>
						<br>
						<h4>Delete Segment wise Email ID Mapping</h4>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblInput">
							<thead>
							</thead>
							<tbody>
								<tr class="odd">
									<td class="fieldname" width="20%">Segment</td>
									<td width="100%"><%=segmentWiseEmailForm.getSegment()%></td>
								</tr>
								
		  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
              
            <tr >
                <td colspan="3" valign="top" style="height:100%;width:100%;">
                    <table width="90%" class="tblFormSection" border="0" align="left" cellpadding="0" cellspacing="0" style="margin-top:15px">
                      <thead>
                      <tr>
                        <td width="24%">
                          <h4>Email IDs</h4>
                        </td>
                  		<td width="76%" valign="bottom">
<!--                         <strong>Access Country:</strong>-->

                        </td>  
                      </tr>
                      <tr>
                        <td colspan="2"> <hr /></td>
                      </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td  colspan="3">
                          <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
                              <td width="10%" style="background-color: #99abc5; color: black;font-weight: bold;">Sr. No.</td>                            
                              <td width="80%" style="background-color:#CBD2DC; color: black;font-weight: bold;">Email ID</td>
                              <td width="10%" style="background-color:#CBD2DC; color: black;font-weight: bold;">Delete</td>
                            </tr>
                            </thead>
                         	<tbody>
                			 	<logic:present name="emailList">
	                    			<logic:iterate id="OB" name="emailList" type="com.integrosys.cms.app.segmentWiseEmail.bus.ISegmentWiseEmail" scope="page" >
					                   <%
					                       String rowClass = "";
					                       counter++;
					                       if ( counter%2 != 0 ) {
					                           rowClass = "odd";
					                       } else {
					                           rowClass = "even";
					                       }
					                  %>
				                    <tr class=<%=rowClass%>>
				                      <td class="index" style="background-color: #99abc5; color: black; font-weight: bold;"><%=counter%></td>
				                      <td class="field"><%=OB.getEmail()%></td>
				                      <td class="field" style="text-align: center;vertical-align: middle;">
				                      <input type="checkbox" checked="checked"  name="removeEmail" value='<%=OB.getEmail()%>'>
				                      </td>
				                    </tr>
	                    			</logic:iterate>
                				</logic:present> 
                					<logic:present name="allEmailList">
	                    			<logic:iterate id="OB" name="allEmailList" type="com.integrosys.cms.app.segmentWiseEmail.bus.ISegmentWiseEmail" scope="page" >
					                   <%
					                       String rowClass = "";
					                       counter++;
					                       if ( counter%2 != 0 ) {
					                           rowClass = "odd";
					                       } else {
					                           rowClass = "even";
					                       }
					                  %>
				                    <tr class=<%=rowClass%>>
				                      <td class="index" style="background-color: #99abc5; color: black; font-weight: bold;"><%=counter%></td>
				                      <td class="field"><%=OB.getEmail()%></td>
				                      <td class="field" style="text-align: center;vertical-align: middle;">
				                      <input type="checkbox"  name="removeEmail" value='<%=OB.getEmail()%>'>
				                      </td>
				                    </tr>
	                    			</logic:iterate>
                				</logic:present> 
                           	</tbody>
                         </table>
                        </td>
                        </tr>  
                      </tbody>
                    </table>
				</td>
              </tr>
      </table>
							
								<html:hidden name="SegmentWiseEmailForm" property="segment" />
								<html:hidden name="SegmentWiseEmailForm" property="emailList" />

								<html:hidden name="SegmentWiseEmailForm" property="createdBy" />
								<html:hidden name="SegmentWiseEmailForm" property="lastUpdatedBy" />
								<html:hidden name="SegmentWiseEmailForm" property="lastUpdateDate" />
								<html:hidden name="SegmentWiseEmailForm" property="creationDate" />
								<html:hidden name="SegmentWiseEmailForm" property="ID" />
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		     
					
					 
		<table width="130" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="65">&nbsp;</td>
				<td width="65">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/delete2.gif',1)"
							onClick="submitForm()"><img src="img/delete1.gif"
								name="Image3311" border="0" id="Image3311" /> </a>
				</td>
				<td colspan="2">
							<a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
								<img src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
					</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>


		<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>

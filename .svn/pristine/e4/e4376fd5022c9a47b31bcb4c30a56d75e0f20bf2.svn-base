
<%@ page import="java.util.*" %>

<%@ page import="com.integrosys.base.businfra.workflow.*" %>
<%@ page import="com.integrosys.base.businfra.search.*" %>
<%@ page import="com.integrosys.base.techinfra.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>




<html>
<head>
<!-- InstanceBeginEditable name="doctitle" -->

<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable -->



<!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" -->

 <!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
 <!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
 <!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
 <!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
 <!-- InstanceParam name="contentWidth" type="text" value="100%" -->
 <!-- InstanceParam name="contentHeight" type="text" value="100%" -->
 <!-- InstanceParam name="contentTitle" type="text" value="Untitled Document" -->
 <!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="true" -->

<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<!-- InstanceEndEditable -->

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



<script>
			function JumpOnSelect(selectObj, newForm)
			{
			   	var selectIndex = selectObj.selectedIndex;
			   	alert(selectIndex);
				if(selectIndex != 0) {
					alert(selectObj.options[selectIndex].value);
		    		document.location = selectObj.options[selectIndex].value;
	    		}

			}
		</script>




</head>


<html:form action="Workspace.do">
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="MM_preloadImages('img/next2.gif')">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->

<%
	SearchResult result = (SearchResult)request.getAttribute("searchResult");
    
    
    
    
%>

  <tr id="envCanvas">

	<td width="100%" valign="top" id="envCanvasContent">
      <table id="window" border="0" cellpadding="0" cellspacing="0">


		<tr id="winCanvas">
		<td>

            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
              <!--DWLayoutTable-->
<%
if(result == null) {

%>

<bean:message key="label.global.not.found"/>

<% } else { 
Collection col = result.getResultList();
String[] elements = new String[]{"Order"};
    String[] actionOrder = new String[]{"ActionOrder"};
    System.out.println("collection col --- "+ col.size());
    int count = result.getStartIndex();
    boolean odd = true;
    OBTask task = null;
    
  %>
 

              <tr >
                <td colspan="3" valign="top" style="height:100%;width:100%;">
					<div id="contentCanvas" style="height:100%;width:100%;"> <!-- InstanceBeginEditable name="contentCanvas" -->
                    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td style="padding-left:5"> <h3>To Do (Item) List</h3></td>
                        </tr>
                        <tr>
                          <td align="center"><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td align="center"><table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                              <thead>
                                <tr>
                                  <td>S/N</td>
                                  <%
                                  Iterator sampitr = col.iterator();
                                  OBTask sampleTask = (OBTask)sampitr.next();
                                  ITaskAttribute[] sampList = sampleTask.getTaskAttributeList();
                                  SortUtil.sortObject(sampList, elements);
                                  for(int kk=0;kk<sampList.length;kk++) {
                                  %>
                                  
                                  	<%
                                  		if(!(kk+1<sampList.length)) {
                                  	%>
                                
                                  <td><%=sampList[kk].getName()%></td>
                                        
                              			<% } else if(sampList[kk+1].getOrder().longValue()-sampList[kk].getOrder().longValue()<10) {%>
                                  <td><%=sampList[kk].getName()%></br><%=sampList[kk+1].getName()%></td>
                                        <% 
                                         	kk++;
                                         	} else { 
                                         %>
                                        
                                  <td><%=sampList[kk].getName()%></td>
                                        <% } %>      
                                <%
                                	}  
                                %>
                                  <td>Action</td>
                                </tr>
                              </thead>
                              
                                  
                              <tbody>
                              <%
                              	Iterator itr = col.iterator();
    							
    							while(itr.hasNext()) {
    								String rowClass="";

        							if(count%2!=0){
          								rowClass="even";
        							}else{
           								rowClass="odd";
       								}
    								task = (OBTask)itr.next();
    								ITaskAttribute[] orderedList = task.getTaskAttributeList();
    								SortUtil.sortObject(orderedList, elements);
    								System.out.println("sorting completed --- ");
    								ITaskAction[] actions = task.getTaskActionList();
    								SortUtil.sortObject(actions, actionOrder);
    								System.out.println("sorting completed for actions--- ");
                               %>
                              
                              <tr class="<%=rowClass%>">
                                  <td class="index"><%=count%></td>
                                <%
                                	for(int i=0;i<orderedList.length;i++) {
                                %>
                                <%
                                 if(!(i+1<orderedList.length)) {
                                %>
                                
                                <td><%=orderedList[i].getValue()%></td>
                                        
                              			<% } else if(orderedList[i+1].getOrder().longValue()-orderedList[i].getOrder().longValue()<10) {%>
                                  <td><%=orderedList[i].getValue()%></br><%=orderedList[i+1].getValue()%></td>
                                        <% 
                                        	i++;
                                            } else if(orderedList[i].getValue() instanceof java.util.Date) { 
                                        %>
                                        
                                        <td><integro:date object="<%=(java.util.Date)orderedList[i].getValue()%>" simpleDateFormat="dd/MM/yyyy"/></td>
                                        <% } else { %>
                                        
                                  <td><%=orderedList[i].getValue()%></td>
                                        <% } %>      
                                <%
                                	}  
                                %>
                                
                                <td > 
                                      <select property="selAction" onChange="JumpOnSelect(this, this.form)">

      							<option value="">Please Select</option>
      							<%
									
									for(int k=0;k<actions.length;k++) {
										String actionLabel = actions[k].getActionLabel();
										String actionUrl = actions[k].getURL();
										System.out.println("To DO URL --"+ actionUrl + task.getTaskReferenceId());
										out.print("<option value='" + actionUrl + task.getTaskReferenceId() +"'>" + actionLabel + "</option>");
									}
								%>
    							</select>
                                   </td>
                                
                                
                              </tr>
                               <%
                               count++;
                                }
                               %>   

                              </tbody>
                            </table></td>
                        </tr>
                        <tr>
                          <td align="center">&nbsp;</td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- InstanceEndEditable --> </div>
				</td>
              </tr>
 <% } %>
              

            </table>

		</td>
		</tr>


      </table>
       </td>
  </tr>


</table>
</html:form>
</body>
</html>

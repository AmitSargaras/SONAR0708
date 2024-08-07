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
                 com.integrosys.cms.app.chktemplate.bus.IDynamicProperty,
                 com.integrosys.cms.app.chktemplate.bus.IDynamicPropertySetup,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.FacilitySubTypeList"%>
                  <%@page import="org.apache.struts.util.LabelValueBean"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/secmaster/subtype_template_list_view.jsp,v 1.15 2006/10/27 08:47:34 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.15 $
 * @since $Date: 2006/10/27 08:47:34 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%



	HashMap facilityMap =(HashMap)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.facilityMap");
	//System.out.println("facilityMap:"+facilityMap);
    ITemplateTrxValue secTrxVal = (ITemplateTrxValue) session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.secTrxVal");
    ITemplate iTemplate = (ITemplate) session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.template");
    if (iTemplate != null)
        pageContext.setAttribute("iTemplate", iTemplate);
    int row = 0;
    String status = "";
    if (secTrxVal != null) {
        status = secTrxVal.getStatus();
    }
    String remarks = secTrxVal.getRemarks();
    String lastActionBy = secTrxVal.getUserInfo();
    ITemplateItem array[] = null;
//  System.out.println("Array Length staging"+secTrxVal.getStagingTemplate().getTemplateItemList().length);
if(secTrxVal.getTemplate()==null){
  array = null;
}else{
  array = secTrxVal.getTemplate().getTemplateItemList();
//  System.out.println("Array Length actual"+array.length);
}

ITemplateItem[] stagingItemList = secTrxVal.getStagingTemplate().getTemplateItemList();
if(!(stagingItemList == null && array == null)) {
  List res = CompareOBUtil.compOBArray(secTrxVal.getStagingTemplate().getTemplateItemList(),array);
  System.out.println("res = " + res);
//    System.out.println("after comp Ob Array");

  ArrayList list = new ArrayList(res);
  pageContext.setAttribute("templates",list);
}
    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";

    boolean close = false;
    if (ICMSConstant.STATE_REJECTED.equals(status)) {
        close = true;
    }

    String colType = iTemplate.getCollateralType();
    String subType = iTemplate.getCollateralSubType();
    String cc = colType;
    String ss = subType;
    
    FacilityTypeList list1 = FacilityTypeList.getInstance();
    colType = list1.getFacilityTypeValue(colType, request.getLocale());
    FacilitySubTypeList list2 = FacilitySubTypeList.getInstance();
    String subType1 = list2.getFacilitySubTypeValue(subType, request.getLocale());
    boolean toTrack = false;
    String event = request.getParameter("event");
    if ("to_track".equals(event)) {
        toTrack = true;
    }

    boolean viewOnly = false;
    if (request.getParameter("view") != null && request.getParameter("view").equals("view")) {
        viewOnly = true;
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
//	    dynamicPropertySetupList = (IDynamicPropertySetup[]) session.getAttribute("com.integrosys.cms.ui.secmaster.FacilityMasterAction.dynamicPropertySetupList");
//	    if (dynamicPropertySetupList != null) {
//	    dynamicPropertySetupListSize = dynamicPropertySetupList.length;
//	    comlen1Size = dynamicPropertySetupList[0].getEntryCodes().length;
//	    comlen2Size = dynamicPropertySetupList[1].getEntryDescription().length;
//	    }
    }
    
    
    String getEvent = request.getParameter("event");
    
    String sub = (String)request.getAttribute("subTypeDesc");
    
    System.out.print("--------- subType1" + subType1 + " "+subType);
    
    String facDocCode=(String)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.facDocCode");
    String facDocDesc=(String)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.facDocDesc");
    String facDocTenureCount=(String)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.facDocTenureCount");
    String facDocTenureType=(String)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.facDocTenureType");
    if(null==facDocCode||"null".equalsIgnoreCase(facDocCode))
  	  facDocCode="";
    if(null==facDocDesc||"null".equalsIgnoreCase(facDocDesc))
  	  facDocDesc="";
    if(null==facDocTenureCount||"null".equalsIgnoreCase(facDocTenureCount))
  	  facDocTenureCount="";
   List tenureTypeList = (List)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.tenureTypeList");
	pageContext.setAttribute("tenureTypeList",tenureTypeList);
	
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
<%@page import="com.integrosys.cms.app.chktemplate.bus.ITemplateItem"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.facmaster.FacilityMasterForm"%>
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

function cancelPage() {
    document.forms[0].event.value="prepare_sectype";
    document.forms[0].submit();
}

function getRecList(){
	var facDocCode=document.getElementById('facDocCode').value;
	var facDocDesc=document.getElementById('facDocDesc').value;
	var facDocTenureCount=document.getElementById('facDocTenureCount').value;
	var facDocTenureType=document.getElementById('facDocTenureType').value;
	document.forms[0].action="DocFacilityMaster.do?event=view_template_item&go=Y&facDocCode="+facDocCode+"&facDocDesc="+facDocDesc+"&facDocTenureCount="+facDocTenureCount+"&facDocTenureType="+facDocTenureType;
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="DocFacilityMaster" >
<input type="hidden" name="event" />
<input type="hidden" name="mandatoryID" />
<input type="hidden" name="index" />
<html:hidden property="secTypeDesc" />
<html:hidden property="subTypeDesc" value="<%= subType1 %>"/>
<input type="hidden" name="subType" value='<%=subType%>'  />
<html:hidden property="secType" />
<input type="hidden" name="withTitle" />
<input type="hidden" name="withoutTitle" />
<input type="hidden" name="completedProperty" />
<input type="hidden" name="underConstruction" />
<input type="hidden" name="facilityCategoryList" />
<input type="hidden" name="facilityTypeList" />
<input type="hidden" name="systemList" />
<input type="hidden" name="facilityCategory" />
<input type="hidden" name="facilityType" />
<input type="hidden" name="system" />
<%if(viewOnly){%>
<input type="hidden" name="view" value="view">
<%}%>

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <tr>
  <td colspan="2">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:10px">
 <THEAD></THEAD>
  <tr>
      <TD colSpan=4 width="100%"> <h3><%=ss%>  ( <bean:write name="DocFacilityMasterForm" property="subTypeDesc"/> )</h3></td></tr>
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
                        <%if(type != null){%>
                        <input name="DocFacilityMasterForm" id="facCategory" property="facilityCategory" value="<%=category%>" readOnly/>
                        <%}else{ %>
                        <input name="DocFacilityMasterForm" id="facCategory" property="facilityCategory" value="" readOnly/>
                        <%} %>
                        </td>
                        
                         <td class="fieldname" >Facility Type</td>
                        <%-- <td>
                      						
<html:select  styleId="facType" name="DocFacilityMasterForm"   property="facilityType" >
<html:option value=""> Please Select </html:option>
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
 
<TR><TD colSpan=4 width="100%">&nbsp;</TD></TR>
 
<!--  <TR><TD colSpan=4 width="100%">Please enter search criteria</TD></TR> -->
                        <tr><td class="fieldname" >Document Code</td>
                        <td >
                        <html:text property="docCode" value="<%= facDocCode %>" styleId='facDocCode'/>
                        <html:errors property="itemCodeError"/></td>
                        <td class="fieldname">Document Description</td>
                        <td>
                        <html:text property="docDesc" value="<%= facDocDesc %>" styleId='facDocDesc'/>
                        <html:errors property="itemDescError"/></td></tr>
                         <tr><td class="fieldname" >Document Tenure</td><td>
                        <html:text maxlength="3" size="10" property="tenureCount" value="<%= facDocTenureCount %>" styleId='facDocTenureCount'/>
                        <html:errors property="tenureError"/>
	 <html:select styleId="facDocTenureType"  property="tenureType" >
												<html:option value=""> Please Select </html:option>
                        <%
                         if(null!=facDocTenureType||!"".equalsIgnoreCase(facDocTenureType)){
                         for(int i=0;i<tenureTypeList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)tenureTypeList.get(i);
                         if(labelValueBean.getValue().equals(facDocTenureType)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}else{%>
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="tenureTypeList" labelProperty="label" property="value"  />
                           <%}%>
									                    </html:select>
                        </td>
                        </tr>
             <tr><td colspan="4"><CENTER><input class=btnNormal style="margin-left:20px;height:30px; WIDTH: 70px;"  type="button" value="Go" onclick='getRecList()'></CENTER></td></tr>           
</table>
  </td>
  </tr>
  
    <tr>
     <%--  <td> <h3><%=ss%> ( <%if(facilityMap!=null){ %><%=facilityMap.get(ss)%><%} %>  )</h3></td> --%>
      <td valign="bottom"><table width="75"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
          	<td>
            &nbsp;
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
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
            </tr>
          </thead>
          <tbody>
<logic:present name="templates" >
<%if(null!=iTemplate){
	if(null!=iTemplate.getTemplateItemList()){
	%>
   <logic:iterate id="compResult" name="templates"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
    ITemplateItem OB = (ITemplateItem) compResult.getObj();
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    boolean checked = false;
    if(OB.getIsMandatoryInd()){
        checked = true;
    }
    boolean checkedDisplay = false;
    if(OB.getIsMandatoryDisplayInd()){
    	checkedDisplay= true;
    }
    String isPreApprove = "N";
    if(OB.getItem().getIsPreApprove()){
    	isPreApprove = "Y";
    }
    
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
  
              <td class="<bean:write name="compResult" property="key" />"><%=row%></td>
              <td style="text-align:center"><input name="tempID" type="checkbox" value="<%=row-1%>" <%if(checked){ %> checked <% } %> disabled />
              </td>
              <td style="text-align:center"><input name="tempDisplayID" type="checkbox" value="<%=row-1%>" <%if(checkedDisplay){ %> checked <% } %> disabled />
                  <td>&nbsp;<bean:write name="compResult" property="obj.item.itemCode" /></td>
              <td>&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
              <td>&nbsp;<%=OB.getItem().getTenureCount()%> &nbsp; <integro:common-code-single  entryCode="<%=OB.getItem().getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" display="true" descWithCode="false" />
                                    		</td>
              <%if(isABCheck){ %>
              <td nowrap>
          		<input name="newWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithFBR){ out.print(" Checked "); }%> DISABLED/>New With FBR
          		<input name="newWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(newWithoutFBR){ out.print(" Checked "); }%> DISABLED/>New Without FBR
          		<input name="usedWithFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithFBR){ out.print(" Checked "); }%> DISABLED/>Used With FBR
          		<input name="usedWithoutFBRID" type="checkbox" value="<%=(row-1)%>" <%if(usedWithoutFBR){ out.print(" Checked "); }%> DISABLED/>Used Without FBR
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
            </tr>
</logic:iterate>
<%}} %>
</logic:present>
<logic:notPresent name="iTemplate" property="templateItemList" >
            <tr class="odd">
              <td colspan="7"><bean:message key="label.global.not.found"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%if((!toTrack && close)&&!getEvent.equals("view_template_item")){%>
<p/>
<p/>
<p/>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
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
<%}%>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
  <%if((!toTrack && close)&&!getEvent.equals("view_template_item")) { %>
  <td valign="baseline" align="center">
    <a href="DocFacilityMaster.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;
   </td>
   <td valign="baseline" align="center">
    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
   </td> 
    <%}else if(toTrack){%>
     <td valign="baseline" align="center">
        <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
      </td>  
    <%}else{%>
     <td valign="baseline" align="center">
    	<a href="#" onClick="cancelPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
    <%}%>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">&nbsp; </td>
  </tr>
  <tr>
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

<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBCoBorrowerDetails"%>
<%@page
	import="com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
         	com.integrosys.cms.ui.common.UIUtil,
         	com.integrosys.cms.app.limit.bus.OBFacilityCoBorrowerDetails,
				com.integrosys.cms.ui.manualinput.limit.FacCoBorrowerDetailsForm,
				com.integrosys.cms.app.customer.bus.ICoBorrowerDetails,
				com.integrosys.cms.ui.manualinput.limit.LmtDetailAction,
				java.util.List"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
LmtDetailForm form = (LmtDetailForm) request.getAttribute("LmtDetailForm");
pageContext.setAttribute("LmtDetailForm", form);
int vno = 0;
String facCoBorrowerLiabIds = form.getFacCoBorrowerLiabIds() == null ? "" : form.getFacCoBorrowerLiabIds();

/* List<FacCoBorrowerDetailsForm> facCoBorrowerList = form.getFacCoBorrowerList();
pageContext.setAttribute("facCoBorrowerList", facCoBorrowerList);
 */
List facCoBorrowerList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerList");
pageContext.setAttribute("facCoBorrowerList", facCoBorrowerList);
//System.out.println("ORIGINAL LIST facCoBorrowerList================="+facCoBorrowerList);



if(null !=facCoBorrowerLiabIds){
if(!facCoBorrowerLiabIds.contains("\"")){
List<String> selectedCoBorrowerIds = UIUtil.getListFromDelimitedString(facCoBorrowerLiabIds, ",");
 facCoBorrowerLiabIds = UIUtil.getJSONStringFromList(selectedCoBorrowerIds, ",");
}
}

String LineCoBorrowIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.LineCoBorrowIds");

if(null !=LineCoBorrowIds){
if(!LineCoBorrowIds.contains("\"")){
List<String> selectedLinCoBorrowIds = UIUtil.getListFromDelimitedString(LineCoBorrowIds, ",");
LineCoBorrowIds = UIUtil.getJSONStringFromList(selectedLinCoBorrowIds, ",");
}
}

List<ICoBorrowerDetails> partyCoBorrowerList = (List<ICoBorrowerDetails>) session.getAttribute(LmtDetailAction.class.getName()+".co_borrower_list");
pageContext.setAttribute("partyCoBorrowerList", partyCoBorrowerList);

%>
 <script type="text/javascript" src="js/jquery.min.js"></script> 

<script type="text/javascript">


var facCoBorrowerLiabIds = "["+'<%=facCoBorrowerLiabIds%>'+"]"; 


var lineCoBorrIds = "["+'<%=LineCoBorrowIds%>'+"]"; 
var linecoBorrowerIdArr = jQuery.parseJSON( lineCoBorrIds );

//console.log("lineCoBorrIds:--"+lineCoBorrIds+"--");
//console.log("linecoBorrowerIdArr:--"+linecoBorrowerIdArr+"--");


//console.log("facCoBorrowerLiabIds:--"+facCoBorrowerLiabIds+"--");
 
//var coBorrowerIdArr = JSON.parse(facCoBorrowerLiabIds);
var coBorrowerIdArr = jQuery.parseJSON( facCoBorrowerLiabIds );

//console.log("coBorrowerIdArr:--"+coBorrowerIdArr+"--");

function validateInput(coBorrowerId){
	
	document.getElementById("facCoBorrowerError").innerHTML = "";
	 if("" == coBorrowerId){
	  		document.getElementById("facCoBorrowerError")
	  		.innerHTML = "<font color=red size=1 >Please select Co-Borrower Id</font>";
	  		
	  		return true;
	  	}
	if(coBorrowerIdArr.length === 5){
		document.getElementById("facCoBorrowerError")
		.innerHTML = "<font color=red size=1 >Maximum 5 Co-Borrowers are allowed</font>";
		
		return true;
	}

	for(var i = 0 ; i < coBorrowerIdArr.length ; i++) {
		if(coBorrowerIdArr[i] == coBorrowerId) {
			document.getElementById("facCoBorrowerError")
			.innerHTML = "<font color=red size=1 >Duplicate Co-Borrower, Co-Borrower Liab Id "+coBorrowerId+" is already added.</font>";
			
			return true;
		}
	}
}

function addCoBorrower() {
	var coBorrowerDropDown = document.getElementById("partyCoBorrower"); 
	var coBorrowerId = coBorrowerDropDown.options[coBorrowerDropDown.selectedIndex].value;
	var coBorrowerName = coBorrowerDropDown.options[coBorrowerDropDown.selectedIndex].text;
	//console.log("selected id : "+coBorrowerId+", name: "+coBorrowerName+", coBorrowerIdArr: "+coBorrowerIdArr.length);
	var coBorrowerNameArr = coBorrowerName.split("-");
	coBorrowerName= coBorrowerNameArr[1];

	if(validateInput(coBorrowerId))
		return;
	
	if(coBorrowerIdArr.length < 5){
		var index = coBorrowerIdArr.length;
		
		if(null== coBorrowerIdArr[0]){
			coBorrowerIdArr.pop();
			index=index-1
		}
		
		insertIntoTable(index, coBorrowerId, coBorrowerName);
		coBorrowerIdArr.push(coBorrowerId);
		setFacCoBorrowerLiabIds();
		//console.log("noRecordsLabel_row: "+document.getElementById("noRecordsLabel_row"));
		
		//document.getElementById("noRecordsLabel_row").style.display="none";
	}
	//console.log("after ADD : "+coBorrowerIdArr.join(","));
}

function insertIntoTable(index, coBorrowerId, coBorrowerName){
	//console.log("insert selected index: "+index+", id: "+coBorrowerId+", name: "+coBorrowerName);
	
	var table = document.getElementById("facCoborrower_table");
	var body = table.getElementsByTagName("tbody")[0];
	
	var row = body.insertRow(index);
	index = index+1;
	row.className= index%2==0 ? "even" : "odd";
	
	var indexCell = row.insertCell(0);
	indexCell.className = "index";
	
	var coBorrowerIdCell = row.insertCell(1);
	var coBorrowerNameCell = row.insertCell(2);
	var actionCell = row.insertCell(3);
	
	indexCell.innerHTML = "<center>"+index+"</center>";
	coBorrowerIdCell.innerHTML = "<center>"+coBorrowerId+"</center>";
	coBorrowerNameCell.innerHTML = "<center>"+coBorrowerName+"</center>";
	actionCell.innerHTML = "<center><a href='#' onclick='removeCoBorrower("+index+")' >Delete</a></center>";
}

function removeCoBorrower(index) {
	
//	console.log("remove index: "+index+", coBorrowerIdArr: "+coBorrowerIdArr.length+", coBorrowerIdArr: "+coBorrowerIdArr.join(","));
	     //   alert("coBorrowerIdArr[index]="+coBorrowerIdArr[index])
	   for(var i = 0 ; i < linecoBorrowerIdArr.length ; i++) {
		if(linecoBorrowerIdArr[i] == coBorrowerIdArr[index-1]) {
			document.getElementById("facCoBorrowerError")
			.innerHTML = "<font color=red size=1 > To delete the 'Co-borrower details' record on Facility screen first delete the same co-Borrower record on Release line details screen</font>";
			
			return true;
		}
	}
	  
	document.getElementById("facCoBorrowerError").innerHTML = "";
	
	if(coBorrowerIdArr.length > -1){
		index = index-1;
		
		deleteFromTable(index);
		coBorrowerIdArr.splice(index, 1);
		setFacCoBorrowerLiabIds();

		refreshIndex();
		
		if(coBorrowerIdArr.length < 0)
			document.getElementById("noRecordsLabel_row").style.display="";
	}
	//console.log("after REMOVE : "+coBorrowerIdArr.join(","));
}


function deleteFromTable(index){
	//console.log("delete selected index: "+index);
	
	var table = document.getElementById("facCoborrower_table");
	var body = table.getElementsByTagName("tbody")[0];
	body.deleteRow(index);
}

function refreshIndex(){
	var table = document.getElementById("facCoborrower_table");
	var body = table.getElementsByTagName("tbody")[0];
	var rows = body.getElementsByTagName("tr");
	//console.log("rows len : "+rows.length);
	for(var i=0; i<(rows.length); i++){
	
		var index = i+1;
 		rows[i].cells[0].innerHTML = index;
		rows[i].cells[3].innerHTML = "<center><a href='#' onclick='removeCoBorrower("+index+")' >Delete</a></center>";
 	
	} 
}

function setFacCoBorrowerLiabIds(){
	var latestCoBorrowerIds = coBorrowerIdArr.join(",");
	//console.log("latestCoBorrowerIds: "+latestCoBorrowerIds);
	document.getElementById("facCoBorrowerIds").value=latestCoBorrowerIds;
	//console.log("facCoBorrowerIds.value: "+document.getElementById("facCoBorrowerIds").value);
}

</script>
<html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=form.getFacCoBorrowerLiabIds()%>"/>
<style>
<!--
select{
  width: 100px;
}

option div {
  padding: 10px;
  background:#f00;
}
-->
</style>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="addCoborrowerTable"  style="margin-top: 10px">
	<thead>
		<tr >
			<td colspan="2"><h3>Co-Borrower Details</h3></td>
		</tr>
        <tr>
	        <td align="left"><html:errors property="coBorrowerDetailsError" /></td>
			<td align="right" valign="baseline">
				<span id="facCoBorrowerError"></span>
				<html:select name="LmtDetailForm" property="partyCoBorrower" styleId="partyCoBorrower" >
					<html:option value="">Please Select</html:option>
					<logic:present name="partyCoBorrowerList">
		            	<html:options collection="partyCoBorrowerList" labelProperty="coBorrowerName" property="coBorrowerLiabId"/>
		            </logic:present>
		        </html:select>
			
				<input type="button" value="Add Co-Borrower Details" class="btnNormal" onclick="addCoBorrower()" />
			</td>
		</tr>	
	</thead>
	<tbody>
		<tr >
			<td colspan="2">
				<table border="0" cellpadding="0" cellspacing="0" class="tblInput" style="margin-top: 0" width="100%" id="facCoborrower_table">
					<thead>
						<tr>
							<td>S/N</td>
							<td>Co-Borrower Liab Id</td>
							<td>Co-Borrower Name</td>
							<td>Action</td>
						</tr>
					</thead>
					<tbody>
						<logic:present name="facCoBorrowerList">
										<logic:iterate id="ob" name="facCoBorrowerList"
											type="com.integrosys.cms.app.limit.bus.OBFacilityCoBorrowerDetails"
											 scope="page">
											<%
												String rowClass = "";
														vno++;
														rowClass = "even";
														
											%>
											 <tr class="<%=rowClass%>">
												<td class="index"><%=vno%></td>
												<td>
												<center><%=ob.getCoBorrowerLiabId()%>&nbsp;</center>
												</td>
												<td>

												<center><%=ob.getCoBorrowerName().split("-")[1]%>&nbsp;</center>
												
												<%-- <html:text property="coBorrowerName" styleId="coBorrowerName" value = "<%=ob.getCoBorrowerName()%>"/> --%>
												</td>
												<td> <a href="#" onclick="removeCoBorrower('<%=vno%>')" >Delete</a></td>
											</tr> 
										</logic:iterate>
									</logic:present>
										<%if(null != facCoBorrowerList && facCoBorrowerList.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>

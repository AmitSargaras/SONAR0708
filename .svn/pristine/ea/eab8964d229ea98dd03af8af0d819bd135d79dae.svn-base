<%--<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>--%>

<%@ page import="java.util.*,
				com.integrosys.component.user.app.bus.*,
				com.integrosys.base.techinfra.beanloader.BeanController,
				com.integrosys.component.user.app.constant.JNDIConstant,
				com.integrosys.cms.app.user.trx.*,
				com.integrosys.cms.app.user.proxy.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%

boolean isDPCUser=false;
ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_DPC_USER){
	isDPCUser=true;
}
List UserList = (List) request.getAttribute("UserList");
String hand = (String) request.getAttribute("hand");
String isHandOffActivityPerformed="";
 isHandOffActivityPerformed = (String) request.getAttribute("isHandOffActivityPerformed");
 if(isHandOffActivityPerformed ==null){
	 isHandOffActivityPerformed ="";
 }
 System.out.println("isHandOffActivityPerformed+++++======>"+ isHandOffActivityPerformed);
//System.out.println("UserList+++++======>"+ UserList.size());
String isOtherUserLogged="";
if(UserList!=null){
	System.out.println("UserList+++++======>"+ UserList.size());
	if(UserList.size()>1){
	isOtherUserLogged="true";
	}
}
System.out.println("isOtherUserLogged+++++======>"+ isOtherUserLogged);
System.out.println("hand+++++======>"+ hand);
//System.out.println("UserList+++++======>"+ UserList);
String UserCount = (String) request.getAttribute("UserCount");

%>

<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%><html>

<head>
<title>View Online Users</title>
<%--<%@ include file="/console/console_include.jsp" %>

--%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/console/css/console.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/console/css/sortable_xp.css"/>
</head>
<script type="text/javascript">
function submitPage() {    
    
    //document.forms[0].event.value="user_detail_list";
    document.forms[0].action =   "user.do?event=user_hand_off&customerID=-999999999&limitProfileID=-999999999"
document.forms[0].submit();
}
function submitPageHand() {
	
	var isHandOffActivityPerformed="<%=isHandOffActivityPerformed%>";
	var isOtherUserLogged="<%=isOtherUserLogged%>";
	if(isOtherUserLogged=='true'){
		alert("System Hand Off can not perform due to other logged in users.");
	}else{
	if(isHandOffActivityPerformed=='true'){

		alert("System handoff is already done for the day");


		}else{
		var handInd = document.getElementById("handoff").value;
		//alert(handInd);
		if(handInd==null||handInd=='N'){

			alert("Please Perform Some Activity.");
			
		}else{
	
	var answer = confirm("Are you sure you want to User hand off?")
    if(answer == true)	
    {
        
        var hand = document.getElementsByName("handoff")[0].checked;
    	//var hand = document.forms[0].elements["handoff"].checked;
    	
        //document.forms[0].event.value="user_detail_list";user_hand_off
        if(hand == true)
        {
        document.forms[0].action =   "user.do?event=user_hand_off&customerID=-999999999&limitProfileID=-999999999&hand=N"
        }else
        {
           document.forms[0].action =   "user.do?event=user_hand_off&customerID=-999999999&limitProfileID=-999999999&hand=Y"
            }
    document.forms[0].submit();
    }

		}
	}
	}
}

function submitKill() {    
    
    //document.forms[0].event.value="user_detail_list";
     var answer = confirm("are you sure you want to Kill Login User Session?")
          if(answer == true)	
          {
    document.forms[0].action =   "user.do?event=kill_user_hand_off_list&hand=<%=hand%>&isHandOffActivityPerformed=<%=isHandOffActivityPerformed%>&customerID=-999999999&limitProfileID=-999999999"
document.forms[0].submit();
          }
}
function flipValues(value){
//alert(value);
	document.getElementById("handoff").value=value;
	//alert(document.getElementById("handoff").value);
	
}
</script>



<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="40%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>Users Currently Online</strong> </td>
  </tr>
  <tr>
  <td>
  <font color='blue'><b>Total online users:  <%=UserCount%> </b></font><br><br>
  </td>
 <td>
 <bean:message key="label.user.hand.off"/> &nbsp;
 
 <%if(isDPCUser){ %>
 
 <%if(hand==null || "".equals(hand)) {%>
 <input type="radio" checked="checked" id="handoff" name="handoff" value="N" onclick=" javascript:showAccField(true) ; " disabled="disabled"  > No  
	&nbsp;&nbsp;
	<input type="radio"  id="handoff" name="handoff" value="Y" onclick=" javascript:showAccField(false) ; " disabled="disabled" > Yes
	&nbsp;&nbsp;
	<%}else if(hand.equals("Y")){ %>
	<input type="radio"  id="handoff" name="handoff" value="N" onclick=" javascript:showAccField(true) ; " disabled="disabled" > No 
	&nbsp;&nbsp;
<input type="radio" checked="checked" id="handoff" name="handoff" value="Y" onclick=" javascript:showAccField(false) ; " disabled="disabled" > Yes
 &nbsp;&nbsp;
 <%}else if(hand.equals("N")){ %>
 <input type="radio" checked="checked" id="handoff" name="handoff" value="N" onclick=" javascript:showAccField(true) ; " disabled="disabled" > No  
	&nbsp;&nbsp;
	<input type="radio"  id="handoff" name="handoff" value="Y" onclick=" javascript:showAccField(false) ; " disabled="disabled" > Yes
	&nbsp;&nbsp;
 <%} %>
 
 
 <%}else{ %>
 
 
 <%if(hand==null || "".equals(hand)) {%>
 <input type="radio" checked="checked" id="handoff" name="handoff" value="N" onclick=" javascript:showAccField(true) ; " > No  
	&nbsp;&nbsp;
	<input type="radio"  id="handoff" name="handoff" value="Y" onclick=" javascript:showAccField(false) ; " > Yes
	&nbsp;&nbsp;
	<%}else if(hand.equals("Y")){ %>
	<input type="radio"  id="handoff" name="handoff" value="N" onclick=" javascript:showAccField(true) ; " > No 
	&nbsp;&nbsp;
<input type="radio" checked="checked" id="handoff" name="handoff" value="Y" onclick=" javascript:showAccField(false) ; " > Yes
 &nbsp;&nbsp;
 <%}else if(hand.equals("N")){ %>
 <input type="radio" checked="checked" id="handoff" name="handoff" value="N" onclick=" javascript:flipValues('N') ; " > No  
	&nbsp;&nbsp;
	<input type="radio"  id="handoff" name="handoff" value="Y" onclick=" javascript:flipValues('Y') ; " > Yes
	&nbsp;&nbsp;
 <%} %>
 
 <%} %>
 
 <%if(!isDPCUser){ %>
 <input onclick="javascript:submitPageHand()"
								name="AddNew12" type="button" id="AddNew12"
								value="System Hand Off" class="btnNormal" /><% }%> &nbsp;
 </td>
 
  </tr>
</table><br>


<form name="myform" action="user_hand_off.jsp" class="niceform" METHOD=POST>
	


		  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead>
                        
                    <tr>                 <td>Sr No.</td>
										<td>LAST LOGIN TIME</td>									
										<td>LAST ACCESS TIME </td>
										<td>LOGIN ID </td>
										<td>USER ID </td>
										<td>USER NAME </td>
										<td>EMPLOYEE ID </td>
										<td>POSITION </td>
										<td>DEPARTMENT </td>
										<td>ORGANISATION </td>
										<td>COUNTRY </td>
										
									</tr>
                    </thead>
                    <tbody>  
				<%int k = 0; %>
				
				<%for(int i = 0 ;i< UserList.size() ;i++) {
					List listAll= new ArrayList();
					listAll =(List) UserList.get(i);
					 k=k+1;
					//listAll.add(UserList.get(i));%>
				
				
                  <tr>
                  <td>
                  <%=k %>
                  </td>
                  <td>
                  <%=(listAll.get(0)!=null)?listAll.get(0):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(1)!=null)?listAll.get(1):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(2)!=null)?listAll.get(2):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(3)!=null)?listAll.get(3):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(4)!=null)?listAll.get(4):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(5)!=null)?listAll.get(5):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(6)!=null)?listAll.get(6):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(7)!=null)?listAll.get(7):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(8)!=null)?listAll.get(8):"-" %>
                  </td>
                  <td>
                  <%=(listAll.get(9)!=null)?listAll.get(9):"-" %>
                  </td>
                  </tr>
                 <%} %>  
									
									
									
                    
                    </tbody>
                </table>

	<table  ><tr width="100%">
	<td width="50%">
	&nbsp;
	</td>
	<td>
	<input onclick="javascript:submitPage()"
								name="AddNew12" type="button" id="AddNew12"
								value="Refresh" class="btnNormal" />
	</td>
	
	<td>
	<%if(!isDPCUser){ %>
	<input onclick="javascript:submitKill()"
								name="AddNew12" type="button" id="AddNew12"
								value="Kill Login User Session" class="btnNormal" />
								
								<%} %> &nbsp;
	</td>
	</tr> </table>
	<script type="text/javascript">
	//document.getElementsByName("handoff")[0].checked;
	//if (document.getElementsByName("handoff") != null)
	//{
	//	if (document.getElementsByName("handoff")[0].checked)			
	//		showAccField(false);
	//	else if (document.getElementsByName("handoff")[1].checked)
	//		showAccField(true);
	//}
</script>
	</form>
</body>
</html>

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
List UserList = (List) request.getAttribute("UserList");
System.out.println("UserList+++++======>"+ UserList.size());
System.out.println("UserList+++++======>"+ UserList);
String UserCount = (String) request.getAttribute("UserCount");

%>
<html>

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
        document.forms[0].action =   "user.do?event=user_detail_list&customerID=-999999999&limitProfileID=-999999999"
    document.forms[0].submit();
}

function submitKill() {    
    
    //document.forms[0].event.value="user_detail_list";
     var answer = confirm("are you sure you want to Kill Login User Session?")
          if(answer == true)	
          {
    document.forms[0].action =   "user.do?event=kill_user_login_list&customerID=-999999999&limitProfileID=-999999999"
document.forms[0].submit();
          }
}
</script>
<%
System.out.println("******* %%%%%%%%%%%%% ****************** &&&&&&&&&&&&&&&&" );
	
	
%>


<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>Users Currently Online</strong> </td>
  </tr>
  <tr>
  <td>
  <font color='blue'><b>Total online users:  <%=UserCount%> </b></font><br><br>
  </td>
 
  </tr>
</table><br>


<form name="myform" action="useronlineDetails.jsp" class="niceform" METHOD=POST>
	


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
	<input onclick="javascript:submitKill()"
								name="AddNew12" type="button" id="AddNew12"
								value="Kill Login User Session" class="btnNormal" />
	</td>
	</tr> </table>
	</form>
</body>
</html>

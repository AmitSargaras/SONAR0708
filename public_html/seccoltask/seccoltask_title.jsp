<%
 String subTitle="";
 if(colTrxVal==null||colTrxVal.getFromState()==null)
  {
 subTitle="Create Task";
  }else
  {
		   if(ICMSConstant.STATE_PENDING_CREATE.equals(colTrxVal.getFromState())
			 ||ICMSConstant.STATE_PENDING_CREATE.equals(colTrxVal.getToState()))  
		   {
		   subTitle="Create Task";
		   }
			 
		   if(ICMSConstant.PENDING_UPDATE.equals(colTrxVal.getFromState())
		   ||ICMSConstant.PENDING_UPDATE.equals(colTrxVal.getToState()))
		   {
		   subTitle="Update Task";
		   }
		   
		   if(ICMSConstant.STATE_PENDING_REJECT.equals(colTrxVal.getFromState())
		   ||ICMSConstant.STATE_PENDING_REJECT.equals(colTrxVal.getToState()))
		   {
		   subTitle="Reject Task";
		   }
		   
		
		   if(ICMSConstant.STATE_ACTIVE.equals(colTrxVal.getToState()))
		   {
				   if(toView)
				   {
				   subTitle="";
				   }
				   
				   if(toReject)
				   {
				   subTitle="Reject Task";
				   }else
				   {
				   subTitle="Update Task";
				   }
		   }

 }

   %>
 
 <tr>
   <td width="78%"> <h3>Create Security Collaboration Task - <%=subTitle%></h3></td>
   <td width="22%" align="right" valign="baseline">&nbsp; </td>
 </tr>
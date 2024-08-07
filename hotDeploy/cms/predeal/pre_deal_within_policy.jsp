<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>

<%@ taglib uri="/WEB-INF/taglib/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>
<%
	boolean editRejected = PreDealConstants.EVENT_MAKER_SUBMIT_UPDATE_REJECT
			.equals(request.getAttribute(PreDealConstants.NEXT_EVENT));

	String counterName = (String) request.getAttribute(PreDealConstants.COUNTER_NAME);
	String isinCode = (String) request.getAttribute(PreDealConstants.ISIN_CODE);
	String ric = (String) request.getAttribute(PreDealConstants.RIC);
%>


<html>
<head>
<script type="text/javascript">
<!--
			function submit ()
			{
				 var form = document.getElementById( 'form' ) ;
<%
				if ( editRejected )
				{
%>
				form.event.value  = '<%= PreDealConstants.EVENT_MAKER_SUBMIT_UPDATE_REJECT %>' ;

<%
				}
				else
				{
%>
				form.event.value  = '<%= PreDealConstants.EVENT_MAKER_SUBMIT_NEW_EAR_MARK %>' ;
<%
				}
%>
				form.submit () ;
			}

			function cancel ()
			{
<%
				if ( editRejected )
				{
%>
				location.href =  '/cms/ToDo.do' ;
<%
				}
				else
				{
%>
				var form = document.getElementById( 'form' ) ;

				form.event.value  = '<%= PreDealConstants.EVENT_MAKER_SEARCH %>' ;

				form.submit () ;

<%
				}
%>
			}

		//-->
		</script>

<title><!-- Pre-Deal --> <bean:message key="title.pre.deal" /></title>

</head>

<body>

<table width="50%" border="0" align="center" cellpadding="0"
	cellspacing="0" class="tblFormSection" style="margin-top: 30px">

	<thead>
		<tr>
			<td>
			<h3>Acknowledgement
			<hr />
			</h3>
			</td>
		</tr>
	</thead>

	<tbody>
		<tr>
			<td>
			<table width="100%" border="0" cellpadding="10" cellspacing="0"
				class="tblInfo">
				<tbody>
					<tr>
						<td height="111" class="odd" style="text-align: center"><STRONG>

						Your ear-making is within the bank's policy for counter
						concentration cap limit. <br />

						Click &quot;Submit&quot; to confirm your ear-marking transaction.

						</STRONG></td>
					</tr>

					<tr>
						<td height="51" class="odd" style="text-align: center">
						&nbsp;</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>

</table>

<p align="center"><a href="#" onmouseout="MM_swapImgRestore()"
	onmouseover="MM_swapImage('Image4411','','/cms/img/submit2.gif',1)"
	onClick="submit()"> <img src="/cms/img/submit1.gif"
	name="Image4411" border="0" id="Image4411" /> </a> <a href="#"
	onmouseout="MM_swapImgRestore()"
	onmouseover="MM_swapImage('Image4413','','/cms/img/cancel2.gif',1)"
	onclick="cancel()"> <img src="/cms/img/cancel1.gif"
	name="Image4413" border="0" id="Image4413" /> </a></p>

<html:form action="PreDeal.do" styleId="form">
	<html:hidden property="event" />
	<html:hidden property="feedId" />
	<html:hidden property="counterName" value="<%= counterName %>" />
	<html:hidden property="isinCode" value="<%= isinCode %>" />
	<html:hidden property="ric" value="<%= ric %>" />
</html:form>


</body>

</html>
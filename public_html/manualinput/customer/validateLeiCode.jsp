<%@page import="com.integrosys.cms.app.lei.json.dto.RetrieveLEICCILResponse,
	java.io.IOException,com.fasterxml.jackson.databind.ObjectMapper,
	com.integrosys.cms.app.lei.json.dto.LEIDetailsResponseDto"%>
<%
RetrieveLEICCILResponse responseObj = (RetrieveLEICCILResponse)request.getAttribute("leiCCILResponse");

if(responseObj != null && !responseObj.toString().isEmpty()){ 
	if(responseObj.getLeiDetails()!=null){
		
		ObjectMapper mapper = new ObjectMapper();	
		LEIDetailsResponseDto myLeiObject = null;			
		try {
			myLeiObject = mapper.readValue(responseObj.getLeiDetails(), LEIDetailsResponseDto.class);
		} catch (IOException e) {
			throw new Exception("Error Parsing response ", e);
		}
				out.println("LEI Code : "+myLeiObject.getLeiNumber()+" ,");
				out.println("Legal NAME : "+myLeiObject.getLegalName()+" ,");
				out.println("Registration Status : "+myLeiObject.getRegistrationStatus());
				out.println("Next Renewal Date : "+myLeiObject.getNextRenewalDate().substring(0,10)+" ,");
				out.println("Legal Form : "+myLeiObject.getLegalForm());

		}	
	}else{
		out.println("CLIMS application will not get the data for requested LEI");
	}

%>
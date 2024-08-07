<%@page import="com.hdfcbank.xsd.isd.panval.PANValServiceResponseType"%>
<%
PANValServiceResponseType responseObj = (PANValServiceResponseType)request.getAttribute("panNSDLResponse");
if(responseObj!=null){ 

	if(responseObj.getPANDetails()!=null 
		&& responseObj.getPANDetails().size()>0 && responseObj.getPANDetails().get(0)!=null){
	
			if(responseObj.getPANDetails().get(0).getPANStatus()!=null && !responseObj.getPANDetails().get(0).getPANStatus().isEmpty()){
				System.out.println("PAN STATUS VALIDATE_JSP::: "+responseObj.getPANDetails().get(0).getPANStatus());
				if("E".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					out.println("FATHER NAME : :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"-Existing and Valid PAN.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("X".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					out.println("FATHER NAME : :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Marked as Deactivated.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("D".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME : :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Deleted.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("EA".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					out.println("FATHER NAME : :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Amalgamation' in ITD database.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("EC".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME : :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Acquisition' in ITD database.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("ED".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Death' in ITD database");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("EI".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Dissolution' in ITD database");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("EL".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Liquidated' in ITD database.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("EM".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Merger' in ITD database.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("EP".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Partition' in ITD database.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("ES".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Split' in ITD database.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("EU".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("PAN NO :"+responseObj.getPANDetails().get(0).getPAN());
					out.println("NAME :"+responseObj.getPANDetails().get(0).getName());
					//out.println("FIRST NAME :"+responseObj.getPANDetails().get(0).getFirstName());
					out.println("FATHER NAME :"+responseObj.getPANDetails().get(0).getFATHERNAME()); 
					out.println("DOB :"+responseObj.getPANDetails().get(0).getDOB());
					out.println("PAN STATUS :"+responseObj.getPANDetails().get(0).getPANStatus()+"- Existing and Valid but event marked as 'Under Liquidation' in ITD database.");
					/* if(responseObj.getPANDetails().get(0).getFiller1()!=null && !responseObj.getPANDetails().get(0).getFiller1().isEmpty()){
						out.println("NAME ON CARD :"+responseObj.getPANDetails().get(0).getFiller1());
					}else{
						out.println("NAME ON CARD :");
					}
					if(responseObj.getPANDetails().get(0).getFiller2()!=null && !responseObj.getPANDetails().get(0).getFiller2().isEmpty()){
						out.println("FILLER-B :"+responseObj.getPANDetails().get(0).getFiller2());
					}else{
						out.println("FILLER-B :");
					}
					if(responseObj.getPANDetails().get(0).getFiller3()!=null && !responseObj.getPANDetails().get(0).getFiller3().isEmpty()){
						out.println("FILLER-C :"+responseObj.getPANDetails().get(0).getFiller3());
					}else{
						out.println("FILLER-C :");
					} */
					out.println("SEEDING STATUS :"+responseObj.getPANDetails().get(0).getSEEDINGSTATUS());
					out.println("VALUE1 :"+responseObj.getPANDetails().get(0).getValue1());
					out.println("VALUE2 :"+responseObj.getPANDetails().get(0).getValue2());
					
				}else if("F".equalsIgnoreCase(responseObj.getPANDetails().get(0).getPANStatus())){
					out.println("Fake PAN");
				}else{
					out.println("Not present in NSDL database/Invalid PAN");
				}
			}
	}else{
		out.println("Return code : "+responseObj.getReturnCode());
		out.println("Response Description: "+responseObj.getReturnDescription());
	}
}else{
	out.println("No response retrieved from NSDL");
}
%>

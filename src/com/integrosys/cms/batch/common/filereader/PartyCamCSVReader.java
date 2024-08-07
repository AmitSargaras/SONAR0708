/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: $
 */
package com.integrosys.cms.batch.common.filereader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Vector;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.propertyfile.PropertyManager;
import com.integrosys.base.techinfra.validation.Validator;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.asst.validator.ASSTValidator;
import com.integrosys.cms.batch.common.datafileparser.Column;
import com.integrosys.cms.batch.common.datafileparser.DataFile;
import com.integrosys.cms.ui.common.constant.IGlobalConstant;

/**
 * Reader for CSV file.
 * 
 * @author $Author: kltan, pctan $<br>
 * @version $Revision:$
 * @since $Date: $ Tag: $Name: $
 */
public class PartyCamCSVReader implements ICMSConstant{

	static Locale locale;
	boolean validationStatus = true;
	HashMap errorHm = new HashMap();
	private int maxRowCount = 0;
	String errorCode = "";
	private boolean isCheckSumFooter = false;
	/*Added by archana for USer upload - start*/
	private boolean userMasterValidationStatus = true ;
	private String secondaryDelimiter;
	/*Added by archana for USer upload - end*/
	public static void setLocale(Locale loca)
	{
		 locale = loca;	
	}
	
	

	public Vector csvToVector(String row, String delimStr) {
	int c;
	Vector v;
	boolean doubleQoutedFieldStarted;
	String fieldValue;
	v = new Vector();
	doubleQoutedFieldStarted = false;
	fieldValue = "";
	c = 0;

	char delim = delimStr.charAt(0);

	while (c < row.length()) {
		L424: {
			if (row.charAt(c) == 34) {
				if (((c + 1) < row.length()) && (row.charAt(c + 1) == 34)) {
					if (((c + 2) < row.length()) && (row.charAt(c + 2) == 34)) {
						if (doubleQoutedFieldStarted == false) {
							doubleQoutedFieldStarted = true;
						}
						else {
							doubleQoutedFieldStarted = false;
						}
						fieldValue = new StringBuffer().append(fieldValue).append(row.charAt(c + 2)).toString();
						c = c + 2;
					}
					else {
						if (((c + 2) == row.length()) || (((c + 2) < row.length()) && (row.charAt(c + 2) == delim))) {
							if (fieldValue.equals("")) {
								if (doubleQoutedFieldStarted == false) {
									doubleQoutedFieldStarted = true;
								}
								else {
									doubleQoutedFieldStarted = false;
								}
							}
							else {
								fieldValue = new StringBuffer().append(fieldValue).append(row.charAt(c)).toString();
							}
							break L424;
						}
						fieldValue = new StringBuffer().append(fieldValue).append(row.charAt(c + 1)).toString();
						c++;
					}
				}
				else {
					if (doubleQoutedFieldStarted) {
						if (((c + 1) == row.length()) || (((c + 1) < row.length()) && (row.charAt(c + 1) == delim))) {
							doubleQoutedFieldStarted = false;
						}
						else {
							fieldValue = new StringBuffer().append(fieldValue).append(row.charAt(c)).toString();
						}
						break L424;
					}
					doubleQoutedFieldStarted = true;
				}
				break L424;
			}
			if (row.charAt(c) == delim) {
				if (doubleQoutedFieldStarted) {
					fieldValue = new StringBuffer().append(fieldValue).append(row.charAt(c)).toString();
				}
				else {
					// System.out.println("fieldValue="+fieldValue);

					v.addElement(fieldValue);
					fieldValue = "";
				}
				break L424;
			}
			fieldValue = new StringBuffer().append(fieldValue).append(row.charAt(c)).toString();
		}
		c++;
	}// end while
	v.addElement(fieldValue);

	return v;
}
	// Read File from UI
	public void readFileCSV(FormFile fileUpload, ProcessDataFilePartyCam dd,DataFile dataFile,String master) {
		try {
			BufferedReader count_in=null;
			BufferedReader in=null;
			if(fileUpload==null)
			{
			count_in=new BufferedReader(new FileReader("D:\\testdata\\UBS.CSV"));
			}
			else
			{
			count_in = new BufferedReader(new InputStreamReader(fileUpload.getInputStream()));
			}
			String str;
			ArrayList maxHolder = new ArrayList();
			int maxCount = 0;
			int lastRowCount = 0;
			long rowCheckSumTotal = 0;
			//Get row count of Last record
			while ((str = count_in.readLine()) != null) {
				lastRowCount++;
			}
			if(fileUpload==null)
			{
			in=new BufferedReader(new FileReader("D:\\testdata\\UBS.CSV"));
			}
			else
			{
			in = new BufferedReader(new InputStreamReader(fileUpload.getInputStream()));
			}
			int count = 0;
			
			while ((str = in.readLine()) != null) {
				validationStatus = true;
				String [][]errorList = new String[dataFile.getHeader().getColumn().length][4];
				HashMap hm = new HashMap();
				Vector vValus = csvToVector(str, dataFile.getDelimiter());
				long rowCheckSum = 0;
							
				if(count == lastRowCount-1 && dataFile.getIsFooter()!=1){
					if(master.equals(USER_UPLOAD)){
						secondaryDelimiter = dataFile.getSecondaryDelimiter();
						/*Check if footer identifier and footer data count is correct */
						if(((String)vValus.elementAt(0)).equals(FOOTER_INDENTIFIER) && vValus.size()== 3){
							/*Check if total row count mentioned in the footer is correct and
							/*Check if total of row checksum matches with the checksum mentioned in the footer
							 * */
							if(Long.parseLong((String)vValus.elementAt(1)) == lastRowCount-2
								&& Long.parseLong((String)vValus.elementAt(2)) == rowCheckSumTotal){
								isCheckSumFooter = false;
								
							}else{
								String checked = (String)PropertyManager.getValue("masterupload.footer.required");
								if(checked.equalsIgnoreCase("No")){
									isCheckSumFooter = false;
								}else{
									isCheckSumFooter = true;
									//userMasterValidationStatus = false;
									validationStatus = false;
									errorList[1][0] = "";
									errorList[1][1] = "Footer checksum does not match";
								}
								
							}
							
						}else{
							//To Do - Handle this error condition - Reject this file
							
							userMasterValidationStatus = false;
							validationStatus = false;
							errorList[1][0] = "";
							errorList[1][1] = "Invalid File";
						}
					}else{
						//This footer check sum is for other masters
						isCheckSumFooter = checkSumRowCount(lastRowCount, str);
					}
					count++;
					continue;
				}else if (count < dd.rowStartIndex) {
					count++;
					continue;
				}
				else if ((count > dd.rowEndIndex) && (dd.rowEndIndex != 0)) {
					break;
				}

				if (str.equals("")) {
					validationStatus = false;
					errorList[1][0] = "";
					errorList[1][1] = "Remove all empty line from the file";
					errorHm.put(new Integer(count), errorList);
					count++;
					continue;
				}

				
					if (vValus.size() == dataFile.getHeader().getColumn().length) {
						Column[] column = dataFile.getHeader().getColumn();
						if(master.equals(USER_UPLOAD))
							rowCheckSum = Long.parseLong((String) vValus.elementAt(column.length -1 ));
						for (int i = dd.columnStartIndex; i < column.length; i++) {
							String currentElement= ((String) vValus.elementAt(i)).trim();	
							 if(column[i].getDataType().equals("ALPHABETIC")){ 
								
							 //This validation is added to avoid xml file relase. in case of xml, HDFC need to take approval from different levels. to avoid that code level change is performed
							 // this is not good practice. one should do requied change in xml only.
								 if(column[i].getName().equalsIgnoreCase("PARTY_ID")){
									 if(currentElement.isEmpty()){
										 validationStatus = false;
											errorList[i][0] = ((String)column[i].getName()).toUpperCase();
											// errorList[i][1] = errorCode;
											errorList[i][1] = "PARTY ID is mandatory";
											 errorList[i][2]=(String)vValus.elementAt(i);
											 errorList[i][3]=String.valueOf(count); 
									 }
									 else if(!ASSTValidator.isValidAlphaNumStringWithSpace(currentElement)){
									 
										 if (!(errorCode = Validator.checkString((String) vValus.elementAt(i), true, 1, column[i].getLength().intValue())).equals(Validator.ERROR_NONE)) {
										validationStatus = false;
										errorList[i][0] = ((String)column[i].getName()).toUpperCase();
										// errorList[i][1] = errorCode;
										errorList[i][1] = "Invalid Entry";
										 errorList[i][2]=(String)vValus.elementAt(i);
										 errorList[i][3]=String.valueOf(count);
									}else{
										hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i));
									}
									}else{
										validationStatus = false;
										errorList[i][0] = ((String)column[i].getName()).toUpperCase();
										errorList[i][1] = "Invalid input data - Special Characters not allowed";
									}
								 }	
								 
								 if(column[i].getName().equalsIgnoreCase("RATING_TYPE")){
										hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i));
								 }
								 if(column[i].getName().equalsIgnoreCase("RM_EMPLOYEE_CODE")){
										hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i));
								 }
							 }
							 else if(column[i].getDataType().equals("NUMERIC_NON_MANDATORY")){
							    	 if("RAM_RATING_YEAR".equalsIgnoreCase(column[i].getName())){
							    		 if(0 == (currentElement.length())){
							    			 hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i)); 
							    		 }
							    		 else if(4 == (currentElement.length())){
										if (!(errorCode = Validator.checkInteger((String) vValus.elementAt(i), false, 0, 9999)).equals(Validator.ERROR_NONE)) {
											validationStatus = false;
											errorList[i][0] = ((String)column[i].getName()).toUpperCase();
//											 errorList[i][1] = errorCode;
											errorList[i][1] = "Invalid Entry";
											 errorList[i][2]=(String)vValus.elementAt(i);
											 errorList[i][3]=String.valueOf(count);
										}else{
											hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i));
										}
							    	 }else{
							    		 validationStatus = false;
											errorList[i][0] = ((String)column[i].getName()).toUpperCase();
//											 errorList[i][1] = errorCode;
											errorList[i][1] = "Invalid Entry";
											 errorList[i][2]=(String)vValus.elementAt(i);
											 errorList[i][3]=String.valueOf(count);
							    	 }
							    	 } else if("RAM_RATING".equalsIgnoreCase(column[i].getName())){
							    		 if(currentElement.length() > 2){
							    			 	validationStatus = false;
												errorList[i][0] = ((String)column[i].getName()).toUpperCase();
//												 errorList[i][1] = errorCode;
												errorList[i][1] = "Invalid Entry";
												 errorList[i][2]=(String)vValus.elementAt(i);
												 errorList[i][3]=String.valueOf(count);	
									    	 }else{
									    		 if (!(errorCode = Validator.checkInteger((String) vValus.elementAt(i), false, 0, 99)).equals(Validator.ERROR_NONE)) {
													validationStatus = false;
													errorList[i][0] = ((String)column[i].getName()).toUpperCase();
//													 errorList[i][1] = errorCode;
													errorList[i][1] = "Invalid Entry";
													 errorList[i][2]=(String)vValus.elementAt(i);
													 errorList[i][3]=String.valueOf(count);
												}else{
													hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i));
												}
									    		 
									    	 }
							    	 } else if("CUSTOMER_RAM_ID".equalsIgnoreCase(column[i].getName())){
							    		 if(currentElement.length() > 20){
							    			 validationStatus = false;
												errorList[i][0] = ((String)column[i].getName()).toUpperCase();
//												 errorList[i][1] = errorCode;
												errorList[i][1] = "Invalid Entry";
												 errorList[i][2]=(String)vValus.elementAt(i);
												 errorList[i][3]=String.valueOf(count);
							    		 }else{
												if (!(errorCode = ASSTValidator.checkBigInteger((String) vValus.elementAt(i), false,new BigInteger("0"), new BigInteger("99999999999999999999"))).equals(Validator.ERROR_NONE)) {
													validationStatus = false;
													errorList[i][0] = ((String)column[i].getName()).toUpperCase();
//													 errorList[i][1] = errorCode;
													errorList[i][1] = "Invalid Entry";
													 errorList[i][2]=(String)vValus.elementAt(i);
													 errorList[i][3]=String.valueOf(count);
												}else{
													hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i));
												}
									    	 }
							    	 }
									}
								else if(column[i].getDataType().equals("DATE_NON_MANDATORY")){

										 if( !("".equals(currentElement))){
										 
										 try {
											  SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
											  sdf.setLenient(false);
										      sdf.parse(currentElement);
										      if(11==(currentElement.length())){
												     if('/'== currentElement.charAt(2) && '/'== currentElement.charAt(6)){
												    	 hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i));
												     }else{
												    	 validationStatus = false;
														 errorList[i][0] = ((String)column[i].getName()).toUpperCase();
														 errorList[i][1] = "Invalid Date";
														 errorList[i][2]=(String)vValus.elementAt(i);
														 errorList[i][3]=String.valueOf(count); 
												     }
										      }else{
										    	  validationStatus = false;
													 errorList[i][0] = ((String)column[i].getName()).toUpperCase();
													 errorList[i][1] = "Invalid Date";
													 errorList[i][2]=(String)vValus.elementAt(i);
													 errorList[i][3]=String.valueOf(count); 
										      }
										 }
										 catch(ParseException e){
											 validationStatus = false;
											 errorList[i][0] = ((String)column[i].getName()).toUpperCase();
											 errorList[i][1] = "Invalid Date";
											 errorList[i][2]=(String)vValus.elementAt(i);
											 errorList[i][3]=String.valueOf(count); 
										 }
										 }else{
											 hm.put(((String)column[i].getName()).toUpperCase(), vValus.elementAt(i));
										 }
								 } else if(column[i].getDataType().equals("DECIMAL_NON_MANDATORY")) {
						              double maxValue = IGlobalConstant.MAXIMUM_ALLOWED_AMOUNT_20_2;
						              String amount = (String)vValus.elementAt(i);
						              System.out.println("The amount is "+amount);
						              //this.errorCode = Validator.checkAmount(amount, false, 0.0D, maxValue, IGlobalConstant.DEFAULT_CURRENCY, locale);
						              if (amount!=null && 
						            		  amount.contains("-") && 
						            		  "NON_FUNDED_AMOUNT".equalsIgnoreCase(column[i].getName()) ) {
						            	  System.out.println("Total Non Funded Amount is negative");
						            	  this.validationStatus = false;
							              errorList[i][0] = column[i].getName().toUpperCase();
							              errorList[i][1] = "Total Non Funded Amount can not be negative.";
							              errorList[i][2] = ((String)vValus.elementAt(i));
							              errorList[i][3] = String.valueOf(count);
						              }else if (!(errorCode = Validator.checkAmount(amount, false, 0,maxValue, 
						            		  IGlobalConstant.DEFAULT_CURRENCY, new Locale("en"))).equals(Validator.ERROR_NONE)) {
						            	  this.validationStatus = false;
							              errorList[i][0] = column[i].getName().toUpperCase();
							              errorList[i][1] = "Invalid Entry";
							              errorList[i][2] = ((String)vValus.elementAt(i));
							              errorList[i][3] = String.valueOf(count);
						              } else {
						            	  
						            	  hm.put(column[i].getName().toUpperCase(),(String) vValus.elementAt(i));
						              }
								 }
						}
					}else{
						//To do - reject this record
						validationStatus = false;
						//userMasterValidationStatus = false;
						errorList[1][0] = "";
						errorList[1][1] = "Number of columns is not as per template";
						 errorList[1][2]=(String)vValus.elementAt(2);
						 errorList[1][3]=String.valueOf(count);
					}

				if(!validationStatus && errorList!=null) {
					errorHm.put(new Integer(count), errorList);
				}//Make it else if
				//Govind S: Blow commented code replace with nested if condition.
//				if (validationStatus && dd.maxRecProcess == null) {
//					dd.rowArray.add(hm);
//				}
				if( dd.maxRecProcess == null)
				{
					if (validationStatus) {
						dd.rowArray.add(hm);
					}
					
					if(master.equals(USER_UPLOAD)||master.equals(UBS_UPLOAD)||master.equals(FINWARE_UPLOAD)||master.equals(FINWAREFD_UPLOAD)||master.equals(EXCHANGE_RATE_UPLOAD)||master.equals(STOCK_ITEM_UPLOAD)||master.equals(BOND_ITEM_UPLOAD)||master.equals(MUTUAL_FUNDS_ITEM_UPLOAD)){
						validationStatus=true;
						
					}
				}
				else if (dd.maxRecProcess.intValue() >= maxCount) {
					dd.rowArray.add(maxHolder);
					maxCount = 0;
					maxHolder = new ArrayList();
				}
				if (dd.maxRecProcess != null) {
					maxHolder.add(hm);
					maxCount++;
				}
				count++;
				rowCheckSumTotal = rowCheckSumTotal+ rowCheckSum;
			}// end while
			maxRowCount = count;
			
			in.close();
			if ((dd.maxRecProcess != null) && !maxHolder.isEmpty()) {
				if(validationStatus) {
					dd.rowArray.add(maxHolder);
				}else{
					dd.rowArray.add(maxHolder);
				}
			}

			// System.out.println("successful insert csv data into array...");
		}
		catch (ArrayIndexOutOfBoundsException e) {
			 e.printStackTrace();
			 errorHm.put("partycamfileuploadError", new ActionMessage("label.partycam.file.error"));
		}
		catch (Exception e) {
			DefaultLogger.error(this, "", e);
			e.printStackTrace();
			throw new ProcessFileException(e.getMessage());
		}
	}
	
	public boolean checkSumRowCount(int lastRowCount,String row) {
		String checked = (String)PropertyManager.getValue("masterupload.footer.required");
		if(checked.equalsIgnoreCase("No")){
			return false;
		}
		String []footerKeyValue = row.split("|");
		try{
			int footerValue = Integer.parseInt(footerKeyValue[1].trim());
			if(!footerKeyValue[0].trim().equalsIgnoreCase("FOOTER") || lastRowCount-2 != Integer.parseInt(footerKeyValue[1].trim())){
				return true;
			}
		}catch(Exception e){
			return true;
		}
		return false;
	}

	public boolean isValidationStatus() {
		return validationStatus;
	}

	public void setValidationStatus(boolean validationStatus) {
		this.validationStatus = validationStatus;
	}

	public HashMap getErrorHm() {
		return errorHm;
	}

	public void setErrorHm(HashMap errorHm) {
		this.errorHm = errorHm;
	}

	public int getMaxRowCount() {
		return maxRowCount;
	}

	public void setMaxRowCount(int maxRowCount) {
		this.maxRowCount = maxRowCount;
	}

	public boolean isCheckSumFooter() {
		return isCheckSumFooter;
	}

	public void setCheckSumFooter(boolean isCheckSumFooter) {
		this.isCheckSumFooter = isCheckSumFooter;
	}
	/*Added by archana for USer upload - start*/
	/**
	 * @return the userMasterValidationStatus
	 */
	public boolean isUserMasterValidationStatus() {
		return userMasterValidationStatus;
	}

	/**
	 * @param userMasterValidationStatus the userMasterValidationStatus to set
	 */
	public void setUserMasterValidationStatus(boolean userMasterValidationStatus) {
		this.userMasterValidationStatus = userMasterValidationStatus;
	}

	/**
	 * @return the secondaryDelimiter
	 */
	public String getSecondaryDelimiter() {
		return secondaryDelimiter;
	}

	/**
	 * @param secondaryDelimiter the secondaryDelimiter to set
	 */
	public void setSecondaryDelimiter(String secondaryDelimiter) {
		this.secondaryDelimiter = secondaryDelimiter;
	}
	

}
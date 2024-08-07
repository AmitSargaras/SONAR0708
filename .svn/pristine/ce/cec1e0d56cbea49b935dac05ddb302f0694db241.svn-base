package com.integrosys.simulator.host.tcp;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;
import com.integrosys.simulator.host.base.helper.Util;
import com.integrosys.simulator.host.transformer.TCPFixedLengthEncodeTransfomer;
import com.integrosys.simulator.host.transformer.TCPFixedLengthTransfomer;

public class TCPLoadSetting {
	private static Map<String, String> hostTCPLoadSettingMap = new HashMap<String, String>();

	private char data_type_P = 'P';

	private char data_type_A = 'A';

	private String properties_file = "build.properties";

	private String project_root = "project.root";

	private String host_service_file = File.separator + "config" + File.separator + "HostServices.xml";

	private String xml_rt_start = "start";

	private String xml_rt_type = "type";

	private String xml_rt_length = "length";

	private String xml_rt_transactions = "transactions";

	private String xml_rt_args = "args";

	private String xml_rt_trnsId = "trnsId";

	private String xml_rt_output_dir = "output_dir";

	private String xml_rt_objRS = "objRS";

	private String xml_rt_tempCdRS = "tempCdRS";

	private String xml_rt_headTempRQ = "headTempRQ";

	private String xml_rt_tempCdRQ = "tempCdRQ";

	private String xml_rt_dest = "dest";

	private String xml_rt_badDest = "badDest";

	private String xml_rt_tag = "tag";

	private String xml_rt_endTag = "endTag";

	private String xml_rt_dynamicResponse = "dynamicResponse";

	public TCPLoadSetting() {
		hostTCPLoadSettingMap.put("97201", "SIBS_COLLATERAL_MASTER_REQ");
		hostTCPLoadSettingMap.put("98201", "SIBS_COLLATERAL_MASTER_REQ");
		hostTCPLoadSettingMap.put("99201", "SIBS_COLLATERAL_MASTER_REQ");
		hostTCPLoadSettingMap.put("97204", "SIBS_COLLATERAL_INSURANCE_REQ");
		hostTCPLoadSettingMap.put("98204", "SIBS_COLLATERAL_INSURANCE_REQ");
		hostTCPLoadSettingMap.put("99204", "SIBS_COLLATERAL_INSURANCE_REQ");
		hostTCPLoadSettingMap.put("97206", "SIBS_COLLATERAL_CHARGOR_REQ");
		hostTCPLoadSettingMap.put("98206", "SIBS_COLLATERAL_CHARGOR_REQ");
		hostTCPLoadSettingMap.put("99206", "SIBS_COLLATERAL_CHARGOR_REQ");
		hostTCPLoadSettingMap.put("97205", "SIBS_COLLATERAL_TRADE_IN_REQ");
		hostTCPLoadSettingMap.put("98205", "SIBS_COLLATERAL_TRADE_IN_REQ");
		hostTCPLoadSettingMap.put("99205", "SIBS_COLLATERAL_TRADE_IN_REQ");
		hostTCPLoadSettingMap.put("97310", "SIBS_FACILITY_MASTER_REQ");
		hostTCPLoadSettingMap.put("98310", "SIBS_FACILITY_MASTER_REQ");
		hostTCPLoadSettingMap.put("99310", "SIBS_FACILITY_MASTER_REQ");
		hostTCPLoadSettingMap.put("97312", "SIBS_FACILITY_RELATIONSHIP_REQ");
		hostTCPLoadSettingMap.put("98312", "SIBS_FACILITY_RELATIONSHIP_REQ");
		hostTCPLoadSettingMap.put("99312", "SIBS_FACILITY_RELATIONSHIP_REQ");
		hostTCPLoadSettingMap.put("97317", "SIBS_FACILITY_BNM_REQ");
		hostTCPLoadSettingMap.put("98317", "SIBS_FACILITY_BNM_REQ");
		hostTCPLoadSettingMap.put("99317", "SIBS_FACILITY_BNM_REQ");
		hostTCPLoadSettingMap.put("97318", "SIBS_FACILITY_OFFICER_REQ");
		hostTCPLoadSettingMap.put("98318", "SIBS_FACILITY_OFFICER_REQ");
		hostTCPLoadSettingMap.put("99318", "SIBS_FACILITY_OFFICER_REQ");
		hostTCPLoadSettingMap.put("97319", "SIBS_FACILITY_INSURANCE_REQ");
		hostTCPLoadSettingMap.put("98319", "SIBS_FACILITY_INSURANCE_REQ");
		hostTCPLoadSettingMap.put("99319", "SIBS_FACILITY_INSURANCE_REQ");
		hostTCPLoadSettingMap.put("97323", "SIBS_FACILITY_MULTI_TIER_FINANCING_REQ");
		hostTCPLoadSettingMap.put("98323", "SIBS_FACILITY_MULTI_TIER_FINANCING_REQ");
		hostTCPLoadSettingMap.put("99323", "SIBS_FACILITY_MULTI_TIER_FINANCING_REQ");
		hostTCPLoadSettingMap.put("97322", "SIBS_FACILITY_BBA_VARI_PACKAGE_REQ");
		hostTCPLoadSettingMap.put("98322", "SIBS_FACILITY_BBA_VARI_PACKAGE_REQ");
		hostTCPLoadSettingMap.put("99322", "SIBS_FACILITY_BBA_VARI_PACKAGE_REQ");
		hostTCPLoadSettingMap.put("97321", "SIBS_FACILITY_ISLAMIC_MASTER_REQ");
		hostTCPLoadSettingMap.put("98321", "SIBS_FACILITY_ISLAMIC_MASTER_REQ");
		hostTCPLoadSettingMap.put("99321", "SIBS_FACILITY_ISLAMIC_MASTER_REQ");
		hostTCPLoadSettingMap.put("97701", "SIBS_COLLATERAL_FACILITY_LINKAGE_REQ");
		hostTCPLoadSettingMap.put("98701", "SIBS_COLLATERAL_FACILITY_LINKAGE_REQ");
		hostTCPLoadSettingMap.put("99701", "SIBS_COLLATERAL_FACILITY_LINKAGE_REQ");
		hostTCPLoadSettingMap.put("97702", "SIBS_COLLATERAL_CHARGE_REQ");
		hostTCPLoadSettingMap.put("98702", "SIBS_COLLATERAL_CHARGE_REQ");
		hostTCPLoadSettingMap.put("99702", "SIBS_COLLATERAL_CHARGE_REQ");

		System.out.println(" [hostTCPLoadSettingMap] size: " + hostTCPLoadSettingMap.size());
	}

	public String readfile(String inputDir) throws Exception {
		File f = new File(inputDir);
		InputStream is = null;
		// byte[] bytes = null;
		StringBuffer buffer = new StringBuffer();
		String line = null;

		try {
			is = new FileInputStream(f);
			BufferedReader in = new BufferedReader(new InputStreamReader(is));
			while ((line = in.readLine()) != null) {
				buffer.append(line);
			}

			//
			// long length = f.length();
			// bytes = new byte[(int)length];
			// is.read(bytes);
		}
		catch (Exception e) {
			throw new Exception("Cannot read the file !!!!! Please put the rigth file into right directory");
		}
		finally {
			try {
				if (is != null) {
					is.close();
					is = null;
				}

			}
			catch (Exception e) {
				throw new Exception("Cannot read the file !!!!! Please put the rigth file into right directory");
			}
		}

		return buffer.toString();

	}

	public TCPLoadSettingVO loadConfig(byte[] requestString) throws Exception {
		String destinationPath = "";
		String reponseXML = "";
		TCPLoadSettingVO tcpLoadSettingVO = new TCPLoadSettingVO();
		String transformString = "";
		try {
			Properties properties = new Properties();
			properties.load(new FileInputStream(properties_file));
			String projectRoot = properties.getProperty(project_root);
			SAXBuilder saxBuilder = new SAXBuilder(false);
			Document configDocument = saxBuilder.build(projectRoot + host_service_file);

			Element rootElement = configDocument.getRootElement();
			Element rootTransactions = rootElement.getChild(xml_rt_transactions);

			// determine Is ASCII
			boolean isAscii = false;
			if (checkAscii(new String(requestString))) {
				isAscii = true;
				transformString = new String(requestString);
			}
			if ((rootTransactions.getChildren() != null) && (rootTransactions.getChildren().size() > 0)) {
				List<Element> elementServiceList = rootTransactions.getChildren();
				for (int i = 0; i < elementServiceList.size(); i++) {
					Element elementService = (Element) elementServiceList.get(i);
					System.out.println("[args] = " + elementService.getChildTextTrim(xml_rt_args));
					if ((elementService.getChildTextTrim(xml_rt_args) == null)
							|| (elementService.getChildTextTrim(xml_rt_args) == "")) {
						throw new Exception("<args> cannot be null or empty value");
					}

					if (!isAscii) {
						// //Only for Fix length
						if ("XML".equalsIgnoreCase(elementService.getChildTextTrim(xml_rt_type))) {
							continue;
						}
						else {
							int trxStart = Integer.parseInt(elementService.getChild(xml_rt_trnsId).getAttribute(
									xml_rt_start).getValue());
							int trxKeep = Integer.parseInt(elementService.getChild(xml_rt_trnsId).getAttribute(
									xml_rt_length).getValue());
							byte[] requestByteArray = new byte[trxKeep];

							char trxArgsType = elementService.getChild(xml_rt_trnsId).getAttribute(xml_rt_type)
									.getValue().toUpperCase().charAt(0);

							// check the message length is equal length of
							// transaction id
							if (new String(requestString).length() < (trxStart + trxKeep)) {
								continue;

							}
							else {
								System.arraycopy(requestString, trxStart, requestByteArray, 0, trxKeep);
								transformString = new String(Util.Decode(requestByteArray, trxKeep, trxArgsType, true,
										0));

								// check matching on FIX_LENGTH
								if (transformString.lastIndexOf(elementService.getChildTextTrim(xml_rt_trnsId).trim()) >= 0) {

									if (elementService.getChild(xml_rt_args).getAttribute(xml_rt_start) == null) {
										throw new Exception("Incorrect value in start position or end postion");
									}

									int start = Integer.parseInt(elementService.getChild(xml_rt_args).getAttribute(
											xml_rt_start).getValue());
									int keep = Integer.parseInt(elementService.getChild(xml_rt_args).getAttribute(
											xml_rt_length).getValue());

									if (keep <= 0) {
										throw new Exception("Incorrect value in start position or end postion");
									}

									byte[] argsByteArray = new byte[keep];
									System.arraycopy(requestString, start, argsByteArray, 0, keep);
									char argsType = elementService.getChild(xml_rt_args).getAttribute(xml_rt_type)
											.getValue().toUpperCase().charAt(0);
									String argsString = new String(Util.Decode(argsByteArray, keep, argsType, true, 0));
									if (argsType == data_type_P) {
										System.out.println("[Pack Value String] : " + argsString);
										BigDecimal temp = new BigDecimal(argsString);
										argsString = temp.toString();
									}

									System.out.println("[Transaction Id] : "
											+ elementService.getChildTextTrim(xml_rt_trnsId));
									System.out.println("[Request String] : " + argsString);

									Object objRS = Class.forName(elementService.getChildTextTrim(xml_rt_objRS))
											.newInstance();
									// byte[] reponseByte =
									// reponseXML.getBytes();
									byte[] reponseByte;
									// check argument match
									if (argsString.trim().equalsIgnoreCase(
											elementService.getChildTextTrim(xml_rt_args).trim())) {
										System.out.println("[Match Argument] : "
												+ elementService.getChildTextTrim(xml_rt_args));
										if ((elementService.getChildTextTrim(xml_rt_dynamicResponse) == null)
												|| (elementService.getChildTextTrim(xml_rt_dynamicResponse) == "")) {
											destinationPath = projectRoot
													+ elementService.getChildTextTrim(xml_rt_output_dir) + "/"
													+ elementService.getChildTextTrim(xml_rt_dest);
											reponseByte = generateFixedResponse(destinationPath, objRS, elementService
													.getChildTextTrim(xml_rt_tempCdRS), elementService
													.getChildTextTrim(xml_rt_tempCdRQ), elementService
													.getChildTextTrim(xml_rt_headTempRQ));
										}
										else {
											reponseByte = generateDynamicResponse(elementService
													.getChildTextTrim(xml_rt_tempCdRS), elementService
													.getChildTextTrim(xml_rt_tempCdRQ), elementService
													.getChildTextTrim(xml_rt_headTempRQ), elementService
													.getChildTextTrim(xml_rt_trnsId), objRS, requestString);
										}
									}
									else {
										System.out.println("[UnMatch Argument] : "
												+ elementService.getChildTextTrim(xml_rt_args));
										destinationPath = projectRoot
												+ elementService.getChildTextTrim(xml_rt_output_dir) + "/"
												+ elementService.getChildTextTrim(xml_rt_badDest);
										reponseByte = generateFixedResponse(destinationPath, objRS, elementService
												.getChildTextTrim(xml_rt_tempCdRS), elementService
												.getChildTextTrim(xml_rt_tempCdRQ), elementService
												.getChildTextTrim(xml_rt_headTempRQ));
									}

									// add end tag in response message

									if ("Y".equalsIgnoreCase(elementService.getChild(xml_rt_endTag).getAttribute(
											xml_rt_tag).getValue())) {
										byte[] reponseByteWithEndTag = new byte[reponseByte.length + 1];
										System.out.println("[endTag] : "
												+ elementService.getChildTextTrim(xml_rt_endTag));
										byte[] temp = Util.Encode(elementService.getChildTextTrim(xml_rt_endTag),
												data_type_A, 1, true, 0);

										// System.arraycopy(temp, 0,
										// reponseByte, reponseByte.length -1 ,
										// temp.length);
										System.arraycopy(reponseByte, 0, reponseByteWithEndTag, 0, reponseByte.length);
										System.arraycopy(temp, 0, reponseByteWithEndTag, reponseByte.length, 1);

										tcpLoadSettingVO.setResponseString(reponseByteWithEndTag);
									}
									else {
										tcpLoadSettingVO.setResponseString(reponseByte);
									}

									break;
								}
							}

						}

					}
					else {
						// Only for XML
						if ("fixed_length".equalsIgnoreCase(elementService.getChildTextTrim(xml_rt_type))) {
							continue;
						}
						else {
							// check matching on XML
							if (transformString.lastIndexOf(elementService.getChildTextTrim(xml_rt_trnsId).trim()) >= 0) {
								System.out.println("[Transaction Id] : "
										+ elementService.getChildTextTrim(xml_rt_trnsId));
								System.out.println("[Request String] : " + transformString);

								// check argument match
								if (transformString.lastIndexOf(elementService.getChildTextTrim(xml_rt_args).trim()) >= 0) {
									System.out.println("[Match Argument] : "
											+ elementService.getChildTextTrim(xml_rt_args));
									destinationPath = projectRoot + elementService.getChildTextTrim(xml_rt_output_dir)
											+ "/" + elementService.getChildTextTrim(xml_rt_dest);
									reponseXML = readfile(destinationPath);
								}
								else {
									System.out.println("[UnMatch Argument] : "
											+ elementService.getChildTextTrim(xml_rt_args));
									destinationPath = projectRoot + elementService.getChildTextTrim(xml_rt_output_dir)
											+ "/" + elementService.getChildTextTrim(xml_rt_badDest);
									reponseXML = readfile(destinationPath);
								}

								byte[] reponseByte = reponseXML.getBytes();
								System.out.println("[destinationPath] : " + destinationPath);

								// add end tag in response message
								if ("Y".equalsIgnoreCase(elementService.getChild(xml_rt_endTag)
										.getAttribute(xml_rt_tag).getValue())) {
									System.out.println("[endTag] : " + elementService.getChildTextTrim(xml_rt_endTag));
									reponseByte = (new String(reponseByte) + elementService
											.getChildTextTrim(xml_rt_endTag)).getBytes();
								}

								tcpLoadSettingVO.setResponseString(reponseByte);
								break;
							}
						}

					}
				}
			}
			else {
				throw new Exception("Cant read XML ! Configure the node!!!!");
			}

		}
		catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return tcpLoadSettingVO;
	}

	private byte[] generateFixedResponse(String destinationPath, Object objRS, String tempCdRS, String tempCdRQ,
			String headerTempRQ) throws Exception {
		System.out.println("[destinationPath] : " + destinationPath);
		String reponseXML = readfile(destinationPath);

		// transform to ebcidic
		return readXMLtoObj(tempCdRS, tempCdRQ, reponseXML, objRS, headerTempRQ);
	}

	private byte[] generateDynamicResponse(String tempCdRS, String tempCdRQ, String headerTempRQ, String trxID,
			Object objRS, byte[] requestString) throws Exception {
		// TCPFixedLengthTransfomer flTransformer = new
		// TCPFixedLengthTransfomer();
		TCPFixedLengthEncodeTransfomer transformer = new TCPFixedLengthEncodeTransfomer();

		objRS = transformer.transformEncodedByteArrayToObj(tempCdRS, (String) hostTCPLoadSettingMap.get(trxID),
				headerTempRQ, requestString, objRS);

		if (objRS instanceof OBMessageHeader) {
			OBMessageHeader objHd = (OBMessageHeader) objRS;
			// set response code = AA
			objHd.setCommonSuccessResponse();

			// set response obj success info
			List responseList = objHd.getResponseFixList();
			if (responseList != null) {
				for (int j = 0; j < responseList.size(); j++) {
					Object responseObj = responseList.get(j);
					if (responseObj instanceof IOBHost) {
						IOBHost hostOb = (IOBHost) responseObj;
						hostOb.setSuccessResponse();
					}

					responseList.set(j, responseObj);
				}
			}
		}

		transformer = new TCPFixedLengthEncodeTransfomer();
		byte[] resulbyte = transformer.transformObjToEncodedByteArray(tempCdRQ, headerTempRQ, objRS);
		return resulbyte;
	}

	public byte[] readXMLtoObj(String tempCdRS, String tempCdRQ, String xmlStrBuffer, Object objRS, String headerTempRQ)
			throws Exception {
		// System.out.println("[readXMLtoObj]");
		TCPFixedLengthTransfomer flTransformer = new TCPFixedLengthTransfomer();
		TCPFixedLengthEncodeTransfomer transformer = new TCPFixedLengthEncodeTransfomer();

		// transform to object base on response template.
		objRS = flTransformer.unmarshalXML2Obj(tempCdRS, xmlStrBuffer, objRS);

		// transform to byte base on request template
		byte[] resulbyte = transformer.transformObjToEncodedByteArray(tempCdRQ, headerTempRQ, objRS);
		return resulbyte;
	}

	public boolean checkAscii(String s) {
		int l = s.length();

		for (int i = 0; i < l; i++) {
			if (nonascii((int) s.charAt(i))) {
				return false;
			}
		}

		return true;
	}

	public boolean nonascii(int b) {
		return (b >= 0177) || ((b < 040) && (b != '\r') && (b != '\n') && (b != '\t'));
	}

	public static byte[] ebcidicToAscii(byte[] ebcidicByte) throws Exception {
		try {
			int offset = 0;
			int len = ebcidicByte.length;
			byte[] asciiByte = new byte[len];
			for (int i = 0; i < len; i++) {
				asciiByte[i] = EBCDIC2ASCII[ebcidicByte[offset + i] & 0xFF];
			}
			return asciiByte;
		}
		catch (Exception e) {
			throw new Exception(e.getMessage(), e);
		}
	}

	public static final byte[] EBCDIC2ASCII = new byte[] { (byte) 0x0, (byte) 0x1, (byte) 0x2, (byte) 0x3, (byte) 0x9C,
			(byte) 0x9, (byte) 0x86, (byte) 0x7F, (byte) 0x97, (byte) 0x8D, (byte) 0x8E, (byte) 0xB, (byte) 0xC,
			(byte) 0xD, (byte) 0xE, (byte) 0xF, (byte) 0x10, (byte) 0x11, (byte) 0x12, (byte) 0x13, (byte) 0x9D,
			(byte) 0xA, (byte) 0x8, (byte) 0x87, (byte) 0x18, (byte) 0x19, (byte) 0x92, (byte) 0x8F, (byte) 0x1C,
			(byte) 0x1D, (byte) 0x1E, (byte) 0x1F, (byte) 0x80, (byte) 0x81, (byte) 0x82, (byte) 0x83, (byte) 0x84,
			(byte) 0x85, (byte) 0x17, (byte) 0x1B, (byte) 0x88, (byte) 0x89, (byte) 0x8A, (byte) 0x8B, (byte) 0x8C,
			(byte) 0x5, (byte) 0x6, (byte) 0x7, (byte) 0x90, (byte) 0x91, (byte) 0x16, (byte) 0x93, (byte) 0x94,
			(byte) 0x95, (byte) 0x96, (byte) 0x4, (byte) 0x98, (byte) 0x99, (byte) 0x9A, (byte) 0x9B, (byte) 0x14,
			(byte) 0x15, (byte) 0x9E, (byte) 0x1A, (byte) 0x20, (byte) 0xA0, (byte) 0xE2, (byte) 0xE4, (byte) 0xE0,
			(byte) 0xE1, (byte) 0xE3, (byte) 0xE5, (byte) 0xE7, (byte) 0xF1, (byte) 0xA2, (byte) 0x2E, (byte) 0x3C,
			(byte) 0x28, (byte) 0x2B, (byte) 0x7C, (byte) 0x26, (byte) 0xE9, (byte) 0xEA, (byte) 0xEB, (byte) 0xE8,
			(byte) 0xED, (byte) 0xEE, (byte) 0xEF, (byte) 0xEC, (byte) 0xDF, (byte) 0x21, (byte) 0x24, (byte) 0x2A,
			(byte) 0x29, (byte) 0x3B, (byte) 0x5E, (byte) 0x2D, (byte) 0x2F, (byte) 0xC2, (byte) 0xC4, (byte) 0xC0,
			(byte) 0xC1, (byte) 0xC3, (byte) 0xC5, (byte) 0xC7, (byte) 0xD1, (byte) 0xA6, (byte) 0x2C, (byte) 0x25,
			(byte) 0x5F, (byte) 0x3E, (byte) 0x3F, (byte) 0xF8, (byte) 0xC9, (byte) 0xCA, (byte) 0xCB, (byte) 0xC8,
			(byte) 0xCD, (byte) 0xCE, (byte) 0xCF, (byte) 0xCC, (byte) 0x60, (byte) 0x3A, (byte) 0x23, (byte) 0x40,
			(byte) 0x27, (byte) 0x3D, (byte) 0x22, (byte) 0xD8, (byte) 0x61, (byte) 0x62, (byte) 0x63, (byte) 0x64,
			(byte) 0x65, (byte) 0x66, (byte) 0x67, (byte) 0x68, (byte) 0x69, (byte) 0xAB, (byte) 0xBB, (byte) 0xF0,
			(byte) 0xFD, (byte) 0xFE, (byte) 0xB1, (byte) 0xB0, (byte) 0x6A, (byte) 0x6B, (byte) 0x6C, (byte) 0x6D,
			(byte) 0x6E, (byte) 0x6F, (byte) 0x70, (byte) 0x71, (byte) 0x72, (byte) 0xAA, (byte) 0xBA, (byte) 0xE6,
			(byte) 0xB8, (byte) 0xC6, (byte) 0xA4, (byte) 0xB5, (byte) 0x7E, (byte) 0x73, (byte) 0x74, (byte) 0x75,
			(byte) 0x76, (byte) 0x77, (byte) 0x78, (byte) 0x79, (byte) 0x7A, (byte) 0xA1, (byte) 0xBF, (byte) 0xD0,
			(byte) 0x5B, (byte) 0xDE, (byte) 0xAE, (byte) 0xAC, (byte) 0xA3, (byte) 0xA5, (byte) 0xB7, (byte) 0xA9,
			(byte) 0xA7, (byte) 0xB6, (byte) 0xBC, (byte) 0xBD, (byte) 0xBE, (byte) 0xDD, (byte) 0xA8, (byte) 0xAF,
			(byte) 0x5D, (byte) 0xB4, (byte) 0xD7, (byte) 0x7B, (byte) 0x41, (byte) 0x42, (byte) 0x43, (byte) 0x44,
			(byte) 0x45, (byte) 0x46, (byte) 0x47, (byte) 0x48, (byte) 0x49, (byte) 0xAD, (byte) 0xF4, (byte) 0xF6,
			(byte) 0xF2, (byte) 0xF3, (byte) 0xF5, (byte) 0x7D, (byte) 0x4A, (byte) 0x4B, (byte) 0x4C, (byte) 0x4D,
			(byte) 0x4E, (byte) 0x4F, (byte) 0x50, (byte) 0x51, (byte) 0x52, (byte) 0xB9, (byte) 0xFB, (byte) 0xFC,
			(byte) 0xF9, (byte) 0xFA, (byte) 0xFF, (byte) 0x5C, (byte) 0xF7, (byte) 0x53, (byte) 0x54, (byte) 0x55,
			(byte) 0x56, (byte) 0x57, (byte) 0x58, (byte) 0x59, (byte) 0x5A, (byte) 0xB2, (byte) 0xD4, (byte) 0xD6,
			(byte) 0xD2, (byte) 0xD3, (byte) 0xD5, (byte) 0x30, (byte) 0x31, (byte) 0x32, (byte) 0x33, (byte) 0x34,
			(byte) 0x35, (byte) 0x36, (byte) 0x37, (byte) 0x38, (byte) 0x39, (byte) 0xB3, (byte) 0xDB, (byte) 0xDC,
			(byte) 0xD9, (byte) 0xDA, (byte) 0x9F };
}
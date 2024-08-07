package com.integrosys.simulator.host.SIBS.collateralmaster;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCollateralMaster extends OBMessageHeader implements IOBHost {
	private Long collateralID;

	private String collateralName;

	private String collateralDesc;

	private String collateralStatus;

	private String currency;

	private String collateralInd;

	private Long accountNumber;

	private String accountType;

	private String collateralCode;

	private Integer collateralbranchNumber;

	private String titleNumber;

	private String lotNumber;

	private String chassisNumber;

	private String engineNumber;

	private String tickerSymbol;

	private BigDecimal sharesUnits;

	private BigDecimal quitRentAmt;

	private BigDecimal assessmentAmt;

	private BigDecimal externalAppraisedValue;

	private String externalAppraisedName;

	private BigDecimal currentValue;

	private BigDecimal reservedPrice;

	private Integer valuationFrequency;

	private String valuationFrequencyCode;

	private String valuationMethod;

	private Date quitRentPaymentDate;

	private Date assessmentPaymentDate;

	private Date externalAppraisalDate;

	private Date valuationDate;

	private Date nextValuationDate;

	private Date dateOfStatus;

	private Long registeredOwnerCIF;

	private String bondNumber;

	private String bondIssuerName;

	private Date bondMaturityDate;

	private String registrationNumber;

	private String ownerOccupied;

	private String propertyType;

	private BigDecimal forceSalesValue;

	private String propertyAddress1;

	private String propertyAddress2;

	private String propertyAddress3;

	private String freeholdLeaseholdInd;

	private Date titleExpiryDate;

	private String landArea;

	private Date guaranteeExpiryDate;

	private String sectionNo;

	private Date reservePriceDate;

	private String titleNoPrefix;

	private String categoryOfLand;

	private String allowPassive;

	private String masterTitleInd;

	private String masterTitleNo;

	private String assumption;

	private BigDecimal auctionPrice;

	private Date auctionDate;

	private Long depositAccountNo;

	private String bankOtherIssuerInd;

	private Date depositExpiryDate;

	private String issuingInstitution;

	private BigDecimal depositInterestRate;

	private BigDecimal depositAmount;

	private Integer depositTerm;

	private String depositTermCode;

	private Date issueDate;

	private String relationship;

	private String newUsedRecondInd;

	private String typeOfUnit;

	private String logBookNo;

	private BigDecimal purchasePrice;

	private BigDecimal downPaymentTradeIn;

	private BigDecimal downPaymentCash;

	private String commissionType;

	private Integer manufactureYear;

	private Date registrationDate;

	private String rlSerialNo;

	private String store;

	private BigDecimal reservedAmt;

	private String descExtra;

	private BigDecimal depositValue;

	private BigDecimal salesProceed;

	private Date dateChattelRepo;

	private Date dateChattelSold;

	private BigDecimal soldAmt;

	private Date roadTaxExpiryDate;

	private String modelNumber;

	private String makeOfGoods;

	private String portRegistration;

	private BigDecimal residualValue;

	private Date purchaseDate;

	private String collateralMessage;

	private String insurance;

	private Date confirmationDate;

	private BigDecimal exchangeRate;

	private String promissoryNoteNumber;

	private String chequeInd;

	private Long bankBranchCode;

	private String drawerName;

	private Date chequeDate;

	private String contractNumber;

	private String contractName;

	private BigDecimal contractAmt;

	private Date contractDate;

	private BigDecimal guaranteeAmt;

	private String itemType;

	private String purchaseReceiptNo;

	private String goldCode;

	private BigDecimal goldWeight;

	private String auctioneer;

	private BigDecimal registrationFee;

	private Long ownershipClaimNo;

	private BigDecimal redeemAmt;

	private BigDecimal pricePerUnit;

	private BigDecimal buyBackValue;

	private BigDecimal conversionRate;

	private String buildUpArea;

	private Integer postcode;

	private Date salesPurchaseDate;

	private String valueGivenInd;

	private BigDecimal cappedPrice;

	private Long cdsAccountNo;

	private BigDecimal exchangeRate2;

	private Long reimbursementBank;

	private String leasingType;

	private BigDecimal newUnitPrice;

	private String vehicleColor;

	private String unitTrustFundName;

	private BigDecimal originalValue;

	public Long getCollateralID() {
		return collateralID;
	}

	public void setCollateralID(Long collateralID) {
		this.collateralID = collateralID;
	}

	public String getCollateralName() {
		return collateralName;
	}

	public void setCollateralName(String collateralName) {
		this.collateralName = collateralName;
	}

	public String getCollateralDesc() {
		return collateralDesc;
	}

	public void setCollateralDesc(String collateralDesc) {
		this.collateralDesc = collateralDesc;
	}

	public String getCollateralStatus() {
		return collateralStatus;
	}

	public void setCollateralStatus(String collateralStatus) {
		this.collateralStatus = collateralStatus;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getCollateralInd() {
		return collateralInd;
	}

	public void setCollateralInd(String collateralInd) {
		this.collateralInd = collateralInd;
	}

	public Long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(Long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getCollateralCode() {
		return collateralCode;
	}

	public void setCollateralCode(String collateralCode) {
		this.collateralCode = collateralCode;
	}

	public Integer getCollateralbranchNumber() {
		return collateralbranchNumber;
	}

	public void setCollateralbranchNumber(Integer collateralbranchNumber) {
		this.collateralbranchNumber = collateralbranchNumber;
	}

	public String getTitleNumber() {
		return titleNumber;
	}

	public void setTitleNumber(String titleNumber) {
		this.titleNumber = titleNumber;
	}

	public String getLotNumber() {
		return lotNumber;
	}

	public void setLotNumber(String lotNumber) {
		this.lotNumber = lotNumber;
	}

	public String getChassisNumber() {
		return chassisNumber;
	}

	public void setChassisNumber(String chassisNumber) {
		this.chassisNumber = chassisNumber;
	}

	public String getEngineNumber() {
		return engineNumber;
	}

	public void setEngineNumber(String engineNumber) {
		this.engineNumber = engineNumber;
	}

	public String getTickerSymbol() {
		return tickerSymbol;
	}

	public void setTickerSymbol(String tickerSymbol) {
		this.tickerSymbol = tickerSymbol;
	}

	public BigDecimal getSharesUnits() {
		return sharesUnits;
	}

	public void setSharesUnits(BigDecimal sharesUnits) {
		this.sharesUnits = sharesUnits;
	}

	public BigDecimal getQuitRentAmt() {
		return quitRentAmt;
	}

	public void setQuitRentAmt(BigDecimal quitRentAmt) {
		this.quitRentAmt = quitRentAmt;
	}

	public BigDecimal getAssessmentAmt() {
		return assessmentAmt;
	}

	public void setAssessmentAmt(BigDecimal assessmentAmt) {
		this.assessmentAmt = assessmentAmt;
	}

	public BigDecimal getExternalAppraisedValue() {
		return externalAppraisedValue;
	}

	public void setExternalAppraisedValue(BigDecimal externalAppraisedValue) {
		this.externalAppraisedValue = externalAppraisedValue;
	}

	public String getExternalAppraisedName() {
		return externalAppraisedName;
	}

	public void setExternalAppraisedName(String externalAppraisedName) {
		this.externalAppraisedName = externalAppraisedName;
	}

	public BigDecimal getCurrentValue() {
		return currentValue;
	}

	public void setCurrentValue(BigDecimal currentValue) {
		this.currentValue = currentValue;
	}

	public BigDecimal getReservedPrice() {
		return reservedPrice;
	}

	public void setReservedPrice(BigDecimal reservedPrice) {
		this.reservedPrice = reservedPrice;
	}

	public Integer getValuationFrequency() {
		return valuationFrequency;
	}

	public void setValuationFrequency(Integer valuationFrequency) {
		this.valuationFrequency = valuationFrequency;
	}

	public String getValuationFrequencyCode() {
		return valuationFrequencyCode;
	}

	public void setValuationFrequencyCode(String valuationFrequencyCode) {
		this.valuationFrequencyCode = valuationFrequencyCode;
	}

	public String getValuationMethod() {
		return valuationMethod;
	}

	public void setValuationMethod(String valuationMethod) {
		this.valuationMethod = valuationMethod;
	}

	public Date getQuitRentPaymentDate() {
		return quitRentPaymentDate;
	}

	public void setQuitRentPaymentDate(Date quitRentPaymentDate) {
		this.quitRentPaymentDate = quitRentPaymentDate;
	}

	public Date getAssessmentPaymentDate() {
		return assessmentPaymentDate;
	}

	public void setAssessmentPaymentDate(Date assessmentPaymentDate) {
		this.assessmentPaymentDate = assessmentPaymentDate;
	}

	public Date getExternalAppraisalDate() {
		return externalAppraisalDate;
	}

	public void setExternalAppraisalDate(Date externalAppraisalDate) {
		this.externalAppraisalDate = externalAppraisalDate;
	}

	public Date getValuationDate() {
		return valuationDate;
	}

	public void setValuationDate(Date valuationDate) {
		this.valuationDate = valuationDate;
	}

	public Date getNextValuationDate() {
		return nextValuationDate;
	}

	public void setNextValuationDate(Date nextValuationDate) {
		this.nextValuationDate = nextValuationDate;
	}

	public Date getDateOfStatus() {
		return dateOfStatus;
	}

	public void setDateOfStatus(Date dateOfStatus) {
		this.dateOfStatus = dateOfStatus;
	}

	public Long getRegisteredOwnerCIF() {
		return registeredOwnerCIF;
	}

	public void setRegisteredOwnerCIF(Long registeredOwnerCIF) {
		this.registeredOwnerCIF = registeredOwnerCIF;
	}

	public String getBondNumber() {
		return bondNumber;
	}

	public void setBondNumber(String bondNumber) {
		this.bondNumber = bondNumber;
	}

	public String getBondIssuerName() {
		return bondIssuerName;
	}

	public void setBondIssuerName(String bondIssuerName) {
		this.bondIssuerName = bondIssuerName;
	}

	public Date getBondMaturityDate() {
		return bondMaturityDate;
	}

	public void setBondMaturityDate(Date bondMaturityDate) {
		this.bondMaturityDate = bondMaturityDate;
	}

	public String getRegistrationNumber() {
		return registrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}

	public String getOwnerOccupied() {
		return ownerOccupied;
	}

	public void setOwnerOccupied(String ownerOccupied) {
		this.ownerOccupied = ownerOccupied;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public BigDecimal getForceSalesValue() {
		return forceSalesValue;
	}

	public void setForceSalesValue(BigDecimal forceSalesValue) {
		this.forceSalesValue = forceSalesValue;
	}

	public String getPropertyAddress1() {
		return propertyAddress1;
	}

	public void setPropertyAddress1(String propertyAddress1) {
		this.propertyAddress1 = propertyAddress1;
	}

	public String getPropertyAddress2() {
		return propertyAddress2;
	}

	public void setPropertyAddress2(String propertyAddress2) {
		this.propertyAddress2 = propertyAddress2;
	}

	public String getPropertyAddress3() {
		return propertyAddress3;
	}

	public void setPropertyAddress3(String propertyAddress3) {
		this.propertyAddress3 = propertyAddress3;
	}

	public String getFreeholdLeaseholdInd() {
		return freeholdLeaseholdInd;
	}

	public void setFreeholdLeaseholdInd(String freeholdLeaseholdInd) {
		this.freeholdLeaseholdInd = freeholdLeaseholdInd;
	}

	public Date getTitleExpiryDate() {
		return titleExpiryDate;
	}

	public void setTitleExpiryDate(Date titleExpiryDate) {
		this.titleExpiryDate = titleExpiryDate;
	}

	public String getLandArea() {
		return landArea;
	}

	public void setLandArea(String landArea) {
		this.landArea = landArea;
	}

	public Date getGuaranteeExpiryDate() {
		return guaranteeExpiryDate;
	}

	public void setGuaranteeExpiryDate(Date guaranteeExpiryDate) {
		this.guaranteeExpiryDate = guaranteeExpiryDate;
	}

	public String getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(String sectionNo) {
		this.sectionNo = sectionNo;
	}

	public Date getReservePriceDate() {
		return reservePriceDate;
	}

	public void setReservePriceDate(Date reservePriceDate) {
		this.reservePriceDate = reservePriceDate;
	}

	public String getTitleNoPrefix() {
		return titleNoPrefix;
	}

	public void setTitleNoPrefix(String titleNoPrefix) {
		this.titleNoPrefix = titleNoPrefix;
	}

	public String getCategoryOfLand() {
		return categoryOfLand;
	}

	public void setCategoryOfLand(String categoryOfLand) {
		this.categoryOfLand = categoryOfLand;
	}

	public String getAllowPassive() {
		return allowPassive;
	}

	public void setAllowPassive(String allowPassive) {
		this.allowPassive = allowPassive;
	}

	public String getMasterTitleInd() {
		return masterTitleInd;
	}

	public void setMasterTitleInd(String masterTitleInd) {
		this.masterTitleInd = masterTitleInd;
	}

	public String getMasterTitleNo() {
		return masterTitleNo;
	}

	public void setMasterTitleNo(String masterTitleNo) {
		this.masterTitleNo = masterTitleNo;
	}

	public String getAssumption() {
		return assumption;
	}

	public void setAssumption(String assumption) {
		this.assumption = assumption;
	}

	public BigDecimal getAuctionPrice() {
		return auctionPrice;
	}

	public void setAuctionPrice(BigDecimal auctionPrice) {
		this.auctionPrice = auctionPrice;
	}

	public Date getAuctionDate() {
		return auctionDate;
	}

	public void setAuctionDate(Date auctionDate) {
		this.auctionDate = auctionDate;
	}

	public Long getDepositAccountNo() {
		return depositAccountNo;
	}

	public void setDepositAccountNo(Long depositAccountNo) {
		this.depositAccountNo = depositAccountNo;
	}

	public String getBankOtherIssuerInd() {
		return bankOtherIssuerInd;
	}

	public void setBankOtherIssuerInd(String bankOtherIssuerInd) {
		this.bankOtherIssuerInd = bankOtherIssuerInd;
	}

	public Date getDepositExpiryDate() {
		return depositExpiryDate;
	}

	public void setDepositExpiryDate(Date depositExpiryDate) {
		this.depositExpiryDate = depositExpiryDate;
	}

	public String getIssuingInstitution() {
		return issuingInstitution;
	}

	public void setIssuingInstitution(String issuingInstitution) {
		this.issuingInstitution = issuingInstitution;
	}

	public BigDecimal getDepositInterestRate() {
		return depositInterestRate;
	}

	public void setDepositInterestRate(BigDecimal depositInterestRate) {
		this.depositInterestRate = depositInterestRate;
	}

	public BigDecimal getDepositAmount() {
		return depositAmount;
	}

	public void setDepositAmount(BigDecimal depositAmount) {
		this.depositAmount = depositAmount;
	}

	public Integer getDepositTerm() {
		return depositTerm;
	}

	public void setDepositTerm(Integer depositTerm) {
		this.depositTerm = depositTerm;
	}

	public String getDepositTermCode() {
		return depositTermCode;
	}

	public void setDepositTermCode(String depositTermCode) {
		this.depositTermCode = depositTermCode;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getNewUsedRecondInd() {
		return newUsedRecondInd;
	}

	public void setNewUsedRecondInd(String newUsedRecondInd) {
		this.newUsedRecondInd = newUsedRecondInd;
	}

	public String getTypeOfUnit() {
		return typeOfUnit;
	}

	public void setTypeOfUnit(String typeOfUnit) {
		this.typeOfUnit = typeOfUnit;
	}

	public String getLogBookNo() {
		return logBookNo;
	}

	public void setLogBookNo(String logBookNo) {
		this.logBookNo = logBookNo;
	}

	public BigDecimal getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(BigDecimal purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public BigDecimal getDownPaymentTradeIn() {
		return downPaymentTradeIn;
	}

	public void setDownPaymentTradeIn(BigDecimal downPaymentTradeIn) {
		this.downPaymentTradeIn = downPaymentTradeIn;
	}

	public BigDecimal getDownPaymentCash() {
		return downPaymentCash;
	}

	public void setDownPaymentCash(BigDecimal downPaymentCash) {
		this.downPaymentCash = downPaymentCash;
	}

	public String getCommissionType() {
		return commissionType;
	}

	public void setCommissionType(String commissionType) {
		this.commissionType = commissionType;
	}

	public Integer getManufactureYear() {
		return manufactureYear;
	}

	public void setManufactureYear(Integer manufactureYear) {
		this.manufactureYear = manufactureYear;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getRlSerialNo() {
		return rlSerialNo;
	}

	public void setRlSerialNo(String rlSerialNo) {
		this.rlSerialNo = rlSerialNo;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public BigDecimal getReservedAmt() {
		return reservedAmt;
	}

	public void setReservedAmt(BigDecimal reservedAmt) {
		this.reservedAmt = reservedAmt;
	}

	public String getDescExtra() {
		return descExtra;
	}

	public void setDescExtra(String descExtra) {
		this.descExtra = descExtra;
	}

	public BigDecimal getDepositValue() {
		return depositValue;
	}

	public void setDepositValue(BigDecimal depositValue) {
		this.depositValue = depositValue;
	}

	public BigDecimal getSalesProceed() {
		return salesProceed;
	}

	public void setSalesProceed(BigDecimal salesProceed) {
		this.salesProceed = salesProceed;
	}

	public Date getDateChattelRepo() {
		return dateChattelRepo;
	}

	public void setDateChattelRepo(Date dateChattelRepo) {
		this.dateChattelRepo = dateChattelRepo;
	}

	public Date getDateChattelSold() {
		return dateChattelSold;
	}

	public void setDateChattelSold(Date dateChattelSold) {
		this.dateChattelSold = dateChattelSold;
	}

	public BigDecimal getSoldAmt() {
		return soldAmt;
	}

	public void setSoldAmt(BigDecimal soldAmt) {
		this.soldAmt = soldAmt;
	}

	public Date getRoadTaxExpiryDate() {
		return roadTaxExpiryDate;
	}

	public void setRoadTaxExpiryDate(Date roadTaxExpiryDate) {
		this.roadTaxExpiryDate = roadTaxExpiryDate;
	}

	public String getModelNumber() {
		return modelNumber;
	}

	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}

	public String getMakeOfGoods() {
		return makeOfGoods;
	}

	public void setMakeOfGoods(String makeOfGoods) {
		this.makeOfGoods = makeOfGoods;
	}

	public String getPortRegistration() {
		return portRegistration;
	}

	public void setPortRegistration(String portRegistration) {
		this.portRegistration = portRegistration;
	}

	public BigDecimal getResidualValue() {
		return residualValue;
	}

	public void setResidualValue(BigDecimal residualValue) {
		this.residualValue = residualValue;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getCollateralMessage() {
		return collateralMessage;
	}

	public void setCollateralMessage(String collateralMessage) {
		this.collateralMessage = collateralMessage;
	}

	public String getInsurance() {
		return insurance;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}

	public Date getConfirmationDate() {
		return confirmationDate;
	}

	public void setConfirmationDate(Date confirmationDate) {
		this.confirmationDate = confirmationDate;
	}

	public BigDecimal getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(BigDecimal exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	public String getPromissoryNoteNumber() {
		return promissoryNoteNumber;
	}

	public void setPromissoryNoteNumber(String promissoryNoteNumber) {
		this.promissoryNoteNumber = promissoryNoteNumber;
	}

	public String getChequeInd() {
		return chequeInd;
	}

	public void setChequeInd(String chequeInd) {
		this.chequeInd = chequeInd;
	}

	public Long getBankBranchCode() {
		return bankBranchCode;
	}

	public void setBankBranchCode(Long bankBranchCode) {
		this.bankBranchCode = bankBranchCode;
	}

	public String getDrawerName() {
		return drawerName;
	}

	public void setDrawerName(String drawerName) {
		this.drawerName = drawerName;
	}

	public Date getChequeDate() {
		return chequeDate;
	}

	public void setChequeDate(Date chequeDate) {
		this.chequeDate = chequeDate;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}

	public BigDecimal getContractAmt() {
		return contractAmt;
	}

	public void setContractAmt(BigDecimal contractAmt) {
		this.contractAmt = contractAmt;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}

	public BigDecimal getGuaranteeAmt() {
		return guaranteeAmt;
	}

	public void setGuaranteeAmt(BigDecimal guaranteeAmt) {
		this.guaranteeAmt = guaranteeAmt;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getPurchaseReceiptNo() {
		return purchaseReceiptNo;
	}

	public void setPurchaseReceiptNo(String purchaseReceiptNo) {
		this.purchaseReceiptNo = purchaseReceiptNo;
	}

	public String getGoldCode() {
		return goldCode;
	}

	public void setGoldCode(String goldCode) {
		this.goldCode = goldCode;
	}

	public BigDecimal getGoldWeight() {
		return goldWeight;
	}

	public void setGoldWeight(BigDecimal goldWeight) {
		this.goldWeight = goldWeight;
	}

	public String getAuctioneer() {
		return auctioneer;
	}

	public void setAuctioneer(String auctioneer) {
		this.auctioneer = auctioneer;
	}

	public BigDecimal getRegistrationFee() {
		return registrationFee;
	}

	public void setRegistrationFee(BigDecimal registrationFee) {
		this.registrationFee = registrationFee;
	}

	public Long getOwnershipClaimNo() {
		return ownershipClaimNo;
	}

	public void setOwnershipClaimNo(Long ownershipClaimNo) {
		this.ownershipClaimNo = ownershipClaimNo;
	}

	public BigDecimal getRedeemAmt() {
		return redeemAmt;
	}

	public void setRedeemAmt(BigDecimal redeemAmt) {
		this.redeemAmt = redeemAmt;
	}

	public BigDecimal getPricePerUnit() {
		return pricePerUnit;
	}

	public void setPricePerUnit(BigDecimal pricePerUnit) {
		this.pricePerUnit = pricePerUnit;
	}

	public BigDecimal getBuyBackValue() {
		return buyBackValue;
	}

	public void setBuyBackValue(BigDecimal buyBackValue) {
		this.buyBackValue = buyBackValue;
	}

	public BigDecimal getConversionRate() {
		return conversionRate;
	}

	public void setConversionRate(BigDecimal conversionRate) {
		this.conversionRate = conversionRate;
	}

	public String getBuildUpArea() {
		return buildUpArea;
	}

	public void setBuildUpArea(String buildUpArea) {
		this.buildUpArea = buildUpArea;
	}

	public Integer getPostcode() {
		return postcode;
	}

	public void setPostcode(Integer postcode) {
		this.postcode = postcode;
	}

	public Date getSalesPurchaseDate() {
		return salesPurchaseDate;
	}

	public void setSalesPurchaseDate(Date salesPurchaseDate) {
		this.salesPurchaseDate = salesPurchaseDate;
	}

	public String getValueGivenInd() {
		return valueGivenInd;
	}

	public void setValueGivenInd(String valueGivenInd) {
		this.valueGivenInd = valueGivenInd;
	}

	public BigDecimal getCappedPrice() {
		return cappedPrice;
	}

	public void setCappedPrice(BigDecimal cappedPrice) {
		this.cappedPrice = cappedPrice;
	}

	public Long getCdsAccountNo() {
		return cdsAccountNo;
	}

	public void setCdsAccountNo(Long cdsAccountNo) {
		this.cdsAccountNo = cdsAccountNo;
	}

	public BigDecimal getExchangeRate2() {
		return exchangeRate2;
	}

	public void setExchangeRate2(BigDecimal exchangeRate2) {
		this.exchangeRate2 = exchangeRate2;
	}

	public Long getReimbursementBank() {
		return reimbursementBank;
	}

	public void setReimbursementBank(Long reimbursementBank) {
		this.reimbursementBank = reimbursementBank;
	}

	public String getLeasingType() {
		return leasingType;
	}

	public void setLeasingType(String leasingType) {
		this.leasingType = leasingType;
	}

	public BigDecimal getNewUnitPrice() {
		return newUnitPrice;
	}

	public void setNewUnitPrice(BigDecimal newUnitPrice) {
		this.newUnitPrice = newUnitPrice;
	}

	public String getVehicleColor() {
		return vehicleColor;
	}

	public void setVehicleColor(String vehicleColor) {
		this.vehicleColor = vehicleColor;
	}

	public String getUnitTrustFundName() {
		return unitTrustFundName;
	}

	public void setUnitTrustFundName(String unitTrustFundName) {
		this.unitTrustFundName = unitTrustFundName;
	}

	public BigDecimal getOriginalValue() {
		return originalValue;
	}

	public void setOriginalValue(BigDecimal originalValue) {
		this.originalValue = originalValue;
	}

	public void setSuccessResponse() {
		setCommonSuccessResponse();

		// set collateralID for new case
		if ((collateralID == null) || (collateralID.longValue() == 0)) {
			try {
				setCollateralID(new Long(Long.parseLong(new DateSequencerFormatter().formatSeq(String
						.valueOf((long) (Math.random() * SEQ_NUMBER))))));
			}
			catch (Exception e) {
				System.out.println(" Exception caught at setSucessReponse: " + e.getMessage());
			}
		}
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSCollateralMaster responseObj = (OBSIBSCollateralMaster) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" collateralID : " + responseObj.getCollateralID() + newLine);
				result.append(" collateralName : " + responseObj.getCollateralName() + newLine);
				result.append(" collateralDesc: " + responseObj.getCollateralDesc() + newLine);
				result.append(" collateralStatus : " + responseObj.getCollateralStatus() + newLine);
				result.append(" currency : " + responseObj.getCurrency() + newLine);
				result.append(" collateralInd : " + responseObj.getCollateralInd() + newLine);
				result.append(" accountNumber : " + responseObj.getAccoutNumber() + newLine);
				result.append(" accountType : " + responseObj.getAccountType() + newLine);
				result.append(" collateralCode : " + responseObj.getCollateralCode() + newLine);
				result.append(" collateralbranchNumber : " + responseObj.getCollateralbranchNumber() + newLine);
				result.append(" titleNumber : " + responseObj.getTitleNumber() + newLine);
				result.append(" lotNumber : " + responseObj.getLotNumber() + newLine);
				result.append(" chassisNumber : " + responseObj.getChassisNumber() + newLine);
				result.append(" engineNumber : " + responseObj.getEngineNumber() + newLine);
				result.append(" tickerSymbol : " + responseObj.getTickerSymbol() + newLine);
				result.append(" sharesUnits : " + responseObj.getSharesUnits() + newLine);
				result.append(" quitRentAmt : " + responseObj.getQuitRentAmt() + newLine);
				result.append(" assessmentAmt : " + responseObj.getAssessmentAmt() + newLine);
				result.append(" externalAppraisedValue : " + responseObj.getExternalAppraisedName() + newLine);
				result.append(" externalAppraisedName : " + responseObj.getExternalAppraisedName() + newLine);
				result.append(" currentValue: " + responseObj.getCurrentValue() + newLine);
				result.append(" reservedPrice : " + responseObj.getReservedPrice() + newLine);
				result.append(" valuationFrequency : " + responseObj.getValuationFrequency() + newLine);
				result.append(" valuationFrequencyCode : " + responseObj.getValuationFrequencyCode() + newLine);
				result.append(" valuationMethod : " + responseObj.getValuationMethod() + newLine);
				result.append(" quitRentPaymentDate : " + responseObj.getQuitRentPaymentDate() + newLine);
				result.append(" assessmentPaymentDate : " + responseObj.getAssessmentPaymentDate() + newLine);
				result.append(" externalAppraisalDate : " + responseObj.getExternalAppraisalDate() + newLine);
				result.append(" valuationDate; : " + responseObj.getValuationDate() + newLine);
				result.append(" nextValuationDate : " + responseObj.getNextValuationDate() + newLine);
				result.append(" dateOfStatus : " + responseObj.getDateOfStatus() + newLine);
				result.append(" registeredOwnerCIF : " + responseObj.getRegisteredOwnerCIF() + newLine);
				result.append(" bondNumber : " + responseObj.getBondNumber() + newLine);
				result.append(" bondIssuerName : " + responseObj.getBondIssuerName() + newLine);
				result.append(" bondMaturityDate : " + responseObj.getBondMaturityDate() + newLine);
				result.append(" registrationNumber : " + responseObj.getRegistrationNumber() + newLine);
				result.append(" ownerOccupied : " + responseObj.getOwnerOccupied() + newLine);
				result.append(" propertyType : " + responseObj.getPropertyType() + newLine);
				result.append(" forceSalesValue : " + responseObj.getForceSalesValue() + newLine);
				result.append(" propertyAddress1 : " + responseObj.getPropertyAddress1() + newLine);
				result.append(" propertyAddress2 : " + responseObj.getPropertyAddress2() + newLine);
				result.append(" propertyAddress3 : " + responseObj.getPropertyAddress3() + newLine);
				result.append(" freeholdLeaseholdInd : " + responseObj.getFreeholdLeaseholdInd() + newLine);
				result.append(" titleExpiryDate : " + responseObj.getTitleExpiryDate() + newLine);
				result.append(" landArea : " + responseObj.getLandArea() + newLine);
				result.append(" guaranteeExpiryDate : " + responseObj.getGuaranteeExpiryDate() + newLine);
				result.append(" sectionNo : " + responseObj.getSectionNo() + newLine);
				result.append(" reservePriceDate : " + responseObj.getReservePriceDate() + newLine);
				result.append(" titleNoPrefix : " + responseObj.getTitleNoPrefix() + newLine);
				result.append(" categoryOfLand : " + responseObj.getCategoryOfLand() + newLine);
				result.append(" allowPassive : " + responseObj.getAllowPassive() + newLine);
				result.append(" masterTitleInd : " + responseObj.getMasterTitleInd() + newLine);
				result.append(" masterTitleNo : " + responseObj.getMasterTitleNo() + newLine);
				result.append(" assumption : " + responseObj.getAssumption() + newLine);
				result.append(" auctionPrice : " + responseObj.getAuctionPrice() + newLine);
				result.append(" auctionDate : " + responseObj.getAuctionDate() + newLine);
				result.append(" depositAccountNo : " + responseObj.getDepositAccountNo() + newLine);
				result.append(" bankOtherIssuerInd : " + responseObj.getBankOtherIssuerInd() + newLine);
				result.append(" depositExpiryDate : " + responseObj.getDepositExpiryDate() + newLine);
				result.append(" issuingInstitution : " + responseObj.getIssuingInstitution() + newLine);
				result.append(" depositInterestRate : " + responseObj.getDepositInterestRate() + newLine);
				result.append(" depositAmount : " + responseObj.getDepositAmount() + newLine);
				result.append(" depositTerm : " + responseObj.getDepositTerm() + newLine);
				result.append(" depositTermCode : " + responseObj.getDepositTermCode() + newLine);
				result.append(" issueDate : " + responseObj.getIssueDate() + newLine);
				result.append(" relationship : " + responseObj.getRelationship() + newLine);
				result.append(" newUsedRecondInd : " + responseObj.getNewUsedRecondInd() + newLine);
				result.append(" typeOfUnit : " + responseObj.getTypeOfUnit() + newLine);
				result.append(" logBookNo : " + responseObj.getLogBookNo() + newLine);
				result.append(" purchasePrice : " + responseObj.getPurchasePrice() + newLine);
				result.append(" downPaymentTradeIn : " + responseObj.getDownPaymentTradeIn() + newLine);
				result.append(" downPaymentCash : " + responseObj.getDownPaymentCash() + newLine);
				result.append(" commissionType : " + responseObj.getCommissionType() + newLine);
				result.append(" manufactureYear : " + responseObj.getManufactureYear() + newLine);
				result.append(" registrationDate : " + responseObj.getRegistrationDate() + newLine);
				result.append(" rlSerialNo : " + responseObj.getRlSerialNo() + newLine);
				result.append(" store : " + responseObj.getStore() + newLine);
				result.append(" reservedAmt : " + responseObj.getReservedAmt() + newLine);
				result.append(" descExtra : " + responseObj.getDescExtra() + newLine);
				result.append(" depositValue : " + responseObj.getDepositValue() + newLine);
				result.append(" salesProceed : " + responseObj.getSalesProceed() + newLine);
				result.append(" dateChattelRepo : " + responseObj.getDateChattelRepo() + newLine);
				result.append(" dateChattelSold : " + responseObj.getDateChattelSold() + newLine);
				result.append(" soldAmt : " + responseObj.getSoldAmt() + newLine);
				result.append(" roadTaxExpiryDate : " + responseObj.getRoadTaxExpiryDate() + newLine);
				result.append(" modelNumber : " + responseObj.getModelNumber() + newLine);
				result.append(" makeOfGoods : " + responseObj.getMakeOfGoods() + newLine);
				result.append(" portRegistration : " + responseObj.getPortRegistration() + newLine);
				result.append(" residualValue : " + responseObj.getResidualValue() + newLine);
				result.append(" purchaseDate : " + responseObj.getPurchaseDate() + newLine);
				result.append(" collateralMessage : " + responseObj.getCollateralMessage() + newLine);
				result.append(" insurance : " + responseObj.getInsurance() + newLine);
				result.append(" confirmationDate : " + responseObj.getConfirmationDate() + newLine);
				result.append(" exchangeRate : " + responseObj.getExchangeRate() + newLine);
				result.append(" promissoryNoteNumber : " + responseObj.getPromissoryNoteNumber() + newLine);
				result.append(" chequeInd : " + responseObj.getChequeInd() + newLine);
				result.append(" bankBranchCode : " + responseObj.getBankBranchCode() + newLine);
				result.append(" drawerName : " + responseObj.getDrawerName() + newLine);
				result.append(" chequeDate : " + responseObj.getChequeDate() + newLine);
				result.append(" contractNumber : " + responseObj.getContractNumber() + newLine);
				result.append(" contractName : " + responseObj.getContractName() + newLine);
				result.append(" contractAmt : " + responseObj.getContractAmt() + newLine);
				result.append(" contractDate : " + responseObj.getContractDate() + newLine);
				result.append(" guaranteeAmt : " + responseObj.getGuaranteeAmt() + newLine);
				result.append(" itemType : " + responseObj.getItemType() + newLine);
				result.append(" purchaseReceiptNo : " + responseObj.getPurchaseReceiptNo() + newLine);
				result.append(" goldCode : " + responseObj.getGoldCode() + newLine);
				result.append(" goldWeight : " + responseObj.getGoldWeight() + newLine);
				result.append(" auctioneer : " + responseObj.getAuctioneer() + newLine);
				result.append(" registrationFee : " + responseObj.getRegistrationFee() + newLine);
				result.append(" ownershipClaimNo : " + responseObj.getOwnershipClaimNo() + newLine);
				result.append(" redeemAmt : " + responseObj.getRedeemAmt() + newLine);
				result.append(" pricePerUnit : " + responseObj.getPricePerUnit() + newLine);
				result.append(" buyBackValue : " + responseObj.getBuyBackValue() + newLine);
				result.append(" conversionRate : " + responseObj.getConversionRate() + newLine);
				result.append(" buildUpArea : " + responseObj.getBuildUpArea() + newLine);
				result.append(" postcode : " + responseObj.getPostcode() + newLine);
				result.append(" salesPurchaseDate : " + responseObj.getSalesPurchaseDate() + newLine);
				result.append(" valueGivenInd : " + responseObj.getValueGivenInd() + newLine);
				result.append(" cappedPrice : " + responseObj.getCappedPrice() + newLine);
				result.append(" cdsAccountNo : " + responseObj.getCdsAccountNo() + newLine);
				result.append(" exchangeRate2 : " + responseObj.getExchangeRate2() + newLine);
				result.append(" reimbursementBank : " + responseObj.getReimbursementBank() + newLine);
				result.append(" leasingType : " + responseObj.getLeasingType() + newLine);
				result.append(" newUnitPrice : " + responseObj.getNewUnitPrice() + newLine);
				result.append(" vehicleColor : " + responseObj.getVehicleColor() + newLine);
				result.append(" unitTrustFundName : " + responseObj.getUnitTrustFundName() + newLine);
				result.append(" originalValue : " + responseObj.getOriginalValue() + newLine);
				result.append("}");
			}
		}

		return result.toString();
	}
}

//GENERATED FILE... ANYMODIFICATION WILL BE LOST. ASK SATHISH FOR ANY CLARIFICATIONpackage com.integrosys.cms.ui.collateral.insprotection.inscrdtderiv;import java.io.Serializable;import com.integrosys.cms.ui.collateral.insprotection.InsProtectionForm;/** *  * Created by IntelliJ IDEA. *  * User: ssathish *  * Date: Jun 20, 2003 *  * Time: 2:56:38 PM *  * To change this template use Options | File Templates. */public class InsCrdtDerivForm extends InsProtectionForm implements Serializable {	public static final String INSCRDTDERIVMAPPER = "com.integrosys.cms.ui.collateral.insprotection.inscrdtderiv.InsCrdtDerivMapper";	private String description = "";	public String getDescription() {		return this.description;	}	public void setDescription(String description) {		this.description = description;	}	private String dateISDAMasterAgmt = "";	public String getDateISDAMasterAgmt() {		return this.dateISDAMasterAgmt;	}	public void setDateISDAMasterAgmt(String dateISDAMasterAgmt) {		this.dateISDAMasterAgmt = dateISDAMasterAgmt;	}	private String dateTreasury = "";	public String getDateTreasury() {		return this.dateTreasury;	}	public void setDateTreasury(String dateTreasury) {		this.dateTreasury = dateTreasury;	}	private String bankRiskAppConfirm = "";	public String getBankRiskAppConfirm() {		return this.bankRiskAppConfirm;	}	public void setBankRiskAppConfirm(String bankRiskAppConfirm) {		this.bankRiskAppConfirm = bankRiskAppConfirm;	}	public String arrInsurer = "";		public String getArrInsurer() {		return arrInsurer;	}	public void setArrInsurer(String arrInsurer) {		this.arrInsurer = arrInsurer;	}	public String chargeType = "";		public String getChargeType() {		return chargeType;	}	public void setChargeType(String chargeType) {		this.chargeType = chargeType;	}	public void reset() {		super.reset();	}	public String[][] getMapper() {		String[][] input = {		{ "form.collateralObject", INSCRDTDERIVMAPPER },		{ "theOBTrxContext", "com.integrosys.cms.ui.common.TrxContextMapper" },		{ "pledgorRemove", "com.integrosys.cms.ui.collateral.pledgor.PledgorRemoveMapper" },		{ "pledgeRemove", "com.integrosys.cms.ui.collateral.pledge.PledgeRemoveMapper" },		};		return input;	}}
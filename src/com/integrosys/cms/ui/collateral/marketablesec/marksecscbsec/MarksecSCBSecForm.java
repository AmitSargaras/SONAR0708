//GENERATED FILE... ANYMODIFICATION WILL BE LOST. ASK SATHISH FOR ANY CLARIFICATIONpackage com.integrosys.cms.ui.collateral.marketablesec.marksecscbsec;import java.io.Serializable;import com.integrosys.cms.ui.collateral.marketablesec.MarketableSecForm;/** *  * Created by IntelliJ IDEA. *  * User: ssathish *  * Date: Jun 20, 2003 *  * Time: 2:56:38 PM *  * To change this template use Options | File Templates. */public class MarksecSCBSecForm extends MarketableSecForm implements Serializable {	public static final String MARKSECSCBSECMAPPER = "com.integrosys.cms.ui.collateral.marketablesec.marksecscbsec.MarksecSCBSecMapper";	public void reset() {		super.reset();	}	public String[][] getMapper() {		String[][] input = {		{ "form.collateralObject", MARKSECSCBSECMAPPER },		{ "theOBTrxContext", "com.integrosys.cms.ui.common.TrxContextMapper" },		};		return input;	}}
package com.integrosys.cms.app.bridgingloan.proxy;

import com.integrosys.cms.app.bridgingloan.bus.BridgingLoanException;
import com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan;
import com.integrosys.cms.app.bridgingloan.bus.IBridgingLoanSummary;
import com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue;
import com.integrosys.cms.app.transaction.ITrxContext;

/**
 * Describe this class. Purpose: Description:
 * 
 * @author $Author$<br>
 * @version $Revision$
 * @since $Date$ Tag: $Name$
 */
public interface IBridgingLoanProxyManager {

	/**
	 * Maker creates bridging loan
	 * @param ctx of ITrxContext type
	 * @param trxValue of IBridgingLoanTrxValue type
	 * @param bridgingLoan of IBridgingLoan type
	 * @return IBridgingLoanTrxValue - the interface representing the bridging
	 *         loan trx obj
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue makerCreateBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue,
			IBridgingLoan bridgingLoan) throws BridgingLoanException;

	/**
	 * Maker updates bridging loan
	 * @param ctx of ITrxContext type
	 * @param trxValue of IBridgingLoanTrxValue type
	 * @param bridgingLoan of IBridgingLoan type
	 * @return IBridgingLoanTrxValue - the interface representing the bridging
	 *         loan trx obj
	 * @throws com.integrosys.cms.app.bridgingloan.bus.BridgingLoanException on
	 *         errors
	 */
	public IBridgingLoanTrxValue makerUpdateBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue,
			IBridgingLoan bridgingLoan) throws BridgingLoanException;

	/**
	 * Maker saves bridging loan
	 * @param ctx of ITrxContext type
	 * @param trxValue of IBridgingLoanTrxValue type
	 * @param bridgingLoan of IBridgingLoan type
	 * @return IBridgingLoanTrxValue - the interface representing the bridging
	 *         loan trx obj
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue makerSaveBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue,
			IBridgingLoan bridgingLoan) throws BridgingLoanException;

	/**
	 * Maker delete the bridging loan.
	 * @param ctx - Transaction Context to use
	 * @param trxValue - bridging loan to be deleted
	 * @return Delete bridging loan
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue makerDeleteBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue)
			throws BridgingLoanException;

	/**
	 * Approve the bridging loan update.
	 * @param ctx - Transaction Context to use
	 * @param trxValue - Policy Cap to be approved
	 * @return Approved Policy Cap
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue checkerApproveBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue)
			throws BridgingLoanException;

	/**
	 * Rejects the bridging loan update.
	 * @param ctx - Transaction Context to use
	 * @param trxValue - Policy Cap to be rejected
	 * @return Rejected Policy Cap
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue checkerRejectBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue)
			throws BridgingLoanException;

	/**
	 * Close the (rejected) bridging loan.
	 * @param ctx - Transaction Context to use
	 * @param trxValue - Policy Cap to be closed
	 * @return Closed Policy Cap
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue makerCloseBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue)
			throws BridgingLoanException;

	/**
	 * Close the (rejected) bridging loan.
	 * @param ctx - Transaction Context to use
	 * @param trxValue - bridging loan to be closed
	 * @return Closed updated bridging loan
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue makerCloseUpdateBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue)
			throws BridgingLoanException;

	/**
	 * Close the (rejected) bridging loan.
	 * @param ctx - Transaction Context to use
	 * @param trxValue - bridging loan to be closed
	 * @return Closed updated bridging loan
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue makerCloseDeleteBridgingLoan(ITrxContext ctx, IBridgingLoanTrxValue trxValue)
			throws BridgingLoanException;

	/**
	 * Get the bridging loan transaction object via primary key
	 * @param pk - Primary Key used to retrieve the trxValue
	 * @return IBridgingLoanTrxValue
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue getBridgingLoanTrxValue(long pk) throws BridgingLoanException;

	/**
	 * Get the bridging loan transaction object via transaction id
	 * @param trxID - transaction ID
	 * @return IBridgingLoanTrxValue
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanTrxValue getBridgingLoanTrxValueByTrxID(String trxID) throws BridgingLoanException;

	/**
	 * Get the list of bridging loan summary info.
	 * @param aLimitProfileID of long type
	 * @return IBridgingLoanSummary[] - the list of bridging loan summary
	 * @throws BridgingLoanException on errors
	 */
	public IBridgingLoanSummary[] getBridgingLoanSummaryList(long aLimitProfileID) throws BridgingLoanException;

}
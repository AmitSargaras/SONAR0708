/*
Copyright Integro Technologies Pte Ltd
$Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/feed/proxy/propertyindex/SBPropertyIndexFeedProxyHome.java,v 1.1 2003/08/20 10:59:30 btchng Exp $
 */
package com.integrosys.cms.app.feed.proxy.propertyindex;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;

/**
 * @author $Author: btchng $<br>
 * @version $Revision: 1.1 $
 * @since $Date: 2003/08/20 10:59:30 $ Tag: $Name: $
 */
public interface SBPropertyIndexFeedProxyHome extends EJBHome {

	public SBPropertyIndexFeedProxy create() throws CreateException, RemoteException;
}

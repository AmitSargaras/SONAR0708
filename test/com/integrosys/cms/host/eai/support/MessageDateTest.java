package com.integrosys.cms.host.eai.support;

import java.util.Date;

import junit.framework.TestCase;

public class MessageDateTest extends TestCase {
	public void testFormatDateTimeLongFormat() {
		String date = "10-Feb-2009 01:59:10";

		Date aDate = MessageDate.getInstance().getDate(date);
		assertNotNull(aDate);
	}

	public void testFormatDateTimeFormat() {
		String date = "20090210015910";

		Date aDate = MessageDate.getInstance().getDate(date);
		assertNotNull(aDate);
	}

	public void testFormatDateFormat() {
		String date = "20090210";

		Date aDate = MessageDate.getInstance().getDate(date);
		assertNotNull(aDate);
	}
}

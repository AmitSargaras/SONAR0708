package com.integrosys.cms.batch.common;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;

import org.apache.commons.lang.ArrayUtils;

public class FileSystemBatchFeedErrorLoggerTest extends TestCase {

	private FileSystemBatchFeedErrorLogger logger;

	public void setUp() {
		logger = new FileSystemBatchFeedErrorLogger();
		logger.setAppendToLogFile(false);
		logger.setLogFileLocation("test.log");
	}

	public void testLogOneBatchFeedError() {
		BatchFeedError error = new BatchFeedError(1, "hello,world", "failed to parse 'world' to a date object");
		logger.log(error);

		try {
			FileInputStream fis = new FileInputStream("test.log");
			BufferedReader reader = new BufferedReader(new InputStreamReader(fis));
			String firstLine = reader.readLine();
			assertTrue(firstLine.indexOf("failed to parse 'world' to a date object") > 1);
		}
		catch (FileNotFoundException e) {
			fail("failed to find 'test.log' in the file system");
		}
		catch (IOException e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));

			fail("failed to find 'test.log' in the file system, stack trace: " + sw.toString());
		}
	}

	public void testLogMultipleBatchFeedError() {
		List batchFeedErrors = new ArrayList();

		BatchFeedError error = new BatchFeedError(1, "hello,world", "failed to parse 'world' to a date object");
		batchFeedErrors.add(error);
		error = new BatchFeedError(3, "1234,05092008", "'1234' exceed the record length required (3)");
		batchFeedErrors.add(error);
		error = new BatchFeedError(3, "123,050920081", "'failed to parse '050920081' to a date object");
		batchFeedErrors.add(error);

		logger.log(batchFeedErrors);

		try {
			int totalLineNumber = 0;

			FileInputStream fis = new FileInputStream("test.log");
			BufferedReader reader = new BufferedReader(new InputStreamReader(fis));
			String line = reader.readLine();
			while (line != null) {
				totalLineNumber++;
				line = reader.readLine();
			}
			assertEquals(3, totalLineNumber);
		}
		catch (FileNotFoundException e) {
			fail("failed to find 'test.log' in the file system");
		}
		catch (IOException e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));

			fail("failed to find 'test.log' in the file system, stack trace: " + sw.toString());
		}

	}

}

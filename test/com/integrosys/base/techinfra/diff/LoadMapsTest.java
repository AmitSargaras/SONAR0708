package com.integrosys.base.techinfra.diff;

import junit.framework.TestCase;

public class LoadMapsTest extends TestCase {

	public void testLoadMaps() throws Exception {
		LoadMaps loadMaps = LoadMaps.getInstance();

		assertNotNull(loadMaps.getMapping());
	}

	public void testLoadIdMaps() throws Exception {
		LoadMaps loadMaps = LoadMaps.getInstance();

		assertNotNull(loadMaps.getIdMapping());
	}

}
